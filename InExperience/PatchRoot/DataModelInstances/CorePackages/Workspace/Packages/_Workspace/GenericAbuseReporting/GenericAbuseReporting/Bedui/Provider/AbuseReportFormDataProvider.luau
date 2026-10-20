local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local ReactModule = require(Parent.React)
local _ = require(GenericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local AbuseReportFormDataContextModule = require(GenericAbuseReporting.Bedui.Provider.AbuseReportFormDataContext)
local FFlagAddThumbnailSelectorReport = require(Parent.SharedFlags).FFlagAddThumbnailSelectorReport

return function(p1)
	-- upvalues: ReactModule (copy), AbuseReportFormDataContextModule (copy), FFlagAddThumbnailSelectorReport (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState({})
	local UseResult = ReactModule.useCallback(function(p2, p3)
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(function(Tbl)
			-- upvalues: p2 (copy), p3 (copy)
			local Copy = table.clone(Tbl)
			Copy[p2] = p3
			
			return Copy
		end)
	end, {})
	
	return ReactModule.createElement(AbuseReportFormDataContextModule.Provider, {
		value = {
			formData = UseStateResult,
			updateForm = ReactModule.useCallback(function(p2, p3)
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(function(Tbl)
					-- upvalues: p2 (copy), p3 (copy)
					local Copy = table.clone(Tbl)
					Copy[p2] = p3
					
					return Copy
				end)
			end, {}),
			custom = p1.custom,
			additionalReportTags = if FFlagAddThumbnailSelectorReport then UseStateResult1 else nil,
			updateAdditionalReportTags = if FFlagAddThumbnailSelectorReport then UseResult else nil
		}
	}, p1.children)
end