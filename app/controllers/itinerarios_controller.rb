class ItinerariosController < ApplicationController
  # GET /itinerarios
  # GET /itinerarios.xml
  def index
    @itinerarios = {:i => [], :v => []}

    Itinerario.pesquisar(params[:linha_id]).each do |i|
      @itinerarios[i.sentido.to_sym][i.position] = i
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @itinerarios.to_json }
      format.xml  { render :xml => @itinerarios }
    end
  end

  # GET /itinerarios/1
  # GET /itinerarios/1.xml
  def show
    @itinerario = Itinerario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @itinerario }
    end
  end

  # GET /itinerarios/new
  # GET /itinerarios/new.xml
  def new
    @itinerario = Itinerario.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @itinerario }
    end
  end

  # GET /itinerarios/1/edit
  def edit
    @itinerario = Itinerario.find(params[:id])
  end

  # POST /itinerarios
  # POST /itinerarios.xml
  def create
    @itinerario = Itinerario.new(params[:itinerario])

    respond_to do |format|
      if @itinerario.save
        format.html { redirect_to(@itinerario, :notice => 'Itinerario was successfully created.') }
        format.xml  { render :xml => @itinerario, :status => :created, :location => @itinerario }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @itinerario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /itinerarios/1
  # PUT /itinerarios/1.xml
  def update
    @itinerario = Itinerario.find(params[:id])

    respond_to do |format|
      if @itinerario.update_attributes(params[:itinerario])
        format.html { redirect_to(@itinerario, :notice => 'Itinerario was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @itinerario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /itinerarios/1
  # DELETE /itinerarios/1.xml
  def destroy
    @itinerario = Itinerario.find(params[:id])
    @itinerario.destroy

    respond_to do |format|
      format.html { redirect_to(itinerarios_url) }
      format.xml  { head :ok }
    end
  end
end
