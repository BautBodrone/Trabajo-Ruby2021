class ProfessionalsController < ApplicationController

  include RenderPdf

  before_action :set_professional, only: %i[ show edit update destroy ]
  load_and_authorize_resource

  # GET /professionals or /professionals.json
  def index
    @professionals = Professional.order(:name).page params[:page]
  end

  # GET /professionals/1 or /professionals/1.json
  def show
    week = render_to_string "professionals/week_download.html.erb"

    respond_to do |format|
      format.html
      format.pdf {  render_pdf week, filename: "week#{@professional.name}.pdf" }
    end
  end

  # GET /professionals/new
  def new
    @professional = Professional.new
  end

  # GET /professionals/month
  def month
    month = render_to_string "professionals/month_download.html.erb"

    respond_to do |format|
      format.html
      format.pdf {  render_pdf month, filename: "month#{@professional.name}.pdf" }
    end
  end

  # GET /professionals/1/edit
  def edit
  end

  # POST /professionals or /professionals.json
  def create
    puts(professional_params)
    @professional = Professional.new(professional_params)
    puts(professional_params)

    respond_to do |format|
      if @professional.save
        format.html { redirect_to @professional, notice: "Professional was successfully created." }
        format.json { render :show, status: :created, location: @professional }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @professional.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /professionals/1 or /professionals/1.json
  def update
    respond_to do |format|
      if @professional.update(professional_params)
        format.html { redirect_to @professional, notice: "Professional was successfully updated." }
        format.json { render :show, status: :ok, location: @professional }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @professional.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professionals/1 or /professionals/1.json
  def destroy
    @professional.destroy
    respond_to do |format|
      format.html { redirect_to professionals_url, notice: "Professional was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professional
      @professional = Professional.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def professional_params
      params.require(:professional).permit(:name)
      #params.fetch(:professional, {})
    end

  before_action :authenticate_user!
end
