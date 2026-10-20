local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UsePropertyFunction = require(CorePackages.Workspace.Packages.GuiObjectUtils).useProperty
local UseUiModeInfoFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local SiteMessageBannerModule = require(Modules.LuaApp.Components.SiteMessageBanner)
local PromptBannerV2Module = require(Modules.LuaApp.Components.AccountSecurity.PromptBannerV2)
local ClientCacheFallbackBanner = require(CorePackages.Workspace.Packages.DiscoveryAvailability).ClientCacheFallbackBanner

local function hasMultipleBanners(...): boolean
	local Count = 0
	
	for _, value in { ... } do
		if value then
			Count += 1
		end
	end
	return Count > 1
end

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), UseUiModeInfoFunction (copy), UiMode (copy), hasMultipleBanners (copy), ReactModule (copy), UsePropertyFunction (copy), SiteMessageBannerModule (copy), PromptBannerV2Module (copy), ClientCacheFallbackBanner (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local IsNotUiModeMatch = UseUiModeInfoFunction().uiMode ~= UiMode.TenFoot
	local Banner = UseDesignTokensResult.LuaApps.Banner
	local ShowSecurityBanner = p1.showSecurityBanner
	local ShowSiteMessageBanner = p1.showSiteMessageBanner
	local ShouldShowBanner = p1.clientCacheFallbackBannerConfig and p1.clientCacheFallbackBannerConfig.shouldShowBanner or false
	local SecurityBanner = Banner.securityBanner
	local Height = ShowSecurityBanner and SecurityBanner.height or 0
	local Height1 = Banner.siteMessageBanner.height or 0
	local VerticalPadding = if hasMultipleBanners(ShowSecurityBanner, ShowSiteMessageBanner, ShouldShowBanner) then Banner.verticalPadding else 0
	local UseRefResult = ReactModule.useRef(nil)
	local AbsoluteSize = UsePropertyFunction(UseRefResult, "AbsoluteSize")
	local OnSizeChangedFunction = p1.onSizeChanged
	ReactModule.useLayoutEffect(function()
		-- upvalues: OnSizeChangedFunction (copy), AbsoluteSize (copy)
		if OnSizeChangedFunction and AbsoluteSize then
			OnSizeChangedFunction(AbsoluteSize)
		end
	end, { AbsoluteSize, OnSizeChangedFunction })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p1.Size or UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = p1.Position,
		ref = UseRefResult
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, VerticalPadding)
		}),
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, Banner.leftMargin),
			PaddingRight = UDim.new(0, Banner.rightMargin),
			PaddingTop = UDim.new(0, Banner.topMargin),
			PaddingBottom = UDim.new(0, Banner.bottomMargin)
		}),
		SiteMessageBanner = if ShowSiteMessageBanner then ReactModule.createElement(SiteMessageBannerModule, { LayoutOrder = 1, Size = UDim2.new(1, 0, 0, Height1) }) else nil,
		AccountSecurityPromptBanner = ReactModule.createElement(PromptBannerV2Module, {
			LayoutOrder = 2,
			isInteractive = IsNotUiModeMatch,
			Size = UDim2.new(1, 0, 0, Height)
		}),
		ClientCacheFallbackBanner = if ShouldShowBanner and p1.clientCacheFallbackBannerConfig then ReactModule.createElement(ClientCacheFallbackBanner, {
			LayoutOrder = 3,
			onRefreshButtonClick = p1.clientCacheFallbackBannerConfig.onRefreshButtonClick
		}) else nil
	})
end