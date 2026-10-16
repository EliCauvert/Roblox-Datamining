local AppStorageService = game:GetService("AppStorageService")
local HttpService = game:GetService("HttpService")
local Parent = script.Parent
local AnalyticsServiceModule = require(Parent.analytics.analyticsService)
local DependenciesModule = require(Parent.dependencies)
local NotificationSnoozedSignal = require(Parent.Signals).NotificationSnoozedSignal
local TypeModule = require(Parent.type)
local Cryo = DependenciesModule.Cryo
local NotificationModalsManager = DependenciesModule.NotificationModalsManager
local Images = DependenciesModule.UIBlox.App.ImageSet.Images
local LocalStorageKey = DependenciesModule.LocalStorage.Enums.LocalStorageKey
local ToastNotificationSnoozeManager = {}
ToastNotificationSnoozeManager.__index = ToastNotificationSnoozeManager

function ToastNotificationSnoozeManager:_batchNotificationAction(p1, Mute) --[[ Line: 31 ]]
	-- upvalues: TypeModule (copy), NotificationSnoozedSignal (copy)
	local NotificationType = if type(p1.notificationType) == "table" then p1.notificationType else { p1.notificationType }
	for _, value in ipairs(NotificationType) do
		if Mute == TypeModule.SnoozeActionEnum.Mute then
			self.snoozedNotificationTypes[value] = {
				durationMinutes = p1.durationMinutes,
				snoozedTimestampMs = DateTime.now().UnixTimestampMillis
			}
		elseif Mute == TypeModule.SnoozeActionEnum.Unmute and self.snoozedNotificationTypes[value] then
			self.snoozedNotificationTypes[value] = nil
		end
	end
	self:_updateAppStorage()
	local Context = p1.context or ""
	
	for _, NotificationType1 in ipairs(NotificationType) do
		self._eventStream.sendEventDeferred(Context, "notificationSnoozedEvent", {
			action_type = Mute,
			duration_minutes = p1.durationMinutes,
			notification_type = NotificationType1
		})
		NotificationSnoozedSignal:fire({
			actionType = Mute,
			context = p1.context,
			durationMinutes = p1.durationMinutes,
			notificationType = NotificationType1
		})
	end
	if p1.modalMessage and p1.modalMessage ~= "" then
		self:_showNotificationsModal(p1.modalMessage)
	end
end

function ToastNotificationSnoozeManager:_isExpiredSnooze(): boolean --[[ Line: 90 ]]
	return self.durationMinutes ~= -1 and self.durationMinutes * 60 <= (DateTime.now().UnixTimestampMillis - self.snoozedTimestampMs) / 1000
end

function ToastNotificationSnoozeManager:_showNotificationsModal(ToastTitle) --[[ Line: 104 ]]
	-- upvalues: NotificationModalsManager (copy), Images (copy)
	NotificationModalsManager.SetUIBloxToast({
		iconImage = Images["icons/common/notificationOn"],
		toastTitle = ToastTitle
	})
end

function ToastNotificationSnoozeManager:_updateAppStorage() --[[ Line: 121 ]]
	-- upvalues: LocalStorageKey (copy), HttpService (copy)
	self._appStorageService:SetItem(LocalStorageKey.SnoozedNotificationTypesLocalStorageKey, HttpService:JSONEncode(self.snoozedNotificationTypes))
	self._appStorageService:Flush()
end

function ToastNotificationSnoozeManager:unmuteNotification(p2) --[[ Line: 138 ]]
	-- upvalues: TypeModule (copy)
	self:_batchNotificationAction(p2, TypeModule.SnoozeActionEnum.Unmute)
end

function ToastNotificationSnoozeManager:snoozeNotification(p2) --[[ Line: 156 ]]
	-- upvalues: TypeModule (copy)
	self:_batchNotificationAction(p2, TypeModule.SnoozeActionEnum.Mute)
end

function ToastNotificationSnoozeManager:isSnoozedNotificationType(p2): boolean --[[ Line: 173 ]]
	-- upvalues: Cryo (copy)
	if not self.snoozedNotificationTypes[p2] then
		return false
	elseif self._isExpiredSnooze(self.snoozedNotificationTypes[p2]) then
		self.snoozedNotificationTypes = Cryo.Dictionary.omit(self.snoozedNotificationTypes, p2)
		self:_updateAppStorage()
		
		return false
	else
		return true
	end
end

function ToastNotificationSnoozeManager.new(_appStorageService) --[[ Line: 191 ]]
	-- upvalues: AnalyticsServiceModule (copy), ToastNotificationSnoozeManager (copy), LocalStorageKey (copy), HttpService (copy)
	local config = {
		_appStorageService = _appStorageService,
		_eventStream = AnalyticsServiceModule.EventStream,
		snoozedNotificationTypes = {}
	}
	setmetatable(config, ToastNotificationSnoozeManager)
	local t = {}
	local SnoozedNotificationTypes = {}
	local Flag = false
	local Success, Result = pcall(function() --[[ Line: 204 ]]
		-- upvalues: config (copy), LocalStorageKey (upval)
		return config._appStorageService:GetItem(LocalStorageKey.SnoozedNotificationTypesLocalStorageKey)
	end)
	
	if Success and Result ~= "" then
		local Success1, Result1 = pcall(function() --[[ Line: 209 ]]
			-- upvalues: HttpService (upval), Result (copy)
			return HttpService:JSONDecode(Result)
		end)
		
		if Success1 then
			t = Result1
		end
	end
	for i, value in pairs(t) do
		if config._isExpiredSnooze(value) then
			Flag = true
		else
			SnoozedNotificationTypes[i] = value
		end
	end
	config.snoozedNotificationTypes = SnoozedNotificationTypes
	
	if Flag then
		config:_updateAppStorage()
	end
	return config
end

ToastNotificationSnoozeManager.default = ToastNotificationSnoozeManager.new(AppStorageService)

return ToastNotificationSnoozeManager