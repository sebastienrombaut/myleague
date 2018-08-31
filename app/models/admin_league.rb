class AdminLeague < ApplicationRecord
  belongs_to :admin
  belongs_to :league
end
