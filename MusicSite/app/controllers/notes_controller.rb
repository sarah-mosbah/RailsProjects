class NotesController < ApplicationController

    before_action :require_current_user!

    def create
        note = current_user.notes.new(notes_params)
        note.save
        flash[:errors]= note.errors.full_messages
        redirect_to track_path(note.track)
    end


    def destroy
     note= current_user.notes.find(params[:id])
     note.destroy
     redirect_to track_url(note.track_id)
    end

    private

    def notes_params
        params.require(:note).permit(:track_id, :content)
    end
end
