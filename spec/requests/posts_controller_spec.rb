require 'rails_helper'

RSpec.describe "PostsControllers", type: :request do

  let!(:posts) { create_list(:post, 10) }
  let(:post_id) { posts.first.id }
  
  describe "GET /api/posts" do
    before { get '/api/posts' }
    it 'returns posts' do
      expect(json).not_to be_empty
    end
  end
end
