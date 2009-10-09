require 'rake'
require 'jsdoc-toolkit'
require 'jsdoc-toolkit/generator'
require 'pathname'

module JsDocToolkit
  class DocTask
    
    def initialize(task_name)
      yield(self)
      task(task_name) { build }
    end

    def jsdoc_dir=(path)    
      @jsdoc_dir = Pathname(path)
    end
    
    def jsdoc_files=(path)
      @jsdoc_files = Pathname(path)
    end  

  private

    def build
      generator = JsDocToolkit::Generator.new
      generator.build(:src_dir => @jsdoc_files.to_s, :doc_dir => @jsdoc_dir.to_s)
    end
    
  end # DocTask
end   # JsDocToolkit