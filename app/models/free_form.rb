class FreeForm
  include ActiveModel::Model

  attr_accessor :test, :free_texts

  def text
    [{
      no: 1,
      comment: "コメント１"
    },
    {
      no: 2,
      comment: "コメント２"
    }]
  end
end
