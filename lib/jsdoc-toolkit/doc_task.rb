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
      @jsdoc_dir = Pathname(caller.first.sub(/:\d+$/, "")).expand_path.parent + path
    end
    
    def jsdoc_files=(path)
      @jsdoc_files = Pathname(caller.first.sub(/:\d+$/, "")).expand_path.parent + path
    end  

  private

    def build
      generator = JsDocToolkit::Generator.new
      generator.build(:src_dir => @jsdoc_files.expand_path.to_s, :doc_dir => @jsdoc_dir.expand_path.to_s)
    end
    
  end # DocTask
end   # JsDocToolkit