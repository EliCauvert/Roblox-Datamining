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
local var1 = nil
local var2 = 0

local function _(p1)
	-- upvalues: var1 (write), var2 (write)
	if p1 ~= nil and p1 ~= var1 then
		var1 = p1
		var2 += 1
	end
	return var2
end

local _ = function(p1)
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
		-- upvalues: promptsEntryPointModule (ref), fFlagEdpGameLeavePromptsHandlerEnabled (ref), useLocalUserId (ref), useSelector (ref), appPage (ref), reactModule (ref), appStorageService (ref), notificationsUpsellModule (ref), var1 (write), var2 (write), promiseModule (ref), pushNotificationsUpsellPromptsClientAttributesTimeoutMs (ref)
		local var3 = false
		
		if p1 == promptsEntryPointModule.HomepageLaunch then
			var3 = not (fFlagEdpGameLeavePromptsHandlerEnabled and p2 ~= nil)
		end
		local var4 = useLocalUserId()
		local var5 = useSelector(function(p3)
			return p3.LaunchContext
		end)
		local var6 = useSelector(function(p3)
			-- upvalues: appPage (copy)
			return p3.Personalization and p3.Personalization.PageSessionTimestamp[appPage.Home]
		end)
		local var7, var8 = reactModule.useState(nil)
		local var9 = tonumber(var4) or 0
		reactModule.useEffect(function()
			-- upvalues: var3 (ref), var5 (ref), appStorageService (copy), notificationsUpsellModule (copy), var6 (ref), var1 (copy), var2 (copy), var8 (ref), var9 (ref), promiseModule (copy), pushNotificationsUpsellPromptsClientAttributesTimeoutMs (copy)
			if not var3 then return end
			local var10 = true
			local var11 = var5 or "Unknown"
			local t = {}
			local ok, status = pcall(appStorageService.GetItem, appStorageService, "KidsAccountHasResetToDefaultTheme")
			
			if ok and typeof(status) == "string" and status ~= "" then
				t.KidsAccountHasResetToDefaultTheme = status
			end
			local var12, var13
			local var14 = (if next(t) == nil then nil else t) or {}
			local sysPromptShownTimestamp = notificationsUpsellModule.NotificationsUpsellConstants.LocalStorageKeys.SysPromptShownTimestamp
			local ok_1, status_1 = pcall(appStorageService.GetItem, appStorageService, notificationsUpsellModule.NotificationsUpsellConstants.LocalStorageKeys.PromptShownCount)
			
			if ok_1 then
				var12 = true
				var13 = tonumber(status_1) or 0
			else
				var12 = false
				var13 = -1
			end
			local var15, var16
			local ok_2, status_2 = pcall(appStorageService.GetItem, appStorageService, sysPromptShownTimestamp)
			
			if ok_2 then
				var15 = true
				var16 = tonumber(status_2) or 0
			else
				var15 = false
				var16 = -1
			end
			local var17 = var6
			
			if var17 ~= nil and var17 ~= var1 then
				var1 = var17
				var2 += 1
			end
			local var18 = var2
			local var19 = false
			
			local function resolveWithNativeStatus(p3)
				-- upvalues: var19 (write), var14 (ref), var11 (ref), var6 (copy), var18 (ref), var12 (ref), var15 (ref), var13 (ref), var16 (ref), var10 (write), var8 (copy), var9 (copy)
				if var19 then return end
				var19 = true
				var14.nativePushPermissionUpsellStatus = p3
				var14.launchContext = var11
				
				if var6 ~= nil then
					var14.homePageSessionTimestamp = tostring(var6)
					var14.homePageSessionOrdinal = tostring(var18)
				end
				var14.legacyPushHistoryReadStatus = if var12 and var15 then "SUCCESS" else "ERROR"
				var14.legacyPushPromptShownCount = tostring(var13)
				var14.legacyPushSystemPromptShownTimestamp = tostring(var16)
				
				if var10 then
					var8({
						attributes = var14,
						homePageSessionTimestamp = var6,
						launchContext = var11,
						userId = var9
					})
				end
			end
			
			notificationsUpsellModule.setupPushNotificationsUpsell.GetPushNotificationPermissionUpsellStatus():andThen(resolveWithNativeStatus)
			promiseModule.delay(pushNotificationsUpsellPromptsClientAttributesTimeoutMs / 1000):andThen(function()
				-- upvalues: resolveWithNativeStatus (ref)
				resolveWithNativeStatus("TIMEOUT")
			end)
			
			return function()
				-- upvalues: var10 (write)
				var10 = false
			end
		end, { var3, var6, var5, var9 })
		
		return if var3 then if var7 == nil or var7.homePageSessionTimestamp ~= var6 or (var7.launchContext ~= (var5 or "Unknown") or var7.userId ~= var9) then nil else var7.attributes else nil
	end
}