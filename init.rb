require 'redmine'

Redmine::Plugin.register :selectbox_autocompleter do
  name 'Selectbox Autocompleter plugin'
  author 'Luiz Silva'
  description 'This plugin generate Autocomplete box for Select box'
  version '1.2.0'
  url 'https://github.com/luizjr/redmine-selectbox-autocompleter'
  author_url 'https://luizjr.dev'

  settings(:default => {
    'target_list' => [
       'issue_assigned_to_id',
       'values_assigned_to_id_1',
       'values_author_id_1',
       'wiki_page_parent_id',
       'project_quick_jump_box'
     ].join("\r\n"),
     'autocomplete_type' => 'select2',
  }, :partial => 'selectbox_autocompleter/settings')

end

ActiveSupport.on_load(:action_view) do
  require File.expand_path('../app/helpers/selectbox_autocompleter_helper', __FILE__)
  ActionView::Base.send :include, SelectboxAutocompleterHelper
end

require File.dirname(__FILE__) + '/lib/selectbox_autocompleter/hooks'