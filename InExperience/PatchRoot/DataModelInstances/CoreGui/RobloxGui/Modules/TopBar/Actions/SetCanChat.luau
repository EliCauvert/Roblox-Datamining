return if require(script.Parent.Parent.Flags.FFlagTopBarDeprecateChatRodux) then nil else require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p0) --[[ line: 11 ]]
	return { canChat = p0 }
end)