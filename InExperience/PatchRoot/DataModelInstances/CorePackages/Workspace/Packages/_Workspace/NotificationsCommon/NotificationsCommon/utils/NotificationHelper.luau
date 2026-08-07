local userInputService = game:GetService("UserInputService")
local guiService = game:GetService("GuiService")
local notificationsCommon = script:FindFirstAncestor("NotificationsCommon")
local cryoModule = require(notificationsCommon.Parent.Cryo)
local typeModule = require(notificationsCommon.type)
local constantsModule = require(notificationsCommon.constants)
local fFlagLuaAppFixToastNotificationClosePosition = game:DefineFastFlag("FFlagLuaAppFixToastNotificationClosePosition", false)

return {
	calculateToastPosition = function(p0, p1, p2) --[[ line: 67 ]]
		-- upvalues: fFlagLuaAppFixToastNotificationClosePosition (ref), guiService (ref)
		return if p0 then if p1 then {
			positionX = 1,
			positionXOffset = -20,
			positionY = 0,
			anchorX = 1,
			anchorY = 0,
			positionYOffset = p2
		} else {
			positionX = 0.5,
			positionXOffset = 0,
			positionY = 0,
			anchorX = 0.5,
			anchorY = 0,
			positionYOffset = p2
		} elseif p1 then {
			positionX = 1,
			positionXOffset = 20,
			positionY = 0,
			anchorX = 0,
			anchorY = 0,
			positionYOffset = p2
		} else {
			positionX = 0.5,
			positionXOffset = 0,
			positionY = 0,
			anchorX = 0.5,
			anchorY = 1,
			positionYOffset = if fFlagLuaAppFixToastNotificationClosePosition then (if fFlagLuaAppFixToastNotificationClosePosition and guiService then guiService:GetGuiInset().Y + 20 else 60) * -1 else -50
		}
	end,
	getDeviceOrientation = function(p3) --[[ line: 22 ]]
		-- upvalues: typeModule (ref)
		return if p3.Y < p3.X then typeModule.DeviceOrientationEnum.Landscape else typeModule.DeviceOrientationEnum.Portrait
	end,
	getNotificationSize = function(p4, p5) --[[ line: 28 ]]
		-- upvalues: constantsModule (ref)
		return if p5 < constantsModule.FullWidthDeviceThreshold then UDim2.new(0, p5 - 24, 0, 0) elseif p4 then if p5 < constantsModule.CompactCardThreashold then UDim2.new(0, constantsModule.InExperienceToastWidth, 0, 0) else UDim2.new(0, constantsModule.InAppToastWidth, 0, 0) else UDim2.new(0, constantsModule.InAppToastWidth, 0, 0)
	end,
	marshalStreamNotificationData = function(p6, _) --[[ line: 42 ]]
		local t = {
			currentState = p6.content.currentState,
			notificationType = p6.content.notificationType,
			id = p6.id
		}
		
		if p6.content.states then
			local currentState = p6.content.states[p6.content.currentState]
			t.state = {
				layoutKey = currentState.layoutKey,
				name = currentState.name,
				visualItems = currentState.visualItems
			}
		end
		return t
	end,
	isToastToRight = function(p7) --[[ line: 63 ]]
		-- upvalues: typeModule (ref)
		return p7 == typeModule.DeviceOrientationEnum.Landscape
	end,
	isDesktopDevice = function() --[[ line: 141 ]]
		-- upvalues: userInputService (ref)
		local none = Enum.Platform.None
		pcall(function() --[[ line: 143 ]]
			-- upvalues: none (write), userInputService (copy)
			none = userInputService:GetPlatform()
		end)
		
		return if none ~= Enum.Platform.Windows then if none ~= Enum.Platform.OSX then none == Enum.Platform.UWP else true else true
	end,
	fireEvent = function(p8, p9, p10, p11) --[[ line: 121 ]]
		-- upvalues: constantsModule (ref), cryoModule (ref)
		local t = { streamContext = "InApp" }
		
		if p10 == nil or p10 == "" then
			p10 = constantsModule.NotificationsClientEventNameDefault
		end
		p8.sendEventDeferred(p9, p10, cryoModule.Dictionary.join(p11, t))
	end
}