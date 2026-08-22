local collectionService = game:GetService("CollectionService")
local videoUtils = script:FindFirstAncestor("VideoUtils")
local parent = videoUtils.Parent
local reactModule = require(parent.React)
local _ = require(script.Parent.FeedVideoPlaybackContext)
local videoEndReason = require(videoUtils.Analytics.Enums).VideoEndReason
local viewportAutoplayCandidateTagModule = require(script.Parent.ViewportAutoplayCandidateTag)
local fFlagLuaAppTileVideoCandidateOnly = require(parent.SharedFlags).FFlagLuaAppTileVideoCandidateOnly
local fFlagLuaAppFixHiddenTileVideoCleanup = require(parent.SharedFlags).FFlagLuaAppFixHiddenTileVideoCleanup
local fFlagLuaAppVideoAutoplayFeedElection = require(parent.SharedFlags).FFlagLuaAppVideoAutoplayFeedElection
local fFlagLuaAppVideoAutoplayElectOnNewCandidateModule = require(script.Parent.FFlagLuaAppVideoAutoplayElectOnNewCandidate)

return function(value, p0, p1, p2) --[[ line: 19 | named "useTagAsViewportAutoplayCandidate" ]]
	-- upvalues: reactModule (ref), fFlagLuaAppTileVideoCandidateOnly (ref), fFlagLuaAppFixHiddenTileVideoCleanup (ref), collectionService (ref), viewportAutoplayCandidateTagModule (ref), fFlagLuaAppVideoAutoplayFeedElection (ref), fFlagLuaAppVideoAutoplayElectOnNewCandidateModule (ref), videoEndReason (ref)
	local var5 = if p0 then p0.viewportVideoAutoplayController else nil
	reactModule.useEffect(function() --[[ line: 30 ]]
		-- upvalues: var5 (ref), fFlagLuaAppTileVideoCandidateOnly (copy), p1 (ref), fFlagLuaAppFixHiddenTileVideoCleanup (copy), p2 (ref), value (ref), collectionService (copy), viewportAutoplayCandidateTagModule (copy), fFlagLuaAppVideoAutoplayFeedElection (copy), fFlagLuaAppVideoAutoplayElectOnNewCandidateModule (copy), videoEndReason (copy)
		if not var5 then return end
		if fFlagLuaAppTileVideoCandidateOnly and not p1 then return end
		if fFlagLuaAppFixHiddenTileVideoCleanup and p2 then return end
		local current = value.current
		
		if not current then return end
		collectionService:AddTag(current, viewportAutoplayCandidateTagModule)
		
		if fFlagLuaAppVideoAutoplayFeedElection and (var5.electOnNewCandidate or fFlagLuaAppVideoAutoplayElectOnNewCandidateModule) then
			var5:onCandidateRegistered(current)
		end
		return function() --[[ line: 60 ]]
			-- upvalues: collectionService (copy), current (ref), viewportAutoplayCandidateTagModule (copy), var5 (copy), videoEndReason (copy)
			collectionService:RemoveTag(current, viewportAutoplayCandidateTagModule)
			var5:resetIfActiveInstance(current, videoEndReason.Unmounted)
		end
	end, {
		var5,
		value,
		if fFlagLuaAppTileVideoCandidateOnly then p1 else nil,
		if fFlagLuaAppFixHiddenTileVideoCleanup then p2 else nil
	})
end