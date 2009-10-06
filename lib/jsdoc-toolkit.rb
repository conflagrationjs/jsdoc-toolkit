require 'pathname'

module JsDocToolkit
  JsDocRoot = (Pathname(__FILE__).parent.parent + "src/jsdoc-toolkit/jsdoc-toolkit").expand_path
  JsDocTemplatePath = JsDocRoot + "templates"
  JsDocJarPath = JsDocRoot + "jsrun.jar"
  JsDocJsPath = JsDocRoot + "app/run.js"

end