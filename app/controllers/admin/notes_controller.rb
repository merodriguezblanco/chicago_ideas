class Admin::NotesController < Admin::AdminController

  # AdminController callbacks
  # ---------------------------------------------------------------------------------------------------------
  def pre_create(model)
    model.author = current_user if current_user
    return model
  end

  # we do not ever want to crete a note on a note, so this method simply overrides the note functionality from the admin controller
  def model_note(model, body)
  end

  def new
    @parent = parent_model
    @model = @parent.notes.build
    render_json_response :ok, :html => render_to_string('admin/shared/form.html.haml', :layout => false)
  end
  
  def create

    @parent = parent_model
    @model = @parent.notes.build(params[:note])
    @model = pre_create(@model)

    if @model.errors.empty? and @model.save
      succeeding_create(@model)
      render_json_model_created_response @model
    else
      if @model.respond_to?('accepts_file_upload?') && @model.accepts_file_upload?
        render_json_response_in_iframe :error, :html => render_to_string('admin/shared/form.html.haml', :layout => false)
      else
        render_json_response :error, :html => render_to_string('admin/shared/form.html.haml', :layout => false)
      end
    end

  end
  # MEMBER PAGES
  # ---------------------------------------------------------------------------------------------------------

  # retrieve the attachment (the file is not publicaly availiable on the internet)
  def attachment
    @note = Note.find(params[:id])
    storage = Fog::Storage.new({:provider => 'AWS', :aws_access_key_id => AWS_ACCESS_KEY_ID, :aws_secret_access_key => AWS_SECRET_ACCESS_KEY})
    redirect_to storage.get_object_url("#{S3_NAMESPACE}-note-attachments", @note.attachment.path, Time.now+120.seconds)
  end

end
