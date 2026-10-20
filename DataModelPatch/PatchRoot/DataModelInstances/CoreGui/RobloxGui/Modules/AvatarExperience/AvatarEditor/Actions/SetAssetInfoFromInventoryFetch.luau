local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Types)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(Assets)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(Assets, "table", "SetAssetInfoFromInventoryFetch action expects assets to be a table")
	
	return { assets = Assets }
end)