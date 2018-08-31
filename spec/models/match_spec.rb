# == Schema Information
#
# Table name: matches
#
#  id         :integer          not null, primary key
#  league_id  :integer
#  comment    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  score1     :integer
#  score2     :integer
#  player1_id :integer
#  player2_id :integer
#

require 'rails_helper'

RSpec.describe Match, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
