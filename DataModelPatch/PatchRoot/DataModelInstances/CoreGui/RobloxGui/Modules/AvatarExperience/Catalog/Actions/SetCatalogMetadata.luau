local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(Metadata)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(Metadata, "table", "SetCatalogMetadata expects 'metadata' to be a table.")
	
	return { metadata = Metadata }
end)