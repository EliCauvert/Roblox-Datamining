local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens
local useUiModeInfo = require(parent.RobloxAppHooks).useUiModeInfo
local uiMode = require(parent.RobloxAppEnums).UiMode
local UIBloxModule = require(parent.UIBlox)
local fFlagRenameDeprecatedUIBloxTokens = require(parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local images = UIBloxModule.App.ImageSet.Images
local useCursor = UIBloxModule.App.SelectionCursor.useCursor
local useScreenSize = require(parent.EconomyCommonCoreScriptHooks).useScreenSize
local constantsModule = require(bulkPurchaseApp.constants)
local scrimModule = require(script.Parent.Scrim)
local boxModule = require(script.Parent.Box)

local function CloseButton(p0) --[[ line: 24 ]]
	-- upvalues: useDesignTokens (ref), useCursor (ref), fFlagRenameDeprecatedUIBloxTokens (ref), reactModule (ref), imageSetLabel (ref), images (ref)
	local var8 = useDesignTokens()
	
	return reactModule.createElement("TextButton", {
		Size = UDim2.fromOffset(if fFlagRenameDeprecatedUIBloxTokens then var8.Size.Size_900 else var8.Global.Size_450, if fFlagRenameDeprecatedUIBloxTokens then var8.Size.Size_900 else var8.Global.Size_450),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[reactModule.Event.Activated] = p0.onActivated,
		Text = "",
		[reactModule.Tag] = "data-testid=BulkPurchaseApp_FullPagePromptCloseButton",
		SelectionImageObject = useCursor(UDim.new(0, if fFlagRenameDeprecatedUIBloxTokens then var8.Radius.Medium else var8.Semantic.Radius.Medium), 0),
		Position = UDim2.fromScale(1, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	}, reactModule.createElement(imageSetLabel, {
		BackgroundTransparency = 1,
		Size = UDim2.fromOffset(if fFlagRenameDeprecatedUIBloxTokens then var8.Size.Size_700 else var8.Global.Size_350, if fFlagRenameDeprecatedUIBloxTokens then var8.Size.Size_700 else var8.Global.Size_350),
		Image = images["icons/navigation/close"],
		ImageColor3 = (if fFlagRenameDeprecatedUIBloxTokens then var8.Color.Content.Emphasis else var8.Semantic.Color.Text.Emphasis).Color3,
		ImageTransparency = (if fFlagRenameDeprecatedUIBloxTokens then var8.Color.Content.Emphasis else var8.Semantic.Color.Text.Emphasis).Transparency,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5)
	}))
end

local var7 = function(p1) --[[ line: 73 ]]
	-- upvalues: fFlagRenameDeprecatedUIBloxTokens (ref)
	return {
		background = (if fFlagRenameDeprecatedUIBloxTokens then p1.Color.Surface.Surface_0 else p1.Semantic.Color.Background.Default).Color3,
		padding = if fFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_600 else p1.Global.Space_300,
		cornerRadius = if fFlagRenameDeprecatedUIBloxTokens then p1.Radius.Medium else p1.Semantic.Radius.Medium,
		headerFontStyle = if fFlagRenameDeprecatedUIBloxTokens then p1.Typography.HeadingSmall else p1.Semantic.Typography.Header,
		headerColorStyle = if fFlagRenameDeprecatedUIBloxTokens then p1.Color.Content.Emphasis else p1.Semantic.Color.Text.Emphasis,
		headerMarginBottom = if fFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_800 else p1.Global.Space_400,
		headerHeight = if fFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_700 else p1.Global.Size_350
	}
end

return reactModule.forwardRef(function(p2, p3) --[[ line: 101 ]]
	-- upvalues: useScreenSize (ref), useDesignTokens (ref), var7 (ref), useUiModeInfo (ref), uiMode (ref), constantsModule (ref), reactModule (ref), scrimModule (ref), boxModule (ref), styledTextLabel (ref), CloseButton (ref)
	local var9 = useScreenSize()
	local var10 = useDesignTokens(var7)
	local var11 = useUiModeInfo()
	local var12 = var9.X < constantsModule.MOBILE_BREAKPOINT and var9.X < var9.Y
	
	return reactModule.createElement(scrimModule, { ref = p3 }, reactModule.createElement(boxModule, {
		BorderSizePixel = 0,
		padding = {
			var10.padding,
			var10.padding,
			var10.padding,
			var10.padding
		},
		cornerRadius = UDim.new(0, var10.cornerRadius),
		Size = UDim2.new(if var12 then 1 else 0, if var12 then 0 else math.min(if var11.uiMode == uiMode.TenFoot then constantsModule.MAX_WIDTH * constantsModule.TEN_FOOT_MULTIPLIER else constantsModule.MAX_WIDTH, var9.X), 0, math.min(if var11.uiMode == uiMode.TenFoot then constantsModule.MAX_HEIGHT * constantsModule.TEN_FOOT_MULTIPLIER else constantsModule.MAX_HEIGHT, var9.Y)),
		BackgroundColor3 = var10.background,
		Position = UDim2.fromScale(0.5, if var12 then 1 else 0.5),
		AnchorPoint = Vector2.new(0.5, if var12 then 1 else 0.5)
	}, {
		Header = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, var10.headerHeight)
		}, reactModule.createElement(styledTextLabel, {
			fontStyle = var10.headerFontStyle,
			colorStyle = var10.headerColorStyle,
			textXAlignment = Enum.TextXAlignment.Center,
			textYAlignment = Enum.TextYAlignment.Center,
			text = p2.title,
			size = UDim2.new(1, 0, 1, 0)
		}), reactModule.createElement(CloseButton, { onActivated = p2.onClose })),
		Content = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, (-var10.headerHeight) - var10.headerMarginBottom),
			Position = UDim2.fromOffset(0, var10.headerHeight + var10.headerMarginBottom)
		}, p2.children)
	}))
end)