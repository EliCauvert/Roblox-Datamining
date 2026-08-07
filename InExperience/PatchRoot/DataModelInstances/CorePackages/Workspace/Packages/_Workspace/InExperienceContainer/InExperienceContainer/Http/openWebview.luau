local httpService = game:GetService("HttpService")
local guiService = game:GetService("GuiService")

return function(p0) --[[ line: 5 | named "openWebview" ]]
	-- upvalues: httpService (ref), guiService (ref)
	local _ = { FullScreen = 0, FormSheet = 2 }
	guiService:BroadcastNotification(httpService:JSONEncode({
		title = "",
		presentationStyle = 2,
		visible = true,
		url = p0
	}), 20)
end