local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(ThumbnailType)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(ThumbnailType, "userdata", "IncrementPPEVersion action expects thumbnailType to be userdata")
	
	return { thumbnailType = ThumbnailType }
end)