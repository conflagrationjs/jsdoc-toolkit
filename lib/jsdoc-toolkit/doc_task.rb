require 'rake'
require 'jsdoc-toolkit'
require 'jsdoc-toolkit/generator'
require 'pathname'

module JsDocToolkit
  class DocTask
    attr_reader :jsdoc_files
    
    def initialize(task_name)
      @jsdoc_files = []
      yield(self)
      task(task_name) { build }
    end

    def jsdoc_dir=(path)    
      @jsdoc_dir = Pathname(path)
    end

  private

    def build
      generator = JsDocToolkit::Generator.new
      generator.build(:src_files => @jsdoc_files, :doc_dir => @jsdoc_dir.to_s)
    end
    
  end # DocTask
end   # JsDocToolkit