local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local DividerModule = require(Foundation.Components.Divider)
local NavigationBarTabModule = require(script.Parent.NavigationBarTab)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseAnimatedHighlightModule = require(Foundation.Utility.useAnimatedHighlight)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local Width = require(Foundation.Utility.Responsive.BreakpointConfig).widths[require(Foundation.Enums.Breakpoint).Small]
local config = { testId = "--foundation-navigation-bar" }

return ReactModule.memo(ReactModule.forwardRef(function(p1, p2)
	-- upvalues: WithDefaultsModule (copy), config (copy), ReactModule (copy), DashModule (copy), UseTokensModule (copy), UseAnimatedHighlightModule (copy), ViewModule (copy), WithCommonPropsModule (copy), StateLayerAffordanceModule (copy), DividerModule (copy), Width (copy), NavigationBarTabModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseStateResult, UseStateResult2 = ReactModule.useState(WithDefaultsModuleResult.defaultActiveItemId or DashModule.get(WithDefaultsModuleResult.items, { 1, "id" }))
	local UseStateResult1 = if WithDefaultsModuleResult.activeItemId == nil then UseStateResult else WithDefaultsModuleResult.activeItemId
	local UseResult = ReactModule.useCallback(function(p3)
		-- upvalues: UseStateResult2 (copy), WithDefaultsModuleResult (copy)
		UseStateResult2(p3)
		
		if WithDefaultsModuleResult.onActivated then
			WithDefaultsModuleResult.onActivated(p3)
		end
	end, { WithDefaultsModuleResult.onActivated })
	local UseTokensModuleResult = UseTokensModule()
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef({})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseRefResult1 (copy), WithDefaultsModuleResult (copy), ReactModule (upval)
		local Current = UseRefResult1.current
		
		for _, item in WithDefaultsModuleResult.items do
			if not Current[item.id] then
				Current[item.id] = ReactModule.createRef()
			end
		end
		return Current
	end, { WithDefaultsModuleResult.items })
	local SomeResult = DashModule.some(WithDefaultsModuleResult.items, function(p3): boolean
		-- upvalues: UseStateResult1 (copy)
		return p3.id == UseStateResult1
	end)
	local UseAnimatedHighlightModuleResult = UseAnimatedHighlightModule(UseStateResult1, p2 or UseRefResult, UseMemoResult, WithDefaultsModuleResult.items)
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = "size-full-0 auto-y",
		backgroundStyle = UseTokensModuleResult.Color.Common.NavigationBar,
		onActivated = DashModule.noop,
		stateLayer = { affordance = StateLayerAffordanceModule.None },
		selection = { Selectable = false },
		ref = p2 or UseRefResult
	}), {
		ActiveIndicator = ReactModule.createElement(ViewModule, {
			tag = "radius-circle bg-system-contrast",
			ZIndex = 3,
			Size = UseAnimatedHighlightModuleResult.highlightWidth:map(function(XOffset): UDim2
				-- upvalues: UseTokensModuleResult (copy)
				return UDim2.fromOffset(XOffset, UseTokensModuleResult.Size.Size_50)
			end),
			Position = UseAnimatedHighlightModuleResult.highlightPosition:map(function(XOffset): UDim2
				return UDim2.fromOffset(XOffset, 0)
			end),
			Visible = SomeResult,
			testId = `{WithDefaultsModuleResult.testId}--active-indicator`
		}),
		Divider = ReactModule.createElement(DividerModule, { testId = `{WithDefaultsModuleResult.testId}--divider` }),
		Tabs = ReactModule.createElement(ViewModule, {
			tag = "row gap-small size-full-0 auto-y margin-x-small",
			ZIndex = 2,
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.fromScale(0.5, 0),
			sizeConstraint = { MaxSize = Vector2.new(Width, 1e999) },
			testId = `{WithDefaultsModuleResult.testId}--tabs`
		}, DashModule.map(WithDefaultsModuleResult.items, function(Item, LayoutOrder)
			-- upvalues: ReactModule (upval), NavigationBarTabModule (upval), UseStateResult1 (copy), UseResult (copy), UseMemoResult (copy), WithDefaultsModuleResult (copy)
			return ReactModule.createElement(NavigationBarTabModule, {
				key = tostring(Item.id),
				item = Item,
				isActive = Item.id == UseStateResult1,
				onActivated = UseResult,
				LayoutOrder = LayoutOrder,
				ref = UseMemoResult[Item.id],
				testId = `{WithDefaultsModuleResult.testId}--item-{Item.id}`
			})
		end))
	})
end))