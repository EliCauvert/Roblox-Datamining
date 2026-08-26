local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens
local useUiModeInfo = require(parent.RobloxAppHooks).useUiModeInfo
local uiMode = require(parent.RobloxAppEnums).UiMode
local UIBloxModule = require(parent.UIBlox)
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local images = UIBloxModule.App.ImageSet.Images
local useCursor = UIBloxModule.App.SelectionCursor.useCursor
local useScreenSize = require(parent.EconomyCommonCoreScriptHooks).useScreenSize
local constantsModule = require(bulkPurchaseApp.constants)
local useCloseOnEscapeEffectModule = require(bulkPurchaseApp.Hooks.useCloseOnEscapeEffect)
local fFlagBulkPurchaseCloseOnEscapeModule = require(bulkPurchaseApp.Flags.FFlagBulkPurchaseCloseOnEscape)
local scrimModule = require(script.Parent.Scrim)
local boxModule = require(script.Parent.Box)

local function CloseButton(p1)
	-- upvalues: useDesignTokens (ref), useCursor (ref), reactModule (ref), imageSetLabel (ref), images (ref)
	local var1 = useDesignTokens()
	
	return reactModule.createElement("TextButton", {
		Size = UDim2.fromOffset(var1.Size.Size_900, var1.Size.Size_900),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[reactModule.Event.Activated] = p1.onActivated,
		Text = "",
		[reactModule.Tag] = "data-testid=BulkPurchaseApp_FullPagePromptCloseButton",
		SelectionImageObject = useCursor(UDim.new(0, var1.Radius.Medium), 0),
		Position = UDim2.fromScale(1, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	}, reactModule.createElement(imageSetLabel, {
		BackgroundTransparency = 1,
		Size = UDim2.fromOffset(var1.Size.Size_700, var1.Size.Size_700),
		Image = images["icons/navigation/close"],
		ImageColor3 = var1.Color.Content.Emphasis.Color3,
		ImageTransparency = var1.Color.Content.Emphasis.Transparency,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5)
	}))
end

local var1 = function(p1)
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

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: fFlagBulkPurchaseCloseOnEscapeModule (ref), useCloseOnEscapeEffectModule (ref), useScreenSize (ref), useDesignTokens (ref), var1 (ref), useUiModeInfo (ref), uiMode (ref), constantsModule (ref), reactModule (ref), scrimModule (ref), boxModule (ref), styledTextLabel (ref), CloseButton (ref)
	if fFlagBulkPurchaseCloseOnEscapeModule then
		useCloseOnEscapeEffectModule("BulkPurchaseCloseFullPagePrompt", p1.onClose)
	end
	local var2 = useScreenSize()
	local var3 = useDesignTokens(var1)
	local var4 = useUiModeInfo()
	local var5 = var2.X < constantsModule.MOBILE_BREAKPOINT and var2.X < var2.Y
	
	return reactModule.createElement(scrimModule, { ref = p2 }, reactModule.createElement(boxModule, {
		BorderSizePixel = 0,
		padding = {
			var3.padding,
			var3.padding,
			var3.padding,
			var3.padding
		},
		cornerRadius = UDim.new(0, var3.cornerRadius),
		Size = UDim2.new(if var5 then 1 else 0, if var5 then 0 else math.min(if var4.uiMode == uiMode.TenFoot then constantsModule.MAX_WIDTH * constantsModule.TEN_FOOT_MULTIPLIER else constantsModule.MAX_WIDTH, var2.X), 0, math.min(if var4.uiMode == uiMode.TenFoot then constantsModule.MAX_HEIGHT * constantsModule.TEN_FOOT_MULTIPLIER else constantsModule.MAX_HEIGHT, var2.Y)),
		BackgroundColor3 = var3.background,
		Position = UDim2.fromScale(0.5, if var5 then 1 else 0.5),
		AnchorPoint = Vector2.new(0.5, if var5 then 1 else 0.5)
	}, {
		Header = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, var3.headerHeight)
		}, reactModule.createElement(styledTextLabel, {
			fontStyle = var3.headerFontStyle,
			colorStyle = var3.headerColorStyle,
			textXAlignment = Enum.TextXAlignment.Center,
			textYAlignment = Enum.TextYAlignment.Center,
			text = p1.title,
			size = UDim2.new(1, 0, 1, 0)
		}), reactModule.createElement(CloseButton, { onActivated = p1.onClose })),
		Content = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, (-var3.headerHeight) - var3.headerMarginBottom),
			Position = UDim2.fromOffset(0, var3.headerHeight + var3.headerMarginBottom)
		}, p1.children)
	}))
end)