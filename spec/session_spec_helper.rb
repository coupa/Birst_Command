module SessionSpecHelper
  def mock_login_and_out(&block)
  	
    message = { :username => Settings.session.username, :password => Settings.session.password }
    savon.expects(:login).with(message: message).returns(BCSpecFixtures.login)
    yield if block_given?
    savon.expects(:logout).with(message: { :token => BCSpecFixtures.login_token }).returns(BCSpecFixtures.logout)
  end
end
