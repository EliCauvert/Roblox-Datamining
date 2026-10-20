local UniversalFeatureRestrictions = script:FindFirstAncestor("UniversalFeatureRestrictions")
local _ = require(UniversalFeatureRestrictions.Common.AbuseVector)
local _ = require(UniversalFeatureRestrictions.Parent.ModerationCommon.Types)
local ShowFeatureRestrictionModule = require(UniversalFeatureRestrictions.Utils.showFeatureRestriction)
local ShowFeatureRestrictionDirectModule = require(UniversalFeatureRestrictions.Utils.showFeatureRestrictionDirect)

local function _(p1): boolean
	return type(p1) == "string" and p1 ~= ""
end

local function buildEndDate(p1)
	if p1.type == "nudge" then
		return "", 0
	end
	local TimeoutStartTime = p1.timeoutStartTime
	local TimeoutDurationSeconds: number = p1.timeoutDurationSeconds
	
	if not TimeoutStartTime or TimeoutStartTime == "" or not TimeoutDurationSeconds or TimeoutDurationSeconds < 0 then
		return nil, nil
	elseif TimeoutDurationSeconds == 0 then
		return "", TimeoutDurationSeconds
	else
		local _DateTime = DateTime.fromIsoDate(TimeoutStartTime)
		
		if _DateTime then
			return DateTime.fromUnixTimestamp(_DateTime.UnixTimestamp + TimeoutDurationSeconds):ToIsoDate(), TimeoutDurationSeconds
		else
			return nil, nil
		end
	end
end

local function buildModerationDetail(ModerationDetail, EndDate, Duration)
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
		title = ModerationDetail.title,
		body = ModerationDetail.body,
		punishmentTypeDescription = ModerationDetail.type,
		beginDate = ModerationDetail.timeoutStartTime or "",
		endDate = EndDate,
		badUtterances = {},
		context = {},
		duration = Duration
	}
end

return function(p1, ModerationDetail, p2)
	-- upvalues: ShowFeatureRestrictionModule (copy), buildEndDate (copy), ShowFeatureRestrictionDirectModule (copy), buildModerationDetail (copy)
	if not ModerationDetail.acknowledgeable and (ModerationDetail.type == "nudge" or ModerationDetail.type == "timeout") then
		local DecisionEventId = ModerationDetail.decisionEventId
		
		if type(DecisionEventId) == "string" and DecisionEventId ~= "" then
			local Title = ModerationDetail.title
			
			if type(Title) == "string" and Title ~= "" then
				local Body = ModerationDetail.body
				
				if type(Body) == "string" and Body ~= "" then
					local EndDate, EndDate2 = buildEndDate(ModerationDetail)
					
					if EndDate == nil or EndDate2 == nil then
						ShowFeatureRestrictionModule(p1, p2)
						
						return
					else
						local Copy = table.clone(p2 or {})
						Copy.analyticsEventId = ModerationDetail.decisionEventId
						ShowFeatureRestrictionDirectModule(p1, buildModerationDetail(ModerationDetail, EndDate, EndDate2), Copy)
						
						return
					end
				end
			end
		end
	end
	ShowFeatureRestrictionModule(p1, p2)
end