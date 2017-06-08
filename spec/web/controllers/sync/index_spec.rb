require_relative '../../../../apps/web/controllers/sync/index'

RSpec.describe Web::Controllers::Sync::Index do
  Sidekiq::Testing.fake!
  let(:action) { described_class.new }
  let(:account) { Account.new(id: 1, login: 'davydovanton') }
  let(:session) { { account: account } }
  let(:params)  { { 'rack.session' => session } }

  it { expect(action.call(params)).to redirect_to('/') }
  it { expect{ action.call(params) }.to change(GetStarredProjectsWorker.jobs, :size).by(1) }
end
