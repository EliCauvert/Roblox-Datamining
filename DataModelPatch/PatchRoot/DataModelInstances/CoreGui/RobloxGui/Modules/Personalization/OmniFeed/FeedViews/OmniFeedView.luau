local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local UseUiModeInfoFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local _ = require(CorePackages.Workspace.Packages.DiscoveryTypes)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseAppPolicyFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local _ = require(CorePackages.Workspace.Packages.ServerDrivenUi)
local OmniFeedImpressionsDetector = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.Personalization.OmniFeed.OmniFeedImpressionsDetector
local OmniFeedItemsContainerModule = require(script.Parent.OmniFeedItemsContainer)
local t = {}

return function(p1)
	-- upvalues: UseAppPolicyFunction (copy), UseUiModeInfoFunction (copy), UiMode (copy), ReactModule (copy), Signal (copy), UseDesignTokensFunction (copy), UseSelectorFunction (copy), t (copy), OmniFeedItemsContainerModule (copy), OmniFeedImpressionsDetector (copy)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
		return p2.useGridPageLayout()
	end)
	local IsUiModeMatch = UseUiModeInfoFunction().uiMode == UiMode.TenFoot
	local NoIsUiModeMatch: boolean = UseAppPolicyResult and not IsUiModeMatch
	local UseRefResult = ReactModule.useRef(Signal.new())
	local UseDesignTokensResult = UseDesignTokensFunction()
	local BackgroundColor = UseDesignTokensResult.LuaApps.App.Page.BackgroundColor
	local BackgroundTransparency = UseDesignTokensResult.LuaApps.App.Page.BackgroundTransparency
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseDesignTokensResult (copy), NoIsUiModeMatch (ref)
		return UseDesignTokensResult.LuaApps.HomeOmniFeed.getLayoutSpacing(NoIsUiModeMatch)
	end, { NoIsUiModeMatch, UseDesignTokensResult })
	local TopPadding = p1.topPadding or UseMemoResult.topMargin
	local BottomPadding = p1.bottomPadding or 80
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: p1 (copy)
		return p2.OmniRecommendations[p1.pageContext]
	end)
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Position = UDim2.fromScale(0, 0),
		Size = UDim2.fromScale(1, 0),
		BackgroundColor3 = BackgroundColor,
		BackgroundTransparency = BackgroundTransparency,
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		OmniFeed = ReactModule.createElement(OmniFeedItemsContainerModule, {
			omniFeedItems = p1.omniFeedItems,
			pageContext = p1.pageContext,
			sduiContext = p1.sduiContext,
			impressionsTag = p1.impressionsTag,
			topMargin = TopPadding,
			bottomMargin = BottomPadding,
			layoutPadding = UseMemoResult.layoutPadding,
			onItemsUpdatedSignalRef = UseRefResult,
			defaultContainerSize = p1.defaultContainerSize,
			sortsData = UseSelectorResult and UseSelectorResult.sorts or t,
			omniFeedPageSection = p1.omniFeedPageSection,
			enableRelativeGui = p1.enableRelativeGui,
			appCompositionEnabled = p1.appCompositionEnabled,
			contentTag = p1.contentTag
		}),
		OmniFeedImpressionsDetector = ReactModule.createElement(OmniFeedImpressionsDetector, {
			onItemsUpdatedSignal = UseRefResult.current,
			impressionsTag = p1.impressionsTag,
			omniFeedItems = p1.omniFeedItems,
			eventContext = p1.analyticsContext
		})
	})
end