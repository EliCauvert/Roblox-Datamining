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

function t:_batchNotificationAction(p0, p1) --[[ line: 31 ]]
	-- upvalues: typeModule (ref), notificationSnoozedSignal (ref)
	local var6 = if type(p0.notificationType) == "table" then p0.notificationType else { p0.notificationType }
	
	for i, v in ipairs(var6) do
		if p1 == typeModule.SnoozeActionEnum.Mute then
			self.snoozedNotificationTypes[v] = {
				durationMinutes = p0.durationMinutes,
				snoozedTimestampMs = DateTime.now().UnixTimestampMillis
			}
		elseif p1 == typeModule.SnoozeActionEnum.Unmute and self.snoozedNotificationTypes[v] then
			self.snoozedNotificationTypes[v] = nil
		end
	end
	self:_updateAppStorage()
	local context = p0.context or ""
	
	for i_1, v_1 in ipairs(var6) do
		self._eventStream.sendEventDeferred(context, "notificationSnoozedEvent", {
			action_type = p1,
			duration_minutes = p0.durationMinutes,
			notification_type = v_1
		})
		notificationSnoozedSignal:fire({
			actionType = p1,
			context = p0.context,
			durationMinutes = p0.durationMinutes,
			notificationType = v_1
		})
	end
	if p0.modalMessage and p0.modalMessage ~= "" then
		self:_showNotificationsModal(p0.modalMessage)
	end
end

function t:_isExpiredSnooze() --[[ line: 90 ]]
	return self.durationMinutes == -1 or self.durationMinutes * 60 > (DateTime.now().UnixTimestampMillis - self.snoozedTimestampMs) / 1000
end

function t._showNotificationsModal(_, p2) --[[ line: 104 ]]
	-- upvalues: notificationModalsManager (ref), images (ref)
	notificationModalsManager.SetUIBloxToast({
		iconImage = images["icons/common/notificationOn"],
		toastTitle = p2
	})
end

function t:_updateAppStorage() --[[ line: 121 ]]
	-- upvalues: localStorageKey (ref), httpService (ref)
	self._appStorageService:SetItem(localStorageKey.SnoozedNotificationTypesLocalStorageKey, httpService:JSONEncode(self.snoozedNotificationTypes))
	self._appStorageService:Flush()
end

function t:unmuteNotification(p3) --[[ line: 138 ]]
	-- upvalues: typeModule (ref)
	self:_batchNotificationAction(p3, typeModule.SnoozeActionEnum.Unmute)
end

function t:snoozeNotification(p4) --[[ line: 156 ]]
	-- upvalues: typeModule (ref)
	self:_batchNotificationAction(p4, typeModule.SnoozeActionEnum.Mute)
end

function t:isSnoozedNotificationType(p5) --[[ line: 173 ]]
	-- upvalues: cryo (ref)
	if not self.snoozedNotificationTypes[p5] then
		return false
	elseif self._isExpiredSnooze(self.snoozedNotificationTypes[p5]) then
		self.snoozedNotificationTypes = cryo.Dictionary.omit(self.snoozedNotificationTypes, p5)
		self:_updateAppStorage()
		
		return false
	end
	return true
end

function t.new(p6) --[[ line: 191 ]]
	-- upvalues: analyticsServiceModule (ref), t (ref), localStorageKey (ref), httpService (ref)
	local t_1 = {
		_appStorageService = p6,
		_eventStream = analyticsServiceModule.EventStream,
		snoozedNotificationTypes = {}
	}
	setmetatable(t_1, t)
	local t_2 = {}
	local t_3 = {}
	local var11 = false
	local ok, status = pcall(function() --[[ line: 204 ]]
		-- upvalues: t_1 (ref), localStorageKey (copy)
		return t_1._appStorageService:GetItem(localStorageKey.SnoozedNotificationTypesLocalStorageKey)
	end)
	
	if ok and status ~= "" then
		local ok_1, status_1 = pcall(function() --[[ line: 209 ]]
			-- upvalues: httpService (copy), status (ref)
			return httpService:JSONDecode(status)
		end)
		
		if ok_1 then
			t_2 = status_1
		end
	end
	for i, v in pairs(t_2) do
		if t_1._isExpiredSnooze(v) then
			var11 = true
		else
			t_3[i] = v
		end
	end
	t_1.snoozedNotificationTypes = t_3
	
	if var11 then
		t_1:_updateAppStorage()
	end
	return t_1
end

t.default = t.new(appStorageService)

return t