local CollectionService = game:GetService("CollectionService")
local VideoUtils = script:FindFirstAncestor("VideoUtils")
local Parent = VideoUtils.Parent
local ReactModule = require(Parent.React)
local _ = require(script.Parent.FeedVideoPlaybackContext)
local VideoEndReason = require(VideoUtils.Analytics.Enums).VideoEndReason
local ViewportAutoplayCandidateTagModule = require(script.Parent.ViewportAutoplayCandidateTag)
local FFlagLuaAppTileVideoCandidateOnly = require(Parent.SharedFlags).FFlagLuaAppTileVideoCandidateOnly
local FFlagLuaAppFixHiddenTileVideoCleanup = require(Parent.SharedFlags).FFlagLuaAppFixHiddenTileVideoCleanup

return function(p1, p2, p3, p4)
	-- upvalues: ReactModule (copy), FFlagLuaAppTileVideoCandidateOnly (copy), FFlagLuaAppFixHiddenTileVideoCleanup (copy), CollectionService (copy), ViewportAutoplayCandidateTagModule (copy), VideoEndReason (copy)
	local ViewportVideoAutoplayController = if p2 then p2.viewportVideoAutoplayController else nil
	ReactModule.useEffect(function()
		-- upvalues: ViewportVideoAutoplayController (copy), FFlagLuaAppTileVideoCandidateOnly (upval), p3 (copy), FFlagLuaAppFixHiddenTileVideoCleanup (upval), p4 (copy), p1 (copy), CollectionService (upval), ViewportAutoplayCandidateTagModule (upval), VideoEndReason (upval)
		if not ViewportVideoAutoplayController then return end
		if FFlagLuaAppTileVideoCandidateOnly and not p3 then return end
		if FFlagLuaAppFixHiddenTileVideoCleanup and p4 then return end
		local Current = p1.current
		
		if not Current then return end
		CollectionService:AddTag(Current, ViewportAutoplayCandidateTagModule)
		
		return function()
			-- upvalues: CollectionService (upval), Current (copy), ViewportAutoplayCandidateTagModule (upval), ViewportVideoAutoplayController (upval), VideoEndReason (upval)
			CollectionService:RemoveTag(Current, ViewportAutoplayCandidateTagModule)
			ViewportVideoAutoplayController:resetIfActiveInstance(Current, VideoEndReason.Unmounted)
		end
	end, {
		ViewportVideoAutoplayController,
		p1,
		if FFlagLuaAppTileVideoCandidateOnly then p3 else nil,
		if FFlagLuaAppFixHiddenTileVideoCleanup then p4 else nil
	})
end