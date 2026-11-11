local HttpService = game:GetService("HttpService")
local GuiService = game:GetService("GuiService")

return function(Url)
	-- upvalues: HttpService (copy), GuiService (copy)
	GuiService:BroadcastNotification(HttpService:JSONEncode({
		title = "",
		presentationStyle = 2,
		visible = true,
		url = Url
	}), 20)
end