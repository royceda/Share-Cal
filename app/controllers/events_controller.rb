class EventsController < ApplicationController

  before_action :set_event, only: [ :show, :edit, :update, :destroy]

  private

  def set_event
    @event = Event.find(params[:id])
  end


  public

  def data
    events = Event.all
    render :json => events.map {|event| {
      :id => event.id,
      :start_date => event.begin.to_formatted_s(:db),
      :end_date => event.end.to_formatted_s(:db),
      :text => event.name
      }}
    end


    def db_action

      mode = params["!nativeeditor_status"]
      id = params[:id]
      start_date = params[:start_date]
      end_date = params[:end_date]
      text = params[:text]
      print "DB ACTION : "+id+"\n\n"

      case mode
        when "inserted"
          #event = Event.create( :begin => start_date, :begin => end_date, :name => text)
          event = Event.create(name: text, begin: start_date, end: end_date, description: "");
            tid = event.id
            print "DB ACTION : INSERTED!!!!! \n \n "
        when "deleted"
          Event.find(id).destroy
          tid = id

        when "updated"
          event = Event.find(id)
          event.begin = start_date
          event.end = end_date
          event.name = text
          event.save
          tid = id
      end

      render :json => {
        :type => mode,
        :sid => id,
        :tid => tid,
      }
    end


    def index
      @events = Event.all;
    end

    def show
      #@event = Event.find(params[:id])
    end

    def update
      #@event = Event.find(params[:id])
      @event.update(name: params[:title], begin: params[:begin], end: params[:end],
        description: params[:description]);
        redirect_to "/events/#{params[:id]}";
      end

      def create
        Event.create(name: params[:title], begin: params[:begin], end: params[:end], description: params[:description]);
          #Yearly treatment
          print "save"
          redirect_to "/events";
        end

        def destroy
          @event.destroy;
        end

      end
