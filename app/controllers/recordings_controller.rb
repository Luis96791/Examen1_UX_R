class RecordingsController < ApplicationController

	http_basic_authenticate_with name: "username", password: "password", except: [:index, :show]

	def create
		@location = Location.find(params[:location_id])
		@recording = @location.recordings.create(recording_params)
		redirect_to location_path(@location)
	end

	def destroy
		@location = Location.find(params[:location_id])
		@recording = @location.recordings.find(params[:id])
		@recording.destroy
		redirect_to location_path(@location)
	end

	private
		def recording_params
			params.require(:recording).permit(:temp, :status)
		end
end
