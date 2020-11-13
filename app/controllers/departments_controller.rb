class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :edit, :update, :destroy]

  # GET /departments
  # GET /departments.json
  def index
    @departments = Department.where(" current_level =1")
  end

  # GET /departments/1
  # GET /departments/1.json
  def show
  end

  # GET /departments/new
  def new
    @department = Department.new
    @parent = params[:parent]
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end

  # GET /departments/1/edit
  def edit
  end

  # POST /departments
  # POST /departments.json
  def create
    @department = Department.new(department_params)
    puts "*"*45
    @department.attributes.each do |k,v|
      puts k
      puts v
    end
    puts "*"*45
    if params[:parent].presence

      @parent_deparment = Department.friendly.find(params[:parent])
      if !(@parent_deparment)
        respond_to do |format|
          format.html { render :new }
          format.json { render json: 'Error, not found parent of this department.', status: :unprocessable_entity }
        end
      end
    end

    if params[:parent].presence

      @parent_deparment = Department.friendly.find(params[:parent])

      @department.current_level = @parent_deparment.current_level + 1

      @department.department_id = @parent_deparment.id
      
      case @department.current_level
      when 1
        @department.level1 = @department.id
        @department.path = @department.id.to_s
      when 2
        @department.level1 = @parent_deparment.level1
        @department.level2 = @department.id
        @department.path = @parent_deparment.path + @department.id.to_s
      when 3
        @department.level1 = @parent_deparment.level1
        @department.level2 = @parent_deparment.level2
        @department.level3 = @department.id
        @department.path = @parent_deparment.path + @department.id.to_s
      when 4
        @department.level1 = @parent_deparment.level1
        @department.level2 = @parent_deparment.level2
        @department.level3 = @parent_deparment.level3
        @department.level4 = @department.id
        @department.path = @parent_deparment.path + @department.id.to_s
      when 5
        @department.level1 = @parent_deparment.level1
        @department.level2 = @parent_deparment.level2
        @department.level3 = @parent_deparment.level3
        @department.level4 = @parent_deparment.level4
        @department.level5 = @department.id
        @department.path = @parent_deparment.path + @department.id.to_s
      when 6
        @department.level1 = @parent_deparment.level1
        @department.level2 = @parent_deparment.level2
        @department.level3 = @parent_deparment.level3
        @department.level4 = @parent_deparment.level4
        @department.level5 = @parent_deparment.level5
        @department.level6 = @department.id
        @department.path = @parent_deparment.path + @department.id.to_s
      else
        @department.level1 = @department.id
        @department.path = @department.id.to_s
      end

    else
      @department.current_level = 1
      @department.level1 = 1
      @department.path = "1"
    end

    respond_to do |format|
      if @department.save
        format.html { redirect_to @department, notice: 'Department was successfully created.' }
        format.json { render :show, status: :created, location: @department }
      else
        format.html { render :new }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /departments/1
  # PATCH/PUT /departments/1.json
  def update
    respond_to do |format|
      if @department.update(department_params)
        format.html { redirect_to @department, notice: 'Department was successfully updated.' }
        format.json { render :show, status: :ok, location: @department }
      else
        format.html { render :edit }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    @department.destroy
    respond_to do |format|
      format.html { redirect_to departments_url, notice: 'Department was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.friendly.find(params[:id])
    end

    def get_path(department)
    end

    # Only allow a list of trusted parameters through.
    def department_params
      params.require(:department).permit(:name)
    end
end
