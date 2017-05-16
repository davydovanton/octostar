require_relative '../../../../apps/web/views/repos/index'

RSpec.describe Web::Views::Repos::Index do
  let(:exposures) { Hash[projects: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/repos/index.html.slim') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  describe '#title' do
    let(:project) { Project.new(name: 'test', owner: 'owner', url: 'google.com') }
    it { expect(view.title(project).to_s).to eq "<a target=\"_blank\" href=\"google.com\">owner&#x2F;test</a>" }
  end

  describe '#waiting_projects' do
    context 'when projects exist' do
      let(:exposures) { Hash[projects: [1], params: {} ] }
      it { expect(view.waiting_projects.to_s).to eq "" }
    end

    context 'when account does not have projects' do
      let(:exposures) { Hash[projects: [], params: {} ] }
      it do
        expect(view.waiting_projects.to_s).to eq(
          "<div class=\"projects__waiting\">\nWe are getting your starred projects...\n<br>\nPlease reload the page in few minutes.\n</div>"
        )
      end
    end

    context 'when result empty' do
      let(:exposures) { Hash[projects: [1], params: {} ] }
      it { expect(view.waiting_projects.to_s).to eq '' }
    end
  end
end
