local userInputService = game:GetService("UserInputService")
local guiService = game:GetService("GuiService")
local notificationsCommon = script:FindFirstAncestor("NotificationsCommon")
local cryoModule = require(notificationsCommon.Parent.Cryo)
local typeModule = require(notificationsCommon.type)
local constantsModule = require(notificationsCommon.constants)
local fFlagLuaAppFixToastNotificationClosePosition = game:DefineFastFlag("FFlagLuaAppFixToastNotificationClosePosition", false)

return {
	calculateToastPosition = function(p1, p2, p3)
		-- upvalues: fFlagLuaAppFixToastNotificationClosePosition (ref), guiService (ref)
		return if p1 then if p2 then {
			positionX = 1,
			positionXOffset = -20,
			positionY = 0,
			anchorX = 1,
			anchorY = 0,
			positionYOffset = p3
		} else {
			positionX = 0.5,
			positionXOffset = 0,
			positionY = 0,
			anchorX = 0.5,
			anchorY = 0,
			positionYOffset = p3
		} elseif p2 then {
			positionX = 1,
			positionXOffset = 20,
			positionY = 0,
			anchorX = 0,
			anchorY = 0,
			positionYOffset = p3
		} else {
			positionX = 0.5,
			positionXOffset = 0,
			positionY = 0,
			anchorX = 0.5,
			anchorY = 1,
			positionYOffset = if fFlagLuaAppFixToastNotificationClosePosition then (if fFlagLuaAppFixToastNotificationClosePosition and guiService then guiService:GetGuiInset().Y + 20 else 60) * -1 else -50
		}
	end,
	getDeviceOrientation = function(p1)
		-- upvalues: typeModule (ref)
		return if p1.Y < p1.X then typeModule.DeviceOrientationEnum.Landscape else typeModule.DeviceOrientationEnum.Portrait
	end,
	getNotificationSize = function(p1, p2)
		-- upvalues: constantsModule (ref)
		return if p2 < constantsModule.FullWidthDeviceThreshold then UDim2.new(0, p2 - 24, 0, 0) elseif p1 then if p2 < constantsModule.CompactCardThreashold then UDim2.new(0, constantsModule.InExperienceToastWidth, 0, 0) else UDim2.new(0, constantsModule.InAppToastWidth, 0, 0) else UDim2.new(0, constantsModule.InAppToastWidth, 0, 0)
	end,
	marshalStreamNotificationData = function(p1, _)
		local t = {
			currentState = p1.content.currentState,
			notificationType = p1.content.notificationType,
			id = p1.id
		}
		
		if p1.content.states then
			local currentState = p1.content.states[p1.content.currentState]
			t.state = {
				layoutKey = currentState.layoutKey,
				name = currentState.name,
				visualItems = currentState.visualItems
			}
		end
		return t
	end,
	isToastToRight = function(p1)
		-- upvalues: typeModule (ref)
		return p1 == typeModule.DeviceOrientationEnum.Landscape
	end,
	isDesktopDevice = function()
		-- upvalues: userInputService (ref)
		local none = Enum.Platform.None
		pcall(function()
			-- upvalues: none (write), userInputService (copy)
			none = userInputService:GetPlatform()
		end)
		
		return if none ~= Enum.Platform.Windows then if none ~= Enum.Platform.OSX then none == Enum.Platform.UWP else true else true
	end,
	fireEvent = function(p1, p2, p3, p4)
		-- upvalues: constantsModule (ref), cryoModule (ref)
		local t = { streamContext = "InApp" }
		
		if p3 == nil or p3 == "" then
			p3 = constantsModule.NotificationsClientEventNameDefault
		end
		p1.sendEventDeferred(p2, p3, cryoModule.Dictionary.join(p4, t))
	end
}