RSpec.describe AccountRepository do
  let(:repo) { AccountRepository.new }

  after { repo.clear }

  describe '#find_by_login' do
    context 'when account does not exist' do
      it { expect(repo.find_by_login('davydovanton')).to be nil }
    end

    context 'when account does not exist' do
      before { repo.create(login: 'davydovanton') }
      it { expect(repo.find_by_login('davydovanton')).to be_a Account }
    end
  end

  describe '#find_with_projects' do
    let(:account) { repo.create(login: 'davydovanton') }
    it { expect(repo.find_with_projects(account.id).projects).to eq [] }
  end
end
