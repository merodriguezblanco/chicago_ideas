class EventsController < ApplicationController

  # cache rendered versions of these pages
  before_filter :cache_rendered_page, :only => [:index, :labs, :partner_programs, :affiliate_event]

  def index
    
    if params[:year_id].present?
      @year_id = params[:year_id].to_i
      @events = Event.joins(:day).where("days.year_id = '#{@year_id}'").order('name ASC').search_sort_paginate(params)
    else
      @events = Event.current.limit(8)
    end
    @page_title = "Events"
    @meta_data = {:page_title => "CIW Events", :og_image => "http://www.chicagoideas.com/assets/application/temp/speaker_landing_banner.jpg", :og_title => "CIW Events | Chicago Ideas Week", :og_type => "website", :og_desc => "Chicago Ideas Week (CIW) is about the sharing of ideas, inspiring action and igniting change to positively impact our world. People who come to CIW are artists, engineers, technologists, inventors, scientists, musicians, economists, explorers-and, well...just innately passionate."}
  end
  
  
  def show
    @event = Event.find(params[:id])
    @event_speakers = @event.event_speakers.all
    @partnerprograms = EventBrand.find_by_name("Partner Program").events.archived
    @meta_data = {:page_title => "#{@event.name}", :og_image => "#{@event.banner(:thumb)}", :og_title => "#{@event.name} | Chicago Ideas Week", :og_type => "website", :og_desc => "#{@event.description[0..200]}"}
  end
  
  
  # Labs landing and individual pages
  def labs
    if params[:year_id].present?
      @year_id = params[:year_id].to_i
      @labs = EventBrand.find_by_name("Lab").events.joins(:day).where("days.year_id = '#{@year_id}'").order('name ASC')
    end
    
    @event_photos = EventPhoto.joins(:event).where('events.event_brand_id = 1').order('RAND()').limit(10)
    @event_brand = EventBrand.find_by_name('Lab')
    @meta_data = {:page_title => "CIW Labs", :og_image => "http://www.chicagoideas.com/assets/application/labs.jpg", :og_title => "CIW Labs | Chicago Ideas Week", :og_type => "website", :og_desc => "CIW Labs offer opportunities for participants to experience and explore the best of Chicago like never before.  Exclusive, behind-the-scenes experiences give participants a unique glimpses into the inner workings of businesses and institutions that are otherwise unavailable to the public.  Small groups will explore what it's like for business leaders in the boardroom, go behind the curtain at leading theaters and venues, and discover 'how-it-works' in hands-on workshops."}
  end
  
  # Labs landing and individual pages
  def lab
    @lab = Event.find(params[:id])
    @page_title = "#{@lab.title}"
  end
  
  def labs_host_form
    @meta_data = {:page_title => "CIW Labs Host Form", :og_image => "http://www.chicagoideas.com/assets/application/labs.jpg", :og_title => "CIW Labs Host Form | Chicago Ideas Week", :og_type => "website", :og_desc => "CIW Labs offer opportunities for participants to experience and explore the best of Chicago like never before.  Exclusive, behind-the-scenes experiences give participants a unique glimpses into the inner workings of businesses and institutions that are otherwise unavailable to the public.  Small groups will explore what it's like for business leaders in the boardroom, go behind the curtain at leading theaters and venues, and discover 'how-it-works' in hands-on workshops."}
  end
  
  
  # Partner Programs landing and individual pages
  def partner_programs
    if params[:year_id].present?
      @year_id = params[:year_id].to_i
      @partnerprograms = EventBrand.find_by_name("Partner Program").events.joins(:day).where("days.year_id = '#{@year_id}'").order('name ASC')
    else
      @partnerprograms = EventBrand.find_by_name("Partner Program").events.archived.order('name ASC')
    
    @meta_data = {:page_title => "Partner Programs", :og_image => "http://www.chicagoideas.com/assets/application/logo.png", :og_title => "Partner Programs | Chicago Ideas Week", :og_type => "website", :og_desc => "CIW Partner Programs are official CIW events that are co-curated with our CIW Partners. All programs subscribe to the same goals of connectivity and innovation as other Chicago Ideas Week events, but provide a unique perspective based on the CIW Partner's specific area of expertise."}  

    #if params[:id].nil? # if no paramter, then load the labs landing
    #  puts 'no param'
    #  @partnerprograms = EventBrand.find_by_name("Partner Program").events.archived.order('name ASC')
    #  @meta_data = {:page_title => "Partner Programs", :og_image => "http://www.chicagoideas.com/assets/application/logo.png", :og_title => "Partner Programs | Chicago Ideas Week", :og_type => "website", :og_desc => "CIW Partner Programs are official CIW events that are co-curated with our CIW Partners. All programs subscribe to the same goals of connectivity and innovation as other Chicago Ideas Week events, but provide a unique perspective based on the CIW Partner's specific area of expertise."}
    #else
    #  puts 'param'
    #  @partnerprogram = Event.find(params[:id])
    #  @meta_data = {:page_title => "#{@partnerprogram.title}", :og_image => "http://www.chicagoideas.com/assets/application/logo.png", :og_title => "#{@partnerprogram.title} | Chicago Ideas Week", :og_type => "website", :og_desc => "#{@partnerprogram.description[0..200]}"}
    #  render "application/partner-programs/partnerprograms_individual"
    end
  end
  
  
  # Affiliate events landing
  def affiliate_event
    @page_title = "Affiliate Events"
    @events = EventBrand.find_by_name("Affiliate Event").events.archived
    @event_photos = EventPhoto.order('RAND()').limit(10)
    @meta_data = {:page_title => "Affiliate Events", :og_image => "http://www.chicagoideas.com/assets/application/affilliate_events_banner.jpg", :og_title => "Affiliate Events | Chicago Ideas Week", :og_type => "website", :og_desc => "Chicago Ideas Week (CIW) is about the sharing of ideas, inspiring action and igniting change to positively impact our world. People who come to CIW are artists, engineers, technologists, inventors, scientists, musicians, economists, explorers-and, well...just innately passionate."}
  end
  
end
