local universalFeatureRestrictions = script:FindFirstAncestor("UniversalFeatureRestrictions")
local _ = require(universalFeatureRestrictions.Common.AbuseVector)
local _ = require(universalFeatureRestrictions.Parent.ModerationCommon.Types)
local showFeatureRestrictionModule = require(universalFeatureRestrictions.Utils.showFeatureRestriction)
local showFeatureRestrictionDirectModule = require(universalFeatureRestrictions.Utils.showFeatureRestrictionDirect)

local function _(p1)
	return type(p1) == "string" and p1 ~= ""
end

local function buildEndDate(p1)
	if p1.type == "nudge" then
		return "", 0
	end
	local timeoutStartTime = p1.timeoutStartTime
	local timeoutDurationSeconds = p1.timeoutDurationSeconds
	
	if not timeoutStartTime or timeoutStartTime == "" or (not timeoutDurationSeconds or timeoutDurationSeconds < 0) then
		return nil, nil
	elseif timeoutDurationSeconds == 0 then
		return "", timeoutDurationSeconds
	end
	local dateTime = DateTime.fromIsoDate(timeoutStartTime)
	
	if dateTime then
		return DateTime.fromUnixTimestamp(dateTime.UnixTimestamp + timeoutDurationSeconds):ToIsoDate(), timeoutDurationSeconds
	end
	return nil, nil
end

local function buildModerationDetail(p1, p2, p3)
	return {
		punishedUserId = 0,
		interventionId = "",
		punishmentId = 0,
		messageToUser = "",
		verificationCategory = "",
		consequenceTransparencyMessage = "",
		showAppealsProcessLink = false,
		isForeshadowingConsequenceEnabled = false,
		violation = nil,
		acknowledgeable = false,
		showUGCAvatarGuidelinesLink = false,
		labelTranslationKey = "",
		title = p1.title,
		body = p1.body,
		punishmentTypeDescription = p1.type,
		beginDate = p1.timeoutStartTime or "",
		endDate = p2,
		badUtterances = {},
		context = {},
		duration = p3
	}
end

return function(p1, p2, p3)
	-- upvalues: showFeatureRestrictionModule (ref), buildEndDate (ref), showFeatureRestrictionDirectModule (ref), buildModerationDetail (ref)
	local decisionEventId
	if not p2.acknowledgeable and (p2.type == "nudge" or p2.type == "timeout") then
		decisionEventId = p2.decisionEventId
		
		if type(decisionEventId) == "string" and decisionEventId ~= "" then
			decisionEventId = p2.title
			
			if type(decisionEventId) == "string" and decisionEventId ~= "" then
				decisionEventId = p2.body
				
				if not (type(decisionEventId) == "string" and decisionEventId ~= "") then
					showFeatureRestrictionModule(p1, p3)
					
					return
				end
				var6, decisionEventId = buildEndDate(p2)
				
				if var6 == nil or decisionEventId == nil then
					showFeatureRestrictionModule(p1, p3)
					
					return
				end
				local cloned = table.clone(p3 or {})
				cloned.analyticsEventId = p2.decisionEventId
				showFeatureRestrictionDirectModule(p1, buildModerationDetail(p2, var6, decisionEventId), cloned)
			end
		end
	end
end