class Quote < ApplicationRecord
  has_many :comments, dependent: :destroy
  
   validates :text, presence: true,
                    length: { minimum: 3 }
end

