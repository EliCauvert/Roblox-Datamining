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
local fFlagIEMSettingsPageDisplaying = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagIEMSettingsPageDisplaying
local setTimeout = require(corePackagesService.Packages.LuauPolyfill).setTimeout

local function _()
	-- upvalues: isAbuseReportMenuOpenCloseSignalEnabledModule (ref), isInWHAM1707ExperimentModule (ref)
	return isAbuseReportMenuOpenCloseSignalEnabledModule() and isInWHAM1707ExperimentModule()
end

local function AbuseReportMenuContentInner(p0)
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
				onClose = p0.onClose,
				isReportTabVisible = p0.isReportTabVisible,
				reportAnythingSnapshotRef = p0.reportAnythingSnapshotRef,
				inExpChatMessagesLoader = inExpChatMessagesLoaderModule,
				inExpVoiceUsersLoader = inExpVoiceUsersLoaderModule,
				voiceChatServiceManager = default,
				preselectedPlayer = p0.preselectedPlayer,
				onReportFinish = p0.onReportFinish
			})
		})
	})
end

local function AbuseReportMenuContent(p1)
	-- upvalues: reactModule (ref), useCaptureScreenshotV2Module (ref), fFlagIEMSettingsPageDisplaying (ref), isAbuseReportMenuOpenCloseSignalEnabledModule (ref), isInWHAM1707ExperimentModule (ref), safetyServiceSignalsModule (ref), setTimeout (ref), fIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelayModule (ref), AbuseReportMenuContentInner (ref)
	local var17, var18 = reactModule.useState(false)
	local var19, var20 = reactModule.useState(nil)
	local var21 = useCaptureScreenshotV2Module()
	local var22 = reactModule.useRef(p1.hideReportTab)
	var22.current = p1.hideReportTab
	local var23 = reactModule.useRef(p1.showReportTab)
	var23.current = p1.showReportTab
	local var24 = reactModule.useRef(false)
	local var25 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var24 (ref), var18 (ref), var21 (ref), var22 (ref), var23 (ref), fFlagIEMSettingsPageDisplaying (copy), p1 (ref), var25 (ref), var20 (ref), isAbuseReportMenuOpenCloseSignalEnabledModule (copy), isInWHAM1707ExperimentModule (copy), safetyServiceSignalsModule (copy), setTimeout (copy), fIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelayModule (copy)
		local function onOpen()
			-- upvalues: var24 (copy), var18 (copy), var21 (copy), var22 (copy), var23 (copy)
			if var24.current then
				return
			end
			var24.current = true
			var18(true)
			var21.captureIfApplicable({ hide = var22.current, show = var23.current })
		end
		
		if fFlagIEMSettingsPageDisplaying then
			p1.registerOnReportTabDisplaying(onOpen)
		else
			p1.registerOnReportTabDisplayed(onOpen)
		end
		p1.registerOnReportTabHidden(function()
			-- upvalues: var21 (copy), var24 (copy), var25 (copy), var18 (copy), var20 (copy), isAbuseReportMenuOpenCloseSignalEnabledModule (copy), isInWHAM1707ExperimentModule (copy), safetyServiceSignalsModule (copy)
			if var21.getIsCapturing() then return end
			var24.current = false
			var25.current = false
			var18(false)
			var20(nil)
			
			if isAbuseReportMenuOpenCloseSignalEnabledModule() and isInWHAM1707ExperimentModule() then
				safetyServiceSignalsModule.reportMenuTabClose()
			end
		end)
		p1.registerSetNextPlayerToReport(function(p2)
			-- upvalues: var20 (copy)
			var20(p2)
		end)
		p1.registerOnSettingsHidden(function()
			-- upvalues: setTimeout (copy), var24 (copy), var21 (copy), fIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelayModule (copy)
			setTimeout(function()
				-- upvalues: var24 (copy), var21 (copy)
				if not var24.current then
					var21.reset()
				end
			end, fIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelayModule)
		end)
	end, {
		p1.registerOnReportTabHidden, p1.registerSetNextPlayerToReport,
		p1.registerOnSettingsHidden,
		if fFlagIEMSettingsPageDisplaying then p1.registerOnReportTabDisplaying else p1.registerOnReportTabDisplayed,
		var21.captureIfApplicable, var21.getIsCapturing, var21.reset
	})
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), var25 (ref), isAbuseReportMenuOpenCloseSignalEnabledModule (copy), isInWHAM1707ExperimentModule (copy), var21 (ref), safetyServiceSignalsModule (copy)
		if not var17 or var25.current then return end
		if not isAbuseReportMenuOpenCloseSignalEnabledModule() or not isInWHAM1707ExperimentModule() then return end
		if not var21.isCaptureApplicable or var21.isScreenshotTaken then
			var25.current = true
			safetyServiceSignalsModule.reportMenuTabOpen()
		end
	end, {
		var17,
		var21.isScreenshotTaken,
		var21.isCaptureApplicable
	})
	
	return reactModule.createElement(AbuseReportMenuContentInner, {
		isReportTabVisible = var17,
		preselectedPlayer = var19,
		reportAnythingSnapshotRef = var21.snapshotRef,
		onClose = p1.hideReportTab,
		onReportFinish = function()
			-- upvalues: var20 (ref)
			var20(nil)
		end
	})
end

return function(p3)
	-- upvalues: localization (ref), localizationService (ref), reactModule (ref), coreScriptsRootProvider (ref), localizationProvider (ref), roactServices (ref), roactNetworking (ref), requestInternalWrapper (ref), httpService (ref), AbuseReportMenuContent (ref)
	return reactModule.createElement(coreScriptsRootProvider, nil, reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		ServicesProvider = reactModule.createElement(roactServices.ServiceProvider, {
			services = { [roactNetworking] = requestInternalWrapper(httpService) }
		}, {
			AbuseReportMenuContent = reactModule.createElement(AbuseReportMenuContent, p3)
		})
	}))
end