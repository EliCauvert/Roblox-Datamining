local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)

return function(p1)
	-- upvalues: CryoModule (copy)
	return CryoModule.Dictionary.values(p1.AvatarExperience.AvatarEditor.Character.BodyColor3s)
end