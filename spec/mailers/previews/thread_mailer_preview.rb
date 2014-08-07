class ThreadMailerPreview < ActionMailer::Preview
  def new_discussion
    user = FactoryGirl.create(:user)
    discussion = FactoryGirl.create(:discussion)
    ThreadMailer.new_discussion(discussion, user)
  end

  def new_comment
    user = FactoryGirl.create :user
    discussion = FactoryGirl.create :discussion
    rich_text_body = "I am a comment with a **bold bit**"
    comment = FactoryGirl.create :comment, discussion: discussion, body: rich_text_body, uses_markdown: true
    ThreadMailer.new_comment comment, user
  end

  def new_vote
    user = FactoryGirl.create :user
    motion = FactoryGirl.create :motion
    vote = FactoryGirl.create :vote, motion: motion
    ThreadMailer.new_vote vote, user
  end

  def mentioned
    user = FactoryGirl.create(:user)
    discussion = FactoryGirl.create(:discussion)
    comment = FactoryGirl.create(:comment, discussion: discussion, body: "Hey there @#{user.username}, I love what you said and want to find out more about the stuff you mentioned, can we please have a cup of tea and a bike ride with me?")
    ThreadMailer.mentioned(user, comment)
  end
end