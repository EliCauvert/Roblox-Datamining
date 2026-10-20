local WhatsNew = script:FindFirstAncestor("WhatsNew")
local EnumsModule = require(WhatsNew.Enums)
local _ = require(WhatsNew.Types)

local function _(Onboarding, p1)
	-- upvalues: EnumsModule (copy)
	return Onboarding ~= EnumsModule.TourType.Onboarding or p1.onboardingEligible
end

local _ = function(p1): boolean
	return p1 ~= nil and p1 ~= ""
end

local _ = function(p1)
	local _DateTime = DateTime.fromIsoDate(p1)
	
	return _DateTime and _DateTime.UnixTimestamp or nil
end

local DeriveResolvedFieldsModule = {
	isEntryInScopeSubtree = function(p1, ScopeId, p2): boolean
		local ScopeId1 = p1.scopeId
		while ScopeId1 ~= nil do
			if ScopeId1 == ScopeId then
				return true
			end
			local v1 = p2[ScopeId1]
			
			if v1 == nil then
				return false
			end
			ScopeId1 = v1.parentScopeId
		end
		return false
	end,
	isEntryExpired = function(p3, Onboarding, p4): boolean
		-- upvalues: EnumsModule (copy)
		local UnixTimestamp = nil
		if p3.publishedTime == nil then
			UnixTimestamp = nil
		else
			local _DateTime = DateTime.fromIsoDate(p3.publishedTime)
			UnixTimestamp = _DateTime and _DateTime.UnixTimestamp or nil
		end
		if UnixTimestamp ~= nil and p4.currentTime < UnixTimestamp then
			return true
		end
		if Onboarding == EnumsModule.TourType.Onboarding then
			return false
		end
		if p3.disabledTime ~= nil then
			local _DateTime = DateTime.fromIsoDate(p3.disabledTime)
			local UnixTimestamp1 = _DateTime and _DateTime.UnixTimestamp or nil
			
			if UnixTimestamp1 ~= nil and UnixTimestamp1 <= p4.currentTime then
				return true
			end
		end
		return false
	end
}

function DeriveResolvedFieldsModule.deriveEntryDisplay(p3, Onboarding, p4)
	-- upvalues: DeriveResolvedFieldsModule (copy), EnumsModule (copy)
	local IsEntryExpired = DeriveResolvedFieldsModule.isEntryExpired(p3, Onboarding, p4)
	local StorageEntry = p4.storage[p3.id]
	local Seen = if StorageEntry then StorageEntry.seen else nil
	local IsNotOnboardingMatch = Onboarding ~= EnumsModule.TourType.Onboarding or p4.onboardingEligible
	
	return {
		id = p3.id,
		scopeId = p3.scopeId,
		title = p3.title,
		text = p3.text,
		icon = p3.icon,
		enabled = p3.enabled,
		publishedTime = p3.publishedTime,
		disabledTime = p3.disabledTime,
		expired = IsEntryExpired,
		seen = Seen,
		optOutCount = if StorageEntry then StorageEntry.optOutCount else 0,
		adopted = if StorageEntry then StorageEntry.adopted else false,
		toShow = p3.enabled and (not IsEntryExpired and (Seen == nil and IsNotOnboardingMatch))
	}
end

function DeriveResolvedFieldsModule.getLabels(p3, Onboarding)
	-- upvalues: EnumsModule (copy)
	return if Onboarding == EnumsModule.TourType.Onboarding then {
		title = p3.onboardingTitle or "",
		text = p3.onboardingText or ""
	} else {
		title = p3.updatesTitle or "",
		text = p3.updatesText or ""
	}
end

function DeriveResolvedFieldsModule.hasLabels(p3): boolean
	local Title = p3.title
	local IsNotTitleMatch: boolean = Title ~= nil and Title ~= ""
	
	if not IsNotTitleMatch then
		local Text = p3.text
		IsNotTitleMatch = Text ~= nil and Text ~= ""
	end
	return IsNotTitleMatch
end

function DeriveResolvedFieldsModule.countScopeSteps(p3): number
	local NewStepCount = 0
	
	for _, tourTip in p3.tourTips do
		NewStepCount += tourTip.stepCount
	end
	return NewStepCount
end

return DeriveResolvedFieldsModule