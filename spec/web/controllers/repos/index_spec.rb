require_relative '../../../../apps/web/controllers/repos/index'

RSpec.describe Web::Controllers::Repos::Index do
  let(:action) { described_class.new }
  let(:params) { Hash[] }

  let(:project_repo) { ProjectRepository.new }

  let(:account_repo) { AccountRepository.new }
  let(:account) { account_repo.create(login: 'davydovanton') }

  after do
    account_repo.clear
    project_repo.clear
  end

  context 'when account logined' do
    let(:session) { { account: account } }
    let(:params)  { { 'rack.session' => session } }

    before { project_repo.create(name: 'test', starred_at: Time.now, account_id: account.id) }

    it { expect(action.call(params)).to be_success }

    it 'does not contain projects' do
      action.call(params)
      expect(action.projects.count).to eq 1
    end

    context 'and limit sets' do
      before { project_repo.create(name: 'test', starred_at: Time.now, account_id: account.id) }
      let(:params)  { { 'rack.session' => session, limit: 1 } }

      it 'returns only one project' do
        action.call(params)
        expect(action.projects.count).to eq 1
      end
    end
  end

  context 'when account logined' do
    it { expect(action.call(params)).to be_success }

    it 'does not contain projects' do
      action.call(params)
      expect(action.projects).to eq []
    end
  end
end
