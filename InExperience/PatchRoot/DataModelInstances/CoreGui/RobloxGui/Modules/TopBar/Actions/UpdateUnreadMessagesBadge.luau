return if require(script.Parent.Parent.Flags.FFlagTopBarDeprecateChatRodux) then nil else require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p1)
	return { messages = p1 }
end)