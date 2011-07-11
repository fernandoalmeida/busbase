class LinhasController < ApplicationController

  respond_to :html
  respond_to :xml, :json, :only => :index

  # GET /linhas
  # GET /linhas.xml
  # GET /linhas.json
  def index
    @linhas = (params && params[:nome] ? Linha.pesquisar(params[:nome]) : Linha.all)
    respond_to do |format|
      format.html { @linhas = @linhas.paginate(:page => params[:page] || 1, :per_page => 50)}
      format.any(:xml, :json) do
        formato = request.format.to_sym
        saida   = { :methods => [:proximo_horario], :only => [:id, :nome, :numero], :include => :empresa }
        render formato => @linhas.send("to_#{formato}", saida)
      end
    end
  end

  # GET /linhas/1
  def show
    @linha = Linha.find(params[:id])
    respond_with @linha
  end

  # GET /linhas/new
  def new
    @linha = Linha.new
  end

  # GET /linhas/1/edit
  def edit
    @linha = Linha.find(params[:id])
  end

  # POST /linhas
  def create
    @linha = Linha.new(params[:linha])
    respond_with(@linha) do |format|
      format.html { @linha.save ? redirect_to(linhas_path, :notice => 'Linha cadastrada com sucesso.') : render(:action => "new") }
    end
  end

  # PUT /linhas/1
  def update
    @linha = Linha.find(params[:id])
    respond_with(@linha) do |format|
      format.html { @linha.update_attributes(params[:linha]) ? redirect_to(linhas_path, :notice => 'Linha atualizada com sucesso.') : render(:action => "edit") }
    end
  end

  # DELETE /linhas/1
  def destroy
    @linha = Linha.find(params[:id])
    @linha.destroy
    redirect_to(linhas_url)
  end
end
