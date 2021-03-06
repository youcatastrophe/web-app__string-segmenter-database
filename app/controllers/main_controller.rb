# Example of the StringSegmenter that is ALREADY included in this application:

# x = StringSegmenter.new("pubcat")
# x.run_program
# x.final_words # Returns an Array of the segmented words.

# So now you have the Ruby program needed to complete this assignment.

# Your controller actions go below this line.
# -----------------------------------------------------------------------------
MyApp.get "/" do

  erb :"main/homepage"
end

MyApp.get "/segment" do
  x = StringSegmenter.new(params[:string_to_segment])
  x.run_program
  @words = x.final_words.join(", ")

  @s = Search.new
  @s.search_string = params[:string_to_segment]
  @s.segmented_parts = @words
  @s.save

  erb :"/result"

end

MyApp.get "/admin" do
  @searches = Search.all
  erb :"Admin/all_results"
end