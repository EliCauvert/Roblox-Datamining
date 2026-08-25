local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local dashModule = require(genericAbuseReporting.Parent.Dash)
local _ = require(genericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local abuseCategoryModule = require(genericAbuseReporting.Enums.AbuseCategory)
local _ = require(genericAbuseReporting.Enums.AbuseVector)

return function(p0)
	-- upvalues: dashModule (ref), abuseCategoryModule (ref)
	local t = {}
	dashModule.forEach(p0.additionalReportTags or {}, function(p1)
		-- upvalues: t (ref)
		if not p1.tagKey or p1.tagKey == "" or (not p1.tagValue or p1.tagValue == "") then return end
		if t[p1.tagKey] == nil then
			t[p1.tagKey] = p1.tagValue
			
			return
		end
		t[p1.tagKey] ..= "," .. p1.tagValue
	end)
	
	return {
		abuseVector = p0.abuseVector,
		category = p0.formData.abuse_category or abuseCategoryModule.ABUSE_CATEGORY_INVALID,
		comment = p0.formData.free_comment or "",
		submitterId = p0.localPlayerUserId,
		targetIdStr = p0.targetIdStr,
		targetType = p0.abuseVector,
		custom = if next(t) ~= nil then nil else t
	}
end