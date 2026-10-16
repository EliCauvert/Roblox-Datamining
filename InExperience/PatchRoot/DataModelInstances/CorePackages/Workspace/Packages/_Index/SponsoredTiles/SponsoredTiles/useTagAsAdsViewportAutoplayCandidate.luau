local CollectionService = game:GetService("CollectionService")
local Parent = script:FindFirstAncestor("SponsoredTiles").Parent
local ReactModule = require(Parent.React)
local VideoEndReason = require(Parent.VideoUtils).AnalyticsEnums.VideoEndReason
local AdsViewportAutoplayCandidateTagModule = require(script.Parent.AdsViewportAutoplayCandidateTag)

return function(p1, p2) --[[ Line: 14 | Named "useTagAsAdsViewportAutoplayCandidate" ]]
	-- upvalues: ReactModule (copy), CollectionService (copy), AdsViewportAutoplayCandidateTagModule (copy), VideoEndReason (copy)
	ReactModule.useEffect(function() --[[ Line: 18 ]]
		-- upvalues: p2 (copy), p1 (copy), CollectionService (upval), AdsViewportAutoplayCandidateTagModule (upval), VideoEndReason (upval)
		if not p2 then return end
		local Current = p1.current
		
		if not Current then return end
		CollectionService:AddTag(Current, AdsViewportAutoplayCandidateTagModule)
		p2:onAdsCandidateRegistered(Current)
		
		return function() --[[ Line: 31 ]]
			-- upvalues: CollectionService (upval), Current (copy), AdsViewportAutoplayCandidateTagModule (upval), p2 (upval), VideoEndReason (upval)
			CollectionService:RemoveTag(Current, AdsViewportAutoplayCandidateTagModule)
			p2:resetIfActiveInstance(Current, VideoEndReason.Unmounted)
		end
	end, { p2, p1 })
end