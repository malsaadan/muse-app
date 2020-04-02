class ArtistsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :find_person, only:[:show, :edit, :update, :destroy]

    def index
        @artists = Artist.all  
    end

    def show
        @songs = @artist.songs
    end

    def new
        @artist = Artist.new
    end

    def create
        Artist.create(person_params)
        redirect_to artists_path
    end

    def edit
    end

    def update
        @artist.update(person_params)
        redirect_to artist
    end

    def destroy
        @artist.destroy
        redirect_to artists_path
    end

    private
        def person_params
            params.require(:artist).permit(:name, :albums, :hometown, :img)
        end

        def find_person
            @artist = Artist.find(params[:id])
        end
end
