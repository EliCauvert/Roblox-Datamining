local MakeActionCreatorFunction = require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator

return if require(script.Parent.Parent.Flags.FFlagTopBarDeprecateDisplayOptionsRodux) then nil else MakeActionCreatorFunction(script.Name, function(IsSmallTouchDevice) --[[ Line: 12 ]]
	return { isSmallTouchDevice = IsSmallTouchDevice }
end)