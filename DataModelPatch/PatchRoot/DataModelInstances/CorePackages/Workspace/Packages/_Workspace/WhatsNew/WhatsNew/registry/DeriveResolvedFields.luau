local WhatsNew = script:FindFirstAncestor("WhatsNew")
local EnumsModule = require(WhatsNew.Enums)
local _ = require(WhatsNew.Types)
local TourTipCtaAccessModule = require(WhatsNew.TourTipCtaAccess)

local function _(p1): boolean
	return p1 ~= nil and p1 ~= ""
end

local _ = function(p1)
	local _DateTime = DateTime.fromIsoDate(p1)
	
	return _DateTime and _DateTime.UnixTimestamp or nil
end

local function isEntryExpired(p1, Onboarding, p2, p3): boolean
	-- upvalues: EnumsModule (copy)
	if Onboarding == EnumsModule.TourType.Onboarding then
		return false
	end
	if p1.disableTime ~= nil then
		local _DateTime = DateTime.fromIsoDate(p1.disableTime)
		local UnixTimestamp = _DateTime and _DateTime.UnixTimestamp or nil
		
		if UnixTimestamp ~= nil and UnixTimestamp <= p2.currentTime then
			return true
		end
	end
	if p1.publishedTime ~= nil then
		local _DateTime = DateTime.fromIsoDate(p1.publishedTime)
		local UnixTimestamp = _DateTime and _DateTime.UnixTimestamp or nil
		
		if UnixTimestamp ~= nil and UnixTimestamp + p3.updateEntryDuration * 86400 <= p2.currentTime then
			return true
		end
	end
	return false
end

local function countScopeSteps(Scope): number
	-- upvalues: TourTipCtaAccessModule (copy), EnumsModule (copy), countScopeSteps (copy)
	local NewStepCount = 0
	
	for _, tourTip in Scope.tourTips do
		local WrapResult = TourTipCtaAccessModule.wrap(tourTip.cta)
		
		if WrapResult:getKind() == EnumsModule.TourTipCtaKind.Nested then
			NewStepCount += countScopeSteps(WrapResult:getScope()) + 1
		else
			NewStepCount += tourTip.stepCount
		end
	end
	return NewStepCount
end

return {
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
	isEntryExpired = isEntryExpired,
	deriveEntryDisplay = function(p3, p4, p5, p6)
		-- upvalues: isEntryExpired (copy)
		local IsEntryExpired = isEntryExpired(p3, p4, p5, p6)
		local StorageEntry = p5.storage[p3.id]
		
		return {
			id = p3.id,
			scopeId = p3.scopeId,
			title = p3.title,
			text = p3.text,
			icon = p3.icon,
			enabled = p3.enabled,
			publishedTime = p3.publishedTime,
			disableTime = p3.disableTime,
			expired = IsEntryExpired,
			seen = if StorageEntry then StorageEntry.seen else nil,
			optOutCount = if StorageEntry then StorageEntry.optOutCount else 0,
			adopted = if StorageEntry then StorageEntry.adopted else false,
			toShow = p3.enabled and not IsEntryExpired
		}
	end,
	getLabels = function(p3, Onboarding)
		-- upvalues: EnumsModule (copy)
		return if Onboarding == EnumsModule.TourType.Onboarding then {
			title = p3.onboardingTitle or "",
			text = p3.onboardingText or ""
		} else {
			title = p3.updatesTitle or "",
			text = p3.updatesText or ""
		}
	end,
	hasLabels = function(p3): boolean
		local Title = p3.title
		local IsNotTitleMatch: boolean = Title ~= nil and Title ~= ""
		
		if not IsNotTitleMatch then
			local Text = p3.text
			IsNotTitleMatch = Text ~= nil and Text ~= ""
		end
		return IsNotTitleMatch
	end,
	countScopeSteps = countScopeSteps
}