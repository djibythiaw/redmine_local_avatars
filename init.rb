# encoding: UTF-8

require 'redmine'

Redmine::Plugin.register :redmine_local_avatars do
  name 'Redmine Local Avatars plugin'
	author 'Ministère de la santé'
	description 'Plugin destiné au ministère de la santé du Sénégal pour adopter Redmine en fonction de leurs besoins'
	version '0.1.1'
	url 'http://www.sante.gouv.sn/'
	author_url 'http://www.sante.gouv.sn/'
end

ActionDispatch::Callbacks.to_prepare do
	require_dependency 'project'
	require_dependency 'principal'
	require_dependency 'user'

	AccountController.send(:include,  LocalAvatarsPlugin::AccountControllerPatch)
	ApplicationHelper.send(:include,  LocalAvatarsPlugin::ApplicationAvatarPatch)
	MyController.send(:include,  LocalAvatarsPlugin::MyControllerPatch)
	User.send(:include,  LocalAvatarsPlugin::UsersAvatarPatch)
	UsersController.send(:include,  LocalAvatarsPlugin::UsersControllerPatch)
	UsersHelper.send(:include,  LocalAvatarsPlugin::UsersHelperPatch)
end

require 'local_avatars'

# patches to Redmine
require "account_controller_patch.rb"
require "application_helper_avatar_patch.rb"
require "my_controller_patch.rb"
require "users_avatar_patch.rb"   # User model
require "users_controller_patch.rb"
require "users_helper_avatar_patch.rb"  # UsersHelper

# hooks
require 'redmine_local_avatars/hooks'
