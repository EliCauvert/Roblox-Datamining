local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ControlStateModule = require(Foundation.Enums.ControlState)
local IconSizeModule = require(Foundation.Enums.IconSize)
local MorphingRowModule = require(script.Parent.MorphingRow)
local _ = require(script.Parent.MorphingRowIndicator)
local NavigationRailItemContextModule = require(script.Parent.NavigationRailItemContext)
local NavigationRailItemIconModule = require(script.Parent.NavigationRailItemIcon)
local NavigationRailTooltipModule = require(script.Parent.NavigationRailTooltip)
local SectionHeaderModule = require(script.Parent.SectionHeader)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local GetIndicatorRingModule = require(script.Parent.getIndicatorRing)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local config = {
	collapsedLabels = false,
	hasDivider = false,
	isActive = false,
	isCollapsed = false,
	testId = "--foundation-navigation-rail-item"
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, p2)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), ReactModule (copy), NavigationRailItemContextModule (copy), ControlStateModule (copy), NavigationRailItemIconModule (copy), IconSizeModule (copy), GetIndicatorRingModule (copy), ViewModule (copy), WithCommonPropsModule (copy), SectionHeaderModule (copy), MorphingRowModule (copy), NavigationRailTooltipModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UseContextResult = ReactModule.useContext(NavigationRailItemContextModule)
	local UseStateResult, UseStateResult2 = ReactModule.useState(ControlStateModule.Default)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useImperativeHandle(p2, function()
		-- upvalues: UseRefResult (copy)
		return UseRefResult.current
	end, {})
	local NoIsCollapsed: boolean = UseContextResult.heldWidth ~= nil and not WithDefaultsModuleResult.isCollapsed
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: WithDefaultsModuleResult (copy), UseTokensModuleResult (copy), ReactModule (upval)
		return ReactModule.createBinding(if WithDefaultsModuleResult.isCollapsed then UseTokensModuleResult.Size.Size_1800 else UseTokensModuleResult.Size.Size_100 * 64)
	end, {
		WithDefaultsModuleResult.isCollapsed,
		UseTokensModuleResult
	})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), WithDefaultsModuleResult (copy)
		return ReactModule.createBinding(if WithDefaultsModuleResult.isCollapsed then 1 else 0)
	end, { WithDefaultsModuleResult.isCollapsed })
	local RailWidth = UseContextResult.railWidth or UseMemoResult
	local CollapseProgress = UseContextResult.collapseProgress or UseMemoResult1
	local HasOnActivated: boolean = WithDefaultsModuleResult.onActivated ~= nil or WithDefaultsModuleResult.onRailActivated ~= nil
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: WithDefaultsModuleResult (copy)
		local OnActivatedFunction: () -> () = WithDefaultsModuleResult.onActivated
		
		if OnActivatedFunction ~= nil then
			OnActivatedFunction()
			
			return
		end
		local OnRailActivatedFunction: (any) -> () = WithDefaultsModuleResult.onRailActivated
		local Id = WithDefaultsModuleResult.id
		
		if OnRailActivatedFunction ~= nil and Id ~= nil then
			OnRailActivatedFunction(Id)
		end
	end, {
		WithDefaultsModuleResult.onActivated,
		WithDefaultsModuleResult.onRailActivated,
		WithDefaultsModuleResult.id
	})
	local Element = ReactModule.createElement(NavigationRailItemIconModule, {
		icon = if WithDefaultsModuleResult.isActive and WithDefaultsModuleResult.selectedIcon then WithDefaultsModuleResult.selectedIcon else WithDefaultsModuleResult.icon,
		isActive = WithDefaultsModuleResult.isActive,
		size = IconSizeModule.Medium,
		style = if WithDefaultsModuleResult.isActive then UseTokensModuleResult.Color.Content.Emphasis else UseTokensModuleResult.Color.Content.Default,
		testId = `{WithDefaultsModuleResult.testId}--icon`
	})
	local IndicatorRingModule, IndicatorRingModule2 = GetIndicatorRingModule(UseTokensModuleResult, UseContextResult.backgroundStyle or UseTokensModuleResult.Color.Common.NavigationBar, WithDefaultsModuleResult.indicator and WithDefaultsModuleResult.indicator.value, WithDefaultsModuleResult.collapsedLabels, WithDefaultsModuleResult.isActive, if HasOnActivated then UseStateResult else ControlStateModule.Default)
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, { tag = "col size-full-0 auto-y" }), {
		SectionHeader = ReactModule.createElement(SectionHeaderModule, {
			hasSectionPadding = true,
			hasDivider = WithDefaultsModuleResult.hasDivider,
			sectionTitle = WithDefaultsModuleResult.sectionTitle,
			isCompact = WithDefaultsModuleResult.isCollapsed,
			isTargetCollapsed = UseContextResult.isTargetCollapsed,
			testId = WithDefaultsModuleResult.testId,
			isHeld = NoIsCollapsed,
			heldWidth = UseContextResult.heldWidth,
			isResizing = UseContextResult.isResizing,
			collapseProgress = CollapseProgress,
			railWidth = RailWidth
		}),
		Row = ReactModule.createElement(MorphingRowModule, {
			railWidth = RailWidth,
			collapseProgress = CollapseProgress,
			showCaption = WithDefaultsModuleResult.collapsedLabels,
			showSideLabel = WithDefaultsModuleResult.collapsedLabels or not WithDefaultsModuleResult.isCollapsed,
			rowRef = UseRefResult,
			text = WithDefaultsModuleResult.text,
			icon = Element,
			indicator = WithDefaultsModuleResult.indicator,
			indicatorMask = IndicatorRingModule,
			indicatorPlate = IndicatorRingModule2,
			onStateChanged = UseStateResult2,
			isActive = WithDefaultsModuleResult.isActive,
			isResizing = UseContextResult.isResizing,
			onActivated = if HasOnActivated then UseResult else nil,
			testId = WithDefaultsModuleResult.testId
		}),
		Tooltip = ReactModule.createElement(NavigationRailTooltipModule, {
			title = WithDefaultsModuleResult.tooltipText or WithDefaultsModuleResult.text,
			anchorRef = UseRefResult,
			noLabel = WithDefaultsModuleResult.isCollapsed and not WithDefaultsModuleResult.collapsedLabels,
			isHovered = UseStateResult == ControlStateModule.Hover,
			testId = `{WithDefaultsModuleResult.testId}--tooltip`
		})
	})
end))