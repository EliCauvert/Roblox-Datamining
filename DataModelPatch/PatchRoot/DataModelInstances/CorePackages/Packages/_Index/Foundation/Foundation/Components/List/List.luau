local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
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
	-- upvalues: WithDefaultsModule (copy), config (copy), ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy), ListContextModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local Largest = 0
	ReactModule.Children.forEach(WithDefaultsModuleResult.children, function(p2)
		-- upvalues: Largest (ref)
		if p2 and p2.props and p2.props.LayoutOrder then
			Largest = math.max(Largest, p2.props.LayoutOrder)
		end
	end)
	local IsContained = if type(WithDefaultsModuleResult.isContained) == "boolean" then WithDefaultsModuleResult.isContained else WithDefaultsModuleResult.isContained.isContained
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = {
			["col size-full-0 auto-y"] = true,
			["stroke-default radius-large"] = IsContained
		},
		ref = Ref
	}), {
		ListContext = ReactModule.createElement(ListContextModule.Provider, {
			value = {
				hasDivider = WithDefaultsModuleResult.hasDivider,
				isContained = IsContained,
				isInset = if type(WithDefaultsModuleResult.hasDivider) == "boolean" then WithDefaultsModuleResult.hasDivider else WithDefaultsModuleResult.hasDivider.isInset,
				hasMargin = if IsContained then true else type(WithDefaultsModuleResult.isContained) ~= "table" or WithDefaultsModuleResult.isContained.hasMargin,
				lastLayoutOrder = Largest,
				size = WithDefaultsModuleResult.size,
				testId = WithDefaultsModuleResult.testId
			}
		}, WithDefaultsModuleResult.children)
	})
end))