local whatsNew = script:FindFirstAncestor("WhatsNew")
local enumsModule = require(whatsNew.Enums)
local _ = require(whatsNew.Types)
local t = {
	isEntryInScopeSubtree = function(p1, p2, p3)
		local scopeId = p1.scopeId
		while scopeId ~= nil do
			if scopeId ~= p2 then
				local var1 = p3[scopeId]
				
				if var1 ~= nil then
					scopeId = var1.parentScopeId
					continue
				end
				return false
			end
			return true
		end
		return false
	end,
	isEntryExpired = function(p4, p5, p6)
		-- upvalues: enumsModule (ref)
		local var2
		if p4.publishedTime == nil then
			var2 = nil
		else
			local dateTime = DateTime.fromIsoDate(p4.publishedTime)
			var2 = if dateTime then dateTime.UnixTimestamp else nil
		end
		if var2 ~= nil and p6.currentTime < var2 then
			return true
		elseif p5 == enumsModule.TourType.Onboarding then
			return false
		elseif p4.disabledTime ~= nil then
			local dateTime = DateTime.fromIsoDate(p4.disabledTime)
			local var3 = if dateTime then dateTime.UnixTimestamp else nil
			
			return var3 == nil or var3 > p6.currentTime
		end
	end
}

local function _(p4, p5)
	-- upvalues: enumsModule (ref)
	return if p4 == enumsModule.TourType.Onboarding then p5.onboardingEligible else true
end

local _ = function(p4)
	return p4 ~= nil and p4 ~= ""
end

local _ = function(p4)
	local dateTime = DateTime.fromIsoDate(p4)
	
	return if dateTime then dateTime.UnixTimestamp else nil
end

function t.deriveEntryDisplay(p4, p5, p6)
	-- upvalues: t (ref), enumsModule (ref)
	local var2 = t.isEntryExpired(p4, p5, p6)
	local id = p6.storage[p4.id]
	local var3 = if id then id.seen else nil
	
	return {
		id = p4.id,
		scopeId = p4.scopeId,
		title = p4.title,
		text = p4.text,
		icon = p4.icon,
		enabled = p4.enabled,
		publishedTime = p4.publishedTime,
		disabledTime = p4.disabledTime,
		expired = var2,
		seen = var3,
		optOutCount = if id then id.optOutCount else 0,
		adopted = if id then id.adopted else false,
		toShow = p4.enabled and (not var2 and (var3 == nil and (if p5 == enumsModule.TourType.Onboarding then p6.onboardingEligible else true)))
	}
end

function t.getLabels(p4, p5)
	-- upvalues: enumsModule (ref)
	return if p5 == enumsModule.TourType.Onboarding then {
		title = p4.onboardingTitle or "",
		text = p4.onboardingText or ""
	} else {
		title = p4.updatesTitle or "",
		text = p4.updatesText or ""
	}
end

function t.hasLabels(p4)
	local title = p4.title
	local var2 = title ~= nil and title ~= ""
	
	if not var2 then
		local text = p4.text
		var2 = text ~= nil and text ~= ""
	end
	return var2
end

function t.countScopeSteps(p4)
	local var2 = 0
	
	for i, v in p4.tourTips do
		var2 += v.stepCount
	end
	return var2
end

return t