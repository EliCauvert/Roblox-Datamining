local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local NotificationsCommon = script:FindFirstAncestor("NotificationsCommon")
local CryoModule = require(NotificationsCommon.Parent.Cryo)
local TypeModule = require(NotificationsCommon.type)
local ConstantsModule = require(NotificationsCommon.constants)
local FFlagLuaAppFixToastNotificationClosePosition = game:DefineFastFlag("FFlagLuaAppFixToastNotificationClosePosition", false)

return {
	calculateToastPosition = function(p1, p2, PositionYOffset)
		-- upvalues: FFlagLuaAppFixToastNotificationClosePosition (copy), GuiService (copy)
		local NewY: number = if FFlagLuaAppFixToastNotificationClosePosition and GuiService then GuiService:GetGuiInset().Y + 20 else 60
		
		return if p1 then if p2 then {
			positionX = 1,
			positionXOffset = -20,
			positionY = 0,
			anchorX = 1,
			anchorY = 0,
			positionYOffset = PositionYOffset
		} else {
			positionX = 0.5,
			positionXOffset = 0,
			positionY = 0,
			anchorX = 0.5,
			anchorY = 0,
			positionYOffset = PositionYOffset
		} elseif p2 then {
			positionX = 1,
			positionXOffset = 20,
			positionY = 0,
			anchorX = 0,
			anchorY = 0,
			positionYOffset = PositionYOffset
		} else {
			positionX = 0.5,
			positionXOffset = 0,
			positionY = 0,
			anchorX = 0.5,
			anchorY = 1,
			positionYOffset = if FFlagLuaAppFixToastNotificationClosePosition then NewY * -1 else -50
		}
	end,
	getDeviceOrientation = function(Vector)
		-- upvalues: TypeModule (copy)
		return if Vector.Y < Vector.X then TypeModule.DeviceOrientationEnum.Landscape else TypeModule.DeviceOrientationEnum.Portrait
	end,
	getNotificationSize = function(p1, p2: number): UDim2
		-- upvalues: ConstantsModule (copy)
		return if p2 < ConstantsModule.FullWidthDeviceThreshold then UDim2.new(0, p2 - 24, 0, 0) elseif p1 and p2 < ConstantsModule.CompactCardThreashold then UDim2.new(0, ConstantsModule.InExperienceToastWidth, 0, 0) else UDim2.new(0, ConstantsModule.InAppToastWidth, 0, 0)
	end,
	marshalStreamNotificationData = function(p1, _)
		local config = {
			currentState = p1.content.currentState,
			notificationType = p1.content.notificationType,
			id = p1.id
		}
		
		if p1.content.states then
			local State = p1.content.states[p1.content.currentState]
			config.state = {
				layoutKey = State.layoutKey,
				name = State.name,
				visualItems = State.visualItems
			}
		end
		return config
	end,
	isToastToRight = function(Landscape): boolean
		-- upvalues: TypeModule (copy)
		return Landscape == TypeModule.DeviceOrientationEnum.Landscape
	end,
	isDesktopDevice = function(): boolean
		-- upvalues: UserInputService (copy)
		local None = Enum.Platform.None
		pcall(function()
			-- upvalues: None (ref), UserInputService (upval)
			None = UserInputService:GetPlatform()
		end)
		
		return None == Enum.Platform.Windows or (None == Enum.Platform.OSX or None == Enum.Platform.UWP)
	end,
	fireEvent = function(p1, p2, p3, p4)
		-- upvalues: ConstantsModule (copy), CryoModule (copy)
		local config = { streamContext = "InApp" }
		
		if p3 == nil or p3 == "" then
			p3 = ConstantsModule.NotificationsClientEventNameDefault
		end
		p1.sendEventDeferred(p2, p3, CryoModule.Dictionary.join(p4, config))
	end
}