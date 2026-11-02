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
local UseTokensFunction = FoundationModule.Hooks.useTokens
local NumberSequence1 = NumberSequence.new(1, 0)
local Selection = { Selectable = false }
local StateLayer = {
	affordance = FoundationModule.Enums.StateLayerAffordance.None
}
local _Vector2 = Vector2.new(0.5, 0)

local function getChevronGeometry(p1)
	return {
		hitPosition = UDim2.fromOffset(0, -p1.Size.Size_600),
		hitSize = UDim2.new(1, 0, 0, p1.Size.Size_900),
		iconPosition = UDim2.fromScale(0.5, 0)
	}
end

return ReactModule.forwardRef(function(Frame: Frame, Ref)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), getChevronGeometry (copy), View (copy), DescriptionTextBlockModule (copy), Skeleton (copy), IconName (copy), DescriptionCollapseFrameModule (copy), NumberSequence1 (copy), Selection (copy), StateLayer (copy), Icon (copy), _Vector2 (copy), IconSize (copy)
	local UseTokensResult = UseTokensFunction()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: getChevronGeometry (upval), UseTokensResult (copy)
		return (getChevronGeometry(UseTokensResult))
	end, { UseTokensResult })
	local PaddingTop = Frame.paddingTop
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: PaddingTop (copy)
		return { top = UDim.new(0, PaddingTop) }
	end, { PaddingTop })
	local CanExpand = Frame.canExpand
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: CanExpand (copy)
		return { Selectable = CanExpand }
	end, { CanExpand })
	local FadeColor = Frame.fadeColor
	local UseMemoResult3 = ReactModule.useMemo(function()
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
	local UseMemoResult4 = ReactModule.useMemo(function()
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
			padding = UseMemoResult1,
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
			padding = UseMemoResult1,
			selection = UseMemoResult2,
			LayoutOrder = Frame.LayoutOrder,
			ref = Ref
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
				}, UseMemoResult4),
				Fade = if NoIsExpanded then ReactModule.createElement(View, {
					tag = "position-bottom-left anchor-bottom-left size-full-800",
					ZIndex = 2,
					testId = "--item-description-fade",
					backgroundStyle = UseMemoResult3
				}, {
					Gradient = ReactModule.createElement("UIGradient", { Rotation = 90, Transparency = NumberSequence1 })
				}) else nil
			}),
			ChevronRow = if CanExpand then ReactModule.createElement(View, {
				tag = "size-full-250",
				LayoutOrder = 2,
				ZIndex = 0,
				testId = "--item-description-expand-row"
			}, {
				Chevron = ReactModule.createElement(View, {
					testId = "--item-description-expand",
					Position = UseMemoResult.hitPosition,
					Size = UseMemoResult.hitSize,
					onActivated = Frame.onToggleExpanded,
					selection = Selection,
					stateLayer = StateLayer
				}, {
					Arrow = ReactModule.createElement(Icon, {
						testId = "--item-description-expand-icon",
						AnchorPoint = _Vector2,
						Position = UseMemoResult.iconPosition,
						name = ChevronLargeUp,
						size = IconSize.Large,
						style = Frame.chevronStyle
					})
				})
			}) else nil
		})
	end
end)