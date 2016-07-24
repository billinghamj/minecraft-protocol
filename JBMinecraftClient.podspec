Pod::Spec.new do |s|
	# information
	s.name = 'JBMinecraftClient'
	s.version = '0.1.0'
	s.summary = 'Supports communication with Minecraft servers'
	s.homepage = 'http://www.jamesbillingham.com'
	s.license = { type: 'GPL v3', file: 'LICENSE' }
	s.authors = { 'James Billingham' => 'james@billingham.net' }

	# source
	s.source = { git: 'git@bitbucket.org:billinghamj/ios-sdk-minecraft-client.git', tag: "v#{s.version}" }

	# project setup
	s.requires_arc = true
	s.ios.deployment_target = '7.0'
	s.ios.deployment_target = '10.9'

	# files
	s.source_files = 'JBMinecraftClient/*.{h,c,cpp,m,mm}', 'JBMinecraftClient/**/*.{h,c,cpp,m,mm}'
	s.public_header_files = 'JBMinecraftClient/*.h'

	# dependencies
	s.dependency 'DNSKit', '= 0.0.1'
	s.dependency 'CocoaAsyncSocket', '~> 7.3'
end
