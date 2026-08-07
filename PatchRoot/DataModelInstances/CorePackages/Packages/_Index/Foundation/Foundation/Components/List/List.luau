-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:05 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
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

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 31 | named "List" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), listContextModule (ref)
	local var7 = withDefaultsModule(p0, t)
	local var8 = 0
	reactModule.Children.forEach(var7.children, function(p2) --[[ line: 35 ]]
		-- upvalues: var8 (write)
		if p2 and p2.props and p2.props.LayoutOrder then
			var8 = math.max(var8, p2.props.LayoutOrder)
		end
	end)
	local var9 = if type(var7.isContained) == "boolean" then var7.isContained else var7.isContained.isContained
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var7, {
		tag = {
			["col size-full-0 auto-y"] = true,
			["stroke-default radius-large"] = var9
		},
		ref = p1
	}), {
		ListContext = reactModule.createElement(listContextModule.Provider, {
			value = {
				hasDivider = var7.hasDivider,
				isContained = var9,
				isInset = if type(var7.hasDivider) == "boolean" then var7.hasDivider else var7.hasDivider.isInset,
				hasMargin = if var9 then true elseif type(var7.isContained) == "table" then var7.isContained.hasMargin else true,
				lastLayoutOrder = var8,
				size = var7.size,
				testId = var7.testId
			}
		}, var7.children)
	})
end))