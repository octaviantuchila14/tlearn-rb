module TLearn
  class Run

    def initialize(config, out=STDOUT)
      @config = config
      @out = out
    end

    def train(data, number_of_sweeps = nil)
      run_tlearn = RunTLearn.new(@config)

      results = run_tlearn.train(TrainingData.new(data), number_of_sweeps)
      
      if results
        results.each{|r| @out.puts(r.inspect)}
        results
      else
        @out.puts("[Error] Training failed") 
      end
    end

    def fitness(data, number_of_sweeps = nil)
      run_tlearn = RunTLearn.new(@config)

      run_tlearn.fitness(FitnessData.new(data), number_of_sweeps)
    end
  
  end
end