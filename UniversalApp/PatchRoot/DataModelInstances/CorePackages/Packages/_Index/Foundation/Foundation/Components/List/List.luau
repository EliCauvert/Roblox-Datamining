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

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), flagsModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), listContextModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = if flagsModule.FoundationListStableContextValue then if type(var1.hasDivider) == "boolean" then var1.hasDivider else var1.hasDivider.hasDivider else nil
	local var3 = 0
	
	if not flagsModule.FoundationListStableContextValue or var2 then
		reactModule.Children.forEach(var1.children, function(p3)
			-- upvalues: var3 (write)
			if p3 and p3.props and p3.props.LayoutOrder then
				var3 = math.max(var3, p3.props.LayoutOrder)
			end
		end)
	end
	local var4 = if type(var1.isContained) == "boolean" then var1.isContained else var1.isContained.isContained
	local var5 = if var4 then true elseif type(var1.isContained) == "table" then var1.isContained.hasMargin else true
	local var6 = if type(var1.hasDivider) == "boolean" then var1.hasDivider else var1.hasDivider.isInset
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, {
		tag = {
			["col size-full-0 auto-y"] = true,
			["stroke-default radius-large"] = var4
		},
		ref = p2
	}), {
		ListContext = reactModule.createElement(listContextModule.Provider, {
			value = if flagsModule.FoundationListStableContextValue then if flagsModule.FoundationListStableContextValue then reactModule.useMemo(function()
				-- upvalues: var1 (ref), var4 (ref), var6 (ref), var5 (ref), var3 (write)
				return {
					hasDivider = var1.hasDivider,
					isContained = var4,
					isInset = var6,
					hasMargin = var5,
					lastLayoutOrder = var3,
					size = var1.size,
					testId = var1.testId
				}
			end, {
				var2, var4, var6, var5, var3, var1.size, var1.testId
			}) else nil else {
				hasDivider = var1.hasDivider,
				isContained = var4,
				isInset = var6,
				hasMargin = var5,
				lastLayoutOrder = var3,
				size = var1.size,
				testId = var1.testId
			}
		}, var1.children)
	})
end))