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

return reactModule.memo(function(p0) --[[ line: 48 | named "SduiAiOverview" ]]
	-- upvalues: useTokens (ref), usePreferences (ref), useLocalization (ref), reactModule (ref), cryoModule (ref), useAiOverviewExpansionModule (ref), view (ref), divider (ref), chip (ref), iconName (ref), chipSize (ref), chipVariant (ref)
	local var4 = useTokens()
	local var5 = usePreferences()
	local var6 = useLocalization({ expandButtonText = "CommonUI.Controls.Action.ShowMore" })
	local var7 = reactModule.useMemo(function() --[[ line: 56 ]]
		-- upvalues: p0 (ref)
		return {
			index = p0.index,
			scrollViewPositionChangedSignal = p0.scrollViewPositionChangedSignal,
			verticalScrollingFrameRef = p0.verticalScrollingFrameRef,
			startRow = p0.startRow or p0.index
		}
	end, {
		p0.index,
		p0.scrollViewPositionChangedSignal,
		p0.verticalScrollingFrameRef,
		p0.startRow
	})
	local var8 = reactModule.useCallback(function(p1) --[[ line: 67 ]]
		-- upvalues: reactModule (copy), cryoModule (copy), var7 (ref)
		if not p1 or typeof(p1) ~= "table" then
			return p1
		end
		local t = {}
		
		for i, v in p1 do
			t[i] = reactModule.cloneElement(v, {
				extraLocalProps = cryoModule.Dictionary.join(if v.props then v.props.extraLocalProps else {}, var7)
			})
		end
		return t
	end, { var7 })
	local var9 = reactModule.useMemo(function() --[[ line: 82 ]]
		-- upvalues: var8 (ref), p0 (ref)
		return var8(p0.content)
	end, { p0.content, var8 })
	local var10 = reactModule.useMemo(function() --[[ line: 86 ]]
		-- upvalues: var8 (ref), p0 (ref)
		return var8(p0.footer)
	end, { p0.footer, var8 })
	local headerGap = p0.headerGap or var4.Gap.Small
	local sectionGap = p0.sectionGap or var4.Gap.Large
	local var13 = if p0.titleComponent == nil then p0.descriptionComponent ~= nil else true
	local var14 = if p0.content == nil then p0.footer ~= nil else true
	local var15 = useAiOverviewExpansionModule({
		buttonHeight = var4.Size.Size_1000,
		compactHeight = p0.compactHeight,
		hasHeader = var13,
		hasExpandableBody = var14,
		sectionGap = sectionGap,
		reducedMotion = var5.reducedMotion
	})
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, sectionGap)
		},
		backgroundStyle = p0.backgroundStyle,
		LayoutOrder = p0.layoutOrder,
		sizeConstraint = if var15.shouldReserveCompactHeight then { MinSize = Vector2.new(0, p0.compactHeight) } else nil,
		testId = p0.testId or "--sdui-ai-overview"
	}, {
		Header = if var13 then reactModule.createElement(view, {
			tag = "size-full-0 auto-y",
			LayoutOrder = 1,
			layout = {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, headerGap)
			},
			onAbsoluteSizeChanged = var15.onHeaderAbsoluteSizeChanged
		}, {
			Title = if p0.titleComponent then reactModule.createElement(view, {
				tag = "size-full-0 auto-y",
				LayoutOrder = 1,
				testId = "--sdui-ai-overview-title"
			}, { Slot = p0.titleComponent }) else nil,
			Description = if p0.descriptionComponent then reactModule.createElement(view, {
				tag = "size-full-0 auto-y",
				LayoutOrder = 2,
				testId = "--sdui-ai-overview-description"
			}, { Slot = p0.descriptionComponent }) else nil
		}) else nil,
		Body = if var14 then reactModule.createElement(view, { tag = "col size-full-0 auto-y", LayoutOrder = 2 }, {
			Inner = reactModule.createElement(view, {
				tag = {
					clip = var15.useCompactViewport,
					["no-clip"] = not var15.useCompactViewport,
					["auto-none"] = var15.useCompactViewport,
					["auto-y"] = not var15.useCompactViewport
				},
				Size = if var15.useCompactViewport then var15.animatedViewportHeight:map(function(p2) --[[ line: 169 ]]
					return UDim2.new(1, 0, 0, math.ceil(p2))
				end) else UDim2.fromScale(1, 0)
			}, {
				Content = reactModule.createElement(view, {
					tag = "size-full-0 auto-y",
					layout = {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, sectionGap)
					},
					onAbsoluteSizeChanged = var15.onContentAbsoluteSizeChanged
				}, {
					Content = if var9 then reactModule.createElement(view, {
						tag = "size-full-0 auto-y",
						LayoutOrder = 3,
						testId = "--sdui-ai-overview-content",
						layout = {
							FillDirection = Enum.FillDirection.Vertical,
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, sectionGap)
						}
					}, var9) else nil,
					Footer = if var10 then reactModule.createElement(view, {
						tag = "size-full-0 auto-y",
						LayoutOrder = 4,
						testId = "--sdui-ai-overview-footer",
						layout = {
							FillDirection = Enum.FillDirection.Vertical,
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, sectionGap)
						}
					}, var10) else nil
				}),
				FadeOverlay = if var15.isCompact then reactModule.createElement(view, {
					tag = "position-bottom-left anchor-bottom-left",
					ZIndex = 2,
					backgroundStyle = p0.backgroundStyle or var4.Color.Surface.Surface_0,
					Size = var15.animatedViewportHeight:map(function(p3) --[[ line: 213 ]]
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
		ToggleButton = if var15.isCompact then reactModule.createElement(view, {
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
					text = p0.expandButtonText or var6.expandButtonText,
					trailing = iconName.ChevronLargeDown,
					size = chipSize.Large,
					variant = chipVariant.Utility,
					onActivated = var15.onExpand
				})
			}),
			TrailingLine = reactModule.createElement(view, { tag = "grow", LayoutOrder = 3 }, { Divider = reactModule.createElement(divider) })
		}) else nil
	})
end)