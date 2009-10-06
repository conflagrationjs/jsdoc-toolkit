require 'test_helper'
require 'jsdoc-toolkit/doc_task'

context "a JsDocToolkit::DocTask" do
  setup do    
    JsDocToolkit::DocTask.new("testing:doc_task") do |doc|
      doc.jsdoc_dir = 'output'
      doc.jsdoc_files = 'input'
    end
  end
  
  should "add a rake task to the task list with the given name" do
    Rake::Task["testing:doc_task"].name
  end.equals("testing:doc_task")
  
  should "generate the docs when invoked" do
    output_dir = Pathname(__FILE__).parent + "output"
    output_dir.rmtree if output_dir.exist?
    output_dir.mkdir
    Rake::Task["testing:doc_task"].invoke
    output_dir.entries.size > 2
  end
  
end