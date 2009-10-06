require 'test_helper'
require 'jsdoc-toolkit/generator'

context "a JsDocToolkit::Generator" do
  
  context "with valid arguments and generating docs" do
    
    setup do
      output_dir = Pathname(__FILE__).parent + "output"
      output_dir.rmtree if output_dir.exist?
      output_dir.mkdir
      generator = JsDocToolkit::Generator.new
      generator.build(:src_dir => Pathname(__FILE__).parent + "input", :doc_dir => output_dir)
      output_dir
    end
    
    should "have created files in the output dir" do
      topic.entries.size > 2
    end
    
  end # with valid arguments and generating docs
  
  context "with various modes of build failure" do
    setup do
      generator = JsDocToolkit::Generator.new      
    end
    
    should "fail without java in ENV['PATH']" do
      begin
        original_path = ENV['PATH']
        ENV['PATH'] = ""
        topic.build(:src_dir => Pathname("input"), :doc_dir => Pathname("output"))
      ensure
        ENV['PATH'] = original_path
      end
    end.raises(RuntimeError, /java was not found/)
  
    should "fail if src dir does not exist" do
      topic.build(:src_dir => Pathname("bzzzzzzzzzzzt"), :doc_dir => Pathname("output"))    
    end.raises(ArgumentError, /src_dir does not exist/)
  
    should "fail if doc dir does not exist" do
      topic.build(:src_dir => Pathname(__FILE__).parent + "input", :doc_dir => Pathname("bzzzzzzzt"))
    end.raises(ArgumentError, /doc_dir does not exist/)
  
    should "fail if src dir is not specified" do
      topic.build(:doc_dir => Pathname("output"))    
    end.raises(ArgumentError, /src_dir was not specified/)
  
    should "fail if doc dir is not specified" do
      topic.build(:src_dir => Pathname("input"))
    end.raises(ArgumentError, /doc_dir was not specified/)
    
  end # with various modes of build failure
  
end

