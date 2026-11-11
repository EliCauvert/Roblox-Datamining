local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)

return require(CorePackages.Packages.Rodux).makeActionCreator("Catalog-" .. script.Name, function(IsUIFullView)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(IsUIFullView, "boolean", "isUIFullView")
	
	return { isUIFullView = IsUIFullView }
end)