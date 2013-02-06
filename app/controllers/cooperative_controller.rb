class CooperativeController < ApplicationController
  def application
    @resource = CooperativeApplication.new
  end
  
  def create
    @resource = CooperativeApplication.new(params[:cooperative_application])
    
    pdf = doc_raptor_send({:document_type => "pdf".to_sym})
    friendlyName = "Cooperative_#{@resource.name}.pdf"
    friendlyName = friendlyName.gsub(" ", "")
    friendlyName = friendlyName.gsub("/", "_")
    File.open("#{Rails.root}/tmp/#{friendlyName}", 'w+b') {|f| f.write(pdf) }
    @resource.pdf = File.open("#{Rails.root}/tmp/#{friendlyName}");
      
    if @resource.save
      CooperativeMailer.send_form(friendlyName).deliver
      redirect_to thankyou_cooperative_index_path
    else
      render :application
    end
  end
end
