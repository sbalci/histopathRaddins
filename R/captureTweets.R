#' Capture Tweets
#'
#'@import shiny
#'@import miniUI
#'@import rtweet
#'@import shinyWidgets
#'@import glue
#'
#' @return
#' @export
#'
#' @examples
#'
# captureTweets <- function(inputValue1, inputValue2) {
    
    ui <- miniUI::miniPage(
        miniUI::gadgetTitleBar("Capture Tweet"),
        miniUI::miniTabstripPanel(
            miniUI::miniTabPanel(
                "Input Tweet",
                icon = shiny::icon("twitter"),
        
        
        miniUI::miniContentPanel(
            # Define layout, inputs, outputs
            
            shiny::textInput("tweetaddress", "tweetaddress"),
            
            shiny::verbatimTextOutput("tweetshot")
            
            
        )
        
        
            )
        )
        
        
        
    )
    
    server <- function(input, output, session) {
        # Define reactive expressions, outputs, etc.
        
        
        output$tweetshot <- renderPrint({
            
            req(input$tweetaddress)
            
            rtweet::tweet_shot(input$tweetaddress)
            
            
            
        })
        
        
        
        # When the Done button is clicked, return a value
        observeEvent(input$done, {
            returnValue <- "done"
            stopApp(returnValue)
        })
    }
    
    
    shiny::runGadget(ui, server,
                     viewer = shiny::dialogViewer(dialogName = "PubMed Search", width = 600, height = 600)
                     # viewer = paneViewer()
    )
    
    
# }


#### 


# deneme <- tweetCodesSubspeciality2 %>%
#     select(status_id,
#            selectedtweets = selectedPathHashtag,
#            status_url,
#            media_url,
#            media_type,
#            ext_media_url) %>%
#     filter(!is.na(selectedtweets)) %>%
#     filter(!is.na(media_url)) %>%
#     filter(media_type == "photo")
#     unnest_wider(data = .,
#                  col = ext_media_url,
#                  names_sep = "_") %>%
#     janitor::clean_names()


# for (i in 1:dim(deneme)[1]) {
# 
#     nameTweetShot <- paste0("TS-", deneme$status_id[i])
# 
#     value <- rtweet::tweet_shot(deneme$status_id[i])
# 
#     assign(x = nameTweetShot, value = value)
# 
#     pathTweetShot <- paste0("~/PathologyTweets2WP/tweetshot/",
#                             nameTweetShot,
#                             ".png")
# 
#     magick::image_write(image = value,
#                         path = pathTweetShot,
#                         format = "png")
# 
#     Sys.sleep(2)
# 
# }



# for (i in 1:dim(deneme)[1]) {
# 
# nameTweetimage <- paste0("TI-", deneme$status_id[i])
# 
# pathTweetimages <- paste0("~/PathologyTweets2WP/tweetimages/",
#                         nameTweetimage
#                         )
# 
# if(!is.na(deneme$ext_media_url_1[i])){
#     download.file(
#         url = deneme$ext_media_url_1[i],
#         destfile = paste0(pathTweetimages,"-1",".jpg"),
#         quiet = TRUE
#     )
# }
# 
# 
# if(!is.na(deneme$ext_media_url_2[i])){
#     download.file(
#         url = deneme$ext_media_url_2[i],
#         destfile = paste0(pathTweetimages,"-2",".jpg"),
#         quiet = TRUE
#     )
# }
# 
# if(!is.na(deneme$ext_media_url_3[i])){
#     download.file(
#         url = deneme$ext_media_url_3[i],
#         destfile = paste0(pathTweetimages,"-3",".jpg"),
#         quiet = TRUE
#     )
# }
# 
# if(!is.na(deneme$ext_media_url_4[i])){
#     download.file(
#         url = deneme$ext_media_url_4[i],
#         destfile = paste0(pathTweetimages,"-4",".jpg"),
#         quiet = TRUE
#     )
# }
# 
# Sys.sleep(2)
# 
# }
