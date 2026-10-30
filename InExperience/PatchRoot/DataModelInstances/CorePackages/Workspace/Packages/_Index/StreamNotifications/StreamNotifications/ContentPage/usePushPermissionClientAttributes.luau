local Parent = script:FindFirstAncestor("StreamNotifications").Parent
local Default = require(Parent.PermissionsProtocol).PermissionsProtocol.default
local PromiseModule = require(Parent.Promise)
local ReactModule = require(Parent.React)
local POSTNOTIFICATIONS = Default.Permissions.POST_NOTIFICATIONS
local PushNotificationsUpsellPromptsClientAttributesTimeoutMs = game:DefineFastInt("PushNotificationsUpsellPromptsClientAttributesTimeoutMs", 1000)

return function()
	-- upvalues: ReactModule (copy), Default (copy), POSTNOTIFICATIONS (copy), PromiseModule (copy), PushNotificationsUpsellPromptsClientAttributesTimeoutMs (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), Default (upval), POSTNOTIFICATIONS (upval), PromiseModule (upval), PushNotificationsUpsellPromptsClientAttributesTimeoutMs (upval)
		local Flag = true
		local Flag1 = false
		local Status = nil
		local UpsellStatus = nil
		
		local function _(p1)
			-- upvalues: Flag1 (ref), Flag (ref), UseStateResult2 (upval)
			if not Flag1 and Flag then
				Flag1 = true
				UseStateResult2(p1)
				
				return
			end
		end
		
		local _ = function()
			-- upvalues: Status (ref), UpsellStatus (ref), Flag1 (ref), Flag (ref), UseStateResult2 (upval)
			if Status == nil or UpsellStatus == nil then return end
			local config = {
				pushNotificationPermissionStatus = Status,
				pushNotificationUpsellStatus = UpsellStatus
			}
			
			if not Flag1 then
				if not Flag then return end
				Flag1 = true
				UseStateResult2(config)
			end
		end
		
		Default:hasPermissions({ POSTNOTIFICATIONS }):andThen(function(Result)
			-- upvalues: Status (ref), UpsellStatus (ref), Flag1 (ref), Flag (ref), UseStateResult2 (upval)
			Status = Result.status or "UNKNOWN"
			
			if Status ~= nil then
				if UpsellStatus == nil then return end
				local config = {
					pushNotificationPermissionStatus = Status,
					pushNotificationUpsellStatus = UpsellStatus
				}
				
				if not Flag1 then
					if not Flag then return end
					Flag1 = true
					UseStateResult2(config)
				end
			end
		end, function()
			-- upvalues: Status (ref), UpsellStatus (ref), Flag1 (ref), Flag (ref), UseStateResult2 (upval)
			Status = "UNKNOWN"
			
			if Status ~= nil then
				if UpsellStatus == nil then return end
				local config = {
					pushNotificationPermissionStatus = Status,
					pushNotificationUpsellStatus = UpsellStatus
				}
				
				if not Flag1 then
					if not Flag then return end
					Flag1 = true
					UseStateResult2(config)
				end
			end
		end)
		Default:shouldShowUpsell({ POSTNOTIFICATIONS }):andThen(function(Result)
			-- upvalues: UpsellStatus (ref), Status (ref), Flag1 (ref), Flag (ref), UseStateResult2 (upval)
			UpsellStatus = Result.upsellStatus or "UNKNOWN"
			
			if Status ~= nil then
				if UpsellStatus == nil then return end
				local config = {
					pushNotificationPermissionStatus = Status,
					pushNotificationUpsellStatus = UpsellStatus
				}
				
				if not Flag1 then
					if not Flag then return end
					Flag1 = true
					UseStateResult2(config)
				end
			end
		end, function()
			-- upvalues: UpsellStatus (ref), Status (ref), Flag1 (ref), Flag (ref), UseStateResult2 (upval)
			UpsellStatus = "UNKNOWN"
			
			if Status ~= nil then
				if UpsellStatus == nil then return end
				local config = {
					pushNotificationPermissionStatus = Status,
					pushNotificationUpsellStatus = UpsellStatus
				}
				
				if not Flag1 then
					if not Flag then return end
					Flag1 = true
					UseStateResult2(config)
				end
			end
		end)
		PromiseModule.delay(PushNotificationsUpsellPromptsClientAttributesTimeoutMs / 1000):andThen(function()
			-- upvalues: Status (ref), UpsellStatus (ref), Flag1 (ref), Flag (ref), UseStateResult2 (upval)
			local config = {
				pushNotificationPermissionStatus = Status or "UNKNOWN",
				pushNotificationUpsellStatus = UpsellStatus or "UNKNOWN"
			}
			
			if not Flag1 then
				if not Flag then return end
				Flag1 = true
				UseStateResult2(config)
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = false
		end
	end, {})
	
	return UseStateResult
end