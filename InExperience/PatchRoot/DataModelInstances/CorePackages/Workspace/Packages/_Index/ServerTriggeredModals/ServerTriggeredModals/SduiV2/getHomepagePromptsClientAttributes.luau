local appStorageService = game:GetService("AppStorageService")
local parent = script:FindFirstAncestor("ServerTriggeredModals").Parent
local fFlagEdpGameLeavePromptsHandlerEnabled = require(parent.SharedFlags).FFlagEdpGameLeavePromptsHandlerEnabled
local promiseModule = require(parent.Promise)
local notificationsUpsellModule = require(parent.NotificationsUpsell)
local reactModule = require(parent.React)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local promptsEntryPointModule = require(script.Parent.PromptsEntryPoint)
local appPage = robloxAppEnumsModule.AppPage
local pushNotificationsUpsellPromptsClientAttributesTimeoutMs = game:DefineFastInt("PushNotificationsUpsellPromptsClientAttributesTimeoutMs", 1000)

local function _(p1)
	-- upvalues: appStorageService (ref)
	local ok, status = pcall(appStorageService.GetItem, appStorageService, p1)
	
	if ok then
		return true, tonumber(status) or 0
	end
	return false, -1
end

local _ = function()
	-- upvalues: appStorageService (ref)
	local t = {}
	local ok, status = pcall(appStorageService.GetItem, appStorageService, "KidsAccountHasResetToDefaultTheme")
	
	if ok and typeof(status) == "string" and status ~= "" then
		t.KidsAccountHasResetToDefaultTheme = status
	end
	return t
end

return {
	get = function()
		-- upvalues: appStorageService (ref)
		local t = {}
		local ok, status = pcall(appStorageService.GetItem, appStorageService, "KidsAccountHasResetToDefaultTheme")
		
		if ok and typeof(status) == "string" and status ~= "" then
			t.KidsAccountHasResetToDefaultTheme = status
		end
		return if next(t) == nil then nil else t
	end,
	use = function(p1, p2)
		-- upvalues: promptsEntryPointModule (ref), fFlagEdpGameLeavePromptsHandlerEnabled (ref), useLocalUserId (ref), useSelector (ref), appPage (ref), reactModule (ref), appStorageService (ref), notificationsUpsellModule (ref), promiseModule (ref), pushNotificationsUpsellPromptsClientAttributesTimeoutMs (ref)
		local var1 = false
		
		if p1 == promptsEntryPointModule.HomepageLaunch then
			var1 = not (fFlagEdpGameLeavePromptsHandlerEnabled and p2 ~= nil)
		end
		local var2 = useLocalUserId()
		local var3 = useSelector(function(p3)
			return p3.LaunchContext
		end)
		local var4 = useSelector(function(p3)
			-- upvalues: appPage (copy)
			return p3.Personalization and p3.Personalization.PageSessionTimestamp[appPage.Home]
		end)
		local var5, var6 = reactModule.useState(nil)
		local var7 = tonumber(var2) or 0
		reactModule.useEffect(function()
			-- upvalues: var1 (ref), var3 (ref), appStorageService (copy), notificationsUpsellModule (copy), var4 (ref), var6 (ref), var7 (ref), promiseModule (copy), pushNotificationsUpsellPromptsClientAttributesTimeoutMs (copy)
			if not var1 then return end
			local var8 = true
			local var9 = var3 or "Unknown"
			local t = {}
			local ok, status = pcall(appStorageService.GetItem, appStorageService, "KidsAccountHasResetToDefaultTheme")
			
			if ok and typeof(status) == "string" and status ~= "" then
				t.KidsAccountHasResetToDefaultTheme = status
			end
			local var10, var11
			local var12 = (if next(t) == nil then nil else t) or {}
			local sysPromptShownTimestamp = notificationsUpsellModule.NotificationsUpsellConstants.LocalStorageKeys.SysPromptShownTimestamp
			local ok_1, status_1 = pcall(appStorageService.GetItem, appStorageService, notificationsUpsellModule.NotificationsUpsellConstants.LocalStorageKeys.PromptShownCount)
			
			if ok_1 then
				var10 = true
				var11 = tonumber(status_1) or 0
			else
				var10 = false
				var11 = -1
			end
			local var13, var14
			local ok_2, status_2 = pcall(appStorageService.GetItem, appStorageService, sysPromptShownTimestamp)
			
			if ok_2 then
				var13 = true
				var14 = tonumber(status_2) or 0
			else
				var13 = false
				var14 = -1
			end
			local var15 = false
			
			local function resolveWithNativeStatus(p3)
				-- upvalues: var15 (write), var12 (ref), var9 (ref), var4 (copy), var10 (ref), var13 (ref), var11 (ref), var14 (ref), var8 (write), var6 (copy), var7 (copy)
				if var15 then return end
				var15 = true
				var12.nativePushPermissionUpsellStatus = p3
				var12.launchContext = var9
				
				if var4 ~= nil then
					var12.homePageSessionTimestamp = tostring(var4)
				end
				var12.legacyPushHistoryReadStatus = if var10 and var13 then "SUCCESS" else "ERROR"
				var12.legacyPushPromptShownCount = tostring(var11)
				var12.legacyPushSystemPromptShownTimestamp = tostring(var14)
				
				if var8 then
					var6({
						attributes = var12,
						homePageSessionTimestamp = var4,
						launchContext = var9,
						userId = var7
					})
				end
			end
			
			notificationsUpsellModule.setupPushNotificationsUpsell.GetPushNotificationPermissionUpsellStatus():andThen(resolveWithNativeStatus)
			promiseModule.delay(pushNotificationsUpsellPromptsClientAttributesTimeoutMs / 1000):andThen(function()
				-- upvalues: resolveWithNativeStatus (ref)
				resolveWithNativeStatus("TIMEOUT")
			end)
			
			return function()
				-- upvalues: var8 (write)
				var8 = false
			end
		end, { var1, var4, var3, var7 })
		
		return if var1 then if var5 == nil or var5.homePageSessionTimestamp ~= var4 or (var5.launchContext ~= (var3 or "Unknown") or var5.userId ~= var7) then nil else var5.attributes else nil
	end
}