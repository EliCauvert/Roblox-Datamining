local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(script.Parent.DescriptionWithChipsTypes)
local DescriptionTextBlockModule = require(script.Parent.DescriptionTextBlock)
local DescriptionCollapseFrameModule = require(script.Parent.DescriptionCollapseFrame)
local View = FoundationModule.View
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local Skeleton = FoundationModule.Skeleton
local NumberSequence1 = NumberSequence.new(1, 0)
local StateLayer = {
	affordance = FoundationModule.Enums.StateLayerAffordance.None
}
local _Vector2 = Vector2.new(0.5, 0.5)
local _UDim2 = UDim2.fromScale(0.5, 0.5)

return ReactModule.forwardRef(function(Frame: Frame, Ref)
	-- upvalues: ReactModule (copy), View (copy), DescriptionTextBlockModule (copy), Skeleton (copy), IconName (copy), DescriptionCollapseFrameModule (copy), NumberSequence1 (copy), StateLayer (copy), Icon (copy), _Vector2 (copy), _UDim2 (copy), IconSize (copy)
	local PaddingTop = Frame.paddingTop
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: PaddingTop (copy)
		return { top = UDim.new(0, PaddingTop) }
	end, { PaddingTop })
	local CanExpand = Frame.canExpand
	local FadeColor = Frame.fadeColor
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: FadeColor (copy)
		return { Transparency = 0, Color3 = FadeColor }
	end, { FadeColor })
	local OnContentHeightChangedFunction = Frame.onContentHeightChanged
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: OnContentHeightChangedFunction (copy)
		OnContentHeightChangedFunction(Frame.AbsoluteSize.Y)
	end, { OnContentHeightChangedFunction })
	local Blocks = Frame.blocks
	local RenderLinkFunction = Frame.renderLink
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: Blocks (copy), ReactModule (upval), View (upval), RenderLinkFunction (copy), DescriptionTextBlockModule (upval)
		local Elements = {}
		
		for LayoutOrder, block in Blocks do
			if block.kind == "link" then
				Elements["Link" .. LayoutOrder] = ReactModule.createElement(View, { tag = "auto-xy", LayoutOrder = LayoutOrder }, { Chip = RenderLinkFunction(block.url, LayoutOrder) })
			else
				Elements["Text" .. LayoutOrder] = ReactModule.createElement(DescriptionTextBlockModule, { text = block.text, LayoutOrder = LayoutOrder })
			end
		end
		return Elements
	end, { Blocks, RenderLinkFunction })
	
	if Frame.isLoading then
		return ReactModule.createElement(View, {
			tag = "size-full-0 auto-y",
			testId = "--item-description-loading",
			padding = UseMemoResult,
			LayoutOrder = Frame.LayoutOrder,
			ref = Ref
		}, {
			Shimmer = ReactModule.createElement(Skeleton, {
				Size = UDim2.new(1, 0, 0, Frame.visibleHeight + Frame.paddingBottom)
			})
		})
	else
		local NoIsExpanded: boolean = CanExpand and not Frame.isExpanded
		local ChevronLargeUp = if Frame.isExpanded then IconName.ChevronLargeUp else IconName.ChevronLargeDown
		
		return ReactModule.createElement(View, {
			tag = "col gap-small size-full-0 auto-y",
			testId = "--item-description",
			padding = UseMemoResult,
			LayoutOrder = Frame.LayoutOrder,
			ref = if CanExpand then nil else Ref
		}, {
			Expandable = ReactModule.createElement(DescriptionCollapseFrameModule, {
				LayoutOrder = 1,
				testId = "--item-description-content",
				height = Frame.visibleHeight + Frame.paddingBottom,
				isExpanded = Frame.isExpanded
			}, {
				Content = ReactModule.createElement(View, {
					tag = "col gap-small size-full-0 auto-y",
					onAbsoluteSizeChanged = UseResult
				}, UseMemoResult2),
				Fade = if NoIsExpanded then ReactModule.createElement(View, {
					tag = "position-bottom-left anchor-bottom-left size-full-800",
					ZIndex = 2,
					testId = "--item-description-fade",
					backgroundStyle = UseMemoResult1
				}, {
					Gradient = ReactModule.createElement("UIGradient", { Rotation = 90, Transparency = NumberSequence1 })
				}) else nil
			}),
			Chevron = if CanExpand then ReactModule.createElement(View, {
				tag = "size-full-900",
				LayoutOrder = 2,
				testId = "--item-description-expand",
				onActivated = Frame.onToggleExpanded,
				stateLayer = StateLayer,
				ref = Ref
			}, {
				Arrow = ReactModule.createElement(Icon, {
					testId = "--item-description-expand-icon",
					AnchorPoint = _Vector2,
					Position = _UDim2,
					name = ChevronLargeUp,
					size = IconSize.Large,
					style = Frame.chevronStyle
				})
			}) else nil
		})
	end
end)