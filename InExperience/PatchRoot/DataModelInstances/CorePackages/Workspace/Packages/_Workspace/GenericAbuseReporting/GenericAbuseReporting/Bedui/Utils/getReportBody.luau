local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local dashModule = require(genericAbuseReporting.Parent.Dash)
local _ = require(genericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local abuseCategoryModule = require(genericAbuseReporting.Enums.AbuseCategory)
local _ = require(genericAbuseReporting.Enums.AbuseVector)

return function(p1)
	-- upvalues: dashModule (ref), abuseCategoryModule (ref)
	local t = {}
	dashModule.forEach(p1.additionalReportTags or {}, function(p2)
		-- upvalues: t (ref)
		if not p2.tagKey or p2.tagKey == "" or (not p2.tagValue or p2.tagValue == "") then return end
		if t[p2.tagKey] == nil then
			t[p2.tagKey] = p2.tagValue
			
			return
		end
		t[p2.tagKey] ..= "," .. p1.tagValue
	end)
	
	return {
		abuseVector = p1.abuseVector,
		category = p1.formData.abuse_category or abuseCategoryModule.ABUSE_CATEGORY_INVALID,
		comment = p1.formData.free_comment or "",
		submitterId = p1.localPlayerUserId,
		targetIdStr = p1.targetIdStr,
		targetType = p1.abuseVector,
		custom = if next(t) ~= nil then nil else t
	}
end