require 'spec_helper'

describe User do
  
  it { should have_valid(:name).when("steve danko", "bill", "dog") }
  it { should_not have_valid(:name).when(nil, "") }

  it { should have_valid(:phone_number).when("1234567890") }
  it { should_not have_valid(:phone_number).when(nil, "", "1233", "123456789", "drtrtg444", 
    "steve is" "1234 12344") }

  it { should have_valid(:email).when('steve@aol.com', 'bill@aol.com', 'dog@aol.com') }
  it { should_not have_valid(:email).when(nil, '','steve', 'bill', 'dog') }

  it { should have_valid(:encrypted_password).when("somepassword88", "1234567811", "steved10") }
  it { should have_valid(:encrypted_password).when("", nil, "this", "steveddd", "1234569") }

end