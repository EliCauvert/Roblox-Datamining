local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local IconButton = FoundationModule.IconButton
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ConstantsModule = require(MomentsCreation.Constants)
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local UseTextFontRowStateModule = require(MomentsCreation.Components.TextOverlay.useTextFontRowState)
local FFlagMomentsTextOverlayColorPickerIconModule = require(MomentsCreation.Flags.FFlagMomentsTextOverlayColorPickerIcon)
local list = {
	{ label = "Builder", font = Enum.Font.BuilderSansMedium },
	{ label = "Source Sans", font = Enum.Font.SourceSans },
	{ label = "Luckiest Guy", font = Enum.Font.LuckiestGuy },
	{ label = "Bangers", font = Enum.Font.Bangers },
	{
		label = "Permanent Marker",
		font = Enum.Font.PermanentMarker
	},
	{ label = "Creepster", font = Enum.Font.Creepster },
	{ label = "Arcade", font = Enum.Font.Arcade },
	{ label = "Sci-Fi", font = Enum.Font.SciFi },
	{ label = "Indie Flower", font = Enum.Font.IndieFlower },
	{ label = "Grenze Gotisch", font = Enum.Font.GrenzeGotisch },
	{ label = "Special Elite", font = Enum.Font.SpecialElite }
}
local config = { Transparency = 0, Color3 = Color3.fromRGB(32, 34, 39) }

return function(Frame) --[[ Line: 58 | Named "TextFontRow" ]]
	-- upvalues: UseTokensFunction (copy), UseTextFontRowStateModule (copy), list (copy), ReactModule (copy), View (copy), FFlagMomentsTextOverlayColorPickerIconModule (copy), Text (copy), config (copy), ConstantsModule (copy), FoundationModule (copy), IconButton (copy), BuilderIconsModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseTextFontRowStateModuleResult = UseTextFontRowStateModule(Frame.controller)
	local Elements = {}
	
	for LayoutOrder, value in list do
		local v1 = UseTextFontRowStateModuleResult.font == value.font
		Elements["Chip" .. LayoutOrder] = ReactModule.createElement(View, {
			tag = "row align-x-center align-y-center size-0-800 auto-x radius-circle clip",
			LayoutOrder = LayoutOrder,
			padding = {
				left = UDim.new(0, UseTokensResult.Padding.Medium),
				right = UDim.new(0, UseTokensResult.Padding.Medium),
				top = if FFlagMomentsTextOverlayColorPickerIconModule and value.font == Enum.Font.LuckiestGuy then UDim.new(0, UseTokensResult.Size.Size_100) else nil
			},
			backgroundStyle = if v1 then UseTokensResult.Inverse.Surface.Surface_0 else UseTokensResult.Color.ActionStandard.Background,
			onActivated = function() --[[ Line: 82 ]]
				-- upvalues: UseTextFontRowStateModuleResult (copy), value (copy), LayoutOrder (copy)
				UseTextFontRowStateModuleResult.onChipActivated(value.font, LayoutOrder)
			end
		}, {
			Label = ReactModule.createElement(Text, {
				tag = "shrink auto-x text-label-medium text-truncate-end",
				Text = value.label,
				fontStyle = { Font = value.font },
				textStyle = if v1 then config else UseTokensResult.Color.ActionStandard.Foreground
			})
		})
	end
	return ReactModule.createElement(View, {
		LayoutOrder = Frame.LayoutOrder,
		Size = UDim2.new(1, 0, 0, ConstantsModule.TextOverlay.PickerRowHeight)
	}, {
		Scroll = ReactModule.createElement(FoundationModule.ScrollView, {
			Size = UDim2.new(1, 0, 1, 0),
			scrollingFrameRef = UseTextFontRowStateModuleResult.scrollingFrameRef,
			onCanvasPositionChanged = UseTextFontRowStateModuleResult.onScrollViewportChanged,
			onAbsoluteCanvasSizeChanged = UseTextFontRowStateModuleResult.onScrollViewportChanged,
			onAbsoluteWindowSizeChanged = UseTextFontRowStateModuleResult.onScrollViewportChanged,
			scroll = {
				scrollBarVisibility = FoundationModule.Enums.Visibility.None,
				ScrollingDirection = Enum.ScrollingDirection.X,
				AutomaticCanvasSize = Enum.AutomaticSize.X
			}
		}, {
			Row = ReactModule.createElement(View, {
				tag = "row align-y-center gap-medium size-0-full auto-x padding-x-large"
			}, Elements)
		}),
		LeftChevron = if UseTextFontRowStateModuleResult.showLeftChevron then ReactModule.createElement(View, {
			ZIndex = 2,
			tag = "position-center-left anchor-center-left auto-xy"
		}, {
			Icon = ReactModule.createElement(IconButton, {
				icon = BuilderIconsModule.Icon.ChevronSmallLeft,
				onActivated = UseTextFontRowStateModuleResult.onLeftChevronActivated,
				size = FoundationModule.Enums.InputSize.Medium
			})
		}) else nil,
		RightChevron = if UseTextFontRowStateModuleResult.showRightChevron then ReactModule.createElement(View, {
			ZIndex = 2,
			tag = "position-center-right anchor-center-right auto-xy"
		}, {
			Icon = ReactModule.createElement(IconButton, {
				icon = BuilderIconsModule.Icon.ChevronSmallRight,
				onActivated = UseTextFontRowStateModuleResult.onRightChevronActivated,
				size = FoundationModule.Enums.InputSize.Medium
			})
		}) else nil
	})
end