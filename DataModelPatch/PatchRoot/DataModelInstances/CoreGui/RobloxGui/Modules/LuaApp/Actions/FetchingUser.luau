local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)

return require(Modules.Common.Action)(script.Name, function(UserId)
	-- upvalues: RetrievalStatusModule (copy)
	return { userId = UserId, status = RetrievalStatusModule.Fetching }
end)