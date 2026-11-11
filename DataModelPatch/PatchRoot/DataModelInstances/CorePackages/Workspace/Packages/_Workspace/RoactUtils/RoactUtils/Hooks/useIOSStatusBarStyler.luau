local Parent = script:FindFirstAncestor("RoactUtils").Parent
local GuiService = game:GetService("GuiService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local NotificationType = require(Parent.RobloxAppEnums).NotificationType
local ReactModule = require(Parent.React)

local function v6(Style)
	-- upvalues: UserInputService (copy), GuiService (copy), HttpService (copy), NotificationType (copy)
	if UserInputService:GetPlatform() == Enum.Platform.IOS then
		GuiService:BroadcastNotification(HttpService:JSONEncode({ style = Style }), NotificationType.SET_STATUS_BAR_STYLE)
	end
end

return function(p1, p2)
	-- upvalues: v6 (copy), ReactModule (copy)
	local Callback = p2 or v6
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), Callback (copy)
		Callback(if p1 then "lightcontent" else "default")
		
		return function()
			-- upvalues: Callback (upval)
			Callback("default")
		end
	end, { p1 })
end