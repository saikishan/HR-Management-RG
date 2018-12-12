class SkillsController < ApplicationController

    def new
        @skill = Skill.new
    end
    
    def create
        @skill = Skill.new(skill_params)
        if @skill.save
            redirect_to @skill
        else
            render 'new'
        end
    end

    def index 
        @skills = Skill.all
    end

    def edit
        @skill = Skill.find(params[:id])
    end

    def update
        @skill = Skill.find(params[:id])
        if @skill.update(skill_params)
            redirect_to @skill
        else
            render 'edit'
        end
    end

    def destroy
        @skill = Skill.find(params[:id])
        @skill.destroy
        redirect_to skills_path
      end

    def show
        #show links to all wmployes with this skill 
        @skill = Skill.find(params[:id])
    end
    private 
    def skill_params
        params.require(:skill).permit(:name)
    end
end
