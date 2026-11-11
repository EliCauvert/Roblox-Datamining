local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(Cursor)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isTypeOrNil(Cursor, "string", "cursor")
	
	return { cursor = Cursor }
end)