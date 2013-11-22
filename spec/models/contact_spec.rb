require 'spec_helper'

describe Contact do
	it "is valid with a firstname, lastname, and email" do
	  contact = build(:contact)
    expect(contact).to be_valid
	end

	it "is invalid without a firstname" do
	  contact = build(:contact, firstname: nil)
	  expect(contact).to have(1).errors_on(:firstname)
	end

	it "is invalid without a lastname" do
	  contact = build(:contact, lastname: nil)
	  expect(contact).to have(1).errors_on(:lastname)
	end

	it "is invalid without an email address w/o factory" do
	  expect(Contact.new(email: nil)).to have(1).errors_on(:email)
	end
	
	it "is invalid without an email address w/ factory" do
	  contact = build(:contact, email: nil)
	  expect(contact).to have(1).errors_on(:email)
	end
	
	it "is invalid with a duplicate email address w/ factory" do
    create(:contact, 
            email: "stan@example.com"
          )
    contact = build(:contact, 
                    email: "stan@example.com"
                    )
    expect(contact).to have(1).errors_on(:email)
  end
  
	it "returns a contact's full name as a string w/o factory" do
    contact = Contact.new(
      firstname: "Stanley",
      lastname: "Chiang",
      email: "stan@ley.com"
    )
    expect(contact.name).to eq 'Stanley Chiang'
	end
	
	it "returns a contact's full name as a string w/ factory" do
    contact = build(:contact, 
                    firstname: "Jane",
                    lastname: "Doe"
                    )
    expect(contact.name).to eq "Jane Doe"
  end	
    
describe "filter last name by letter" do
  before :each do
    @smith = create(:contact, firstname: 'John', lastname: 'Smith',
    email: 'jsmith@example.com')
    @jones = create(:contact, firstname: 'Tim', lastname: 'Jones',
    email: 'tjones@example.com')
    @johnson = create(:contact, firstname: 'John', lastname: 'Johnson',
    email: 'jjohnson@example.com')
  end

  context "matching letters" do
    it "returns a sorted array of results that match" do
      expect(Contact.by_letter("J")).to eq [@johnson, @jones]
    end
  end
  context "non-matching letters" do
    it "returns a sorted array of results that match" do
      expect(Contact.by_letter("J")).to_not include @smith
    end
  end
end


  
  it "has a valid factory" do
    expect(build(:contact)).to be_valid
  end
    
  it "has three phone numbers" do
    expect(create(:contact).phones.count).to eq 3
  end

    
end
