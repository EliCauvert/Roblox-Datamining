local collectionService = game:GetService("CollectionService")
local parent = script:FindFirstAncestor("SponsoredTiles").Parent
local reactModule = require(parent.React)
local videoEndReason = require(parent.VideoUtils).AnalyticsEnums.VideoEndReason
local adsViewportAutoplayCandidateTagModule = require(script.Parent.AdsViewportAutoplayCandidateTag)

return function(value, p1)
	-- upvalues: reactModule (ref), collectionService (ref), adsViewportAutoplayCandidateTagModule (ref), videoEndReason (ref)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), value (ref), collectionService (copy), adsViewportAutoplayCandidateTagModule (copy), videoEndReason (copy)
		if not p1 then return end
		local current = value.current
		
		if current then
			collectionService:AddTag(current, adsViewportAutoplayCandidateTagModule)
			p1:onAdsCandidateRegistered(current)
			
			return function()
				-- upvalues: collectionService (copy), current (ref), adsViewportAutoplayCandidateTagModule (copy), p1 (copy), videoEndReason (copy)
				collectionService:RemoveTag(current, adsViewportAutoplayCandidateTagModule)
				p1:resetIfActiveInstance(current, videoEndReason.Unmounted)
			end
		end
	end, { p1, value })
end