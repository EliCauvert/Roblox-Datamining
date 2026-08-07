local whatsNew = script:FindFirstAncestor("WhatsNew")
local enumsModule = require(whatsNew.Enums)
local _ = require(whatsNew.Types)
local t = {
	isEntryInScopeSubtree = function(p0, p1, p2) --[[ line: 29 ]]
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
	isEntryExpired = function(p3, p4, p5, p6) --[[ line: 48 ]]
		-- upvalues: enumsModule (ref)
		if p4 == enumsModule.TourType.Onboarding then
			return false
		elseif p3.disableTime ~= nil then
			local dateTime = DateTime.fromIsoDate(p3.disableTime)
			local var5 = if dateTime then dateTime.UnixTimestamp else nil
			
			if var5 ~= nil and var5 <= p5.currentTime then
				return true
			elseif p3.publishedTime ~= nil then
				local dateTime = DateTime.fromIsoDate(p3.publishedTime)
				local var7 = if dateTime then dateTime.UnixTimestamp else nil
				
				return var7 == nil or var7 + p6.updateEntryDuration * 86400 > p5.currentTime
			end
		end
	end
}

local function _(p7, p8) --[[ line: 13 | named "clientGatesPass" ]]
	-- upvalues: enumsModule (ref)
	return if p7 == enumsModule.TourType.Onboarding then p8.grandfathered ~= true else true
end

local _ = function(p9) --[[ line: 20 | named "isNonEmptyString" ]]
	return p9 ~= nil and p9 ~= ""
end

local _ = function(p10) --[[ line: 24 | named "isoDateToUnix" ]]
	local dateTime = DateTime.fromIsoDate(p10)
	
	return if dateTime then dateTime.UnixTimestamp else nil
end

function t.deriveEntryDisplay(p11, p12, p13, p14) --[[ line: 81 ]]
	-- upvalues: t (ref), enumsModule (ref)
	local var11
	local var9 = t.isEntryExpired(p11, p12, p13, p14)
	local id = p13.storage[p11.id]
	local var10 = if id then id.seen else nil
	local meta = p13.meta
	
	if p12 == enumsModule.TourType.Onboarding then
		var11 = meta.grandfathered ~= true
		var11 = nil
	else
		var11 = true
	end
	return {
		id = p11.id,
		scopeId = p11.scopeId,
		title = p11.title,
		text = p11.text,
		icon = p11.icon,
		enabled = p11.enabled,
		publishedTime = p11.publishedTime,
		disableTime = p11.disableTime,
		expired = var9,
		seen = var10,
		optOutCount = if id then id.optOutCount else 0,
		adopted = if id then id.adopted else false,
		toShow = p11.enabled and (not var9 and (var10 == nil and var11))
	}
end

function t.getLabels(p15, p16) --[[ line: 110 ]]
	-- upvalues: enumsModule (ref)
	return if p16 == enumsModule.TourType.Onboarding then {
		title = p15.onboardingTitle or "",
		text = p15.onboardingText or ""
	} else {
		title = p15.updatesTitle or "",
		text = p15.updatesText or ""
	}
end

function t.hasLabels(p17) --[[ line: 124 ]]
	local title = p17.title
	local var12 = title ~= nil and title ~= ""
	
	if not var12 then
		local text = p17.text
		var12 = text ~= nil and text ~= ""
	end
	return var12
end

function t.countScopeSteps(p18) --[[ line: 128 ]]
	local var13 = 0
	
	for i, v in p18.tourTips do
		var13 += v.stepCount
	end
	return var13
end

return t