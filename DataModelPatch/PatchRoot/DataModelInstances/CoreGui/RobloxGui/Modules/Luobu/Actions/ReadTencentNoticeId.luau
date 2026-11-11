local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)

return require(Modules.Common.Action)(script.Name, function(NoticeId)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(NoticeId, "number", "noticeId")
	
	return { noticeId = NoticeId }
end)