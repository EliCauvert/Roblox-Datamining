local parent = script:FindFirstAncestor("RoactUtils").Parent
local guiService = game:GetService("GuiService")
local httpService = game:GetService("HttpService")
local userInputService = game:GetService("UserInputService")
local notificationType = require(parent.RobloxAppEnums).NotificationType
local reactModule = require(parent.React)
local _ = { LIGHT = "lightcontent", DEFAULT = "default" }

local var4 = function(p0) --[[ line: 19 ]]
	-- upvalues: userInputService (ref), guiService (ref), httpService (ref), notificationType (ref)
	if userInputService:GetPlatform() == Enum.Platform.IOS then
		guiService:BroadcastNotification(httpService:JSONEncode({ style = p0 }), notificationType.SET_STATUS_BAR_STYLE)
	end
end

return function(p1, p2) --[[ line: 31 | named "useIOSStatusBarStyler" ]]
	-- upvalues: var4 (ref), reactModule (ref)
	p2 = p2 or var4
	reactModule.useEffect(function() --[[ line: 34 ]]
		-- upvalues: p1 (ref), p2 (ref)
		p2(if p1 then "lightcontent" else "default")
		
		return function() --[[ line: 37 ]]
			-- upvalues: p2 (copy)
			p2("default")
		end
	end, { p1 })
end