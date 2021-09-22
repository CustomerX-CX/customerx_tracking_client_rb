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

Configuration is done through a block returning an instance of `CustomerxTracking::Client`.
The block is mandatory and if not passed, an `ArgumentError` will be thrown.

```ruby
require 'customerx_tracking'

@customerx_tracking = CustomerxTracking::Client.new do |config|
  # Mandatory:

  config.base_url = "<- customerx-tracking-url ->" # e.g. https://tracking.customerx.com.br/api/v1/tracking or https://sandbox.tracking.customerx.com.br/api/v1/tracking

  # Choose one of the following depending on your authentication
  config.credential = "your credential"
  config.key = "your key"
end
```

## Usage

The result of configuration is an instance of `CustomerxTracking::Client` which can then be used in two different methods.

One way to use the client is to pass it in as an argument to individual classes.

## Actions

### Tracker

At this point we will track the information. With the ```@customerx_tracking``` variable instantiated in initilizer we can call the tracker method

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

Exemplo:

```
@customerx_tracking.tracker(
  external_id_client: '145206',
  identifier: 'report_x',
  type_tracking: 'action',
  email: 'email@email.com'
)
```

Para campos adicionais utilize `additonal_data`

```
additonal_data = {
  amount: 1,
  external_id_product: '123',
  external_id_contact: '21312',
  date_tracking: '01/01/2021'
}

@customerx_tracking.tracker(
  external_id_client: '145206',
  identifier: 'report_x',
  type_tracking: 'action',
  email: 'email@email.com',
  additonal_data: additonal_data
)
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