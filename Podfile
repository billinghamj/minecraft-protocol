podspec
inhibit_all_warnings!

post_install do |installer|

	# enable building all architectures all the time
	installer.project.build_configurations.each do |config|
		config.build_settings.delete 'ONLY_ACTIVE_ARCH'
	end

end
