local collectionService = game:GetService("CollectionService")
local videoUtils = script:FindFirstAncestor("VideoUtils")
local parent = videoUtils.Parent
local reactModule = require(parent.React)
local _ = require(script.Parent.FeedVideoPlaybackContext)
local videoEndReason = require(videoUtils.Analytics.Enums).VideoEndReason
local viewportAutoplayCandidateTagModule = require(script.Parent.ViewportAutoplayCandidateTag)
local fFlagLuaAppTileVideoCandidateOnly = require(parent.SharedFlags).FFlagLuaAppTileVideoCandidateOnly
local fFlagLuaAppFixHiddenTileVideoCleanup = require(parent.SharedFlags).FFlagLuaAppFixHiddenTileVideoCleanup

return function(value, p0, p1, p2)
	-- upvalues: reactModule (ref), fFlagLuaAppTileVideoCandidateOnly (ref), fFlagLuaAppFixHiddenTileVideoCleanup (ref), collectionService (ref), viewportAutoplayCandidateTagModule (ref), videoEndReason (ref)
	local var4 = if p0 then p0.viewportVideoAutoplayController else nil
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), fFlagLuaAppTileVideoCandidateOnly (copy), p1 (ref), fFlagLuaAppFixHiddenTileVideoCleanup (copy), p2 (ref), value (ref), collectionService (copy), viewportAutoplayCandidateTagModule (copy), videoEndReason (copy)
		if not var4 then return end
		if fFlagLuaAppTileVideoCandidateOnly and not p1 then return end
		if fFlagLuaAppFixHiddenTileVideoCleanup and p2 then return end
		local current = value.current
		
		if current then
			collectionService:AddTag(current, viewportAutoplayCandidateTagModule)
			
			return function()
				-- upvalues: collectionService (copy), current (ref), viewportAutoplayCandidateTagModule (copy), var4 (copy), videoEndReason (copy)
				collectionService:RemoveTag(current, viewportAutoplayCandidateTagModule)
				var4:resetIfActiveInstance(current, videoEndReason.Unmounted)
			end
		end
	end, {
		var4,
		value,
		if fFlagLuaAppTileVideoCandidateOnly then p1 else nil,
		if fFlagLuaAppFixHiddenTileVideoCleanup then p2 else nil
	})
end