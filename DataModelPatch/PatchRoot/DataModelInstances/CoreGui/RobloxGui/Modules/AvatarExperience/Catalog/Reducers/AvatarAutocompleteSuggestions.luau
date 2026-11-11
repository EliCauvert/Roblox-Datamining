local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)

return (require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Catalog.Actions.AddAvatarAutocompleteSuggestion).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return (CryoModule.Dictionary.join(p1, { [p2.prefix] = p2.autocompleteSuggestions }))
	end
}))