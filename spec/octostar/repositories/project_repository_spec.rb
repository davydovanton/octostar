RSpec.describe ProjectRepository do
  let(:repo) { ProjectRepository.new }

  after do
    AccountRepository.new.clear
    repo.clear
  end

  describe '#find_by_account' do
    before do
      a = AccountRepository.new.create(login: 'other')
      repo.create(name: 'test', starred_at: Time.now, account_id: account.id)
      repo.create(name: 'test', starred_at: Time.now, account_id: a.id)
    end

    let(:account) { AccountRepository.new.create(login: 'davydovanton') }
    it { expect(repo.find_by_account(account.id).count).to eq 1 }
  end
end
