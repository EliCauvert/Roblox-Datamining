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
local scrimModule = require(script.Parent.Scrim)
local boxModule = require(script.Parent.Box)

local function CloseButton(p0) --[[ line: 22 ]]
	-- upvalues: useDesignTokens (ref), useCursor (ref), reactModule (ref), imageSetLabel (ref), images (ref)
	local var8 = useDesignTokens()
	
	return reactModule.createElement("TextButton", {
		Size = UDim2.fromOffset(var8.Size.Size_900, var8.Size.Size_900),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[reactModule.Event.Activated] = p0.onActivated,
		Text = "",
		[reactModule.Tag] = "data-testid=BulkPurchaseApp_FullPagePromptCloseButton",
		SelectionImageObject = useCursor(UDim.new(0, var8.Radius.Medium), 0),
		Position = UDim2.fromScale(1, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	}, reactModule.createElement(imageSetLabel, {
		BackgroundTransparency = 1,
		Size = UDim2.fromOffset(var8.Size.Size_700, var8.Size.Size_700),
		Image = images["icons/navigation/close"],
		ImageColor3 = var8.Color.Content.Emphasis.Color3,
		ImageTransparency = var8.Color.Content.Emphasis.Transparency,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5)
	}))
end

local var7 = function(p1) --[[ line: 51 ]]
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

return reactModule.forwardRef(function(p2, p3) --[[ line: 69 ]]
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