# CustomerX Tracking Client
It is a service provided by CustomerX, so that its customers can track their actions in their software.

## Documentation

This Ruby gem is a wrapper around CustomerX Tracking REST API. Please see our [API documentation](https://doc.tracking.customerx.com.br) for more information.

Please check out the [class documentation](https://doc.tracking.customerx.com.br), and [issues](https://github.com/CustomerX-CX/customerx_tracking_client_rb/issues) before reporting a bug or asking for help.

## Installation

The CustomerX Tracking client can be installed using Rubygems or Bundler.

### Rubygems

```sh
gem install customerx_tracking
```

### Bundler

Add it to your Gemfile

    gem "customerx_tracking"

and follow normal [Bundler](https://bundler.io/) installation and execution procedures.

## Configuration

```ruby
require 'customerx_tracking'

CustomerxTracking.config do |c|
  # Mandatory:

  c.base_url = "<- customerx-tracking-url ->" # e.g. https://tracker.customerx.com.br or https://sandbox.tracker.customerx.com.br

  # To perform any tracking action, it is necessary to inform the credential and key that is released when creating a new account in our environments. These credentials identify your company so that the link of the tracking carried out is valid.
  c.credential = "your credential"
  c.key = "your key"

  # In the authorization method, the company key found in the company's registration is required. In this method we will get this key plus the external_id_client and the email of the user who will be tracking. We will create a SHA256 and then convert to Base64 this will be your authorization. Example:
  
  # Ruby 
  ### mySHA256 = OpenSSL::HMAC.digest('sha256', your customer key, "#{client.external_id_client}:#{email}")
  ### myBase64 = Base64.encode64(mySHA256) 
  ### /h/B4pTJ3FdOgkYdYuh1UZFQ16B1pi+5idFCJKJ9Z1g=

  # JS
  ### funcao gera_hash(external_id_client, email_client) {
  ###   key = 'e64ec8813228b00400f3da965d858513';
  ###   value = external_id_client + ':' + email_client;
  ###   sha_256 = HMAC.SHA256(key, value);
  ###   hash = Base64.encode(sha_256);
  ###   retorna hash;
  ### }

  # OBS: Use only one authentication method. Authorization or Credential and Key
  c.authorization = ""
end
```

## Usage

## Actions

### Tracker

To make the tracker just start the module ```CustomerxTracking::Tracker.create``` with that enter the parameters for the tracker

Mandatory parameters:

* external_id_client **required field**
* identifier **required field**
* type_tracking **required field**
* email **required field**

Field Details:

* external_id_client - Your customer code
* type_tracking - What will be tracheated? A screen (screen), an action (action) or a login (login) NOTE: The identifier can be used to generate the tracking record
* identifier - Screen name or action that was performed
* email - Email of the user who performed the operation (NOTE: The email must be linked to a client in our database so that we can make the reference between tracking and our platform
* amount - Total number of operations, not mandatory. If not informed, 1 will be counted for each request, if informed, the amount informed will be counted
* external_id_product - If you need to control tracking by product, just inform the code of the product to be tracked
* external_id_contact - If the email does not exist, the external id of the contact can be sent, so that we can search for this email in our database, we will automatically fill in the email
* date_tracking - If necessary, retroactive tracking can be informed with the date on which the operation was performed, if not, the date of the tracheting moment will be entered. NOTE: Format 04/09/2020

Example:

```
CustomerxTracking::Tracker.create({
  external_id_client: '145206',
  identifier: 'report_x',
  type_tracking: 'action',
  email: 'email@email.com'
})
```

## Note on Patches/Pull Requests
1. Fork the project.
2. Make your feature addition or bug fix.
3. Add tests for it. This is important so that we don't break it in a future
   version unintentionally.
4. Commit. Do not alter `Rakefile`, version, or history. (If you want to have
   your own version, that is fine, but bump version in a commit by itself that
   we can ignore when we pull.)
5. Submit a pull request.