local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)

return require(Modules.Common.Action)(script.Name, function(AgreedUserAgreements)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(AgreedUserAgreements, "table", "agreements")
	
	return { agreedUserAgreements = AgreedUserAgreements }
end)