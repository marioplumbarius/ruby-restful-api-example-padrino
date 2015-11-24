describe Project, type: :model do
  it { is_expected.to belong_to(:developer) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:release_date) }
  it { is_expected.to validate_presence_of(:developer) }

  context 'with @kind' do

    Project.kinds.keys.each do |kind|

      it "should allow the value '#{kind}'" do
        project = build :project, kind: kind

        expect(project).to be_valid
      end

    end
  end

  context 'default_scope' do

    after do
      Project.first
    end

    it 'orders by :updated_at' do
      expect(Project).to receive(:order).with(:updated_at)
    end
  end

end
