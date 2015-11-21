describe Developer, type: :model do
  it { is_expected.to validate_presence_of(:name) }

  # there is a open bug related to the following validation, so I'm keeping it in pending state until the fix comes up
  xit { is_expected.to validate_numericality_of(:age).only_integer }
  it { is_expected.to validate_presence_of(:age) }
  it { is_expected.to validate_numericality_of(:age).is_greater_than(0) }

  it { is_expected.to validate_presence_of(:github) }
  it { is_expected.to allow_value('https://github.com/marioluan').for(:github) }
  it { is_expected.to_not allow_value('github.com/marioluan').for(:github) }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to allow_value('mariosouzaluan@gmail.com').for(:email) }
  it { is_expected.to_not allow_value('mariosouzaluangmailcom').for(:email) }
end
