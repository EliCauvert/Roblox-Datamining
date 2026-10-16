local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local Parent = BulkPurchaseApp.Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseUiModeInfoFunction = require(Parent.RobloxAppHooks).useUiModeInfo
local UiMode = require(Parent.RobloxAppEnums).UiMode
local UIBloxModule = require(Parent.UIBlox)
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Images = UIBloxModule.App.ImageSet.Images
local UseCursorFunction = UIBloxModule.App.SelectionCursor.useCursor
local UseScreenSizeFunction = require(Parent.EconomyCommonCoreScriptHooks).useScreenSize
local ConstantsModule = require(BulkPurchaseApp.constants)
local UseCloseOnEscapeEffectModule = require(BulkPurchaseApp.Hooks.useCloseOnEscapeEffect)
local FFlagBulkPurchaseCloseOnEscapeModule = require(BulkPurchaseApp.Flags.FFlagBulkPurchaseCloseOnEscape)
local ScrimModule = require(script.Parent.Scrim)
local BoxModule = require(script.Parent.Box)

local function CloseButton(p1) --[[ Line: 26 ]]
	-- upvalues: UseDesignTokensFunction (copy), UseCursorFunction (copy), ReactModule (copy), ImageSetLabel (copy), Images (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	
	return ReactModule.createElement("TextButton", {
		Size = UDim2.fromOffset(UseDesignTokensResult.Size.Size_900, UseDesignTokensResult.Size.Size_900),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[ReactModule.Event.Activated] = p1.onActivated,
		Text = "",
		[ReactModule.Tag] = "data-testid=BulkPurchaseApp_FullPagePromptCloseButton",
		SelectionImageObject = UseCursorFunction(UDim.new(0, UseDesignTokensResult.Radius.Medium), 0),
		Position = UDim2.fromScale(1, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	}, ReactModule.createElement(ImageSetLabel, {
		BackgroundTransparency = 1,
		Size = UDim2.fromOffset(UseDesignTokensResult.Size.Size_700, UseDesignTokensResult.Size.Size_700),
		Image = Images["icons/navigation/close"],
		ImageColor3 = UseDesignTokensResult.Color.Content.Emphasis.Color3,
		ImageTransparency = UseDesignTokensResult.Color.Content.Emphasis.Transparency,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5)
	}))
end

local function v14(p1) --[[ Line: 55 ]]
	return {
		background = p1.Color.Surface.Surface_0.Color3,
		padding = p1.Size.Size_600,
		cornerRadius = p1.Radius.Medium,
		headerFontStyle = p1.Typography.HeadingSmall,
		headerColorStyle = p1.Color.Content.Emphasis,
		headerMarginBottom = p1.Size.Size_800,
		headerHeight = p1.Size.Size_700
	}
end

return (ReactModule.forwardRef(function(p1, Ref) --[[ Line: 73 ]]
	-- upvalues: FFlagBulkPurchaseCloseOnEscapeModule (copy), UseCloseOnEscapeEffectModule (copy), UseScreenSizeFunction (copy), UseDesignTokensFunction (copy), v14 (copy), UseUiModeInfoFunction (copy), UiMode (copy), ConstantsModule (copy), ReactModule (copy), ScrimModule (copy), BoxModule (copy), StyledTextLabel (copy), CloseButton (copy)
	if FFlagBulkPurchaseCloseOnEscapeModule then
		UseCloseOnEscapeEffectModule("BulkPurchaseCloseFullPagePrompt", p1.onClose)
	end
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseDesignTokensResult = UseDesignTokensFunction(v14)
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