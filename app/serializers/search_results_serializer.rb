class SearchResultsSerializer < ActiveModel::Serializer
  attributes :no_relation, :following, :requested

  def no_relation
    object[:no_relation].map {|user|
    UserSerializer.new(user)
    }
  end

  def following
    object[:following].map {|user|
    UserSerializer.new(user)
    }
  end

  def requested
    object[:requested].map {|user|
    UserSerializer.new(user)
    }
  end

end
