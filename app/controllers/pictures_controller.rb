class PicturesController < ApplicationController
    def new_form
        render("pic_templates/new_form.html.erb")
    end
    
    def create_row
        # Parameters: {"the_source"=>"", "the_caption"=>""}
        
        p = Photo.new
        p.source = params["the_source"]
        p.caption = params["the_caption"]
        p.save
        
        @photo_count = Photo.count
        
        render("pic_templates/create_row.html.erb")
    end
    
    def index
        
        @home = Photo.all.order(:updated_at => :desc)
        
        render("pic_templates/index.html.erb")
    end
    
    def show
        
        @pic = Photo.find(params["the_id"])
        
        render("pic_templates/show.html.erb")
    end
    
    def edit_form
        # Parameters: {"an_id"=>""}
        
        @pic = Photo.find(params["an_id"])
        
        render("pic_templates/edit_form.html.erb")
    end
    
    def update_row
        
        #Parameters: {"the_source"=>"", "the_caption"=>"", "some_id"=>""}
        
        @pic = Photo.find(params["some_id"])
        @pic.source = params["the_source"]
        @pic.caption = params["the_caption"]
        @pic.save
        
        render("pic_templates/update_row.html.erb")
    end
    
    def destroy_row
        # Parameters: {"toast_id"=>""}
        
        @pic = Photo.find(params["toast_id"])
        @pic.destroy
        
        render("pic_templates/destroy_row.html.erb")
    end
    
end