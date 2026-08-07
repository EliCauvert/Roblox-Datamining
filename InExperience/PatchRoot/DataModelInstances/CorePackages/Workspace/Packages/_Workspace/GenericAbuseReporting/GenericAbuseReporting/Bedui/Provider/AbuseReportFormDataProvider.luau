local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local reactModule = require(parent.React)
local _ = require(genericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local abuseReportFormDataContextModule = require(genericAbuseReporting.Bedui.Provider.AbuseReportFormDataContext)
local fFlagAddThumbnailSelectorReport = require(parent.SharedFlags).FFlagAddThumbnailSelectorReport

return function(p0) --[[ line: 19 | named "AbuseReportFormDataProvider" ]]
	-- upvalues: reactModule (ref), abuseReportFormDataContextModule (ref), fFlagAddThumbnailSelectorReport (ref)
	local var3, var4 = reactModule.useState({})
	local var5, var6 = reactModule.useState({})
	
	return reactModule.createElement(abuseReportFormDataContextModule.Provider, {
		value = {
			formData = var3,
			updateForm = reactModule.useCallback(function(p1, p2) --[[ line: 23 ]]
				-- upvalues: var4 (ref)
				var4(function(p3) --[[ line: 24 ]]
					-- upvalues: p1 (ref), p2 (ref)
					local cloned = table.clone(p3)
					cloned[p1] = p2
					
					return cloned
				end)
			end, {}),
			custom = p0.custom,
			additionalReportTags = if fFlagAddThumbnailSelectorReport then var5 else nil,
			updateAdditionalReportTags = if fFlagAddThumbnailSelectorReport then reactModule.useCallback(function(p4, p5) --[[ line: 31 ]]
				-- upvalues: var6 (ref)
				var6(function(p6) --[[ line: 32 ]]
					-- upvalues: p4 (ref), p5 (ref)
					local cloned = table.clone(p6)
					cloned[p4] = p5
					
					return cloned
				end)
			end, {}) else nil
		}
	}, p0.children)
end