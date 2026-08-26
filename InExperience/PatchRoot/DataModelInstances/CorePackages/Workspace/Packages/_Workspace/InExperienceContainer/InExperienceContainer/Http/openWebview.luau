local httpService = game:GetService("HttpService")
local guiService = game:GetService("GuiService")

return function(p1)
	-- upvalues: httpService (ref), guiService (ref)
	local _ = { FullScreen = 0, FormSheet = 2 }
	guiService:BroadcastNotification(httpService:JSONEncode({
		title = "",
		presentationStyle = 2,
		visible = true,
		url = p1
	}), 20)
end