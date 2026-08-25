local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local flagsModule = require(foundation.Utility.Flags)
local _ = require(foundation.Enums.InputSize)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local listContextModule = require(script.Parent.ListContext)
local t = {
	testId = "--foundation-list",
	hasDivider = { hasDivider = true, isInset = true },
	isContained = { isContained = false, hasMargin = true }
}

return reactModule.memo(reactModule.forwardRef(function(p0, p1)
	-- upvalues: withDefaultsModule (ref), t (ref), flagsModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), listContextModule (ref)
	local var8 = withDefaultsModule(p0, t)
	local var9 = if flagsModule.FoundationListStableContextValue then if type(var8.hasDivider) == "boolean" then var8.hasDivider else var8.hasDivider.hasDivider else nil
	local var10 = 0
	
	if not flagsModule.FoundationListStableContextValue or var9 then
		reactModule.Children.forEach(var8.children, function(p2)
			-- upvalues: var10 (write)
			if p2 and p2.props and p2.props.LayoutOrder then
				var10 = math.max(var10, p2.props.LayoutOrder)
			end
		end)
	end
	local var11 = if type(var8.isContained) == "boolean" then var8.isContained else var8.isContained.isContained
	local var12 = if var11 then true elseif type(var8.isContained) == "table" then var8.isContained.hasMargin else true
	local var13 = if type(var8.hasDivider) == "boolean" then var8.hasDivider else var8.hasDivider.isInset
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var8, {
		tag = {
			["col size-full-0 auto-y"] = true,
			["stroke-default radius-large"] = var11
		},
		ref = p1
	}), {
		ListContext = reactModule.createElement(listContextModule.Provider, {
			value = if flagsModule.FoundationListStableContextValue then if flagsModule.FoundationListStableContextValue then reactModule.useMemo(function()
				-- upvalues: var8 (ref), var11 (ref), var13 (ref), var12 (ref), var10 (write)
				return {
					hasDivider = var8.hasDivider,
					isContained = var11,
					isInset = var13,
					hasMargin = var12,
					lastLayoutOrder = var10,
					size = var8.size,
					testId = var8.testId
				}
			end, {
				var9, var11, var13, var12, var10, var8.size, var8.testId
			}) else nil else {
				hasDivider = var8.hasDivider,
				isContained = var11,
				isInset = var13,
				hasMargin = var12,
				lastLayoutOrder = var10,
				size = var8.size,
				testId = var8.testId
			}
		}, var8.children)
	})
end))