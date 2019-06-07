class TablesController < ApplicationController
  before_action :current, only: [:show, :edit, :update, :destroy]

  def index
    @tables = Table.where(completed: false)
  end

  def completed
    @tables = Table.where(completed: true)
  end


  def new
    @table = Table.new
  end


  def create
    @table = Table.new(table_params)
    if @table.save
      redirect_to tables_path, notice: "Table save successfully!!"

    else
      render :new, notice: "Error, try again."
    end
  end


  def show
  end


  def edit
  end


  def update
    # @table = Table.find(params[:id])
    @table.update(table_params)

    redirect_to tables_path #cambiar luego para path hacia los inventarios
  end



  def destroy
    @table.destroy

    redirect_to tables_path, notice: "Template destroyed"
  end


  private
  def table_params
    params.require(:table).permit(:product, :description, :qty, :price, :total_price, :completed)
  end

  def current
    @table = Table.find(params[:id])
  end
end
