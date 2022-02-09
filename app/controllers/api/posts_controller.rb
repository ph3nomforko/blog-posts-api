class Api::PostsController < ApplicationController

    require 'rest-client'

    #def ping
    #    url = "http://[::1]:3000"
    #    response = RestClient.get(url)
    #    render json:response
    #end

    def get_posts


        if params["tags"]
            url_params = []
            url_params = params[:tags].split(',')
            final_response = {:posts => []}
            hatchaway_url = "https://api.hatchways.io/assessment/blog/posts?tag="

            url_params.each do |tag|
                response = RestClient.get(hatchaway_url + tag)
                parsed_response = JSON.parse(response)
                parsed_response["posts"].each do |post|
                    final_response[:posts] << post
                end
            end

            final_response[:posts] = final_response[:posts].uniq!

            #final_response[:posts].each do |post|
            #    test_post_id = post["id"]
            #    found_id = final_response[:posts].find {|el| test_post_id = el}
            #    if found_id != nil
            #        final_response[:posts].delete_at(final_response[:posts].index(test_post_id))
            #    end
            #end

            render json: final_response

        else      
            payload = { error: "Tages parameter required" }
            render :json => payload
        end

    end

end
