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

return function(value, p1, p2, p3)
	-- upvalues: reactModule (ref), fFlagLuaAppTileVideoCandidateOnly (ref), fFlagLuaAppFixHiddenTileVideoCleanup (ref), collectionService (ref), viewportAutoplayCandidateTagModule (ref), fFlagLuaAppVideoAutoplayFeedElection (ref), fFlagLuaAppVideoAutoplayElectOnNewCandidateModule (ref), videoEndReason (ref)
	local var1 = if p1 then p1.viewportVideoAutoplayController else nil
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), fFlagLuaAppTileVideoCandidateOnly (copy), p2 (ref), fFlagLuaAppFixHiddenTileVideoCleanup (copy), p3 (ref), value (ref), collectionService (copy), viewportAutoplayCandidateTagModule (copy), fFlagLuaAppVideoAutoplayFeedElection (copy), fFlagLuaAppVideoAutoplayElectOnNewCandidateModule (copy), videoEndReason (copy)
		if not var1 then return end
		if fFlagLuaAppTileVideoCandidateOnly and not p2 then return end
		if fFlagLuaAppFixHiddenTileVideoCleanup and p3 then return end
		local current = value.current
		
		if not current then return end
		collectionService:AddTag(current, viewportAutoplayCandidateTagModule)
		
		if fFlagLuaAppVideoAutoplayFeedElection and (var1.electOnNewCandidate or fFlagLuaAppVideoAutoplayElectOnNewCandidateModule) then
			var1:onCandidateRegistered(current)
		end
		return function()
			-- upvalues: collectionService (copy), current (ref), viewportAutoplayCandidateTagModule (copy), var1 (copy), videoEndReason (copy)
			collectionService:RemoveTag(current, viewportAutoplayCandidateTagModule)
			var1:resetIfActiveInstance(current, videoEndReason.Unmounted)
		end
	end, {
		var1,
		value,
		if fFlagLuaAppTileVideoCandidateOnly then p2 else nil,
		if fFlagLuaAppFixHiddenTileVideoCleanup then p3 else nil
	})
end