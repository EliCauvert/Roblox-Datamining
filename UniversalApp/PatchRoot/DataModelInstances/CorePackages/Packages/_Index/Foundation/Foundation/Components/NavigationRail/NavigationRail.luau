local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local DividerModule = require(Foundation.Components.Divider)
local NavigationRailItemContextModule = require(script.Parent.NavigationRailItem.NavigationRailItemContext)
local NavigationRailItemModule = require(script.Parent.NavigationRailItem)
local OrientationModule = require(Foundation.Enums.Orientation)
local ScrollViewModule = require(Foundation.Components.ScrollView)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local VisibilityModule = require(Foundation.Enums.Visibility)
local UseNavigationRailVariantsModule = require(script.Parent.useNavigationRailVariants)
local UsePreferencesModule = require(Foundation.Providers.Preferences.usePreferences)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local config = {
	collapsedLabels = false,
	isCollapsed = false,
	stickyFooter = false,
	stickyHeader = false,
	testId = "--foundation-navigation-rail"
}

local function renderItems(p1)
	-- upvalues: ReactModule (copy), NavigationRailItemModule (copy)
	local Elements = {}
	
	for LayoutOrder, item in p1.items do
		Elements[tostring(item.id)] = ReactModule.createElement(NavigationRailItemModule, {
			text = item.text,
			icon = item.icon,
			selectedIcon = item.selectedIcon,
			indicator = item.indicator,
			hasDivider = item.hasDivider,
			sectionTitle = item.sectionTitle,
			isActive = item.id == p1.activeItemId,
			isCollapsed = p1.isCollapsed,
			collapsedLabels = p1.collapsedLabels,
			id = item.id,
			onActivated = item.onActivated,
			onRailActivated = p1.onActivated,
			LayoutOrder = LayoutOrder,
			testId = item.testId or `{p1.testId}--item-{item.id}`
		})
	end
	return Elements
end

return ReactModule.memo(ReactModule.forwardRef(function(p2, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UsePreferencesModule (copy), UseNavigationRailVariantsModule (copy), ReactModule (copy), ReactOtterModule (copy), ViewModule (copy), renderItems (copy), WithCommonPropsModule (copy), NavigationRailItemContextModule (copy), ScrollViewModule (copy), VisibilityModule (copy), DividerModule (copy), OrientationModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p2, config)
	local UseTokensModuleResult = UseTokensModule()
	local UsePreferencesModuleResult = UsePreferencesModule()
	local UseNavigationRailVariantsModuleResult = UseNavigationRailVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.isCollapsed)
	local NavigationBar = UseTokensModuleResult.Color.Common.NavigationBar
	local Width = UseNavigationRailVariantsModuleResult.container.width
	local Widths = UseNavigationRailVariantsModuleResult.widths
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(Width, (ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})))
	local UseRefResult = ReactModule.useRef(Width)
	
	if UseRefResult.current ~= Width then
		UseRefResult.current = Width
		UseStateResult2(true)
	end
	ReactModule.useEffect(function()
		-- upvalues: UsePreferencesModuleResult (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), Width (copy), UseStateResult2 (copy), UseTokensModuleResult (copy)
		if UsePreferencesModuleResult.reducedMotion then
			UseAnimatedBindingResult2((ReactOtterModule.instant(Width)))
			UseStateResult2(false)
			
			return
		else
			UseAnimatedBindingResult2(ReactOtterModule.ease(Width, {
				easingStyle = UseTokensModuleResult.Ease.StandardOut,
				duration = UseTokensModuleResult.Time.Time_200
			}))
		end
	end, {
		Width,
		UsePreferencesModuleResult.reducedMotion,
		UseTokensModuleResult.Ease.StandardOut,
		UseTokensModuleResult.Time.Time_200
	})
	local NoUseStateResult: boolean = WithDefaultsModuleResult.isCollapsed and not UseStateResult
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseAnimatedBindingResult (copy), Widths (copy)
		return UseAnimatedBindingResult:map(function(p3): number
			-- upvalues: Widths (upval)
			return 1 - math.clamp((p3 - Widths.collapsed) / (Widths.expanded - Widths.collapsed), 0, 1)
		end)
	end, { UseAnimatedBindingResult, Widths })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseAnimatedBindingResult (copy)
		return UseAnimatedBindingResult:map(function(XOffset): UDim2
			return UDim2.new(0, XOffset, 1, 0)
		end)
	end, { UseAnimatedBindingResult })
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: NavigationBar (copy), UseMemoResult (copy), UseStateResult (copy), WithDefaultsModuleResult (copy), UseNavigationRailVariantsModuleResult (copy), UseAnimatedBindingResult (copy)
		return {
			backgroundStyle = NavigationBar,
			collapseProgress = UseMemoResult,
			heldWidth = if UseStateResult and not WithDefaultsModuleResult.collapsedLabels then UseNavigationRailVariantsModuleResult.items.heldWidth else nil,
			isResizing = UseStateResult,
			isTargetCollapsed = WithDefaultsModuleResult.isCollapsed,
			railWidth = UseAnimatedBindingResult
		}
	end, {
		NavigationBar, UseMemoResult, UseStateResult,
		WithDefaultsModuleResult.collapsedLabels,
		UseNavigationRailVariantsModuleResult.items.heldWidth,
		WithDefaultsModuleResult.isCollapsed, UseAnimatedBindingResult
	})
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local FooterItems = WithDefaultsModuleResult.footerItems
	local Element = if FooterItems == nil or #FooterItems <= 0 then nil else ReactModule.createElement(ViewModule, {
		LayoutOrder = 2,
		tag = if WithDefaultsModuleResult.collapsedLabels then UseNavigationRailVariantsModuleResult.labeledList.tag else UseNavigationRailVariantsModuleResult.footerItems.tag,
		testId = `{WithDefaultsModuleResult.testId}--footer-items`
	}, (renderItems({
		items = FooterItems,
		activeItemId = WithDefaultsModuleResult.activeItemId,
		isCollapsed = NoUseStateResult,
		collapsedLabels = WithDefaultsModuleResult.collapsedLabels,
		onActivated = WithDefaultsModuleResult.onActivated,
		testId = WithDefaultsModuleResult.testId
	})))
	local Element1 = if WithDefaultsModuleResult.header == nil then nil else ReactModule.createElement(ViewModule, {
		LayoutOrder = 1,
		tag = UseNavigationRailVariantsModuleResult.header.tag,
		testId = `{WithDefaultsModuleResult.testId}--header`
	}, WithDefaultsModuleResult.header)
	local Element2 = if WithDefaultsModuleResult.footer == nil and Element == nil then nil else ReactModule.createElement(ViewModule, {
		LayoutOrder = 3,
		tag = UseNavigationRailVariantsModuleResult.block.tag,
		testId = `{WithDefaultsModuleResult.testId}--footer-block`
	}, {
		Footer = if WithDefaultsModuleResult.footer == nil then nil else ReactModule.createElement(ViewModule, {
			LayoutOrder = 1,
			tag = UseNavigationRailVariantsModuleResult.footerItems.tag,
			testId = `{WithDefaultsModuleResult.testId}--footer`
		}, WithDefaultsModuleResult.footer),
		FooterItems = Element
	})
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		selectionGroup = true,
		tag = UseNavigationRailVariantsModuleResult.container.tag,
		backgroundStyle = NavigationBar,
		Size = UseMemoResult1,
		ref = Ref
	}), {
		Content = ReactModule.createElement(NavigationRailItemContextModule.Provider, { value = UseMemoResult2 }, {
			Content = ReactModule.createElement(ViewModule, { tag = UseNavigationRailVariantsModuleResult.content.tag }, {
				Header = if WithDefaultsModuleResult.stickyHeader then Element1 else nil,
				Body = ReactModule.createElement(ScrollViewModule, {
					LayoutOrder = 2,
					tag = UseNavigationRailVariantsModuleResult.body.tag,
					selection = { Selectable = false },
					scroll = {
						AutomaticCanvasSize = Enum.AutomaticSize.Y,
						CanvasSize = UDim2.fromScale(1, 0),
						ScrollingDirection = Enum.ScrollingDirection.Y,
						scrollBarVisibility = if WithDefaultsModuleResult.isCollapsed then VisibilityModule.None else nil
					},
					onAbsoluteWindowSizeChanged = ReactModule.useCallback(function(p3)
						-- upvalues: UseBindingResult2 (copy)
						UseBindingResult2(p3.AbsoluteWindowSize.Y)
					end, {}),
					testId = `{WithDefaultsModuleResult.testId}--body`
				}, {
					Column = ReactModule.createElement(ViewModule, {
						tag = UseNavigationRailVariantsModuleResult.column.tag,
						Size = ReactModule.useMemo(function()
							-- upvalues: UseBindingResult (copy)
							return UseBindingResult:map(function(YOffset): UDim2
								return UDim2.new(1, 0, 0, YOffset)
							end)
						end, { UseBindingResult }),
						testId = `{WithDefaultsModuleResult.testId}--column`
					}, {
						Top = ReactModule.createElement(ViewModule, {
							LayoutOrder = 1,
							tag = UseNavigationRailVariantsModuleResult.block.tag
						}, {
							Header = if WithDefaultsModuleResult.stickyHeader then nil else Element1,
							Items = ReactModule.createElement(ViewModule, {
								LayoutOrder = 2,
								tag = if WithDefaultsModuleResult.collapsedLabels then UseNavigationRailVariantsModuleResult.labeledList.tag else UseNavigationRailVariantsModuleResult.items.tag,
								testId = `{WithDefaultsModuleResult.testId}--items`
							}, (renderItems({
								items = WithDefaultsModuleResult.items,
								activeItemId = WithDefaultsModuleResult.activeItemId,
								isCollapsed = NoUseStateResult,
								collapsedLabels = WithDefaultsModuleResult.collapsedLabels,
								onActivated = WithDefaultsModuleResult.onActivated,
								testId = WithDefaultsModuleResult.testId
							})))
						}),
						Bottom = if WithDefaultsModuleResult.stickyFooter then nil else Element2
					})
				}),
				Footer = if WithDefaultsModuleResult.stickyFooter then Element2 else nil
			})
		}),
		Edge = ReactModule.createElement(DividerModule, {
			orientation = OrientationModule.Vertical,
			AnchorPoint = UseNavigationRailVariantsModuleResult.edge.AnchorPoint,
			Position = UseNavigationRailVariantsModuleResult.edge.Position,
			testId = `{WithDefaultsModuleResult.testId}--edge`
		})
	})
end))