return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(HelpModalVisible)
	return { helpModalVisible = HelpModalVisible }
end)