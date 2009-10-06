require 'jsdoc-toolkit'
require 'pathname'

module JsDocToolkit
  class Generator
    DefaultOptions = {:recurse => "-r", :all => "-a", :template => %Q[-t=#{JsDocTemplatePath + "jsdoc"}]}
    
    def build(options)
      raise RuntimeError, "java was not found in your PATH." if `which java 2>/dev/null`.strip.empty?
      raise ArgumentError, ":src_dir was not specified" unless options[:src_dir]
      raise ArgumentError, ":doc_dir was not specified" unless options[:doc_dir]
      
      src_dir, doc_dir = Pathname(options[:src_dir]), Pathname(options[:doc_dir])
      raise ArgumentError, ":src_dir does not exist" unless src_dir.exist?
      raise ArgumentError, ":doc_dir does not exist" unless doc_dir.exist?
      run_jsdoc(src_dir, doc_dir)
    end
  
  private
  
    def run_jsdoc(src_dir, doc_dir)
      system("java", "-jar", JsDocJarPath, JsDocJsPath, %Q[-d=#{doc_dir.expand_path}], *merge_defaults_with_src(src_dir))
    end
    
    def merge_defaults_with_src(src_dir)
      DefaultOptions.values + [src_dir.expand_path.to_s]
    end
    
  end # Generator
end   # JsDocToolkit