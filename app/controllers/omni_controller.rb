class OmniController < ApplicationController
  def square_new  
    render({ :template => "game_templates/new_square_calc" })
  end

  def square_results
    @the_num = params.fetch("number").to_f

    @the_result = @the_num ** 2
      
    render({ :template => "game_templates/square_results" })
  end

  def square_root_new  
    render({ :template => "game_templates/new_square_root_calc" })
  end

  def square_root_results
    @the_num = params.fetch("number").to_f

    @the_result = @the_num ** (0.5)
       
    render({ :template => "game_templates/square_root_results" })
  end

  def random_new  
    render({ :template => "game_templates/new_random_calc" })
  end

  def random_results
    @input_min = params.fetch("user_min").to_f
    @input_max = params.fetch("user_max").to_f
    
    @the_result = rand(@input_min..@input_max)

    render({ :template => "game_templates/random_results" })
  end

  def payment_new  
    render({ :template => "game_templates/new_payment_calc" })
  end

  def payment_results
    @input_apr = params.fetch("user_apr").to_f
    @input_years = params.fetch("user_years").to_i
    @input_pv = params.fetch("user_pv").to_f
  
    @numerator = (@input_apr / 100 / 12) * @input_pv
    @denominator = (1 - ((1 + (@input_apr / 100 / 12)) ** (-@input_years * 12)))
    @payment = @numerator / @denominator
  
    render({ :template => "game_templates/payment_results" })
  end
end
