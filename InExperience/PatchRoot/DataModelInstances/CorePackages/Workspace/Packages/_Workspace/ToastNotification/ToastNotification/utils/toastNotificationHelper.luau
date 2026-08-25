local userInputService = game:GetService("UserInputService")
local guiService = game:GetService("GuiService")
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local typeModule = require(parent.type)
local constantsModule = require(parent.constants)
local dependenciesModule = require(parent.dependencies)
local loggerModule = require(parent.Logger)
local cryo = dependenciesModule.Cryo
local timeTrigger = dependenciesModule.ToastNotificationProtocolEnums.TimeTrigger
local fFlagFriendshipNotifsUseSendrExperiment = require(parent_1.SharedFlags).FFlagFriendshipNotifsUseSendrExperiment

local var6 = function(p0)
	-- upvalues: typeModule (ref)
	return if p0.Y < p0.X then typeModule.DeviceOrientationEnum.Landscape else typeModule.DeviceOrientationEnum.Portrait
end

local var7 = function(p1, p2)
	-- upvalues: constantsModule (ref)
	return if p2 < constantsModule.FullWidthDeviceThreshold then UDim2.new(0, p2 - 24, 0, 0) elseif p1 then if p2 < constantsModule.CompactCardThreashold then UDim2.new(0, constantsModule.InExperienceToastWidth, 0, 0) else UDim2.new(0, constantsModule.InAppToastWidth, 0, 0) else UDim2.new(0, constantsModule.InAppToastWidth, 0, 0)
end

local _ = function(p3, p4)
	if p3 then
		table.insert(p3, p4)
		
		return p3
	end
	return { p4 }
end

local _ = function(p5)
	return if p5.button == nil then if p5.textBody == nil then if p5.thumbnail == nil then if p5.metaAction == nil then if p5.singleMetaAction == nil then "unknown" else "singleMetaAction" else "metaAction" else "thumbnail" else "textBody" else "button"
end

local var8 = function(p6)
	if not p6 then
		return nil
	end
	local t = {
		button = nil,
		textBody = nil,
		thumbnail = nil,
		metaAction = nil,
		singleMetaAction = nil
	}
	
	for i, v in ipairs(p6.visualItems) do
		local var18 = if v.button ~= nil then if v.textBody ~= nil then if v.thumbnail ~= nil then if v.metaAction ~= nil then if v.singleMetaAction ~= nil then "unknown" else "singleMetaAction" else "metaAction" else "thumbnail" else "textBody" else "button"
		
		if var18 ~= "unknown" then
			local var21
			local var19 = t[var18]
			local var20 = v[var18]
			
			if var19 then
				table.insert(var19, var20)
				var21 = var19
			else
				var21 = { var20 }
			end
			t[var18] = var21
		end
	end
	return {
		layoutKey = p6.layoutKey,
		name = p6.name,
		timeOnScreenMs = p6.timeOnScreenMs,
		visualItems = t
	}
end

local var9 = function(p7)
	-- upvalues: var8 (ref)
	local t = {
		currentState = p7.content.currentState,
		notificationType = p7.content.notificationType,
		id = p7.content.id,
		priority = p7.content.priority,
		clientEventsPayload = p7.content.clientEventsPayload,
		deliverTimestamp = p7.deliverTimestamp,
		notificationReceivedTimestampMs = p7.notificationReceivedTimestampMs,
		timers = p7.content.timers,
		luaNotifInfo = p7.luaNotifInfo
	}
	
	if p7.content.states then
		t.state = var8(p7.content.states[p7.content.currentState])
	end
	return t
end

local var10 = function(p8)
	-- upvalues: typeModule (ref)
	return p8 == typeModule.DeviceOrientationEnum.Landscape
end

local t = {
	positionX = 1,
	positionXOffset = -5,
	positionY = 0,
	anchorX = 1,
	anchorY = 0
}
local t_1 = {
	positionX = 1,
	positionXOffset = 20,
	positionY = 0,
	anchorX = 0,
	anchorY = 0
}
local t_2 = {
	positionX = 0.5,
	positionXOffset = 0,
	positionY = 0,
	anchorX = 0.5,
	anchorY = 0
}
local t_3 = {
	positionX = 0.5,
	positionXOffset = 0,
	positionY = 0,
	anchorX = 0.5,
	anchorY = 1
}
local vector2 = Vector2.new(800, 600)

local _ = function(p9)
	-- upvalues: constantsModule (ref)
	return p9.Y * (constantsModule.FRRToastPosition.NotificationFrameTopScale + constantsModule.FRRToastPosition.NotificationFrameHeightScale) - constantsModule.FRRToastPosition.NotificationRightInset
end

local var16 = function(p10, p11, p12)
	-- upvalues: constantsModule (ref)
	local var23 = p12.Y * (constantsModule.FRRToastPosition.NotificationFrameTopScale + constantsModule.FRRToastPosition.NotificationFrameHeightScale) - constantsModule.FRRToastPosition.NotificationRightInset - p12.Y
	local t = {
		positionX = 1,
		positionY = 1,
		anchorX = 1,
		anchorY = 1,
		positionXOffset = -constantsModule.FRRToastPosition.NotificationRightInset,
		positionYOffset = var23
	}
	var23 = {
		positionX = 1,
		positionXOffset = 20,
		positionY = 1,
		anchorX = 0,
		anchorY = 1,
		positionYOffset = var23
	}
	
	return if p10 then t elseif p11 then t else var23
end

return {
	calculateToastPosition = function(p13, p14, p15, p16, p17, p18)
		-- upvalues: fFlagFriendshipNotifsUseSendrExperiment (ref), vector2 (ref), var16 (ref), guiService (ref), cryo (ref), t (ref), t_2 (ref), t_1 (ref), t_3 (ref)
		if fFlagFriendshipNotifsUseSendrExperiment and p17 == "legacyBottomRight" then
			return var16(p13, p16, p18 or (if workspace.CurrentCamera then workspace.CurrentCamera.ViewportSize else vector2))
		end
		local var25 = if guiService then guiService:GetGuiInset() else Vector2.new(0, 0)
		
		return if p13 then if p14 then cryo.Dictionary.union(t, { positionYOffset = p15 }) else cryo.Dictionary.union(t_2, { positionYOffset = p15 + var25.Y }) elseif p14 then if p16 then cryo.Dictionary.union(t, { positionYOffset = p15 }) else cryo.Dictionary.union(t_1, { positionYOffset = p15 }) elseif p16 then cryo.Dictionary.union(t_2, { positionYOffset = p15 + var25.Y }) else cryo.Dictionary.union(t_3, {
			positionYOffset = -1 * (if guiService then var25.Y + 20 else 60)
		})
	end,
	getNotificationScript2LegacyToastOffsets = if fFlagFriendshipNotifsUseSendrExperiment then function(p19)
		-- upvalues: constantsModule (ref)
		return -constantsModule.FRRToastPosition.NotificationRightInset, p19.Y * (constantsModule.FRRToastPosition.NotificationFrameTopScale + constantsModule.FRRToastPosition.NotificationFrameHeightScale) - constantsModule.FRRToastPosition.NotificationRightInset - p19.Y
	end else nil,
	calculateTimeRemaining = function(p20, p21, p22)
		-- upvalues: timeTrigger (ref)
		p21 = p21 or DateTime.now().UnixTimestampMillis
		p21 = p22 or DateTime.now().UnixTimestampMillis
		p21 = 0
		
		if p20.trigger == timeTrigger.OnReceive then
			p21 = p20.timespanMs - (DateTime.now().UnixTimestampMillis - p21)
		elseif p20.trigger == timeTrigger.OnDisplay then
			p21 = p20.timespanMs - (DateTime.now().UnixTimestampMillis - p21)
		end
		return math.max(p21, 0)
	end,
	getDeviceOrientation = var6,
	getNotificationSize = var7,
	marshalNotificationData = var9,
	isToastToRight = var10,
	isDesktopDevice = function()
		-- upvalues: userInputService (ref)
		local none = Enum.Platform.None
		pcall(function()
			-- upvalues: none (write), userInputService (copy)
			none = userInputService:GetPlatform()
		end)
		
		return if none ~= Enum.Platform.Windows then if none ~= Enum.Platform.OSX then none == Enum.Platform.UWP else true else true
	end,
	getNearestWholeNumber = function(p23)
		return if p23 % 1 < 0.5 then math.floor(p23) else math.ceil(p23)
	end,
	getTimerFromCardData = function(p24, p25)
		-- upvalues: loggerModule (ref), timeTrigger (ref)
		if p24 and p24.timers and p24.timers[p25] then
			return p24.timers[p25]
		end
		loggerModule:warning("timerKey {} not found in list of timers. Using default.", p25)
		
		return { timespanMs = 0, trigger = timeTrigger.OnDisplay }
	end,
	fireEvent = function(p26, p27)
		p26.sendEventDeferred("ToastNotification", "toastNotificationClientEvent", p27)
	end,
	isUserThumbnail = function(p28)
		-- upvalues: typeModule (ref)
		return if p28.idType ~= typeModule.SENDERThumbnailTypeEnum.User then p28.idType == typeModule.SENDERThumbnailTypeEnum.AvatarImageUrl else true
	end
}