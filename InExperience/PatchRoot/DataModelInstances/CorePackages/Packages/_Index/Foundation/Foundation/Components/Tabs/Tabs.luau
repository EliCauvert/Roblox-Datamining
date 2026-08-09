local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local fillBehaviorModule = require(foundation.Enums.FillBehavior)
local flagsModule = require(foundation.Utility.Flags)
local inputSizeModule = require(foundation.Enums.InputSize)
local tabItemModule = require(script.Parent.TabItem)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local useAnimatedHighlightModule = require(foundation.Utility.useAnimatedHighlight)
local overflowScrollContainerModule = require(script.Parent.OverflowScrollContainer)
local t = {
	testId = "--foundation-tabs",
	ZIndex = 1,
	fillBehavior = fillBehaviorModule.Fill,
	size = inputSizeModule.Medium
}

return reactModule.memo(reactModule.forwardRef(function(value, p0) --[[ line: 45 | named "Tabs" ]]
	-- upvalues: useTokensModule (ref), withDefaultsModule (ref), t (ref), reactModule (ref), dashModule (ref), fillBehaviorModule (ref), flagsModule (ref), useAnimatedHighlightModule (ref), viewModule (ref), withCommonPropsModule (ref), overflowScrollContainerModule (ref), tabItemModule (ref)
	local var23
	local var14 = useTokensModule()
	local var15 = withDefaultsModule(value, t)
	local var16, var17 = reactModule.useState(var15.defaultActiveTabId or dashModule.get(var15, { 1, "id" }))
	local var18 = reactModule.useCallback(function(p1) --[[ line: 51 ]]
		-- upvalues: var15 (ref), var17 (ref)
		if var15.onActivated then
			var15.onActivated(p1)
		end
		var17(p1)
	end)
	local var19 = var15.fillBehavior == fillBehaviorModule.Fill
	local activeTabId = var15.activeTabId or var16
	local var21 = dashModule.find(var15.tabs, function(p2) --[[ line: 60 ]]
		-- upvalues: activeTabId (ref)
		return p2.id == activeTabId
	end)
	local var22 = reactModule.useRef(nil)
	local _ = nil
	
	if flagsModule.FoundationFixStaleAnimatedHighlightRefs then
		local var24 = reactModule.useRef({})
		var23 = reactModule.useMemo(function() --[[ line: 70 ]]
			-- upvalues: var24 (ref), var15 (ref), reactModule (copy)
			local current = var24.current
			
			for i, v in var15.tabs do
				if v.ref then
					current[v.id] = v.ref
				elseif not current[v.id] then
					current[v.id] = reactModule.createRef()
				end
			end
			return current
		end, { var15.tabs })
	else
		var23 = reactModule.useMemo(function() --[[ line: 82 ]]
			-- upvalues: var15 (ref), reactModule (copy)
			local t = {}
			
			for i, v in var15.tabs do
				t[v.id] = v.ref or reactModule.createRef()
			end
			return t
		end, { var15.tabs })
	end
	local var25 = useAnimatedHighlightModule(activeTabId, p0 or var22, var23, var15.size, var15.fillBehavior)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var15, if flagsModule.FoundationTabsInlineSizeFull then { tag = "auto-y clip", Size = UDim2.fromScale(1, 0) } else { tag = "size-full-0 auto-y clip" }), {
		Tabs = reactModule.createElement(viewModule, if flagsModule.FoundationTabsInlineSizeFull then {
			tag = "col auto-y",
			ref = p0 or var22,
			Size = UDim2.fromScale(1, 0)
		} else { tag = "col size-full-0 auto-y", ref = p0 or var22 }, {
			Wrapper = reactModule.createElement(viewModule, if flagsModule.FoundationTabsInlineSizeFull then {
				LayoutOrder = 1,
				tag = "auto-y",
				Size = UDim2.fromScale(1, 0),
				testId = `{var15.testId}--wrapper`
			} else {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y",
				testId = `{var15.testId}--wrapper`
			}, {
				ScrollContainer = reactModule.createElement(overflowScrollContainerModule, {
					LayoutOrder = 1,
					size = var15.size,
					testId = `{var15.testId}--scroll-container`
				}, {
					TabList = reactModule.createElement(viewModule, {
						tag = if flagsModule.FoundationTabsInlineSizeFull then {
							["row flex-y-fill auto-xy"] = true,
							["gap-large"] = not var19
						} else {
							["row flex-y-fill auto-xy"] = true,
							["gap-large"] = not var19,
							["size-full-0"] = var19
						},
						Size = if flagsModule.FoundationTabsInlineSizeFull and var19 then UDim2.fromScale(1, 0) else nil,
						testId = `{var15.testId}--list`
					}, dashModule.map(var15.tabs, function(p3, p4) --[[ line: 155 ]]
						-- upvalues: reactModule (copy), tabItemModule (copy), activeTabId (ref), var18 (ref), var15 (ref), var23 (write)
						return reactModule.createElement(tabItemModule, {
							id = p3.id,
							text = p3.text,
							key = tostring(p3.id),
							icon = p3.icon,
							isActive = p3.id == activeTabId,
							onActivated = var18,
							LayoutOrder = p4,
							fillBehavior = var15.fillBehavior,
							size = var15.size,
							isDisabled = p3.isDisabled,
							testId = `{var15.testId}--item-{p3.id}`,
							ref = var23[p3.id]
						})
					end))
				}),
				Border = reactModule.createElement(viewModule, {
					LayoutOrder = 2,
					AnchorPoint = Vector2.new(0, 1),
					Size = UDim2.new(1, 0, 0, var14.Stroke.Thick),
					Position = UDim2.fromScale(0, 1),
					backgroundStyle = var14.Color.Stroke.Default,
					testId = `{var15.testId}--border`
				})
			}),
			Content = if var21 and var21.content then reactModule.createElement(viewModule, if flagsModule.FoundationTabsInlineSizeFull then {
				LayoutOrder = 2,
				tag = "auto-y",
				Size = UDim2.fromScale(1, 0),
				testId = `{var15.testId}--content`
			} else {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y",
				testId = `{var15.testId}--content`
			}, var21.content) else nil
		}),
		AnimatedBorder = reactModule.createElement(viewModule, {
			LayoutOrder = 0,
			ZIndex = var15.ZIndex + 1,
			Size = var25.highlightWidth:map(function(p5) --[[ line: 206 ]]
				-- upvalues: var14 (ref)
				return UDim2.fromOffset(p5, var14.Stroke.Thick)
			end),
			Position = reactModule.joinBindings({ var25.highlightPosition, var25.activeItemHeight }):map(function(p6) --[[ line: 209 ]]
				-- upvalues: var14 (ref)
				return UDim2.fromOffset(p6[1], p6[2] - var14.Stroke.Thick)
			end),
			backgroundStyle = var14.Color.System.Contrast,
			testId = `{var15.testId}--animated-border`
		})
	})
end))