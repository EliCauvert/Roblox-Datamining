local AppStorageService = game:GetService("AppStorageService")
local ServerTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local Parent = ServerTriggeredModals.Parent
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEdpGameLeavePromptsHandlerEnabled = SharedFlagsModule.FFlagEdpGameLeavePromptsHandlerEnabled
local FFlagSplitPaneEducationalTour = SharedFlagsModule.FFlagSplitPaneEducationalTour
local FFlagHomepagePromptsHalloween2026ThemeModule = require(ServerTriggeredModals.Flags.FFlagHomepagePromptsHalloween2026Theme)
local FFlagAppThemeHalloween2026Module = require(Parent.SharedFlags.FFlagAppThemeHalloween2026)
local FFlagAppThemeHalloween2026ForAllModule = require(Parent.SharedFlags.FFlagAppThemeHalloween2026ForAll)
local PromiseModule = require(Parent.Promise)
local NotificationsUpsellModule = require(Parent.NotificationsUpsell)
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local PromptsEntryPointModule = require(script.Parent.PromptsEntryPoint)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local PushNotificationsUpsellPromptsClientAttributesTimeoutMs = game:DefineFastInt("PushNotificationsUpsellPromptsClientAttributesTimeoutMs", 1000)
local HomePageSessionTimestamp = nil
local Count = 0

local function _(p1): number
	-- upvalues: HomePageSessionTimestamp (ref), Count (ref)
	if p1 ~= nil and p1 ~= HomePageSessionTimestamp then
		HomePageSessionTimestamp = p1
		Count += 1
	end
	return Count
end

local _ = function(p1)
	-- upvalues: AppStorageService (copy)
	local Success, Result = pcall(AppStorageService.GetItem, AppStorageService, p1)
	
	if Success then
		return true, tonumber(Result) or 0
	else
		return false, -1
	end
end

local function getExistingHomepageClientAttributes()
	-- upvalues: FFlagSplitPaneEducationalTour (copy), Parent (copy), AppStorageService (copy), FFlagHomepagePromptsHalloween2026ThemeModule (copy), FFlagAppThemeHalloween2026Module (copy), FFlagAppThemeHalloween2026ForAllModule (copy)
	local t = {}
	
	if FFlagSplitPaneEducationalTour and require(Parent.SplitPane).isSplitPaneTourSupported() then
		t.isSplitPaneTourSupported = "true"
	end
	local Success, Result = pcall(AppStorageService.GetItem, AppStorageService, "KidsAccountHasResetToDefaultTheme")
	
	if Success and typeof(Result) == "string" and Result ~= "" then
		t.KidsAccountHasResetToDefaultTheme = Result
	end
	if FFlagHomepagePromptsHalloween2026ThemeModule then
		t.applicablePlusThemes = if FFlagAppThemeHalloween2026Module then "Halloween2026" else ""
		t.applicableDeviceThemes = if FFlagAppThemeHalloween2026Module and FFlagAppThemeHalloween2026ForAllModule then "Halloween2026" else ""
	end
	return t
end

return {
	get = function()
		-- upvalues: getExistingHomepageClientAttributes (copy)
		local ExistingHomepageClientAttributes = getExistingHomepageClientAttributes()
		
		return if next(ExistingHomepageClientAttributes) == nil then nil else ExistingHomepageClientAttributes
	end,
	use = function(HomepageLaunch, p1)
		-- upvalues: PromptsEntryPointModule (copy), FFlagEdpGameLeavePromptsHandlerEnabled (copy), UseLocalUserIdFunction (copy), UseSelectorFunction (copy), AppPage (copy), ReactModule (copy), getExistingHomepageClientAttributes (copy), NotificationsUpsellModule (copy), AppStorageService (copy), HomePageSessionTimestamp (ref), Count (ref), PromiseModule (copy), PushNotificationsUpsellPromptsClientAttributesTimeoutMs (copy)
		local Inverted: boolean = HomepageLaunch == PromptsEntryPointModule.HomepageLaunch and not (FFlagEdpGameLeavePromptsHandlerEnabled and p1 ~= nil)
		local UseLocalUserIdResult = UseLocalUserIdFunction()
		local UseSelectorResult = UseSelectorFunction(function(p2)
			return p2.LaunchContext
		end)
		local UseSelectorResult1 = UseSelectorFunction(function(p2)
			-- upvalues: AppPage (upval)
			return p2.Personalization and p2.Personalization.PageSessionTimestamp[AppPage.Home]
		end)
		local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
		local Number: number = tonumber(UseLocalUserIdResult) or 0
		ReactModule.useEffect(function()
			-- upvalues: Inverted (copy), UseSelectorResult (copy), getExistingHomepageClientAttributes (upval), NotificationsUpsellModule (upval), AppStorageService (upval), UseSelectorResult1 (copy), HomePageSessionTimestamp (upval), Count (upval), UseStateResult2 (copy), Number (copy), PromiseModule (upval), PushNotificationsUpsellPromptsClientAttributesTimeoutMs (upval)
			if not Inverted then return end
			local Flag = true
			local UseSelectorResult2 = UseSelectorResult or "Unknown"
			local ExistingHomepageClientAttributes = getExistingHomepageClientAttributes()
			local ExistingHomepageClientAttributes1 = (if next(ExistingHomepageClientAttributes) == nil then nil else ExistingHomepageClientAttributes) or {}
			local SysPromptShownTimestamp = NotificationsUpsellModule.NotificationsUpsellConstants.LocalStorageKeys.SysPromptShownTimestamp
			local Success, Result = pcall(AppStorageService.GetItem, AppStorageService, NotificationsUpsellModule.NotificationsUpsellConstants.LocalStorageKeys.PromptShownCount)
			local Flag1 = nil
			local Number1 = nil
			
			if Success then
				Flag1 = true
				Number1 = tonumber(Result) or 0
			else
				Flag1 = false
				Number1 = -1
			end
			local Success1, Result1 = pcall(AppStorageService.GetItem, AppStorageService, SysPromptShownTimestamp)
			local Flag2 = nil
			local Number2 = nil
			
			if Success1 then
				Flag2 = true
				Number2 = tonumber(Result1) or 0
			else
				Flag2 = false
				Number2 = -1
			end
			local HomePageSessionTimestamp1 = UseSelectorResult1
			
			if HomePageSessionTimestamp1 ~= nil and HomePageSessionTimestamp1 ~= HomePageSessionTimestamp then
				HomePageSessionTimestamp = HomePageSessionTimestamp1
				Count += 1
			end
			local Count1: number = Count
			local Flag3 = false
			
			local function resolveWithNativeStatus(Result)
				-- upvalues: Flag3 (ref), ExistingHomepageClientAttributes1 (copy), UseSelectorResult2 (copy), UseSelectorResult1 (upval), Count1 (copy), Flag1 (copy), Flag2 (copy), Number1 (copy), Number2 (copy), Flag (ref), UseStateResult2 (upval), Number (upval)
				if Flag3 then return end
				Flag3 = true
				ExistingHomepageClientAttributes1.nativePushPermissionUpsellStatus = Result
				ExistingHomepageClientAttributes1.launchContext = UseSelectorResult2
				
				if UseSelectorResult1 ~= nil then
					ExistingHomepageClientAttributes1.homePageSessionTimestamp = tostring(UseSelectorResult1)
					ExistingHomepageClientAttributes1.homePageSessionOrdinal = tostring(Count1)
				end
				ExistingHomepageClientAttributes1.legacyPushHistoryReadStatus = if Flag1 and Flag2 then "SUCCESS" else "ERROR"
				ExistingHomepageClientAttributes1.legacyPushPromptShownCount = tostring(Number1)
				ExistingHomepageClientAttributes1.legacyPushSystemPromptShownTimestamp = tostring(Number2)
				
				if Flag then
					UseStateResult2({
						attributes = ExistingHomepageClientAttributes1,
						homePageSessionTimestamp = UseSelectorResult1,
						launchContext = UseSelectorResult2,
						userId = Number
					})
				end
			end
			
			NotificationsUpsellModule.setupPushNotificationsUpsell.GetPushNotificationPermissionUpsellStatus():andThen(resolveWithNativeStatus)
			PromiseModule.delay(PushNotificationsUpsellPromptsClientAttributesTimeoutMs / 1000):andThen(function()
				-- upvalues: resolveWithNativeStatus (copy)
				resolveWithNativeStatus("TIMEOUT")
			end)
			
			return function()
				-- upvalues: Flag (ref)
				Flag = false
			end
		end, { Inverted, UseSelectorResult1, UseSelectorResult, Number })
		local Attributes = if UseStateResult == nil or UseStateResult.homePageSessionTimestamp ~= UseSelectorResult1 or UseStateResult.launchContext ~= (UseSelectorResult or "Unknown") or UseStateResult.userId ~= Number then nil else UseStateResult.attributes
		
		return if Inverted then Attributes else nil
	end
}