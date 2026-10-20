local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local FlagsModule = require(Foundation.Utility.Flags)
local _ = require(Foundation.Enums.InputSize)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local ListContextModule = require(script.Parent.ListContext)
local config = {
	testId = "--foundation-list",
	hasDivider = { hasDivider = true, isInset = true },
	isContained = { isContained = false, hasMargin = true }
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), FlagsModule (copy), ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy), ListContextModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local HasDivider = if FlagsModule.FoundationListStableContextValue then if type(WithDefaultsModuleResult.hasDivider) == "boolean" then WithDefaultsModuleResult.hasDivider else WithDefaultsModuleResult.hasDivider.hasDivider else nil
	local Largest = 0
	
	if not FlagsModule.FoundationListStableContextValue or HasDivider then
		ReactModule.Children.forEach(WithDefaultsModuleResult.children, function(p2)
			-- upvalues: Largest (ref)
			if p2 and p2.props and p2.props.LayoutOrder then
				Largest = math.max(Largest, p2.props.LayoutOrder)
			end
		end)
	end
	local IsContained = if type(WithDefaultsModuleResult.isContained) == "boolean" then WithDefaultsModuleResult.isContained else WithDefaultsModuleResult.isContained.isContained
	local IsNotTable = if IsContained then true else type(WithDefaultsModuleResult.isContained) ~= "table" or WithDefaultsModuleResult.isContained.hasMargin
	local HasDivider1 = if type(WithDefaultsModuleResult.hasDivider) == "boolean" then WithDefaultsModuleResult.hasDivider else WithDefaultsModuleResult.hasDivider.isInset
	local UseMemoResult = if FlagsModule.FoundationListStableContextValue then ReactModule.useMemo(function()
		-- upvalues: WithDefaultsModuleResult (copy), IsContained (copy), HasDivider1 (copy), IsNotTable (copy), Largest (ref)
		return {
			hasDivider = WithDefaultsModuleResult.hasDivider,
			isContained = IsContained,
			isInset = HasDivider1,
			hasMargin = IsNotTable,
			lastLayoutOrder = Largest,
			size = WithDefaultsModuleResult.size,
			testId = WithDefaultsModuleResult.testId
		}
	end, {
		HasDivider, IsContained, HasDivider1, IsNotTable, Largest,
		WithDefaultsModuleResult.size, WithDefaultsModuleResult.testId
	}) else nil
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = {
			["col size-full-0 auto-y"] = true,
			["stroke-default radius-large"] = IsContained
		},
		ref = Ref
	}), {
		ListContext = ReactModule.createElement(ListContextModule.Provider, {
			value = if FlagsModule.FoundationListStableContextValue then UseMemoResult else {
				hasDivider = WithDefaultsModuleResult.hasDivider,
				isContained = IsContained,
				isInset = HasDivider1,
				hasMargin = IsNotTable,
				lastLayoutOrder = Largest,
				size = WithDefaultsModuleResult.size,
				testId = WithDefaultsModuleResult.testId
			}
		}, WithDefaultsModuleResult.children)
	})
end))