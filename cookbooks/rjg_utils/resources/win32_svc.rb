# TODO: add [stop, start, restart] actions.  Add an action which allows the setting of the startup mode (manual, automatic, disabled, etc)

actions :set_logon_account

attribute :service_name, :kind_of => [String]
attribute :service_account_user, :kind_of => [String]
attribute :service_account_pass, :kind_of => [String]
attribute :restart_service, :kind_of => [String]