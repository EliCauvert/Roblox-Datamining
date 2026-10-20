local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local Parent = BulkPurchaseApp.Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseUiModeInfoFunction = require(Parent.RobloxAppHooks).useUiModeInfo
local UiMode = require(Parent.RobloxAppEnums).UiMode
local UIBloxModule = require(Parent.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(Parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Images = UIBloxModule.App.ImageSet.Images
local UseCursorFunction = UIBloxModule.App.SelectionCursor.useCursor
local UseScreenSizeFunction = require(Parent.EconomyCommonCoreScriptHooks).useScreenSize
local ConstantsModule = require(BulkPurchaseApp.constants)
local ScrimModule = require(script.Parent.Scrim)
local BoxModule = require(script.Parent.Box)

local function CloseButton(p1)
	-- upvalues: UseDesignTokensFunction (copy), UseCursorFunction (copy), FFlagRenameDeprecatedUIBloxTokens (copy), ReactModule (copy), ImageSetLabel (copy), Images (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	
	return ReactModule.createElement("TextButton", {
		Size = UDim2.fromOffset(if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_900 else UseDesignTokensResult.Global.Size_450, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_900 else UseDesignTokensResult.Global.Size_450),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[ReactModule.Event.Activated] = p1.onActivated,
		Text = "",
		[ReactModule.Tag] = "data-testid=BulkPurchaseApp_FullPagePromptCloseButton",
		SelectionImageObject = UseCursorFunction(UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Radius.Medium else UseDesignTokensResult.Semantic.Radius.Medium), 0),
		Position = UDim2.fromScale(1, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	}, ReactModule.createElement(ImageSetLabel, {
		BackgroundTransparency = 1,
		Size = UDim2.fromOffset(if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_700 else UseDesignTokensResult.Global.Size_350, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_700 else UseDesignTokensResult.Global.Size_350),
		Image = Images["icons/navigation/close"],
		ImageColor3 = (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Content.Emphasis else UseDesignTokensResult.Semantic.Color.Text.Emphasis).Color3,
		ImageTransparency = (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Content.Emphasis else UseDesignTokensResult.Semantic.Color.Text.Emphasis).Transparency,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5)
	}))
end

local function v13(p1)
	-- upvalues: FFlagRenameDeprecatedUIBloxTokens (copy)
	return {
		background = (if FFlagRenameDeprecatedUIBloxTokens then p1.Color.Surface.Surface_0 else p1.Semantic.Color.Background.Default).Color3,
		padding = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_600 else p1.Global.Space_300,
		cornerRadius = if FFlagRenameDeprecatedUIBloxTokens then p1.Radius.Medium else p1.Semantic.Radius.Medium,
		headerFontStyle = if FFlagRenameDeprecatedUIBloxTokens then p1.Typography.HeadingSmall else p1.Semantic.Typography.Header,
		headerColorStyle = if FFlagRenameDeprecatedUIBloxTokens then p1.Color.Content.Emphasis else p1.Semantic.Color.Text.Emphasis,
		headerMarginBottom = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_800 else p1.Global.Space_400,
		headerHeight = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_700 else p1.Global.Size_350
	}
end

return (ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: UseScreenSizeFunction (copy), UseDesignTokensFunction (copy), v13 (copy), UseUiModeInfoFunction (copy), UiMode (copy), ConstantsModule (copy), ReactModule (copy), ScrimModule (copy), BoxModule (copy), StyledTextLabel (copy), CloseButton (copy)
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseDesignTokensResult = UseDesignTokensFunction(v13)
	local UseUiModeInfoResult = UseUiModeInfoFunction()
	local ScaledMAXWIDTH = if UseUiModeInfoResult.uiMode == UiMode.TenFoot then ConstantsModule.MAX_WIDTH * ConstantsModule.TEN_FOOT_MULTIPLIER else ConstantsModule.MAX_WIDTH
	local IsXBelow: boolean = UseScreenSizeResult.X < ConstantsModule.MOBILE_BREAKPOINT and UseScreenSizeResult.X < UseScreenSizeResult.Y
	
	return ReactModule.createElement(ScrimModule, { ref = Ref }, ReactModule.createElement(BoxModule, {
		BorderSizePixel = 0,
		padding = {
			UseDesignTokensResult.padding,
			UseDesignTokensResult.padding,
			UseDesignTokensResult.padding,
			UseDesignTokensResult.padding
		},
		cornerRadius = UDim.new(0, UseDesignTokensResult.cornerRadius),
		Size = UDim2.new(if IsXBelow then 1 else 0, if IsXBelow then 0 else math.min(ScaledMAXWIDTH, UseScreenSizeResult.X), 0, (math.min(if UseUiModeInfoResult.uiMode == UiMode.TenFoot then ConstantsModule.MAX_HEIGHT * ConstantsModule.TEN_FOOT_MULTIPLIER else ConstantsModule.MAX_HEIGHT, UseScreenSizeResult.Y))),
		BackgroundColor3 = UseDesignTokensResult.background,
		Position = UDim2.fromScale(0.5, if IsXBelow then 1 else 0.5),
		AnchorPoint = Vector2.new(0.5, if IsXBelow then 1 else 0.5)
	}, {
		Header = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, UseDesignTokensResult.headerHeight)
		}, ReactModule.createElement(StyledTextLabel, {
			fontStyle = UseDesignTokensResult.headerFontStyle,
			colorStyle = UseDesignTokensResult.headerColorStyle,
			textXAlignment = Enum.TextXAlignment.Center,
			textYAlignment = Enum.TextYAlignment.Center,
			text = p1.title,
			size = UDim2.new(1, 0, 1, 0)
		}), ReactModule.createElement(CloseButton, { onActivated = p1.onClose })),
		Content = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, -UseDesignTokensResult.headerHeight - UseDesignTokensResult.headerMarginBottom),
			Position = UDim2.fromOffset(0, UseDesignTokensResult.headerHeight + UseDesignTokensResult.headerMarginBottom)
		}, p1.children)
	}))
end))