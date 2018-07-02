class CorgisController < ApplicationController
  before_action :set_corgi, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /corgis
  # GET /corgis.json
  def index
    @corgis = Corgi.all.order("created_at desc")
  end

  # GET /corgis/1
  # GET /corgis/1.json
  def show
  end

  # GET /corgis/new
  def new
    @corgi = current_user.corgi.build
  end

  # GET /corgis/1/edit
  def edit
  end

  # POST /corgis
  # POST /corgis.json
  def create
    @corgi = current_user.corgis.build(corgi_params)

    respond_to do |format|
      if @corgi.save
        format.html { redirect_to @corgi, notice: 'Corgi was successfully created.' }
        format.json { render :show, status: :created, location: @corgi }
      else
        format.html { render :new }
        format.json { render json: @corgi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /corgis/1
  # PATCH/PUT /corgis/1.json
  def update
    respond_to do |format|
      if @corgi.update(corgi_params)
        format.html { redirect_to @corgi, notice: 'Corgi was successfully updated.' }
        format.json { render :show, status: :ok, location: @corgi }
      else
        format.html { render :edit }
        format.json { render json: @corgi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /corgis/1
  # DELETE /corgis/1.json
  def destroy
    @corgi.destroy
    respond_to do |format|
      format.html { redirect_to corgis_url, notice: 'Corgi was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_corgi
      @corgi = Corgi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def corgi_params
      params.require(:corgi).permit(:description, :size, :price, :name, :image, :color)
    end
end
