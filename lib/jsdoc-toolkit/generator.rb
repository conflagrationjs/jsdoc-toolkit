require 'jsdoc-toolkit'
require 'pathname'

module JsDocToolkit
  class Generator
    DefaultOptions = {:recurse => "-r", :all => "-a", :template => %Q[-t=#{JsDocTemplatePath + "jsdoc"}],
                      :verbose => "-v", :unique => "-u"}
    
    def build(options)
      src_files, doc_dir = Array(options[:src_files]), Pathname(options[:doc_dir].to_s)
      raise RuntimeError, "java was not found in your PATH." if `which java 2>/dev/null`.strip.empty?
      raise ArgumentError, ":src_files was not specified or was empty" if src_files.empty?
      raise ArgumentError, ":doc_dir was not specified or does not exist" unless options[:doc_dir] && doc_dir.exist?

      run_jsdoc(src_files, doc_dir)
    end
  
  private
  
    def run_jsdoc(src_files, doc_dir)
      system("java", "-jar", JsDocJarPath, JsDocJsPath, %Q[-d=#{doc_dir.expand_path}], *merge_defaults_with_src(src_files))
    end
    
    def merge_defaults_with_src(src_files)
      DefaultOptions.values + src_files
    end
    
  end # Generator
end   # JsDocToolkit