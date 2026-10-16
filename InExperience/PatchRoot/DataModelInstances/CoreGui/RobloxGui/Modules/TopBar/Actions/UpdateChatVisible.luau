local MakeActionCreatorFunction = require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator

return if require(script.Parent.Parent.Flags.FFlagTopBarDeprecateChatRodux) then nil else MakeActionCreatorFunction(script.Name, function(Visible) --[[ Line: 11 ]]
	return { visible = Visible }
end)