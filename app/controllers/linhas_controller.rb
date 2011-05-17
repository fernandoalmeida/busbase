class LinhasController < ApplicationController
  # GET /linhas
  # GET /linhas.xml
  def index
    @linhas = (params && params[:nome] ? Linha.pesquisar(params[:nome]) : Linha.all).paginate(:page => params[:page] || 1, :per_page => 50)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @linhas }
      format.json { render :json => @linhas.to_json }
    end
  end

  # GET /linhas/1
  # GET /linhas/1.xml
  def show
    @linha = Linha.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @linha }
    end
  end

  # GET /linhas/new
  # GET /linhas/new.xml
  def new
    @linha = Linha.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @linha }
    end
  end

  # GET /linhas/1/edit
  def edit
    @linha = Linha.find(params[:id])
  end

  # POST /linhas
  # POST /linhas.xml
  def create
    @linha = Linha.new(params[:linha])

    respond_to do |format|
      if @linha.save
        format.html { redirect_to(@linha, :notice => 'Linha was successfully created.') }
        format.xml  { render :xml => @linha, :status => :created, :location => @linha }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @linha.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /linhas/1
  # PUT /linhas/1.xml
  def update
    @linha = Linha.find(params[:id])

    respond_to do |format|
      if @linha.update_attributes(params[:linha])
        format.html { redirect_to(@linha, :notice => 'Linha was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @linha.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /linhas/1
  # DELETE /linhas/1.xml
  def destroy
    @linha = Linha.find(params[:id])
    @linha.destroy

    respond_to do |format|
      format.html { redirect_to(linhas_url) }
      format.xml  { head :ok }
    end
  end
end
