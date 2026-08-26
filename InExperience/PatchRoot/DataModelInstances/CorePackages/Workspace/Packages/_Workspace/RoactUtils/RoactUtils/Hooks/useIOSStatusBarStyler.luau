local parent = script:FindFirstAncestor("RoactUtils").Parent
local guiService = game:GetService("GuiService")
local httpService = game:GetService("HttpService")
local userInputService = game:GetService("UserInputService")
local notificationType = require(parent.RobloxAppEnums).NotificationType
local reactModule = require(parent.React)
local _ = { LIGHT = "lightcontent", DEFAULT = "default" }

local var1 = function(p1)
	-- upvalues: userInputService (ref), guiService (ref), httpService (ref), notificationType (ref)
	if userInputService:GetPlatform() == Enum.Platform.IOS then
		guiService:BroadcastNotification(httpService:JSONEncode({ style = p1 }), notificationType.SET_STATUS_BAR_STYLE)
	end
end

return function(p1, p2)
	-- upvalues: var1 (ref), reactModule (ref)
	p2 = p2 or var1
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), p2 (ref)
		p2(if p1 then "lightcontent" else "default")
		
		return function()
			-- upvalues: p2 (copy)
			p2("default")
		end
	end, { p1 })
end