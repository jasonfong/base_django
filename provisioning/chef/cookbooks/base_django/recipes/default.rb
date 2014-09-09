application 'base_django' do
  path  '/srv/base_django'
  owner 'vagrant'
  group 'vagrant'

  repository 'https://github.com/jasonfong/base-django.git'
  revision   'master'

  django do
    requirements 'requirements.txt'
    local_settings 'local_settings.py'
    settings_template 'settings.py.erb'
  end

end
