local Parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local ReactModule = require(Parent.React)
local FFlagAbuseReportMenuV2 = require(Parent.SharedFlags).FFlagAbuseReportMenuV2
local View = require(Parent.Foundation).View
local ListContextModule = require(script.Parent.ListContext)

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: ReactModule (copy), View (copy), FFlagAbuseReportMenuV2 (copy), ListContextModule (copy)
	return ReactModule.createElement(View, {
		tag = if FFlagAbuseReportMenuV2 and p1.tag then p1.tag else "size-full-0 auto-y col",
		LayoutOrder = p1.layoutOrder,
		ref = Ref
	}, {
		ListContext = ReactModule.createElement(ListContextModule.Provider, {
			value = {
				value = p1.value,
				onValueChanged = ReactModule.useCallback(function(p2)
					-- upvalues: p1 (copy)
					p1.onValueChanged(p2)
				end, { p1.onValueChanged })
			}
		}, p1.children)
	})
end))