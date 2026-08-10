local whatsNew = script:FindFirstAncestor("WhatsNew")
local enumsModule = require(whatsNew.Enums)
local _ = require(whatsNew.Types)
local t = {
	isEntryInScopeSubtree = function(p0, p1, p2) --[[ line: 27 ]]
		local scopeId = p0.scopeId
		while scopeId ~= nil do
			if scopeId ~= p1 then
				local var3 = p2[scopeId]
				
				if var3 ~= nil then
					scopeId = var3.parentScopeId
					continue
				end
				return false
			end
			return true
		end
		return false
	end,
	isEntryExpired = function(p3, p4, p5) --[[ line: 46 ]]
		-- upvalues: enumsModule (ref)
		local var5
		if p3.publishedTime == nil then
			var5 = nil
		else
			local dateTime = DateTime.fromIsoDate(p3.publishedTime)
			var5 = if dateTime then dateTime.UnixTimestamp else nil
		end
		if var5 ~= nil and p5.currentTime < var5 then
			return true
		elseif p4 == enumsModule.TourType.Onboarding then
			return false
		elseif p3.disabledTime ~= nil then
			local dateTime = DateTime.fromIsoDate(p3.disabledTime)
			local var7 = if dateTime then dateTime.UnixTimestamp else nil
			
			return var7 == nil or var7 > p5.currentTime
		end
	end
}

local function _(p6, p7) --[[ line: 11 | named "clientGatesPass" ]]
	-- upvalues: enumsModule (ref)
	return if p6 == enumsModule.TourType.Onboarding then p7.onboardingEligible else true
end

local _ = function(p8) --[[ line: 18 | named "isNonEmptyString" ]]
	return p8 ~= nil and p8 ~= ""
end

local _ = function(p9) --[[ line: 22 | named "isoDateToUnix" ]]
	local dateTime = DateTime.fromIsoDate(p9)
	
	return if dateTime then dateTime.UnixTimestamp else nil
end

function t.deriveEntryDisplay(p10, p11, p12) --[[ line: 74 ]]
	-- upvalues: t (ref), enumsModule (ref)
	local var9 = t.isEntryExpired(p10, p11, p12)
	local id = p12.storage[p10.id]
	local var10 = if id then id.seen else nil
	
	return {
		id = p10.id,
		scopeId = p10.scopeId,
		title = p10.title,
		text = p10.text,
		icon = p10.icon,
		enabled = p10.enabled,
		publishedTime = p10.publishedTime,
		disabledTime = p10.disabledTime,
		expired = var9,
		seen = var10,
		optOutCount = if id then id.optOutCount else 0,
		adopted = if id then id.adopted else false,
		toShow = p10.enabled and (not var9 and (var10 == nil and (if p11 == enumsModule.TourType.Onboarding then p12.onboardingEligible else true)))
	}
end

function t.getLabels(p13, p14) --[[ line: 102 ]]
	-- upvalues: enumsModule (ref)
	return if p14 == enumsModule.TourType.Onboarding then {
		title = p13.onboardingTitle or "",
		text = p13.onboardingText or ""
	} else {
		title = p13.updatesTitle or "",
		text = p13.updatesText or ""
	}
end

function t.hasLabels(p15) --[[ line: 116 ]]
	local title = p15.title
	local var11 = title ~= nil and title ~= ""
	
	if not var11 then
		local text = p15.text
		var11 = text ~= nil and text ~= ""
	end
	return var11
end

function t.countScopeSteps(p16) --[[ line: 120 ]]
	local var12 = 0
	
	for i, v in p16.tourTips do
		var12 += v.stepCount
	end
	return var12
end

return t