local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local fFlagAbuseReportMenuV2 = require(parent.SharedFlags).FFlagAbuseReportMenuV2
local view = foundationModule.View
local listContextModule = require(script.Parent.ListContext)

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: reactModule (ref), view (ref), fFlagAbuseReportMenuV2 (ref), listContextModule (ref)
	return reactModule.createElement(view, {
		tag = if fFlagAbuseReportMenuV2 and p1.tag then p1.tag else "size-full-0 auto-y col",
		LayoutOrder = p1.layoutOrder,
		ref = p2
	}, {
		ListContext = reactModule.createElement(listContextModule.Provider, {
			value = {
				value = p1.value,
				onValueChanged = reactModule.useCallback(function(p3)
					-- upvalues: p1 (ref)
					p1.onValueChanged(p3)
				end, { p1.onValueChanged })
			}
		}, p1.children)
	})
end))