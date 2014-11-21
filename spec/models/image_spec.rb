require 'rails_helper'

describe Image do 

    it { is_expected.to validate_presence_of :title}
    it { is_expected.to validate_presence_of :imgurl}
    it { is_expected.to validate_presence_of :width}
    it { is_expected.to validate_presence_of :height}
    it { is_expected.to validate_presence_of :filesize}
    it { is_expected.to have_and_belong_to_many :boards}

end
