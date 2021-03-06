#
# Cookbook Name:: rjg_utils
# Recipe:: create_users
#
#  Copyright 2011 Ryan J. Geyer
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

directory 'C:/powershell_scripts/rjg_utils/' do
  recursive true
  action :create
end

remote_file 'C:/powershell_scripts/rjg_utils/functions.ps1' do
  source "functions.ps1"
  backup false
end

# TODO: This concept was a bust, we might want to retry it later.
#rjg_utils_system "Reboot System" do
#  node_attribute "rjg_utils_reboot"
#  action :nothing
#end

# Personal preference, but it's handy on most systems
# TODO: Of course this doesn't exist for the RightScale user who doesn't have an interactive shell, gotta find another way.
#powershell "Show extensions for known file types" do
#  pscode = <<'EOF'
#$reg_path = "Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
#$name = "HideFileExt"
#
#Get-ItemProperty -Path $reg_path -Name $name -ErrorAction SilentlyContinue | Out-Null
#$prop = $?
#if(!$prop)
#{
#  Write-Output "Registry value for hiding file extensions doesn't exist, creating it..."
#  New-ItemProperty -Path $reg_path -Name $name -Value 0 -Type dword
#}
#else
#{
#  Write-Output "Registry value for hiding file extensions exists, setting it to false..."
#  Set-ItemProperty -Path $reg_path -Name $name -Value 0 -Type dword
#}
#EOF
#  source(pscode)
#end