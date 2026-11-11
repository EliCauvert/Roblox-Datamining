local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local _ = require(Modules.AvatarExperience.Common.Types)

return require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(Modules.AvatarExperience.AvatarEditor.Actions.SetRemoteUprankedItems).name] = function(_, p1)
		-- upvalues: ArgCheckModule (copy)
		ArgCheckModule.isType(p1.uprankedItems, "table", "items data must be a table.")
		
		return p1.uprankedItems
	end
})