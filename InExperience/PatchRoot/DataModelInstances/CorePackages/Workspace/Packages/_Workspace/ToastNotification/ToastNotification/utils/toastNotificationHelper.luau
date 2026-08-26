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

local var1 = function(p1)
	-- upvalues: typeModule (ref)
	return if p1.Y < p1.X then typeModule.DeviceOrientationEnum.Landscape else typeModule.DeviceOrientationEnum.Portrait
end

local var2 = function(p1, p2)
	-- upvalues: constantsModule (ref)
	return if p2 < constantsModule.FullWidthDeviceThreshold then UDim2.new(0, p2 - 24, 0, 0) elseif p1 then if p2 < constantsModule.CompactCardThreashold then UDim2.new(0, constantsModule.InExperienceToastWidth, 0, 0) else UDim2.new(0, constantsModule.InAppToastWidth, 0, 0) else UDim2.new(0, constantsModule.InAppToastWidth, 0, 0)
end

local _ = function(p1, p2)
	if p1 then
		table.insert(p1, p2)
		
		return p1
	end
	return { p2 }
end

local _ = function(p1)
	return if p1.button == nil then if p1.textBody == nil then if p1.thumbnail == nil then if p1.metaAction == nil then if p1.singleMetaAction == nil then "unknown" else "singleMetaAction" else "metaAction" else "thumbnail" else "textBody" else "button"
end

local var3 = function(p1)
	if not p1 then
		return nil
	end
	local t = {
		button = nil,
		textBody = nil,
		thumbnail = nil,
		metaAction = nil,
		singleMetaAction = nil
	}
	
	for i, v in ipairs(p1.visualItems) do
		local var4 = if v.button ~= nil then if v.textBody ~= nil then if v.thumbnail ~= nil then if v.metaAction ~= nil then if v.singleMetaAction ~= nil then "unknown" else "singleMetaAction" else "metaAction" else "thumbnail" else "textBody" else "button"
		
		if var4 ~= "unknown" then
			local var5
			local var6 = t[var4]
			local var7 = v[var4]
			
			if var6 then
				table.insert(var6, var7)
				var5 = var6
			else
				var5 = { var7 }
			end
			t[var4] = var5
		end
	end
	return {
		layoutKey = p1.layoutKey,
		name = p1.name,
		timeOnScreenMs = p1.timeOnScreenMs,
		visualItems = t
	}
end

local var8 = function(p2)
	-- upvalues: var3 (ref)
	local t = {
		currentState = p2.content.currentState,
		notificationType = p2.content.notificationType,
		id = p2.content.id,
		priority = p2.content.priority,
		clientEventsPayload = p2.content.clientEventsPayload,
		deliverTimestamp = p2.deliverTimestamp,
		notificationReceivedTimestampMs = p2.notificationReceivedTimestampMs,
		timers = p2.content.timers,
		luaNotifInfo = p2.luaNotifInfo
	}
	
	if p2.content.states then
		t.state = var3(p2.content.states[p2.content.currentState])
	end
	return t
end

local var9 = function(p2)
	-- upvalues: typeModule (ref)
	return p2 == typeModule.DeviceOrientationEnum.Landscape
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

local _ = function(p2)
	-- upvalues: constantsModule (ref)
	return p2.Y * (constantsModule.FRRToastPosition.NotificationFrameTopScale + constantsModule.FRRToastPosition.NotificationFrameHeightScale) - constantsModule.FRRToastPosition.NotificationRightInset
end

local var10 = function(p2, p3, p4)
	-- upvalues: constantsModule (ref)
	local var11 = p4.Y * (constantsModule.FRRToastPosition.NotificationFrameTopScale + constantsModule.FRRToastPosition.NotificationFrameHeightScale) - constantsModule.FRRToastPosition.NotificationRightInset - p4.Y
	local t = {
		positionX = 1,
		positionY = 1,
		anchorX = 1,
		anchorY = 1,
		positionXOffset = -constantsModule.FRRToastPosition.NotificationRightInset,
		positionYOffset = var11
	}
	var11 = {
		positionX = 1,
		positionXOffset = 20,
		positionY = 1,
		anchorX = 0,
		anchorY = 1,
		positionYOffset = var11
	}
	
	return if p2 then t elseif p3 then t else var11
end

return {
	calculateToastPosition = function(p2, p3, p4, p5, p6, p7)
		-- upvalues: fFlagFriendshipNotifsUseSendrExperiment (ref), vector2 (ref), var10 (ref), guiService (ref), cryo (ref), t (ref), t_2 (ref), t_1 (ref), t_3 (ref)
		if fFlagFriendshipNotifsUseSendrExperiment and p6 == "legacyBottomRight" then
			return var10(p2, p5, p7 or (if workspace.CurrentCamera then workspace.CurrentCamera.ViewportSize else vector2))
		end
		local var11 = if guiService then guiService:GetGuiInset() else Vector2.new(0, 0)
		
		return if p2 then if p3 then cryo.Dictionary.union(t, { positionYOffset = p4 }) else cryo.Dictionary.union(t_2, { positionYOffset = p4 + var11.Y }) elseif p3 then if p5 then cryo.Dictionary.union(t, { positionYOffset = p4 }) else cryo.Dictionary.union(t_1, { positionYOffset = p4 }) elseif p5 then cryo.Dictionary.union(t_2, { positionYOffset = p4 + var11.Y }) else cryo.Dictionary.union(t_3, {
			positionYOffset = -1 * (if guiService then var11.Y + 20 else 60)
		})
	end,
	getNotificationScript2LegacyToastOffsets = if fFlagFriendshipNotifsUseSendrExperiment then function(p2)
		-- upvalues: constantsModule (ref)
		return -constantsModule.FRRToastPosition.NotificationRightInset, p2.Y * (constantsModule.FRRToastPosition.NotificationFrameTopScale + constantsModule.FRRToastPosition.NotificationFrameHeightScale) - constantsModule.FRRToastPosition.NotificationRightInset - p2.Y
	end else nil,
	calculateTimeRemaining = function(p2, p3, p4)
		-- upvalues: timeTrigger (ref)
		p3 = p3 or DateTime.now().UnixTimestampMillis
		p3 = p4 or DateTime.now().UnixTimestampMillis
		p3 = 0
		
		if p2.trigger == timeTrigger.OnReceive then
			p3 = p2.timespanMs - (DateTime.now().UnixTimestampMillis - p3)
		elseif p2.trigger == timeTrigger.OnDisplay then
			p3 = p2.timespanMs - (DateTime.now().UnixTimestampMillis - p3)
		end
		return math.max(p3, 0)
	end,
	getDeviceOrientation = var1,
	getNotificationSize = var2,
	marshalNotificationData = var8,
	isToastToRight = var9,
	isDesktopDevice = function()
		-- upvalues: userInputService (ref)
		local none = Enum.Platform.None
		pcall(function()
			-- upvalues: none (write), userInputService (copy)
			none = userInputService:GetPlatform()
		end)
		
		return if none ~= Enum.Platform.Windows then if none ~= Enum.Platform.OSX then none == Enum.Platform.UWP else true else true
	end,
	getNearestWholeNumber = function(p2)
		return if p2 % 1 < 0.5 then math.floor(p2) else math.ceil(p2)
	end,
	getTimerFromCardData = function(p2, p3)
		-- upvalues: loggerModule (ref), timeTrigger (ref)
		if p2 and p2.timers and p2.timers[p3] then
			return p2.timers[p3]
		end
		loggerModule:warning("timerKey {} not found in list of timers. Using default.", p3)
		
		return { timespanMs = 0, trigger = timeTrigger.OnDisplay }
	end,
	fireEvent = function(p2, p3)
		p2.sendEventDeferred("ToastNotification", "toastNotificationClientEvent", p3)
	end,
	isUserThumbnail = function(p2)
		-- upvalues: typeModule (ref)
		return if p2.idType ~= typeModule.SENDERThumbnailTypeEnum.User then p2.idType == typeModule.SENDERThumbnailTypeEnum.AvatarImageUrl else true
	end
}