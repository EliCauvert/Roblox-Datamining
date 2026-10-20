local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(LookId, IsFavorited)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(LookId, "string", "SetLookFavorite expects lookId")
	ArgCheckModule.isType(IsFavorited, "boolean", "SetLookFavorite expects isFavorited")
	
	return { lookId = LookId, isFavorited = IsFavorited }
end)