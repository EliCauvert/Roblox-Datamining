local SetCurrentCharacterFunction = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceRodux).Actions.SetCurrentCharacter

return function(p1)
	-- upvalues: SetCurrentCharacterFunction (copy)
	return function(p2)
		-- upvalues: SetCurrentCharacterFunction (upval), p1 (copy)
		p2:dispatch(SetCurrentCharacterFunction(p1))
	end
end