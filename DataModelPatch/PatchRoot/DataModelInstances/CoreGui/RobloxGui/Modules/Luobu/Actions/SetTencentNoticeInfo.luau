local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)

return require(Modules.Common.Action)(script.Name, function(NoticeList)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(NoticeList, "table", "noticeList")
	
	return { noticeList = NoticeList }
end)