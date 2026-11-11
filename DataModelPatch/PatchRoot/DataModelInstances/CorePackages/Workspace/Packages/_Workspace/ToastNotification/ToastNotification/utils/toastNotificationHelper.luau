local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local Parent = script.Parent.Parent
local TypeModule = require(Parent.type)
local ConstantsModule = require(Parent.constants)
local DependenciesModule = require(Parent.dependencies)
local LoggerModule = require(Parent.Logger)
local Cryo = DependenciesModule.Cryo
local TimeTrigger = DependenciesModule.ToastNotificationProtocolEnums.TimeTrigger
local FFlagFriendshipNotifsUseSendrExperiment = require(Parent.Parent.SharedFlags).FFlagFriendshipNotifsUseSendrExperiment

local function _(List, p1)
	if List then
		table.insert(List, p1)
		
		return List
	else
		return { p1 }
	end
end

local _ = function(VisualItems): string
	return if VisualItems.button == nil then if VisualItems.textBody == nil then if VisualItems.thumbnail == nil then if VisualItems.metaAction == nil then if VisualItems.singleMetaAction == nil then "unknown" else "singleMetaAction" else "metaAction" else "thumbnail" else "textBody" else "button"
end

local function v12(State)
	if not State then
		return nil
	end
	local VisualItems = {
		button = nil,
		textBody = nil,
		thumbnail = nil,
		metaAction = nil,
		singleMetaAction = nil
	}
	
	for _, visualItem in ipairs(State.visualItems) do
		local Unknown: string = if visualItem.button == nil then if visualItem.textBody == nil then if visualItem.thumbnail == nil then if visualItem.metaAction == nil then if visualItem.singleMetaAction == nil then "unknown" else "singleMetaAction" else "metaAction" else "thumbnail" else "textBody" else "button"
		
		if Unknown ~= "unknown" then
			local List = VisualItems[Unknown]
			local VisualItemEntry = visualItem[Unknown]
			local List1 = nil
			
			if List then
				table.insert(List, VisualItemEntry)
				List1 = List
			else
				List1 = { VisualItemEntry }
			end
			VisualItems[Unknown] = List1
		end
	end
	return {
		layoutKey = State.layoutKey,
		name = State.name,
		timeOnScreenMs = State.timeOnScreenMs,
		visualItems = VisualItems
	}
end

local config = {
	positionX = 1,
	positionXOffset = -5,
	positionY = 0,
	anchorX = 1,
	anchorY = 0
}
local config1 = {
	positionX = 1,
	positionXOffset = 20,
	positionY = 0,
	anchorX = 0,
	anchorY = 0
}
local config2 = {
	positionX = 0.5,
	positionXOffset = 0,
	positionY = 0,
	anchorX = 0.5,
	anchorY = 0
}
local config3 = {
	positionX = 0.5,
	positionXOffset = 0,
	positionY = 0,
	anchorX = 0.5,
	anchorY = 1
}
local _Vector2 = Vector2.new(800, 600)

local _ = function(p1)
	-- upvalues: ConstantsModule (copy)
	return p1.Y * (ConstantsModule.FRRToastPosition.NotificationFrameTopScale + ConstantsModule.FRRToastPosition.NotificationFrameHeightScale) - ConstantsModule.FRRToastPosition.NotificationRightInset
end

local function v19(Vector)
	-- upvalues: ConstantsModule (copy)
	return -ConstantsModule.FRRToastPosition.NotificationRightInset, Vector.Y * (ConstantsModule.FRRToastPosition.NotificationFrameTopScale + ConstantsModule.FRRToastPosition.NotificationFrameHeightScale) - ConstantsModule.FRRToastPosition.NotificationRightInset - Vector.Y
end

local function v20(p1, p2, Vector)
	-- upvalues: ConstantsModule (copy)
	local YDelta = Vector.Y * (ConstantsModule.FRRToastPosition.NotificationFrameTopScale + ConstantsModule.FRRToastPosition.NotificationFrameHeightScale) - ConstantsModule.FRRToastPosition.NotificationRightInset - Vector.Y
	local config = {
		positionX = 1,
		positionY = 1,
		anchorX = 1,
		anchorY = 1,
		positionXOffset = -ConstantsModule.FRRToastPosition.NotificationRightInset,
		positionYOffset = YDelta
	}
	local config1 = {
		positionX = 1,
		positionXOffset = 20,
		positionY = 1,
		anchorX = 0,
		anchorY = 1,
		positionYOffset = YDelta
	}
	
	return if p1 then config elseif p2 then config else config1
end

return {
	calculateToastPosition = function(p1, p2, PositionYOffset, p3, p4, p5)
		-- upvalues: FFlagFriendshipNotifsUseSendrExperiment (copy), _Vector2 (copy), v20 (copy), GuiService (copy), Cryo (copy), config (copy), config2 (copy), config1 (copy), config3 (copy)
		if FFlagFriendshipNotifsUseSendrExperiment and p4 == "legacyBottomRight" then
			return (v20(p1, p3, p5 or (workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or _Vector2)))
		else
			local GuiInset = if GuiService then GuiService:GetGuiInset() else Vector2.new(0, 0)
			local NewY: number = if GuiService then GuiInset.Y + 20 else 60
			
			return if p1 then if p2 then Cryo.Dictionary.union(config, { positionYOffset = PositionYOffset }) else Cryo.Dictionary.union(config2, { positionYOffset = PositionYOffset + GuiInset.Y }) elseif p2 then if p3 then Cryo.Dictionary.union(config, { positionYOffset = PositionYOffset }) else Cryo.Dictionary.union(config1, { positionYOffset = PositionYOffset }) elseif p3 then Cryo.Dictionary.union(config2, { positionYOffset = PositionYOffset + GuiInset.Y }) else Cryo.Dictionary.union(config3, { positionYOffset = -1 * NewY })
		end
	end,
	getNotificationScript2LegacyToastOffsets = if FFlagFriendshipNotifsUseSendrExperiment then v19 else nil,
	calculateTimeRemaining = function(TimerFromCardData, p1, p2): number
		-- upvalues: TimeTrigger (copy)
		local P24 = p1 or DateTime.now().UnixTimestampMillis
		local P25 = p2 or DateTime.now().UnixTimestampMillis
		
		return (math.max(if TimerFromCardData.trigger == TimeTrigger.OnReceive then TimerFromCardData.timespanMs - (DateTime.now().UnixTimestampMillis - P24) elseif TimerFromCardData.trigger == TimeTrigger.OnDisplay then TimerFromCardData.timespanMs - (DateTime.now().UnixTimestampMillis - P25) else 0, 0))
	end,
	getDeviceOrientation = function(Vector)
		-- upvalues: TypeModule (copy)
		return if Vector.Y < Vector.X then TypeModule.DeviceOrientationEnum.Landscape else TypeModule.DeviceOrientationEnum.Portrait
	end,
	getNotificationSize = function(p1, p2: number): UDim2
		-- upvalues: ConstantsModule (copy)
		return if p2 < ConstantsModule.FullWidthDeviceThreshold then UDim2.new(0, p2 - 24, 0, 0) elseif p1 and p2 < ConstantsModule.CompactCardThreashold then UDim2.new(0, ConstantsModule.InExperienceToastWidth, 0, 0) else UDim2.new(0, ConstantsModule.InAppToastWidth, 0, 0)
	end,
	marshalNotificationData = function(p1)
		-- upvalues: v12 (copy)
		local config = {
			currentState = p1.content.currentState,
			notificationType = p1.content.notificationType,
			id = p1.content.id,
			priority = p1.content.priority,
			clientEventsPayload = p1.content.clientEventsPayload,
			deliverTimestamp = p1.deliverTimestamp,
			notificationReceivedTimestampMs = p1.notificationReceivedTimestampMs,
			timers = p1.content.timers,
			luaNotifInfo = p1.luaNotifInfo
		}
		
		if p1.content.states then
			config.state = v12(p1.content.states[p1.content.currentState])
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
	getNearestWholeNumber = function(Value: number): number
		return if Value % 1 < 0.5 then math.floor(Value) else math.ceil(Value)
	end,
	getTimerFromCardData = function(p1, p2)
		-- upvalues: LoggerModule (copy), TimeTrigger (copy)
		if p1 and p1.timers and p1.timers[p2] then
			return p1.timers[p2]
		else
			LoggerModule:warning("timerKey {} not found in list of timers. Using default.", p2)
			
			return { timespanMs = 0, trigger = TimeTrigger.OnDisplay }
		end
	end,
	fireEvent = function(p1, p2)
		p1.sendEventDeferred("ToastNotification", "toastNotificationClientEvent", p2)
	end,
	isUserThumbnail = function(p1): boolean
		-- upvalues: TypeModule (copy)
		return p1.idType == TypeModule.SENDERThumbnailTypeEnum.User or p1.idType == TypeModule.SENDERThumbnailTypeEnum.AvatarImageUrl
	end
}