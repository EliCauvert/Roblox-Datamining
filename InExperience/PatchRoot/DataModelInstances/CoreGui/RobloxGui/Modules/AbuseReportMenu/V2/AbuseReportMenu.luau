local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local httpService = game:GetService("HttpService")
local localizationService = game:GetService("LocalizationService")
local robloxGui = coreGuiService.RobloxGui
local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local coreScriptsRootProvider = require(corePackagesService.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider
local reactModule = require(corePackagesService.Packages.React)
local requestInternalWrapper = require(corePackagesService.Workspace.Packages.Http).NetworkLayers.requestInternalWrapper
local roactNetworking = require(corePackagesService.Workspace.Packages.RoactServiceTags).RoactNetworking
local roactServices = require(corePackagesService.Workspace.Packages.RoactServices).RoactServices
local focusNavigationUtilsModule = require(corePackagesService.Workspace.Packages.FocusNavigationUtils)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusRoot = focusNavigationUtilsModule.FocusRoot
local useRegistryEntry = focusNavigationUtilsModule.FocusNavigableSurfaceRegistry.useRegistryEntry
local dynamicReportInExpContainerModule = require(corePackagesService.Workspace.Packages.GenericAbuseReporting.DynamicReportInExpContainer)
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local localizationProvider = require(corePackagesService.Workspace.Packages.Localization).LocalizationProvider
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local useCaptureScreenshotV2Module = require(abuseReportMenu.Hooks.useCaptureScreenshotV2)
local isAbuseReportMenuOpenCloseSignalEnabledModule = require(abuseReportMenu.Flags.isAbuseReportMenuOpenCloseSignalEnabled)
local fIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelayModule = require(abuseReportMenu.Flags.FIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelay)
local isInWHAM1707ExperimentModule = require(script.Parent.isInWHAM1707Experiment)
local safetyServiceSignalsModule = require(script.Parent.safetyServiceSignals)
local inExpChatMessagesLoaderModule = require(script.Parent.inExpChatMessagesLoader)
local inExpVoiceUsersLoaderModule = require(script.Parent.inExpVoiceUsersLoader)
local setTimeout = require(corePackagesService.Packages.LuauPolyfill).setTimeout

local function _()
	-- upvalues: isAbuseReportMenuOpenCloseSignalEnabledModule (ref), isInWHAM1707ExperimentModule (ref)
	return isAbuseReportMenuOpenCloseSignalEnabledModule() and isInWHAM1707ExperimentModule()
end

local function AbuseReportMenuContentInner(p1)
	-- upvalues: useRegistryEntry (ref), focusNavigableSurfaceIdentifierEnum (ref), reactModule (ref), focusRoot (ref), dynamicReportInExpContainerModule (ref), inExpChatMessagesLoaderModule (ref), inExpVoiceUsersLoaderModule (ref), default (ref)
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		FocusNavigationCoreScriptsWrapper = reactModule.createElement(focusRoot, {
			isAutoFocusRoot = true,
			isIsolated = true,
			frameProps = { Size = UDim2.new(1, 0, 1, 0) },
			isFocusable = useRegistryEntry(focusNavigableSurfaceIdentifierEnum.CentralOverlay) == nil,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.RouterView
		}, {
			DynamicReportInExpContainer = reactModule.createElement(dynamicReportInExpContainerModule, {
				onClose = p1.onClose,
				isReportTabVisible = p1.isReportTabVisible,
				reportAnythingSnapshotRef = p1.reportAnythingSnapshotRef,
				inExpChatMessagesLoader = inExpChatMessagesLoaderModule,
				inExpVoiceUsersLoader = inExpVoiceUsersLoaderModule,
				voiceChatServiceManager = default,
				preselectedPlayer = p1.preselectedPlayer,
				onReportFinish = p1.onReportFinish
			})
		})
	})
end

local function AbuseReportMenuContent(p1)
	-- upvalues: reactModule (ref), useCaptureScreenshotV2Module (ref), isAbuseReportMenuOpenCloseSignalEnabledModule (ref), isInWHAM1707ExperimentModule (ref), safetyServiceSignalsModule (ref), setTimeout (ref), fIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelayModule (ref), AbuseReportMenuContentInner (ref)
	local var1, var2 = reactModule.useState(false)
	local var3, var4 = reactModule.useState(nil)
	local var5 = useCaptureScreenshotV2Module()
	local var6 = reactModule.useRef(p1.hideReportTab)
	var6.current = p1.hideReportTab
	local var7 = reactModule.useRef(p1.showReportTab)
	var7.current = p1.showReportTab
	local var8 = reactModule.useRef(false)
	local var9 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), var2 (ref), var5 (ref), var6 (ref), var7 (ref), p1 (ref), var9 (ref), var4 (ref), isAbuseReportMenuOpenCloseSignalEnabledModule (copy), isInWHAM1707ExperimentModule (copy), safetyServiceSignalsModule (copy), setTimeout (copy), fIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelayModule (copy)
		p1.registerOnReportTabDisplaying(function()
			-- upvalues: var8 (copy), var2 (copy), var5 (copy), var6 (copy), var7 (copy)
			if var8.current then
				return
			end
			var8.current = true
			var2(true)
			var5.captureIfApplicable({ hide = var6.current, show = var7.current })
		end)
		p1.registerOnReportTabHidden(function()
			-- upvalues: var5 (copy), var8 (copy), var9 (copy), var2 (copy), var4 (copy), isAbuseReportMenuOpenCloseSignalEnabledModule (copy), isInWHAM1707ExperimentModule (copy), safetyServiceSignalsModule (copy)
			if var5.getIsCapturing() then return end
			var8.current = false
			var9.current = false
			var2(false)
			var4(nil)
			
			if isAbuseReportMenuOpenCloseSignalEnabledModule() and isInWHAM1707ExperimentModule() then
				safetyServiceSignalsModule.reportMenuTabClose()
			end
		end)
		p1.registerSetNextPlayerToReport(function(p2)
			-- upvalues: var4 (copy)
			var4(p2)
		end)
		p1.registerOnSettingsHidden(function()
			-- upvalues: setTimeout (copy), var8 (copy), var5 (copy), fIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelayModule (copy)
			setTimeout(function()
				-- upvalues: var8 (copy), var5 (copy)
				if not var8.current then
					var5.reset()
				end
			end, fIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelayModule)
		end)
	end, {
		p1.registerOnReportTabHidden, p1.registerSetNextPlayerToReport,
		p1.registerOnSettingsHidden, p1.registerOnReportTabDisplaying,
		var5.captureIfApplicable, var5.getIsCapturing, var5.reset
	})
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var9 (ref), isAbuseReportMenuOpenCloseSignalEnabledModule (copy), isInWHAM1707ExperimentModule (copy), var5 (ref), safetyServiceSignalsModule (copy)
		if not var1 or var9.current then return end
		if not isAbuseReportMenuOpenCloseSignalEnabledModule() or not isInWHAM1707ExperimentModule() then return end
		if not var5.isCaptureApplicable or var5.isScreenshotTaken then
			var9.current = true
			safetyServiceSignalsModule.reportMenuTabOpen()
		end
	end, {
		var1,
		var5.isScreenshotTaken,
		var5.isCaptureApplicable
	})
	
	return reactModule.createElement(AbuseReportMenuContentInner, {
		isReportTabVisible = var1,
		preselectedPlayer = var3,
		reportAnythingSnapshotRef = var5.snapshotRef,
		onClose = p1.hideReportTab,
		onReportFinish = function()
			-- upvalues: var4 (ref)
			var4(nil)
		end
	})
end

return function(p1)
	-- upvalues: localization (ref), localizationService (ref), reactModule (ref), coreScriptsRootProvider (ref), localizationProvider (ref), roactServices (ref), roactNetworking (ref), requestInternalWrapper (ref), httpService (ref), AbuseReportMenuContent (ref)
	return reactModule.createElement(coreScriptsRootProvider, nil, reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		ServicesProvider = reactModule.createElement(roactServices.ServiceProvider, {
			services = { [roactNetworking] = requestInternalWrapper(httpService) }
		}, {
			AbuseReportMenuContent = reactModule.createElement(AbuseReportMenuContent, p1)
		})
	}))
end