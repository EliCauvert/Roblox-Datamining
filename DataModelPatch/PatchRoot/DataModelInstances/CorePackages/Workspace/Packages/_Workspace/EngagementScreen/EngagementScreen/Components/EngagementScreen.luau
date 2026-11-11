local Parent = script:FindFirstAncestor("EngagementScreen").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local StandardButtonSize = UIBloxModule.App.Button.Enum.StandardButtonSize
local DividerWithText = require(Parent.AuthCommon).Components.DividerWithText
local SwitchAccountButtonModule = require(script.Parent.SwitchAccountButton)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local AppLogging = require(Parent.RoactServiceTags).AppLogging
local TelemetryConfigs = require(Parent.AuthAnalytics).TelemetryConfigs

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), UseLocalizationFunction (copy), UseRoactServiceFunction (copy), AppLogging (copy), ReactModule (copy), TelemetryConfigs (copy), Button (copy), ButtonType (copy), StandardButtonSize (copy), DividerWithText (copy), SwitchAccountButtonModule (copy)
	local UseDesignTokensResult = UseDesignTokensFunction(function(p2)
		return {
			headerFontStyle = p2.Typography.HeadingSmall,
			footerFontStyle = p2.Typography.CaptionSmall,
			defaultTextColor = p2.Color.Content.Default,
			mutedTextColor = p2.Color.Content.Muted,
			engagementScreen = p2.LuaApps.EngagementScreen
		}
	end)
	local HeaderFontStyle = UseDesignTokensResult.headerFontStyle
	local UseLocalizationResult = UseLocalizationFunction({
		["continue"] = "CommonUI.Features.Label.EngagementScreen.Continue",
		orYouCan = "CommonUI.Features.Labels.OrYouCan"
	})
	local UseRoactServiceResult = UseRoactServiceFunction(AppLogging)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRoactServiceResult (copy), TelemetryConfigs (upval), p1 (copy)
		pcall(function()
			-- upvalues: UseRoactServiceResult (upval), TelemetryConfigs (upval)
			UseRoactServiceResult:logRobloxTelemetryCounter(TelemetryConfigs.EngagementScreenContinueButtonClickedConfig, 1)
		end)
		p1.onContinue()
	end, { p1.onContinue, UseRoactServiceResult })
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRoactServiceResult (copy), TelemetryConfigs (upval)
		UseRoactServiceResult:logEventOnce("engagement_screen_did_mount")
		UseRoactServiceResult:logRobloxTelemetryCounter(TelemetryConfigs.EngagementScreenMountTelemetryConfig, 1)
	end, { UseRoactServiceResult })
	
	return ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, if p1.renderBackground then p1.renderBackground() else nil, ReactModule.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		Position = UseDesignTokensResult.engagementScreen.robloxLogoTextImagePosition,
		Size = UseDesignTokensResult.engagementScreen.robloxLogoTextImageSize,
		Image = UseDesignTokensResult.engagementScreen.robloxLogoTextImageUrl,
		AnchorPoint = Vector2.new(0.5, 0.5)
	}), ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = UseDesignTokensResult.engagementScreen.buttonContainerPosition,
		Size = UDim2.new(0, UseDesignTokensResult.engagementScreen.containerWidth, 0, UseDesignTokensResult.engagementScreen.containerHeight),
		AnchorPoint = Vector2.new(0.5, 0.5)
	}, ReactModule.createElement("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		Padding = UDim.new(0, UseDesignTokensResult.engagementScreen.buttonPadding)
	}), ReactModule.createElement(Button, {
		layoutOrder = 1,
		buttonType = ButtonType.PrimarySystem,
		text = UseLocalizationResult["continue"],
		fontStyle = HeaderFontStyle,
		standardSize = StandardButtonSize.Regular,
		onActivated = UseResult
	}), if p1.onSwitchAccounts then ReactModule.createElement(ReactModule.Fragment, nil, ReactModule.createElement(DividerWithText, {
		layoutOrder = 2,
		width = 0,
		height = 0,
		size = UDim2.new(0, UseDesignTokensResult.engagementScreen.dividerWidth, 0, UseDesignTokensResult.engagementScreen.dividerHeight),
		font = UseDesignTokensResult.footerFontStyle.Font,
		fontSize = UseDesignTokensResult.footerFontStyle.FontSize,
		color3 = UseDesignTokensResult.mutedTextColor.Color3,
		transparency = UseDesignTokensResult.mutedTextColor.Transparency,
		text = UseLocalizationResult.orYouCan,
		padding = UseDesignTokensResult.engagementScreen.dividerPadding
	}), ReactModule.createElement(SwitchAccountButtonModule, {
		layoutOrder = 3,
		fontStyle = HeaderFontStyle,
		onActivated = p1.onSwitchAccounts
	})) else nil))
end