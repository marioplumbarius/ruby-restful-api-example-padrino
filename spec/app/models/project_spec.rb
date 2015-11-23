describe Project, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:release_date) }

  context 'with @kind' do

    Project.kinds.keys.each do |kind|

      it "should allow the value '#{kind}'" do
        project = build :project, kind: kind

        expect(project).to be_valid
      end

    end
  end
end
