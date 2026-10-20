local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local LocalizationService = game:GetService("LocalizationService")
local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local CoreScriptsRootProvider = require(CorePackages.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider
local ReactModule = require(CorePackages.Packages.React)
local RequestInternalWrapperFunction = require(CorePackages.Workspace.Packages.Http).NetworkLayers.requestInternalWrapper
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local FocusNavigationUtilsModule = require(CorePackages.Workspace.Packages.FocusNavigationUtils)
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local UseRegistryEntryFunction = FocusNavigationUtilsModule.FocusNavigableSurfaceRegistry.useRegistryEntry
local DynamicReportInExpContainerModule = require(CorePackages.Workspace.Packages.GenericAbuseReporting.DynamicReportInExpContainer)
local Localization = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization
local LocalizationProvider = require(CorePackages.Workspace.Packages.Localization).LocalizationProvider
local Default = require(game:GetService("CoreGui").RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local UseCaptureScreenshotV2Module = require(AbuseReportMenu.Hooks.useCaptureScreenshotV2)
local UseSettingsHubCloseButtonModule = require(script.Parent.useSettingsHubCloseButton)
local IsAbuseReportMenuOpenCloseSignalEnabledModule = require(AbuseReportMenu.Flags.isAbuseReportMenuOpenCloseSignalEnabled)
local FFlagReportFocusNavCloseButtonModule = require(AbuseReportMenu.Flags.FFlagReportFocusNavCloseButton)
local FIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelayModule = require(AbuseReportMenu.Flags.FIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelay)
local SafetyServiceSignalsModule = require(script.Parent.safetyServiceSignals)
local InExpChatMessagesLoaderModule = require(script.Parent.inExpChatMessagesLoader)
local InExpVoiceUsersLoaderModule = require(script.Parent.inExpVoiceUsersLoader)
local SetTimeoutFunction = require(CorePackages.Packages.LuauPolyfill).setTimeout

local function _()
	-- upvalues: IsAbuseReportMenuOpenCloseSignalEnabledModule (copy)
	return IsAbuseReportMenuOpenCloseSignalEnabledModule()
end

local function AbuseReportMenuContentInner(p1)
	-- upvalues: UseRegistryEntryFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), FFlagReportFocusNavCloseButtonModule (copy), UseSettingsHubCloseButtonModule (copy), ReactModule (copy), FocusRoot (copy), DynamicReportInExpContainerModule (copy), InExpChatMessagesLoaderModule (copy), InExpVoiceUsersLoaderModule (copy), Default (copy)
	local NoUseRegistryEntryResult = UseRegistryEntryFunction(FocusNavigableSurfaceIdentifierEnum.CentralOverlay) == nil
	local NextSelectionUp = nil
	local v1 = nil
	
	if FFlagReportFocusNavCloseButtonModule then
		NextSelectionUp, v28 = UseSettingsHubCloseButtonModule(p1.getSettingsHubRef, p1.isReportTabVisible)
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		FocusNavigationCoreScriptsWrapper = ReactModule.createElement(FocusRoot, {
			isIsolated = true,
			frameProps = {
				Size = UDim2.new(1, 0, 1, 0),
				SelectionBehaviorUp = if FFlagReportFocusNavCloseButtonModule and NextSelectionUp ~= nil then Enum.SelectionBehavior.Escape else nil,
				NextSelectionUp = NextSelectionUp
			},
			isFocusable = NoUseRegistryEntryResult,
			isAutoFocusRoot = not FFlagReportFocusNavCloseButtonModule or not v1,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.RouterView
		}, {
			DynamicReportInExpContainer = ReactModule.createElement(DynamicReportInExpContainerModule, {
				onClose = p1.onClose,
				isReportTabVisible = p1.isReportTabVisible,
				reportAnythingSnapshotRef = p1.reportAnythingSnapshotRef,
				inExpChatMessagesLoader = InExpChatMessagesLoaderModule,
				inExpVoiceUsersLoader = InExpVoiceUsersLoaderModule,
				voiceChatServiceManager = Default,
				preselectedPlayer = p1.preselectedPlayer,
				onReportFinish = p1.onReportFinish
			})
		})
	})
end

local function AbuseReportMenuContent(p1)
	-- upvalues: ReactModule (copy), UseCaptureScreenshotV2Module (copy), IsAbuseReportMenuOpenCloseSignalEnabledModule (copy), SafetyServiceSignalsModule (copy), SetTimeoutFunction (copy), FIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelayModule (copy), AbuseReportMenuContentInner (copy), FFlagReportFocusNavCloseButtonModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseCaptureScreenshotV2ModuleResult = UseCaptureScreenshotV2Module()
	local UseRefResult = ReactModule.useRef(p1.hideReportTab)
	UseRefResult.current = p1.hideReportTab
	local UseRefResult1 = ReactModule.useRef(p1.showReportTab)
	UseRefResult1.current = p1.showReportTab
	local UseRefResult2 = ReactModule.useRef(false)
	local UseRefResult3 = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult2 (copy), UseStateResult2 (copy), UseCaptureScreenshotV2ModuleResult (copy), UseRefResult (copy), UseRefResult1 (copy), p1 (copy), UseRefResult3 (copy), UseStateResult2_1 (copy), IsAbuseReportMenuOpenCloseSignalEnabledModule (upval), SafetyServiceSignalsModule (upval), SetTimeoutFunction (upval), FIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelayModule (upval)
		p1.registerOnReportTabDisplaying(function()
			-- upvalues: UseRefResult2 (upval), UseStateResult2 (upval), UseCaptureScreenshotV2ModuleResult (upval), UseRefResult (upval), UseRefResult1 (upval)
			if not UseRefResult2.current then
				UseRefResult2.current = true
				UseStateResult2(true)
				UseCaptureScreenshotV2ModuleResult.captureIfApplicable({
					hide = UseRefResult.current,
					show = UseRefResult1.current
				})
				
				return
			end
		end)
		p1.registerOnReportTabHidden(function()
			-- upvalues: UseCaptureScreenshotV2ModuleResult (upval), UseRefResult2 (upval), UseRefResult3 (upval), UseStateResult2 (upval), UseStateResult2_1 (upval), IsAbuseReportMenuOpenCloseSignalEnabledModule (upval), SafetyServiceSignalsModule (upval)
			if UseCaptureScreenshotV2ModuleResult.getIsCapturing() then return end
			UseRefResult2.current = false
			UseRefResult3.current = false
			UseStateResult2(false)
			UseStateResult2_1(nil)
			
			if IsAbuseReportMenuOpenCloseSignalEnabledModule() then
				SafetyServiceSignalsModule.reportMenuTabClose()
			end
		end)
		p1.registerSetNextPlayerToReport(function(p2)
			-- upvalues: UseStateResult2_1 (upval)
			UseStateResult2_1(p2)
		end)
		p1.registerOnSettingsHidden(function()
			-- upvalues: SetTimeoutFunction (upval), UseRefResult2 (upval), UseCaptureScreenshotV2ModuleResult (upval), FIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelayModule (upval)
			SetTimeoutFunction(function()
				-- upvalues: UseRefResult2 (upval), UseCaptureScreenshotV2ModuleResult (upval)
				if not UseRefResult2.current then
					UseCaptureScreenshotV2ModuleResult.reset()
				end
			end, FIntAbuseReportTabClearCapturedScreenshotOnCloseFixDelayModule)
		end)
	end, {
		p1.registerOnReportTabHidden, p1.registerSetNextPlayerToReport,
		p1.registerOnSettingsHidden, p1.registerOnReportTabDisplaying,
		UseCaptureScreenshotV2ModuleResult.captureIfApplicable,
		UseCaptureScreenshotV2ModuleResult.getIsCapturing,
		UseCaptureScreenshotV2ModuleResult.reset
	})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseRefResult3 (copy), IsAbuseReportMenuOpenCloseSignalEnabledModule (upval), UseCaptureScreenshotV2ModuleResult (copy), SafetyServiceSignalsModule (upval)
		if not UseStateResult or UseRefResult3.current then return end
		if not IsAbuseReportMenuOpenCloseSignalEnabledModule() then return end
		if not UseCaptureScreenshotV2ModuleResult.isCaptureApplicable or UseCaptureScreenshotV2ModuleResult.isScreenshotTaken then
			UseRefResult3.current = true
			SafetyServiceSignalsModule.reportMenuTabOpen()
		end
	end, {
		UseStateResult,
		UseCaptureScreenshotV2ModuleResult.isScreenshotTaken,
		UseCaptureScreenshotV2ModuleResult.isCaptureApplicable
	})
	
	return ReactModule.createElement(AbuseReportMenuContentInner, {
		isReportTabVisible = UseStateResult,
		preselectedPlayer = UseStateResult1,
		reportAnythingSnapshotRef = UseCaptureScreenshotV2ModuleResult.snapshotRef,
		getSettingsHubRef = if FFlagReportFocusNavCloseButtonModule then p1.getSettingsHubRef else nil,
		onClose = p1.hideReportTab,
		onReportFinish = function()
			-- upvalues: UseStateResult2_1 (copy)
			UseStateResult2_1(nil)
		end
	})
end

return function(p1)
	-- upvalues: Localization (copy), LocalizationService (copy), ReactModule (copy), CoreScriptsRootProvider (copy), LocalizationProvider (copy), RoactServices (copy), RoactNetworking (copy), RequestInternalWrapperFunction (copy), HttpService (copy), AbuseReportMenuContent (copy)
	return ReactModule.createElement(CoreScriptsRootProvider, nil, ReactModule.createElement(LocalizationProvider, {
		localization = Localization.new(LocalizationService.RobloxLocaleId)
	}, {
		ServicesProvider = ReactModule.createElement(RoactServices.ServiceProvider, {
			services = {
				[RoactNetworking] = RequestInternalWrapperFunction(HttpService)
			}
		}, {
			AbuseReportMenuContent = ReactModule.createElement(AbuseReportMenuContent, p1)
		})
	}))
end