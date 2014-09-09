application 'base_django' do
  path  '/srv/base_django'
  owner 'vagrant'
  group 'vagrant'

  repository 'https://github.com/jasonfong/base_django.git'
  revision   'master'

  django do
    requirements 'requirements.txt'
    local_settings_file 'local_settings.py'
    settings_template 'settings.py.erb'
  end

  gunicorn do
    app_module 'base_django.wsgi'
    virtualenv '/srv/base_django/shared/env'
    host "0.0.0.0"
    port 8080
    debug true
    autostart true
  end

end
