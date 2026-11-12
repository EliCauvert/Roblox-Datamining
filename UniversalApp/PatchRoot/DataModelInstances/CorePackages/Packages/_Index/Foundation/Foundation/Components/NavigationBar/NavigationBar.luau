local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local DividerModule = require(Foundation.Components.Divider)
local NavigationBarActiveIndicatorModule = require(script.Parent.NavigationBarActiveIndicator)
local NavigationBarTabModule = require(script.Parent.NavigationBarTab)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local Width = require(Foundation.Utility.Responsive.BreakpointConfig).widths[require(Foundation.Enums.Breakpoint).Small]
local config = {
	isDocked = true,
	hasLabels = true,
	testId = "--foundation-navigation-bar"
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), ReactModule (copy), DashModule (copy), UseTokensModule (copy), NavigationBarActiveIndicatorModule (copy), NavigationBarTabModule (copy), ViewModule (copy), WithCommonPropsModule (copy), Width (copy), StateLayerAffordanceModule (copy), DividerModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseStateResult, UseStateResult2 = ReactModule.useState(WithDefaultsModuleResult.defaultActiveItemId or DashModule.get(WithDefaultsModuleResult.items, { 1, "id" }))
	local UseStateResult1 = if WithDefaultsModuleResult.activeItemId == nil then UseStateResult else WithDefaultsModuleResult.activeItemId
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2 (copy), WithDefaultsModuleResult (copy)
		UseStateResult2(p2)
		
		if WithDefaultsModuleResult.onActivated then
			WithDefaultsModuleResult.onActivated(p2)
		end
	end, { WithDefaultsModuleResult.onActivated })
	local UseTokensModuleResult = UseTokensModule()
	local NoIsDocked = not WithDefaultsModuleResult.isDocked
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef({})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseRefResult2 (copy), WithDefaultsModuleResult (copy), ReactModule (upval)
		local Current = UseRefResult2.current
		
		for _, item in WithDefaultsModuleResult.items do
			if not Current[item.id] then
				Current[item.id] = ReactModule.createRef()
			end
		end
		return Current
	end, { WithDefaultsModuleResult.items })
	local Element = ReactModule.createElement(NavigationBarActiveIndicatorModule, {
		activeItemId = UseStateResult1,
		isVisible = DashModule.some(WithDefaultsModuleResult.items, function(p2): boolean
			-- upvalues: UseStateResult1 (copy)
			return p2.id == UseStateResult1
		end),
		isCapsule = NoIsDocked,
		containerRef = if NoIsDocked then UseRefResult1 else Ref or UseRefResult,
		tabRefs = UseMemoResult,
		items = WithDefaultsModuleResult.items,
		hasLabels = WithDefaultsModuleResult.hasLabels,
		testId = `{WithDefaultsModuleResult.testId}--active-indicator`
	})
	local MapResult = DashModule.map(WithDefaultsModuleResult.items, function(Item, LayoutOrder)
		-- upvalues: ReactModule (upval), NavigationBarTabModule (upval), UseStateResult1 (copy), WithDefaultsModuleResult (copy), NoIsDocked (copy), UseResult (copy), UseMemoResult (copy)
		return ReactModule.createElement(NavigationBarTabModule, {
			key = tostring(Item.id),
			item = Item,
			isActive = Item.id == UseStateResult1,
			hasLabel = WithDefaultsModuleResult.hasLabels,
			isCapsule = NoIsDocked,
			onActivated = UseResult,
			LayoutOrder = LayoutOrder,
			ref = UseMemoResult[Item.id],
			testId = `{WithDefaultsModuleResult.testId}--item-{Item.id}`
		})
	end)
	
	return if NoIsDocked then ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, { tag = "size-full-0 auto-y margin-x-small", ref = Ref }), {
		Capsule = ReactModule.createElement(ViewModule, {
			tag = "position-top-center anchor-top-center size-full-0 auto-y padding-x-medium padding-y-xsmall stroke-standard stroke-default radius-circle bg-over-media-100",
			sizeConstraint = { MaxSize = Vector2.new(Width, 1e999) },
			onActivated = DashModule.noop,
			stateLayer = { affordance = StateLayerAffordanceModule.None },
			selection = { Selectable = false },
			testId = `{WithDefaultsModuleResult.testId}--capsule`
		}, {
			ActiveIndicator = Element,
			Tabs = ReactModule.createElement(ViewModule, {
				tag = "size-full-0 auto-y",
				ZIndex = 2,
				layout = {
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, UseTokensModuleResult.Size.Size_150),
					SortOrder = Enum.SortOrder.LayoutOrder
				},
				ref = UseRefResult1,
				testId = `{WithDefaultsModuleResult.testId}--tabs`
			}, MapResult)
		})
	}) else ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = "size-full-0 auto-y",
		backgroundStyle = UseTokensModuleResult.Color.Common.NavigationBar,
		onActivated = DashModule.noop,
		stateLayer = { affordance = StateLayerAffordanceModule.None },
		selection = { Selectable = false },
		ref = Ref or UseRefResult
	}), {
		ActiveIndicator = Element,
		Divider = ReactModule.createElement(DividerModule, { testId = `{WithDefaultsModuleResult.testId}--divider` }),
		Tabs = ReactModule.createElement(ViewModule, {
			tag = "row gap-small position-top-center anchor-top-center size-full-0 auto-y margin-x-small",
			ZIndex = 2,
			sizeConstraint = { MaxSize = Vector2.new(Width, 1e999) },
			testId = `{WithDefaultsModuleResult.testId}--tabs`
		}, MapResult)
	})
end))