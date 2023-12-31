
Feature: Validating Place API
#-------------------------------------------------------------------------------------------------------------------------
  @RegisterLeadAPI
  Scenario Outline: Verify if Lead is being Succesfully added using RegisterAPI
    Given AddLeadAPI Payload with "<Mobilenumber>"
    When user calls endpoint "InstaOtpSent" with "POST" http request
    Then the API call got success with status code 200
    And "message" in response body is "OTP sent successfully"
    And the call Payload with "<Mobilenumber>" "<OTP>"
    Then calls endpoint "InstaVerifyOTP" with "POST" http request
    Then the API call got success with status code 200
    And "message" in response body is "OTP verified successfully. Welcome ."
    And "data.lead.mobile" in response body is "<Mobilenumber>"
   
    Examples: 
      | Mobilenumber | OTP    |
      |   9567189111 | 123456 |
      |    785643266 | 123456 |
      |  87654320972 | 123456 |

#------------------------------------------------------------------------------------------------------------------------
  @quick-eligibility/business-locationAPI
  Scenario Outline: Quick Eligibilty checks for Buisness Location
    Given EligibilitychecksAPI Payload with "<lead_id>" "<pincode>" "<email>" "<action>"
    When calls Endpoint "Instaeligibiltychecks" with "POST" http Requests
    Then the API call got success with status code 200
    And "message" in response body is "Lead updated successfully"
    And "data.lead.email" in response body is "<email>"
    And "data.lead.pincode" in response body is "<pincode>"

    Examples: 
      | lead_id                              | pincode | email         |action|
      | 2266053a-b11d-d9df-f00e-64a3cc8969b2 |  560040 | huj@gmail.com |business_location|
      | 2266053a-b11d-d9df-f00e-64a3cc8969b2 |  560078 | huj@          |business_location|

#-------------------------------------------------------------------------------------------------------------------------
  @quick-eligibility/business-informationAPI
  Scenario Outline: Verify the Business information
    Given Add Business Information payload with "<lead>" "<occupationType>" "<BusinessVintage>" "<Industryid>" "<action>"
    When call end point "Instaeligibiltychecks" and "POST" the request
    Then the API call got success with status code 200
    And "message" in response body is "Lead updated successfully"
    And "data.lead.business_vintage" in response body is "<BusinessVintage>"

    Examples: 
      | lead                                 | occupationType | BusinessVintage | Industryid | action               |
      | 2266053a-b11d-d9df-f00e-64a3cc8969b2 | Business Owner | >36 months      |          1 | business_information |

#--------------------------------------------------------------------------------------------------------------------------
  @quick-eligibility/business-natureAPI
  Scenario Outline: Verify the Business Nature
    Given Add Business Nature Payload with values of "<Leadid>"  "<NatureBusinessID>" "<action>"
    And call end point "Instaeligibiltychecks" and "POST" the request
    Then the API call got success with status code 200
    And "message" in response body is "Lead updated successfully"

    Examples: 
      | Leadid                               | NatureBusinessID | action             |
      | 37faa01f-e9ab-d47f-62f8-634f828110b2 |                1 | nature_of_business |

#----------------------------------------------------------------------------------------------------------------------------
  @quick-eligibility/business-panAPI
  Scenario Outline: Verify the Buiness pan
    Given Add Business PAN payload with values of "<Leadid>"  "<PAN>" "<action>" <masterid>
    And call end point "Instaeligibiltychecks" and "POST" the request
    Then the API call got success with status code 200
    And "message" in response body is "Lead updated successfully"
    And "data.lead.pan" in response body is "<PAN>"

    Examples: 
      | Leadid                               | PAN        | action       | masterid |
      | 37faa01f-e9ab-d47f-62f8-634f828110b2 | BAWPM3735P | business_pan |        1 |
      | 37faa01f-e9ab-d47f-62f8-634f828110b2 | BAWPM3735P | business_pan |        2 |
   
#---------------------------------------------------------------------------------------------------------------------
  @quick-eligibility/business-documentAPI
  Scenario Outline: Verify the Business Documents
    Given Add Business Documents payload with values of "<Leadid>"  "<docboolean>" "<action>"
    And call end point "Instaeligibiltychecks" and "POST" the request
    Then the API call got success with status code 200
    And "message" in response body is "Lead updated successfully"
    
    Examples: 
      | Leadid                               | docboolean | action            |
      | 37faa01f-e9ab-d47f-62f8-634f828110b2 | true       | business_document |
#---------------------------------------------------------------------------------------------------------------------
    @quick-eligibility/loan-purposeAPI
    Scenario Outline: Verify the Business Loan Purpose
    Given Add Business loan purpose payload value of "<Leadid>"  "<num>" "<loanpurpose>"
    And call end point "Instaeligibiltychecks" and "POST" the request
    Then the API call got success with status code 200
    And "message" in response body is "Lead updated successfully"

    Examples: 
      | Leadid                               | num | loanpurpose  |
      | 37faa01f-e9ab-d47f-62f8-634f828110b2 |   5 | loan_purpose |
