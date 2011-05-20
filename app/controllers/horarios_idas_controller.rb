class HorariosIdasController < ApplicationController
  # GET /horarios_idas
  # GET /horarios_idas.xml
  def index
    @horarios_idas = HorariosIda.pesquisar(params[:linha_id])

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @horarios_idas }
    end
  end

  # GET /horarios_idas/1
  # GET /horarios_idas/1.xml
  def show
    @horarios_ida = HorariosIda.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @horarios_ida }
    end
  end

  # GET /horarios_idas/new
  # GET /horarios_idas/new.xml
  def new
    @horarios_ida = HorariosIda.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @horarios_ida }
    end
  end

  # GET /horarios_idas/1/edit
  def edit
    @horarios_ida = HorariosIda.find(params[:id])
  end

  # POST /horarios_idas
  # POST /horarios_idas.xml
  def create
    @horarios_ida = HorariosIda.new(params[:horarios_ida])

    respond_to do |format|
      if @horarios_ida.save
        format.html { redirect_to(@horarios_ida, :notice => 'Horarios ida was successfully created.') }
        format.xml  { render :xml => @horarios_ida, :status => :created, :location => @horarios_ida }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @horarios_ida.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /horarios_idas/1
  # PUT /horarios_idas/1.xml
  def update
    @horarios_ida = HorariosIda.find(params[:id])

    respond_to do |format|
      if @horarios_ida.update_attributes(params[:horarios_ida])
        format.html { redirect_to(@horarios_ida, :notice => 'Horarios ida was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @horarios_ida.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /horarios_idas/1
  # DELETE /horarios_idas/1.xml
  def destroy
    @horarios_ida = HorariosIda.find(params[:id])
    @horarios_ida.destroy

    respond_to do |format|
      format.html { redirect_to(horarios_idas_url) }
      format.xml  { head :ok }
    end
  end
end
