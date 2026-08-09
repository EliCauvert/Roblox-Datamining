local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(parent.AppCommonLib)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local cryoModule = require(parent.Cryo)
local view = foundationModule.View
local button = foundationModule.Button
local usePreferences = foundationModule.Hooks.usePreferences
local useTokens = foundationModule.Hooks.useTokens
local buttonSize = foundationModule.Enums.ButtonSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local useAiOverviewExpansionModule = require(script.Parent.useAiOverviewExpansion)

return reactModule.memo(function(p0) --[[ line: 45 | named "SduiAiOverview" ]]
	-- upvalues: useTokens (ref), usePreferences (ref), useLocalization (ref), reactModule (ref), cryoModule (ref), useAiOverviewExpansionModule (ref), view (ref), button (ref), buttonSize (ref), buttonVariant (ref), fillBehavior (ref)
	local var4 = useTokens()
	local var5 = usePreferences()
	local var6 = useLocalization({ expandButtonText = "CommonUI.Controls.Action.ShowMore" })
	local var7 = reactModule.useMemo(function() --[[ line: 53 ]]
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
	local var8 = reactModule.useCallback(function(p1) --[[ line: 64 ]]
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
	local var9 = reactModule.useMemo(function() --[[ line: 79 ]]
		-- upvalues: var8 (ref), p0 (ref)
		return var8(p0.content)
	end, { p0.content, var8 })
	local var10 = reactModule.useMemo(function() --[[ line: 83 ]]
		-- upvalues: var8 (ref), p0 (ref)
		return var8(p0.footer)
	end, { p0.footer, var8 })
	local large = var4.Gap.Large
	local var11 = if p0.titleComponent == nil then p0.descriptionComponent ~= nil else true
	local var12 = if p0.content == nil then p0.footer ~= nil else true
	local expandButtonText = p0.expandButtonText or var6.expandButtonText
	local backgroundStyle = p0.backgroundStyle or var4.Color.Surface.Surface_0
	local size1000 = var4.Size.Size_1000
	local var15 = useAiOverviewExpansionModule({
		buttonHeight = size1000,
		compactHeight = p0.compactHeight,
		hasHeader = var11,
		hasExpandableBody = var12,
		sectionGap = large,
		reducedMotion = var5.reducedMotion
	})
	
	return reactModule.createElement(view, {
		tag = "col gap-large size-full-0 auto-y",
		backgroundStyle = p0.backgroundStyle,
		LayoutOrder = p0.layoutOrder,
		sizeConstraint = if var15.shouldReserveCompactHeight then { MinSize = Vector2.new(0, p0.compactHeight) } else nil,
		testId = p0.testId or "--sdui-ai-overview"
	}, {
		Header = if var11 then reactModule.createElement(view, {
			tag = "col gap-large size-full-0 auto-y",
			LayoutOrder = 1,
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
		Body = if var12 then reactModule.createElement(view, { tag = "col size-full-0 auto-y", LayoutOrder = 2 }, {
			Inner = reactModule.createElement(view, {
				tag = {
					clip = var15.useCompactViewport,
					["no-clip"] = not var15.useCompactViewport,
					["auto-none"] = var15.useCompactViewport,
					["auto-y"] = not var15.useCompactViewport
				},
				Size = if var15.useCompactViewport then var15.animatedViewportHeight:map(function(p2) --[[ line: 155 ]]
					return UDim2.new(1, 0, 0, math.ceil(p2))
				end) else UDim2.fromScale(1, 0)
			}, {
				Content = reactModule.createElement(view, {
					tag = "col gap-large size-full-0 auto-y",
					onAbsoluteSizeChanged = var15.onContentAbsoluteSizeChanged
				}, {
					Content = if var9 then reactModule.createElement(view, {
						tag = "col gap-large size-full-0 auto-y",
						LayoutOrder = 3,
						testId = "--sdui-ai-overview-content"
					}, var9) else nil,
					Footer = if var10 then reactModule.createElement(view, {
						tag = "col gap-large size-full-0 auto-y",
						LayoutOrder = 4,
						testId = "--sdui-ai-overview-footer"
					}, var10) else nil
				}),
				FadeOverlay = if var15.isCompact then reactModule.createElement(view, {
					tag = "position-bottom-left anchor-bottom-left",
					ZIndex = 2,
					backgroundStyle = backgroundStyle,
					Size = var15.animatedViewportHeight:map(function(p3) --[[ line: 184 ]]
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
		ToggleButtonContainer = if var15.isCompact then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = UDim2.new(1, 0, 0, size1000)
		}, {
			ToggleButton = reactModule.createElement(button, {
				testId = "--sdui-ai-overview-toggle",
				text = expandButtonText,
				size = buttonSize.Medium,
				variant = buttonVariant.Standard,
				fillBehavior = fillBehavior.Fill,
				onActivated = var15.onExpand
			})
		}) else nil
	})
end)