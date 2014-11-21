require 'rails_helper'

describe Board do 

    it { is_expected.to validate_presence_of :name}
    it { is_expected.to validate_presence_of :theme}
    it { is_expected.to have_and_belong_to_many :images}
    it { is_expected.to belong_to :user}
  

end
