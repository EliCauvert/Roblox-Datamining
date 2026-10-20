local CollectionService = game:GetService("CollectionService")
local VideoUtils = script:FindFirstAncestor("VideoUtils")
local Parent = VideoUtils.Parent
local ReactModule = require(Parent.React)
local _ = require(script.Parent.FeedVideoPlaybackContext)
local ViewportAutoplayVideoKeyAttributeModule = require(script.Parent.ViewportAutoplayVideoKeyAttribute)
local UserIntentModeAutoplayCandidateTagModule = require(script.Parent.UserIntentModeAutoplayCandidateTag)
local VideoEndReason = require(VideoUtils.Analytics.Enums).VideoEndReason
local ViewportAutoplayCandidateTagModule = require(script.Parent.ViewportAutoplayCandidateTag)
local ViewportAutoplayRowSpanAttributeModule = require(script.Parent.ViewportAutoplayRowSpanAttribute)
local ViewportAutoplayCellVerticalPaddingAttributeModule = require(script.Parent.ViewportAutoplayCellVerticalPaddingAttribute)
local ViewportAutoplayAlignmentTypeAttributeModule = require(script.Parent.ViewportAutoplayAlignmentTypeAttribute)
local AlignmentType = require(Parent.DiscoveryTypes).GameCollectionItemTypes.AlignmentType
local FFlagLuaAppOneByTwoHoverIdleAutoplay = require(Parent.SharedFlags).FFlagLuaAppOneByTwoHoverIdleAutoplay
local FFlagLuaAppTileVideoCandidateOnly = require(Parent.SharedFlags).FFlagLuaAppTileVideoCandidateOnly
local FFlagLuaAppFixHiddenTileVideoCleanup = require(Parent.SharedFlags).FFlagLuaAppFixHiddenTileVideoCleanup
local FFlagLuaAppVideoAutoplayFeedElection = require(Parent.SharedFlags).FFlagLuaAppVideoAutoplayFeedElection
local FFlagLuaAppVideoAutoplayElectOnNewCandidateModule = require(script.Parent.FFlagLuaAppVideoAutoplayElectOnNewCandidate)

local function _(Enabled): boolean
	-- upvalues: FFlagLuaAppTileVideoCandidateOnly (copy)
	return not FFlagLuaAppTileVideoCandidateOnly or Enabled == true
end

local _ = function(Enabled, p1, p2)
	-- upvalues: FFlagLuaAppFixHiddenTileVideoCleanup (copy), FFlagLuaAppTileVideoCandidateOnly (copy)
	return not (FFlagLuaAppFixHiddenTileVideoCleanup and p1) and (not FFlagLuaAppTileVideoCandidateOnly or Enabled == true or p2)
end

local _ = function(p1, p2)
	-- upvalues: FFlagLuaAppVideoAutoplayFeedElection (copy), FFlagLuaAppVideoAutoplayElectOnNewCandidateModule (copy)
	return p1 or FFlagLuaAppVideoAutoplayFeedElection and (p2 or FFlagLuaAppVideoAutoplayElectOnNewCandidateModule)
end

return function(p1, p2, Enabled, p3, Value, Value1, LeftPin, p4)
	-- upvalues: FFlagLuaAppOneByTwoHoverIdleAutoplay (copy), ReactModule (copy), FFlagLuaAppFixHiddenTileVideoCleanup (copy), FFlagLuaAppTileVideoCandidateOnly (copy), AlignmentType (copy), ViewportAutoplayVideoKeyAttributeModule (copy), ViewportAutoplayRowSpanAttributeModule (copy), ViewportAutoplayCellVerticalPaddingAttributeModule (copy), ViewportAutoplayAlignmentTypeAttributeModule (copy), CollectionService (copy), ViewportAutoplayCandidateTagModule (copy), UserIntentModeAutoplayCandidateTagModule (copy), FFlagLuaAppVideoAutoplayFeedElection (copy), FFlagLuaAppVideoAutoplayElectOnNewCandidateModule (copy), VideoEndReason (copy)
	local ViewportVideoAutoplayController = if p2 then p2.viewportVideoAutoplayController else nil
	local VideoKey = if FFlagLuaAppOneByTwoHoverIdleAutoplay and p4 then p4.videoKey else nil
	local IsUserIntentModeAutoplayCandidate = FFlagLuaAppOneByTwoHoverIdleAutoplay and (p4 ~= nil and p4.isUserIntentModeAutoplayCandidate)
	local v1: boolean = FFlagLuaAppOneByTwoHoverIdleAutoplay and p4 ~= nil
	ReactModule.useEffect(function()
		-- upvalues: ViewportVideoAutoplayController (copy), FFlagLuaAppOneByTwoHoverIdleAutoplay (upval), Enabled (copy), p3 (copy), IsUserIntentModeAutoplayCandidate (copy), FFlagLuaAppFixHiddenTileVideoCleanup (upval), FFlagLuaAppTileVideoCandidateOnly (upval), p1 (copy), Value (copy), LeftPin (copy), AlignmentType (upval), VideoKey (copy), ViewportAutoplayVideoKeyAttributeModule (upval), ViewportAutoplayRowSpanAttributeModule (upval), ViewportAutoplayCellVerticalPaddingAttributeModule (upval), Value1 (copy), ViewportAutoplayAlignmentTypeAttributeModule (upval), CollectionService (upval), ViewportAutoplayCandidateTagModule (upval), UserIntentModeAutoplayCandidateTagModule (upval), v1 (copy), FFlagLuaAppVideoAutoplayFeedElection (upval), FFlagLuaAppVideoAutoplayElectOnNewCandidateModule (upval), VideoEndReason (upval)
		if not ViewportVideoAutoplayController then return end
		if FFlagLuaAppOneByTwoHoverIdleAutoplay then
			if FFlagLuaAppFixHiddenTileVideoCleanup and p3 or FFlagLuaAppTileVideoCandidateOnly and Enabled ~= true and not IsUserIntentModeAutoplayCandidate then return end
		else
			if FFlagLuaAppTileVideoCandidateOnly and not Enabled then return end
			if FFlagLuaAppFixHiddenTileVideoCleanup and p3 then return end
		end
		local Current = p1.current
		
		if not Current then return end
		if Value == 2 and LeftPin ~= AlignmentType.LeftPin and LeftPin ~= AlignmentType.RightPin then return end
		if FFlagLuaAppOneByTwoHoverIdleAutoplay and VideoKey then
			Current:SetAttribute(ViewportAutoplayVideoKeyAttributeModule, VideoKey)
		end
		if Value ~= nil then
			Current:SetAttribute(ViewportAutoplayRowSpanAttributeModule, Value)
			Current:SetAttribute(ViewportAutoplayCellVerticalPaddingAttributeModule, Value1)
			Current:SetAttribute(ViewportAutoplayAlignmentTypeAttributeModule, LeftPin)
		end
		if not FFlagLuaAppOneByTwoHoverIdleAutoplay or (not FFlagLuaAppTileVideoCandidateOnly or Enabled == true) then
			CollectionService:AddTag(Current, ViewportAutoplayCandidateTagModule)
		end
		if FFlagLuaAppOneByTwoHoverIdleAutoplay and IsUserIntentModeAutoplayCandidate then
			CollectionService:AddTag(Current, UserIntentModeAutoplayCandidateTagModule)
		end
		if FFlagLuaAppOneByTwoHoverIdleAutoplay then
			local ElectOnNewCandidate = ViewportVideoAutoplayController.electOnNewCandidate
			
			if v1 and ViewportVideoAutoplayController:isUserIntentWithSelectiveAutoplay() or FFlagLuaAppVideoAutoplayFeedElection and (ElectOnNewCandidate or FFlagLuaAppVideoAutoplayElectOnNewCandidateModule) then
				ViewportVideoAutoplayController:onCandidateRegistered(Current)
			end
		elseif FFlagLuaAppVideoAutoplayFeedElection and (ViewportVideoAutoplayController.electOnNewCandidate or FFlagLuaAppVideoAutoplayElectOnNewCandidateModule) then
			ViewportVideoAutoplayController:onCandidateRegistered(Current)
		end
		return function()
			-- upvalues: CollectionService (upval), Current (copy), ViewportAutoplayCandidateTagModule (upval), FFlagLuaAppOneByTwoHoverIdleAutoplay (upval), UserIntentModeAutoplayCandidateTagModule (upval), Value (upval), ViewportAutoplayRowSpanAttributeModule (upval), ViewportAutoplayCellVerticalPaddingAttributeModule (upval), ViewportAutoplayAlignmentTypeAttributeModule (upval), ViewportAutoplayVideoKeyAttributeModule (upval), ViewportVideoAutoplayController (upval), VideoEndReason (upval)
			CollectionService:RemoveTag(Current, ViewportAutoplayCandidateTagModule)
			
			if FFlagLuaAppOneByTwoHoverIdleAutoplay then
				CollectionService:RemoveTag(Current, UserIntentModeAutoplayCandidateTagModule)
			end
			if Value ~= nil then
				Current:SetAttribute(ViewportAutoplayRowSpanAttributeModule, nil)
				Current:SetAttribute(ViewportAutoplayCellVerticalPaddingAttributeModule, nil)
				Current:SetAttribute(ViewportAutoplayAlignmentTypeAttributeModule, nil)
			end
			if FFlagLuaAppOneByTwoHoverIdleAutoplay then
				Current:SetAttribute(ViewportAutoplayVideoKeyAttributeModule, nil)
			end
			ViewportVideoAutoplayController:resetIfActiveInstance(Current, VideoEndReason.Unmounted)
		end
	end, {
		ViewportVideoAutoplayController, p1,
		if FFlagLuaAppTileVideoCandidateOnly then Enabled else nil,
		if FFlagLuaAppFixHiddenTileVideoCleanup then p3 else nil, Value, Value1,
		LeftPin, if FFlagLuaAppOneByTwoHoverIdleAutoplay then VideoKey else nil,
		if FFlagLuaAppOneByTwoHoverIdleAutoplay then IsUserIntentModeAutoplayCandidate else nil,
		if FFlagLuaAppOneByTwoHoverIdleAutoplay then v1 else nil
	})
end