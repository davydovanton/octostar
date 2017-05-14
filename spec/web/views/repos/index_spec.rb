require_relative '../../../../apps/web/views/repos/index'

RSpec.describe Web::Views::Repos::Index do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/repos/index.html.slim') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  describe '#title' do
    let(:project) { Project.new(name: 'test', owner: 'owner', url: 'google.com') }
    it { expect(view.title(project).to_s).to eq "<a target=\"_blank\" href=\"google.com\">owner&#x2F;test</a>" }
  end
end
