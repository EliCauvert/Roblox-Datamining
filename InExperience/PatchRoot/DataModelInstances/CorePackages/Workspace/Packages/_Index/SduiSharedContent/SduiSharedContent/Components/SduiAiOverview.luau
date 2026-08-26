local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(parent.AppCommonLib)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local cryoModule = require(parent.Cryo)
local view = foundationModule.View
local chip = foundationModule.Chip
local divider = foundationModule.Divider
local usePreferences = foundationModule.Hooks.usePreferences
local useTokens = foundationModule.Hooks.useTokens
local chipSize = foundationModule.Enums.ChipSize
local chipVariant = foundationModule.Enums.ChipVariant
local iconName = foundationModule.Enums.IconName
local useAiOverviewExpansionModule = require(script.Parent.useAiOverviewExpansion)

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), usePreferences (ref), useLocalization (ref), reactModule (ref), cryoModule (ref), useAiOverviewExpansionModule (ref), view (ref), divider (ref), chip (ref), iconName (ref), chipSize (ref), chipVariant (ref)
	local var1 = useTokens()
	local var2 = usePreferences()
	local var3 = useLocalization({ expandButtonText = "CommonUI.Controls.Action.ShowMore" })
	local var4 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		return {
			index = p1.index,
			scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
			verticalScrollingFrameRef = p1.verticalScrollingFrameRef,
			startRow = p1.startRow or p1.index
		}
	end, {
		p1.index,
		p1.scrollViewPositionChangedSignal,
		p1.verticalScrollingFrameRef,
		p1.startRow
	})
	local var5 = reactModule.useCallback(function(p2)
		-- upvalues: reactModule (copy), cryoModule (copy), var4 (ref)
		if not p2 or typeof(p2) ~= "table" then
			return p2
		end
		local t = {}
		
		for i, v in p2 do
			t[i] = reactModule.cloneElement(v, {
				extraLocalProps = cryoModule.Dictionary.join(if v.props then v.props.extraLocalProps else {}, var4)
			})
		end
		return t
	end, { var4 })
	local var6 = reactModule.useMemo(function()
		-- upvalues: var5 (ref), p1 (ref)
		return var5(p1.content)
	end, { p1.content, var5 })
	local var7 = reactModule.useMemo(function()
		-- upvalues: var5 (ref), p1 (ref)
		return var5(p1.footer)
	end, { p1.footer, var5 })
	local headerGap = p1.headerGap or var1.Gap.Small
	local sectionGap = p1.sectionGap or var1.Gap.Large
	local var8 = if p1.titleComponent == nil then p1.descriptionComponent ~= nil else true
	local var9 = if p1.content == nil then p1.footer ~= nil else true
	local var10 = useAiOverviewExpansionModule({
		buttonHeight = var1.Size.Size_1000,
		compactHeight = p1.compactHeight,
		hasHeader = var8,
		hasExpandableBody = var9,
		sectionGap = sectionGap,
		reducedMotion = var2.reducedMotion
	})
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, sectionGap)
		},
		backgroundStyle = p1.backgroundStyle,
		LayoutOrder = p1.layoutOrder,
		sizeConstraint = if var10.shouldReserveCompactHeight then { MinSize = Vector2.new(0, p1.compactHeight) } else nil,
		testId = p1.testId or "--sdui-ai-overview"
	}, {
		Header = if var8 then reactModule.createElement(view, {
			tag = "size-full-0 auto-y",
			LayoutOrder = 1,
			layout = {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, headerGap)
			},
			onAbsoluteSizeChanged = var10.onHeaderAbsoluteSizeChanged
		}, {
			Title = if p1.titleComponent then reactModule.createElement(view, {
				tag = "size-full-0 auto-y",
				LayoutOrder = 1,
				testId = "--sdui-ai-overview-title"
			}, { Slot = p1.titleComponent }) else nil,
			Description = if p1.descriptionComponent then reactModule.createElement(view, {
				tag = "size-full-0 auto-y",
				LayoutOrder = 2,
				testId = "--sdui-ai-overview-description"
			}, { Slot = p1.descriptionComponent }) else nil
		}) else nil,
		Body = if var9 then reactModule.createElement(view, { tag = "col size-full-0 auto-y", LayoutOrder = 2 }, {
			Inner = reactModule.createElement(view, {
				tag = {
					clip = var10.useCompactViewport,
					["no-clip"] = not var10.useCompactViewport,
					["auto-none"] = var10.useCompactViewport,
					["auto-y"] = not var10.useCompactViewport
				},
				Size = if var10.useCompactViewport then var10.animatedViewportHeight:map(function(p3)
					return UDim2.new(1, 0, 0, math.ceil(p3))
				end) else UDim2.fromScale(1, 0)
			}, {
				Content = reactModule.createElement(view, {
					tag = "size-full-0 auto-y",
					layout = {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, sectionGap)
					},
					onAbsoluteSizeChanged = var10.onContentAbsoluteSizeChanged
				}, {
					Content = if var6 then reactModule.createElement(view, {
						tag = "size-full-0 auto-y",
						LayoutOrder = 3,
						testId = "--sdui-ai-overview-content",
						layout = {
							FillDirection = Enum.FillDirection.Vertical,
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, sectionGap)
						}
					}, var6) else nil,
					Footer = if var7 then reactModule.createElement(view, {
						tag = "size-full-0 auto-y",
						LayoutOrder = 4,
						testId = "--sdui-ai-overview-footer",
						layout = {
							FillDirection = Enum.FillDirection.Vertical,
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, sectionGap)
						}
					}, var7) else nil
				}),
				FadeOverlay = if var10.isCompact then reactModule.createElement(view, {
					tag = "position-bottom-left anchor-bottom-left",
					ZIndex = 2,
					backgroundStyle = p1.backgroundStyle or var1.Color.Surface.Surface_0,
					Size = var10.animatedViewportHeight:map(function(p3)
						return UDim2.new(1, 0, 0, math.ceil(p3 * 0.25))
					end)
				}, {
					Gradient = reactModule.createElement("UIGradient", {
						Rotation = 90,
						Transparency = NumberSequence.new({
							NumberSequenceKeypoint.new(0, 1),
							NumberSequenceKeypoint.new(1, 0)
						})
					})
				}) else nil
			})
		}) else nil,
		ToggleButton = if var10.isCompact then reactModule.createElement(view, {
			tag = "row align-y-center gap-xsmall size-full-0 auto-y",
			LayoutOrder = 3
		}, {
			LeadingLine = reactModule.createElement(view, { tag = "grow", LayoutOrder = 1 }, { Divider = reactModule.createElement(divider) }),
			ChipOutline = reactModule.createElement(view, {
				tag = "auto-xy stroke-default radius-circle",
				LayoutOrder = 2
			}, {
				Chip = reactModule.createElement(chip, {
					testId = "--sdui-ai-overview-toggle",
					text = p1.expandButtonText or var3.expandButtonText,
					trailing = iconName.ChevronLargeDown,
					size = chipSize.Large,
					variant = chipVariant.Utility,
					onActivated = var10.onExpand
				})
			}),
			TrailingLine = reactModule.createElement(view, { tag = "grow", LayoutOrder = 3 }, { Divider = reactModule.createElement(divider) })
		}) else nil
	})
end)