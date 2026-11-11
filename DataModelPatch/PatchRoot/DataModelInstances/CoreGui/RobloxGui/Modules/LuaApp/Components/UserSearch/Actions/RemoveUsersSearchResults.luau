local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(Keyword)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(Keyword, "string", "Actions.RemoveUsersSearchResults.keyword")
	
	return { searchUuid = Keyword, keyword = Keyword }
end)