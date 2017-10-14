class FreeForm
  include ActiveModel::Model

  attr_accessor :free_texts

  def free_texts
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
