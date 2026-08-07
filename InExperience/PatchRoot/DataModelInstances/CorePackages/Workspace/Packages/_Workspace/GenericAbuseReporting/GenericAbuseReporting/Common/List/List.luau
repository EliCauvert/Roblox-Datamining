local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local fFlagAbuseReportMenuV2 = require(parent.SharedFlags).FFlagAbuseReportMenuV2
local view = foundationModule.View
local listContextModule = require(script.Parent.ListContext)

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 22 | named "List" ]]
	-- upvalues: reactModule (ref), view (ref), fFlagAbuseReportMenuV2 (ref), listContextModule (ref)
	return reactModule.createElement(view, {
		tag = if fFlagAbuseReportMenuV2 and p0.tag then p0.tag else "size-full-0 auto-y col",
		LayoutOrder = p0.layoutOrder,
		ref = p1
	}, {
		ListContext = reactModule.createElement(listContextModule.Provider, {
			value = {
				value = p0.value,
				onValueChanged = reactModule.useCallback(function(p2) --[[ line: 23 ]]
					-- upvalues: p0 (ref)
					p0.onValueChanged(p2)
				end, { p0.onValueChanged })
			}
		}, p0.children)
	})
end))