local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local FillBehaviorModule = require(Foundation.Enums.FillBehavior)
local FlagsModule = require(Foundation.Utility.Flags)
local InputSizeModule = require(Foundation.Enums.InputSize)
local OverflowScrollContainerModule = require(Foundation.Components.OverflowScrollContainer)
local TabItemModule = require(script.Parent.TabItem)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local UseAnimatedHighlightModule = require(Foundation.Utility.useAnimatedHighlight)
local OverflowScrollContainerModule1 = require(script.Parent.OverflowScrollContainer)
local config = {
	testId = "--foundation-tabs",
	ZIndex = 1,
	fillBehavior = FillBehaviorModule.Fill,
	size = InputSizeModule.Medium
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, p2)
	-- upvalues: UseTokensModule (copy), WithDefaultsModule (copy), config (copy), ReactModule (copy), DashModule (copy), FillBehaviorModule (copy), FlagsModule (copy), UseAnimatedHighlightModule (copy), ViewModule (copy), WithCommonPropsModule (copy), OverflowScrollContainerModule (copy), OverflowScrollContainerModule1 (copy), InputSizeModule (copy), TabItemModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseStateResult, UseStateResult2 = ReactModule.useState(WithDefaultsModuleResult.defaultActiveTabId or DashModule.get(WithDefaultsModuleResult, { 1, "id" }))
	local UseResult = ReactModule.useCallback(function(p3)
		-- upvalues: WithDefaultsModuleResult (copy), UseStateResult2 (copy)
		if WithDefaultsModuleResult.onActivated then
			WithDefaultsModuleResult.onActivated(p3)
		end
		UseStateResult2(p3)
	end)
	local IsFillBehaviorMatch = WithDefaultsModuleResult.fillBehavior == FillBehaviorModule.Fill
	local ActiveTabId = WithDefaultsModuleResult.activeTabId or UseStateResult
	local FindResult = DashModule.find(WithDefaultsModuleResult.tabs, function(p3): boolean
		-- upvalues: ActiveTabId (copy)
		return p3.id == ActiveTabId
	end)
	local UseRefResult = ReactModule.useRef(nil)
	local v1 = nil
	local UseBindingResult2 = nil
	local UseResult1 = nil
	
	if FlagsModule.FoundationUnifiedScrimScrolling then
		v1, UseBindingResult2 = ReactModule.useBinding(0)
		UseResult1 = ReactModule.useCallback(function(Frame)
			-- upvalues: UseBindingResult2 (ref)
			UseBindingResult2(Frame.AbsoluteSize.X)
		end, {})
	end
	local UseMemoResult = nil
	local UseRefResult1 = ReactModule.useRef({})
	UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseRefResult1 (copy), WithDefaultsModuleResult (copy), ReactModule (upval)
		local Current = UseRefResult1.current
		
		for _, tab in WithDefaultsModuleResult.tabs do
			if tab.ref then
				Current[tab.id] = tab.ref
			elseif not Current[tab.id] then
				Current[tab.id] = ReactModule.createRef()
			end
		end
		return Current
	end, { WithDefaultsModuleResult.tabs })
	local UseAnimatedHighlightModuleResult = UseAnimatedHighlightModule(ActiveTabId, p2 or UseRefResult, UseMemoResult, WithDefaultsModuleResult.size, WithDefaultsModuleResult.fillBehavior)
	local Size = WithDefaultsModuleResult.size
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = if FlagsModule.FoundationUnifiedScrimScrolling then "auto-y no-clip" else "auto-y clip",
		Size = UDim2.fromScale(1, 0),
		sizeConstraint = if FlagsModule.FoundationUnifiedScrimScrolling and not IsFillBehaviorMatch then {
			MaxSize = v1:map(function(X): Vector2
				return Vector2.new(X, 1e999)
			end)
		} else nil
	}), {
		Tabs = ReactModule.createElement(ViewModule, {
			tag = "col auto-y",
			ref = p2 or UseRefResult,
			Size = UDim2.fromScale(1, 0)
		}, {
			Wrapper = ReactModule.createElement(ViewModule, {
				LayoutOrder = 1,
				tag = "auto-y",
				Size = UDim2.fromScale(1, 0),
				testId = `{WithDefaultsModuleResult.testId}--wrapper`
			}, {
				ScrollContainer = ReactModule.createElement(if FlagsModule.FoundationUnifiedScrimScrolling then OverflowScrollContainerModule else OverflowScrollContainerModule1, if FlagsModule.FoundationUnifiedScrimScrolling then {
					LayoutOrder = 1,
					size = WithDefaultsModuleResult.size,
					scrimBottomInset = UseTokensModuleResult.Stroke.Thick,
					testId = `{WithDefaultsModuleResult.testId}--scroll-container`
				} else {
					LayoutOrder = 1,
					size = WithDefaultsModuleResult.size,
					testId = `{WithDefaultsModuleResult.testId}--scroll-container`
				}, {
					TabList = ReactModule.createElement(ViewModule, {
						onAbsoluteSizeChanged = if FlagsModule.FoundationUnifiedScrimScrolling then UseResult1 else nil,
						tag = {
							["row flex-y-fill auto-xy"] = true,
							["gap-large"] = not IsFillBehaviorMatch and (Size == InputSizeModule.Small or Size == InputSizeModule.XSmall)
						},
						Size = if IsFillBehaviorMatch then UDim2.fromScale(1, 0) else nil,
						testId = `{WithDefaultsModuleResult.testId}--list`
					}, DashModule.map(WithDefaultsModuleResult.tabs, function(p3, LayoutOrder)
						-- upvalues: ReactModule (upval), TabItemModule (upval), ActiveTabId (copy), UseResult (copy), WithDefaultsModuleResult (copy), UseMemoResult (ref)
						return ReactModule.createElement(TabItemModule, {
							id = p3.id,
							text = p3.text,
							indicator = p3.indicator,
							key = tostring(p3.id),
							icon = p3.icon,
							isActive = p3.id == ActiveTabId,
							onActivated = UseResult,
							LayoutOrder = LayoutOrder,
							fillBehavior = WithDefaultsModuleResult.fillBehavior,
							size = WithDefaultsModuleResult.size,
							isDisabled = p3.isDisabled,
							testId = `{WithDefaultsModuleResult.testId}--item-{p5.id}`,
							ref = UseMemoResult[p3.id]
						})
					end))
				}),
				Border = ReactModule.createElement(ViewModule, {
					LayoutOrder = 2,
					AnchorPoint = Vector2.new(0, 1),
					Size = UDim2.new(1, 0, 0, UseTokensModuleResult.Stroke.Thick),
					Position = UDim2.fromScale(0, 1),
					backgroundStyle = UseTokensModuleResult.Color.Stroke.Default,
					testId = `{WithDefaultsModuleResult.testId}--border`
				})
			}),
			Content = if FindResult and FindResult.content then ReactModule.createElement(ViewModule, {
				LayoutOrder = 2,
				tag = "auto-y",
				Size = UDim2.fromScale(1, 0),
				testId = `{WithDefaultsModuleResult.testId}--content`
			}, FindResult.content) else nil
		}),
		AnimatedBorder = ReactModule.createElement(ViewModule, {
			LayoutOrder = 0,
			ZIndex = WithDefaultsModuleResult.ZIndex + 1,
			Size = UseAnimatedHighlightModuleResult.highlightWidth:map(function(XOffset): UDim2
				-- upvalues: UseTokensModuleResult (copy)
				return UDim2.fromOffset(XOffset, UseTokensModuleResult.Stroke.Thick)
			end),
			AnchorPoint = Vector2.new(0, 1),
			Position = ReactModule.joinBindings({
				UseAnimatedHighlightModuleResult.highlightPosition,
				UseAnimatedHighlightModuleResult.activeItemHeight
			}):map(function(Entry): UDim2
				return UDim2.fromOffset(Entry[1], Entry[2])
			end),
			backgroundStyle = UseTokensModuleResult.Color.System.Contrast,
			testId = `{WithDefaultsModuleResult.testId}--animated-border`
		})
	})
end))