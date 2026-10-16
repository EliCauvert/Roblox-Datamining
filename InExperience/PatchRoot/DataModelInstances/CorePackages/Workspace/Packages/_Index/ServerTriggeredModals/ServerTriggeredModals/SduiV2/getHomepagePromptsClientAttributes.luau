local appStorageService = game:GetService("AppStorageService")
local parent = script:FindFirstAncestor("ServerTriggeredModals").Parent
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEdpGameLeavePromptsHandlerEnabled = sharedFlagsModule.FFlagEdpGameLeavePromptsHandlerEnabled
local fFlagSduiClientDrivenTemplates = sharedFlagsModule.FFlagSplitPaneEducationalTour and sharedFlagsModule.FFlagSduiClientDrivenTemplates
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

local function getExistingHomepageClientAttributes()
	-- upvalues: fFlagSduiClientDrivenTemplates (ref), parent (ref), appStorageService (ref)
	local t = {}
	
	if fFlagSduiClientDrivenTemplates and require(parent.SplitPane).isSplitPaneTourSupported() then
		t.isSplitPaneTourSupported = "true"
	end
	local ok, status = pcall(appStorageService.GetItem, appStorageService, "KidsAccountHasResetToDefaultTheme")
	
	if ok and typeof(status) == "string" and status ~= "" then
		t.KidsAccountHasResetToDefaultTheme = status
	end
	return t
end

return {
	get = function()
		-- upvalues: getExistingHomepageClientAttributes (ref)
		local var3 = getExistingHomepageClientAttributes()
		
		return if next(var3) == nil then nil else var3
	end,
	use = function(p1, p2)
		-- upvalues: promptsEntryPointModule (ref), fFlagEdpGameLeavePromptsHandlerEnabled (ref), useLocalUserId (ref), useSelector (ref), appPage (ref), reactModule (ref), getExistingHomepageClientAttributes (ref), notificationsUpsellModule (ref), appStorageService (ref), var1 (write), var2 (write), promiseModule (ref), pushNotificationsUpsellPromptsClientAttributesTimeoutMs (ref)
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
			-- upvalues: var3 (ref), var5 (ref), getExistingHomepageClientAttributes (copy), notificationsUpsellModule (copy), appStorageService (copy), var6 (ref), var1 (copy), var2 (copy), var8 (ref), var9 (ref), promiseModule (copy), pushNotificationsUpsellPromptsClientAttributesTimeoutMs (copy)
			if not var3 then return end
			local var10, var11
			local var12 = true
			local var13 = var5 or "Unknown"
			local var14 = getExistingHomepageClientAttributes()
			local var15 = (if next(var14) == nil then nil else var14) or {}
			local sysPromptShownTimestamp = notificationsUpsellModule.NotificationsUpsellConstants.LocalStorageKeys.SysPromptShownTimestamp
			local ok, status = pcall(appStorageService.GetItem, appStorageService, notificationsUpsellModule.NotificationsUpsellConstants.LocalStorageKeys.PromptShownCount)
			
			if ok then
				var10 = true
				var11 = tonumber(status) or 0
			else
				var10 = false
				var11 = -1
			end
			local var16, var17
			local ok_1, status_1 = pcall(appStorageService.GetItem, appStorageService, sysPromptShownTimestamp)
			
			if ok_1 then
				var16 = true
				var17 = tonumber(status_1) or 0
			else
				var16 = false
				var17 = -1
			end
			local var18 = var6
			
			if var18 ~= nil and var18 ~= var1 then
				var1 = var18
				var2 += 1
			end
			local var19 = var2
			local var20 = false
			
			local function resolveWithNativeStatus(p3)
				-- upvalues: var20 (write), var15 (ref), var13 (ref), var6 (copy), var19 (ref), var10 (ref), var16 (ref), var11 (ref), var17 (ref), var12 (write), var8 (copy), var9 (copy)
				if var20 then return end
				var20 = true
				var15.nativePushPermissionUpsellStatus = p3
				var15.launchContext = var13
				
				if var6 ~= nil then
					var15.homePageSessionTimestamp = tostring(var6)
					var15.homePageSessionOrdinal = tostring(var19)
				end
				var15.legacyPushHistoryReadStatus = if var10 and var16 then "SUCCESS" else "ERROR"
				var15.legacyPushPromptShownCount = tostring(var11)
				var15.legacyPushSystemPromptShownTimestamp = tostring(var17)
				
				if var12 then
					var8({
						attributes = var15,
						homePageSessionTimestamp = var6,
						launchContext = var13,
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
				-- upvalues: var12 (write)
				var12 = false
			end
		end, { var3, var6, var5, var9 })
		
		return if var3 then if var7 == nil or var7.homePageSessionTimestamp ~= var6 or (var7.launchContext ~= (var5 or "Unknown") or var7.userId ~= var9) then nil else var7.attributes else nil
	end
}