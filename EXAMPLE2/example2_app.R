teaching <- function(path_code, path_docs, default_time,
                     title = "odin!",
                     parameters = NULL, extra = NULL) {
  model <- odin::odin_(path_code)
  
  code <- shiny::tagList(
    shiny::h2("Code"),
    shinyAce::aceEditor("code", mode = "r", readOnly = TRUE,
                        value = odin.ui:::read_text(path_code)))
  docs <- shiny::includeMarkdown(path_docs)
  
  ui <- shiny::shinyUI(
    shiny::navbarPage(
      title,
      id = "odin_ui_navbar",
      inverse = TRUE,
      shiny::tabPanel(
        "Code & documentation",
        shiny::fluidRow(
          shiny::column(6, code),
          shiny::column(6, docs))),
      shiny::tabPanel(
        "Run",
        odin.ui:::mod_model_ui("model", NULL)),
      shiny::tabPanel(
        "Parameters",
        odin.ui:::mod_parameter_input("odin_parameter", NULL))))
  
  server <- function(input, output, session) {
    shiny::callModule(odin.ui:::mod_model_server, "model",
                      model, default_time, parameters, extra)
    shiny::callModule(odin.ui:::mod_parameter_server, "odin_parameter",
                      model, default_time, parameters, extra)
  }
  
  shiny::shinyApp(ui, server)
  
}

teaching("example2.R", "example2.md", 14, 
         extra = list(mean_N = function(x) rowMeans(x$N)) )

