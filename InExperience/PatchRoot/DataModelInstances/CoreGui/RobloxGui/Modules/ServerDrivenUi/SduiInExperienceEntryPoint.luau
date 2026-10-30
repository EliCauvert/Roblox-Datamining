local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local LocalizationService = game:GetService("LocalizationService")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local Localization = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization
local LocalizationProvider = require(CorePackages.Workspace.Packages.Localization).LocalizationProvider
local SduiFeatureEntryPoint = require(CorePackages.Workspace.Packages.SduiSharedUtilities).SduiFeatureEntryPoint
local UniversalAppPolicyModule = require(CorePackages.Workspace.Packages.UniversalAppPolicy)
local SduiInExperienceHostModule = require(script.Parent.SduiInExperienceHost)
local NewResult = nil

local function _()
	-- upvalues: NewResult (ref), Localization (copy), LocalizationService (copy)
	if NewResult == nil then
		NewResult = Localization.new(LocalizationService.RobloxLocaleId)
	end
	return NewResult
end

local _ = function()
	-- upvalues: GuiService (copy), FoundationModule (copy)
	return if GuiService:IsTenFootInterface() then FoundationModule.Enums.Device.Console else FoundationModule.Enums.Device.Desktop
end

local _ = function(p1, p2, Child)
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement(p1, p2, { Child = Child })
end

return ReactModule.memo(ReactModule.forwardRef(function(Frame: Frame, Ref)
	-- upvalues: ReactModule (copy), SduiFeatureEntryPoint (copy), UniversalAppPolicyModule (copy), SduiInExperienceHostModule (copy), LocalizationProvider (copy), NewResult (ref), Localization (copy), LocalizationService (copy), FoundationModule (copy), GuiService (copy)
	local Element = ReactModule.createElement(SduiFeatureEntryPoint, {
		configKey = Frame.configKey,
		identifier = Frame.identifier,
		appPage = Frame.surfaceKey,
		routeName = Frame.routeName,
		additionalAnalyticsData = Frame.additionalAnalyticsData,
		loadTimer = Frame.loadTimer,
		onRetry = Frame.onRetry,
		errorSlot = Frame.errorSlot,
		loadingSlot = Frame.loadingSlot,
		shouldDisplayLoading = Frame.shouldDisplayLoading,
		shouldDisplayError = Frame.shouldDisplayError,
		onAbsoluteSizeChange = Frame.onAbsoluteSizeChange,
		extraLocalProps = Frame.extraLocalProps,
		LayoutOrder = Frame.LayoutOrder,
		Size = Frame.Size,
		AutomaticSize = Frame.AutomaticSize,
		Position = Frame.Position,
		ref = Ref
	})
	
	if not Frame.disableAppPolicyProvider then
		Element = ReactModule.createElement(UniversalAppPolicyModule.RoactAppPolicy.Provider, { policy = { UniversalAppPolicyModule.AppFeaturePolicies } }, { Child = Element })
	end
	local Element1 = ReactModule.createElement(SduiInExperienceHostModule, { surfaceKey = Frame.surfaceKey }, { Child = Element })
	
	if not Frame.disableLocalizationProvider then
		local t = {}
		
		if NewResult == nil then
			NewResult = Localization.new(LocalizationService.RobloxLocaleId)
		end
		t.localization = NewResult
		Element1 = ReactModule.createElement(LocalizationProvider, t, { Child = Element1 })
	end
	if not Frame.disableFoundationProvider then
		Element1 = ReactModule.createElement(FoundationModule.FoundationProvider, {
			colorMode = Frame.colorMode or FoundationModule.Enums.ColorMode.Dark,
			device = Frame.device or (if GuiService:IsTenFootInterface() then FoundationModule.Enums.Device.Console else FoundationModule.Enums.Device.Desktop)
		}, { Child = Element1 })
	end
	return Element1
end))