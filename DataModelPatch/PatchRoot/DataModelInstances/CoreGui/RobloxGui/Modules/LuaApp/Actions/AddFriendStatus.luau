local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(Id, Status)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(Id, "string", "Actions.AddFriendStatus.id")
	ArgCheckModule.isType(Status, "EnumItem", "Actions.AddFriendStatus.status")
	
	return { id = Id, status = Status }
end)