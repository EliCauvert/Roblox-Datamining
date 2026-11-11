local MakeActionCreatorFunction = require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator

return if require(script.Parent.Parent.Flags.FFlagTopBarDeprecateChatRodux) then nil else MakeActionCreatorFunction(script.Name, function(Messages)
	return { messages = Messages }
end)