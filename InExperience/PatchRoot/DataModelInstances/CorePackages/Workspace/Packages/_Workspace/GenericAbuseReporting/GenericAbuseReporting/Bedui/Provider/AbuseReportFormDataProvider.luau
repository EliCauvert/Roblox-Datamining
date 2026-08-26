local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local reactModule = require(parent.React)
local _ = require(genericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local abuseReportFormDataContextModule = require(genericAbuseReporting.Bedui.Provider.AbuseReportFormDataContext)
local fFlagAddThumbnailSelectorReport = require(parent.SharedFlags).FFlagAddThumbnailSelectorReport

return function(p1)
	-- upvalues: reactModule (ref), abuseReportFormDataContextModule (ref), fFlagAddThumbnailSelectorReport (ref)
	local var1, var2 = reactModule.useState({})
	local var3, var4 = reactModule.useState({})
	
	return reactModule.createElement(abuseReportFormDataContextModule.Provider, {
		value = {
			formData = var1,
			updateForm = reactModule.useCallback(function(p2, p3)
				-- upvalues: var2 (ref)
				var2(function(p4)
					-- upvalues: p2 (ref), p3 (ref)
					local cloned = table.clone(p4)
					cloned[p2] = p3
					
					return cloned
				end)
			end, {}),
			custom = p1.custom,
			additionalReportTags = if fFlagAddThumbnailSelectorReport then var3 else nil,
			updateAdditionalReportTags = if fFlagAddThumbnailSelectorReport then reactModule.useCallback(function(p2, p3)
				-- upvalues: var4 (ref)
				var4(function(p4)
					-- upvalues: p2 (ref), p3 (ref)
					local cloned = table.clone(p4)
					cloned[p2] = p3
					
					return cloned
				end)
			end, {}) else nil
		}
	}, p1.children)
end