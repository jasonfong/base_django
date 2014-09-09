PROJECT_NAME = node.default.django_project.project_name
VIRTUALENV = "/srv/#{PROJECT_NAME}/shared/env"

directory "/srv/#{PROJECT_NAME}/shared" do
  action :create
  recursive true
end

application PROJECT_NAME do
  path  "/srv/#{PROJECT_NAME}"
  owner 'vagrant'
  group 'vagrant'

  repository node.default.django_project.repository
  revision   node.default.django_project.branch

  django do
    requirements 'requirements.txt'
    local_settings_file "#{PROJECT_NAME}/local_settings.py"
  end

  gunicorn do
    app_module "#{PROJECT_NAME}.wsgi"
    virtualenv VIRTUALENV
    host '0.0.0.0'
    port 8080
    debug true
    autostart true
  end

end
