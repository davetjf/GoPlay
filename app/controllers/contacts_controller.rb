class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    if  user_signed_in? && current_user.admin?
    @contacts = Contact.all
    else
    redirect_to '/'
    end
  end


  def actioned
    @contacts = Contact.find_by(id: params[:id])
    @contacts.update_attribute(:actioned, 1)
    redirect_to "/messages"
  end  

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    if  user_signed_in? && current_user.admin?
    @contacts = Contact.all
    else
    flash[:notice] = "You do not have permission to view this page"
    redirect_to '/'

    end

  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to '/', notice: 'Message was successfully sent. Admin will respond within 24 hours' }
        format.json { render :show, status: :created, location: @contact }

      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:Name, :email, :subject, :message)
    end
end
