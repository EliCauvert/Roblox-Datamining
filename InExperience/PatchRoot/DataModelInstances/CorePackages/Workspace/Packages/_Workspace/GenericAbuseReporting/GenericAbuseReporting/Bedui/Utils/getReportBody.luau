local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local DashModule = require(GenericAbuseReporting.Parent.Dash)
local _ = require(GenericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local AbuseCategoryModule = require(GenericAbuseReporting.Enums.AbuseCategory)
local _ = require(GenericAbuseReporting.Enums.AbuseVector)

return function(p1) --[[ Line: 28 ]]
	-- upvalues: DashModule (copy), AbuseCategoryModule (copy)
	local TagValues = {}
	DashModule.forEach(p1.additionalReportTags or {}, function(p2) --[[ Line: 38 ]]
		-- upvalues: TagValues (copy)
		if not p2.tagKey or p2.tagKey == "" or not p2.tagValue or p2.tagValue == "" then return end
		if TagValues[p2.tagKey] == nil then
			TagValues[p2.tagKey] = p2.tagValue
			
			return
		else
			TagValues[p2.tagKey] ..= "," .. p2.tagValue
		end
	end)
	
	return {
		abuseVector = p1.abuseVector,
		category = p1.formData.abuse_category or AbuseCategoryModule.ABUSE_CATEGORY_INVALID,
		comment = p1.formData.free_comment or "",
		submitterId = p1.localPlayerUserId,
		targetIdStr = p1.targetIdStr,
		targetType = p1.abuseVector,
		custom = if next(TagValues) == nil then nil else TagValues
	}
end