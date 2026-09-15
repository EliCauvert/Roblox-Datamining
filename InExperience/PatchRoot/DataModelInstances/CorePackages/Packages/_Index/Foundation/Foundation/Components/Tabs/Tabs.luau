local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local fillBehaviorModule = require(foundation.Enums.FillBehavior)
local flagsModule = require(foundation.Utility.Flags)
local inputSizeModule = require(foundation.Enums.InputSize)
local overflowScrollContainerModule = require(foundation.Components.OverflowScrollContainer)
local tabItemModule = require(script.Parent.TabItem)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local useAnimatedHighlightModule = require(foundation.Utility.useAnimatedHighlight)
local overflowScrollContainerModule_1 = require(script.Parent.OverflowScrollContainer)
local t = {
	testId = "--foundation-tabs",
	ZIndex = 1,
	fillBehavior = fillBehaviorModule.Fill,
	size = inputSizeModule.Medium
}

return reactModule.memo(reactModule.forwardRef(function(value, p1)
	-- upvalues: useTokensModule (ref), withDefaultsModule (ref), t (ref), reactModule (ref), dashModule (ref), fillBehaviorModule (ref), flagsModule (ref), useAnimatedHighlightModule (ref), viewModule (ref), withCommonPropsModule (ref), overflowScrollContainerModule (ref), overflowScrollContainerModule_1 (ref), inputSizeModule (ref), tabItemModule (ref)
	local var1 = useTokensModule()
	local var2 = withDefaultsModule(value, t)
	local var3, var4 = reactModule.useState(var2.defaultActiveTabId or dashModule.get(var2, { 1, "id" }))
	local var5 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), var4 (ref)
		if var2.onActivated then
			var2.onActivated(p2)
		end
		var4(p2)
	end)
	local var6 = var2.fillBehavior == fillBehaviorModule.Fill
	local activeTabId = var2.activeTabId or var3
	local var7 = dashModule.find(var2.tabs, function(p2)
		-- upvalues: activeTabId (ref)
		return p2.id == activeTabId
	end)
	local var8 = reactModule.useRef(nil)
	local var9 = nil
	local _ = nil
	local var10 = nil
	
	if flagsModule.FoundationUnifiedScrimScrolling then
		local var11, var12 = reactModule.useBinding(0)
		var9 = var11
		local var13 = var12
		var10 = reactModule.useCallback(function(p2)
			-- upvalues: var13 (write)
			var13(p2.AbsoluteSize.X)
		end, {})
	end
	local _ = nil
	local var14 = reactModule.useRef({})
	local var15 = reactModule.useMemo(function()
		-- upvalues: var14 (ref), var2 (ref), reactModule (copy)
		local current = var14.current
		
		for i, v in var2.tabs do
			if v.ref then
				current[v.id] = v.ref
			elseif not current[v.id] then
				current[v.id] = reactModule.createRef()
			end
		end
		return current
	end, { var2.tabs })
	local var16 = useAnimatedHighlightModule(activeTabId, p1 or var8, var15, var2.size, var2.fillBehavior)
	local size = var2.size
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var2, {
		tag = if flagsModule.FoundationUnifiedScrimScrolling then "auto-y no-clip" else "auto-y clip",
		Size = UDim2.fromScale(1, 0),
		sizeConstraint = if flagsModule.FoundationUnifiedScrimScrolling and not var6 then {
			MaxSize = var9:map(function(p2)
				return Vector2.new(p2, 1e999)
			end)
		} else nil
	}), {
		Tabs = reactModule.createElement(viewModule, {
			tag = "col auto-y",
			ref = p1 or var8,
			Size = UDim2.fromScale(1, 0)
		}, {
			Wrapper = reactModule.createElement(viewModule, {
				LayoutOrder = 1,
				tag = "auto-y",
				Size = UDim2.fromScale(1, 0),
				testId = `{var2.testId}--wrapper`
			}, {
				ScrollContainer = reactModule.createElement(if flagsModule.FoundationUnifiedScrimScrolling then overflowScrollContainerModule else overflowScrollContainerModule_1, if flagsModule.FoundationUnifiedScrimScrolling then {
					LayoutOrder = 1,
					size = var2.size,
					scrimBottomInset = var1.Stroke.Thick,
					testId = `{var2.testId}--scroll-container`
				} else {
					LayoutOrder = 1,
					size = var2.size,
					testId = `{var2.testId}--scroll-container`
				}, {
					TabList = reactModule.createElement(viewModule, {
						onAbsoluteSizeChanged = if flagsModule.FoundationUnifiedScrimScrolling then var10 else nil,
						tag = {
							["row flex-y-fill auto-xy"] = true,
							["gap-large"] = not var6 and (if size ~= inputSizeModule.Small then size == inputSizeModule.XSmall else true)
						},
						Size = if var6 then UDim2.fromScale(1, 0) else nil,
						testId = `{var2.testId}--list`
					}, dashModule.map(var2.tabs, function(p2, p3)
						-- upvalues: reactModule (copy), tabItemModule (copy), activeTabId (ref), var5 (ref), var2 (ref), var15 (write)
						return reactModule.createElement(tabItemModule, {
							id = p2.id,
							text = p2.text,
							indicator = p2.indicator,
							key = tostring(p2.id),
							icon = p2.icon,
							isActive = p2.id == activeTabId,
							onActivated = var5,
							LayoutOrder = p3,
							fillBehavior = var2.fillBehavior,
							size = var2.size,
							isDisabled = p2.isDisabled,
							testId = `{var2.testId}--item-{p5.id}`,
							ref = var15[p2.id]
						})
					end))
				}),
				Border = reactModule.createElement(viewModule, {
					LayoutOrder = 2,
					AnchorPoint = Vector2.new(0, 1),
					Size = UDim2.new(1, 0, 0, var1.Stroke.Thick),
					Position = UDim2.fromScale(0, 1),
					backgroundStyle = var1.Color.Stroke.Default,
					testId = `{var2.testId}--border`
				})
			}),
			Content = if var7 and var7.content then reactModule.createElement(viewModule, {
				LayoutOrder = 2,
				tag = "auto-y",
				Size = UDim2.fromScale(1, 0),
				testId = `{var2.testId}--content`
			}, var7.content) else nil
		}),
		AnimatedBorder = reactModule.createElement(viewModule, {
			LayoutOrder = 0,
			ZIndex = var2.ZIndex + 1,
			Size = var16.highlightWidth:map(function(p2)
				-- upvalues: var1 (ref)
				return UDim2.fromOffset(p2, var1.Stroke.Thick)
			end),
			AnchorPoint = Vector2.new(0, 1),
			Position = reactModule.joinBindings({ var16.highlightPosition, var16.activeItemHeight }):map(function(p2)
				return UDim2.fromOffset(p2[1], p2[2])
			end),
			backgroundStyle = var1.Color.System.Contrast,
			testId = `{var2.testId}--animated-border`
		})
	})
end))