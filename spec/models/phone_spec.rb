require 'spec_helper'

describe Phone do
    
  it "does not allow duplicate phone numbers per contact w/ factory" do
    contact = create(:contact)
    home_phone = create(:home_phone, 
                        contact: contact,
                        phone: '785-555-1234'
                       ) 
    mobile_phone = build(:mobile_phone,
                        contact: contact,
                        phone: '785-555-1234'
    )    
    expect(mobile_phone).to have(1).errors_on(:phone)
  end
  
  it "allows two contacts to share a phone number w/ factory" do
    create(:home_phone,
          phone: "785-555-1234"
          )
    phone2 = build(:home_phone, phone: "785-555-1234")
expect(phone2).to be_valid

  end
end
