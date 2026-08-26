local appStorageService = game:GetService("AppStorageService")
local httpService = game:GetService("HttpService")
local parent = script.Parent
local analyticsServiceModule = require(parent.analytics.analyticsService)
local dependenciesModule = require(parent.dependencies)
local notificationSnoozedSignal = require(parent.Signals).NotificationSnoozedSignal
local typeModule = require(parent.type)
local cryo = dependenciesModule.Cryo
local localStorage = dependenciesModule.LocalStorage
local notificationModalsManager = dependenciesModule.NotificationModalsManager
local images = dependenciesModule.UIBlox.App.ImageSet.Images
local localStorageKey = localStorage.Enums.LocalStorageKey
local t = {}
t.__index = t

function t:_batchNotificationAction(p1, p2)
	-- upvalues: typeModule (ref), notificationSnoozedSignal (ref)
	local var1 = if type(p1.notificationType) == "table" then p1.notificationType else { p1.notificationType }
	
	for i, v in ipairs(var1) do
		if p2 == typeModule.SnoozeActionEnum.Mute then
			self.snoozedNotificationTypes[v] = {
				durationMinutes = p1.durationMinutes,
				snoozedTimestampMs = DateTime.now().UnixTimestampMillis
			}
		elseif p2 == typeModule.SnoozeActionEnum.Unmute and self.snoozedNotificationTypes[v] then
			self.snoozedNotificationTypes[v] = nil
		end
	end
	self:_updateAppStorage()
	local context = p1.context or ""
	
	for i_1, v_1 in ipairs(var1) do
		self._eventStream.sendEventDeferred(context, "notificationSnoozedEvent", {
			action_type = p2,
			duration_minutes = p1.durationMinutes,
			notification_type = v_1
		})
		notificationSnoozedSignal:fire({
			actionType = p2,
			context = p1.context,
			durationMinutes = p1.durationMinutes,
			notificationType = v_1
		})
	end
	if p1.modalMessage and p1.modalMessage ~= "" then
		self:_showNotificationsModal(p1.modalMessage)
	end
end

function t:_isExpiredSnooze()
	return self.durationMinutes == -1 or self.durationMinutes * 60 > (DateTime.now().UnixTimestampMillis - self.snoozedTimestampMs) / 1000
end

function t._showNotificationsModal(_, p3)
	-- upvalues: notificationModalsManager (ref), images (ref)
	notificationModalsManager.SetUIBloxToast({
		iconImage = images["icons/common/notificationOn"],
		toastTitle = p3
	})
end

function t:_updateAppStorage()
	-- upvalues: localStorageKey (ref), httpService (ref)
	self._appStorageService:SetItem(localStorageKey.SnoozedNotificationTypesLocalStorageKey, httpService:JSONEncode(self.snoozedNotificationTypes))
	self._appStorageService:Flush()
end

function t:unmuteNotification(p3)
	-- upvalues: typeModule (ref)
	self:_batchNotificationAction(p3, typeModule.SnoozeActionEnum.Unmute)
end

function t:snoozeNotification(p3)
	-- upvalues: typeModule (ref)
	self:_batchNotificationAction(p3, typeModule.SnoozeActionEnum.Mute)
end

function t:isSnoozedNotificationType(p3)
	-- upvalues: cryo (ref)
	if not self.snoozedNotificationTypes[p3] then
		return false
	elseif self._isExpiredSnooze(self.snoozedNotificationTypes[p3]) then
		self.snoozedNotificationTypes = cryo.Dictionary.omit(self.snoozedNotificationTypes, p3)
		self:_updateAppStorage()
		
		return false
	end
	return true
end

function t.new(p3)
	-- upvalues: analyticsServiceModule (ref), t (ref), localStorageKey (ref), httpService (ref)
	local t_1 = {
		_appStorageService = p3,
		_eventStream = analyticsServiceModule.EventStream,
		snoozedNotificationTypes = {}
	}
	setmetatable(t_1, t)
	local t_2 = {}
	local t_3 = {}
	local var2 = false
	local ok, status = pcall(function()
		-- upvalues: t_1 (ref), localStorageKey (copy)
		return t_1._appStorageService:GetItem(localStorageKey.SnoozedNotificationTypesLocalStorageKey)
	end)
	
	if ok and status ~= "" then
		local ok_1, status_1 = pcall(function()
			-- upvalues: httpService (copy), status (ref)
			return httpService:JSONDecode(status)
		end)
		
		if ok_1 then
			t_2 = status_1
		end
	end
	for i, v in pairs(t_2) do
		if t_1._isExpiredSnooze(v) then
			var2 = true
		else
			t_3[i] = v
		end
	end
	t_1.snoozedNotificationTypes = t_3
	
	if var2 then
		t_1:_updateAppStorage()
	end
	return t_1
end

t.default = t.new(appStorageService)

return t