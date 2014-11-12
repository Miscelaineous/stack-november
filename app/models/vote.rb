class Vote < ActiveRecord::Base
	belongs_to :story, counter_cache: true # counter_cache makes sure the table's votes count is up to date
	validates :ip_address, uniqueness: {scope: :story}
end
