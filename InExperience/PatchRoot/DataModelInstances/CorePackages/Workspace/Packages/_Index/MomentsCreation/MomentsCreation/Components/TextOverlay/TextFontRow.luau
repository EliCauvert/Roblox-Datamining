local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local iconButton = foundationModule.IconButton
local text = foundationModule.Text
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local constantsModule = require(momentsCreation.Constants)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local useTextFontRowStateModule = require(momentsCreation.Components.TextOverlay.useTextFontRowState)
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
local t = { Transparency = 0, Color3 = Color3.fromRGB(32, 34, 39) }

return function(p1)
	-- upvalues: useTokens (ref), useTextFontRowStateModule (ref), list (ref), reactModule (ref), view (ref), text (ref), t (ref), constantsModule (ref), foundationModule (ref), iconButton (ref), builderIconsModule (ref)
	local var1 = useTokens()
	local var2 = useTextFontRowStateModule(p1.controller)
	local t_1 = {}
	
	for i, v in list do
		local var3 = var2.font == v.font
		t_1["Chip" .. i] = reactModule.createElement(view, {
			tag = "row align-x-center align-y-center size-0-800 auto-x radius-circle clip",
			LayoutOrder = i,
			padding = {
				left = UDim.new(0, var1.Padding.Medium),
				right = UDim.new(0, var1.Padding.Medium)
			},
			backgroundStyle = if var3 then var1.Inverse.Surface.Surface_0 else var1.Color.ActionStandard.Background,
			onActivated = function()
				-- upvalues: var2 (ref), v (ref)
				var2.onChipActivated(v.font)
			end
		}, {
			Label = reactModule.createElement(text, {
				tag = "shrink auto-x text-label-medium text-truncate-end",
				Text = v.label,
				fontStyle = { Font = v.font },
				textStyle = if var3 then t else var1.Color.ActionStandard.Foreground
			})
		})
	end
	return reactModule.createElement(view, {
		LayoutOrder = p1.LayoutOrder,
		Size = UDim2.new(1, 0, 0, constantsModule.TextOverlay.PickerRowHeight)
	}, {
		Scroll = reactModule.createElement(foundationModule.ScrollView, {
			Size = UDim2.new(1, 0, 1, 0),
			scrollingFrameRef = var2.scrollingFrameRef,
			onCanvasPositionChanged = var2.onScrollViewportChanged,
			onAbsoluteCanvasSizeChanged = var2.onScrollViewportChanged,
			onAbsoluteWindowSizeChanged = var2.onScrollViewportChanged,
			scroll = {
				scrollBarVisibility = foundationModule.Enums.Visibility.None,
				ScrollingDirection = Enum.ScrollingDirection.X,
				AutomaticCanvasSize = Enum.AutomaticSize.X
			}
		}, {
			Row = reactModule.createElement(view, {
				tag = "row align-y-center gap-medium size-0-full auto-x padding-x-large"
			}, t_1)
		}),
		LeftChevron = if var2.showLeftChevron then reactModule.createElement(view, {
			ZIndex = 2,
			tag = "position-center-left anchor-center-left auto-xy"
		}, {
			Icon = reactModule.createElement(iconButton, {
				icon = builderIconsModule.Icon.ChevronSmallLeft,
				onActivated = var2.onLeftChevronActivated,
				size = foundationModule.Enums.InputSize.Medium
			})
		}) else nil,
		RightChevron = if var2.showRightChevron then reactModule.createElement(view, {
			ZIndex = 2,
			tag = "position-center-right anchor-center-right auto-xy"
		}, {
			Icon = reactModule.createElement(iconButton, {
				icon = builderIconsModule.Icon.ChevronSmallRight,
				onActivated = var2.onRightChevronActivated,
				size = foundationModule.Enums.InputSize.Medium
			})
		}) else nil
	})
end