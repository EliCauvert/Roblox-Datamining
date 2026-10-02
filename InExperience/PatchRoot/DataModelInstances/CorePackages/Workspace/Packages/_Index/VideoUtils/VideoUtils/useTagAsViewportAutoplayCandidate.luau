local collectionService = game:GetService("CollectionService")
local videoUtils = script:FindFirstAncestor("VideoUtils")
local parent = videoUtils.Parent
local reactModule = require(parent.React)
local _ = require(script.Parent.FeedVideoPlaybackContext)
local viewportAutoplayVideoKeyAttributeModule = require(script.Parent.ViewportAutoplayVideoKeyAttribute)
local userIntentModeAutoplayCandidateTagModule = require(script.Parent.UserIntentModeAutoplayCandidateTag)
local videoEndReason = require(videoUtils.Analytics.Enums).VideoEndReason
local viewportAutoplayCandidateTagModule = require(script.Parent.ViewportAutoplayCandidateTag)
local viewportAutoplayRowSpanAttributeModule = require(script.Parent.ViewportAutoplayRowSpanAttribute)
local viewportAutoplayCellVerticalPaddingAttributeModule = require(script.Parent.ViewportAutoplayCellVerticalPaddingAttribute)
local viewportAutoplayAlignmentTypeAttributeModule = require(script.Parent.ViewportAutoplayAlignmentTypeAttribute)
local alignmentType = require(parent.DiscoveryTypes).GameCollectionItemTypes.AlignmentType
local fFlagLuaAppOneByTwoHoverIdleAutoplay = require(parent.SharedFlags).FFlagLuaAppOneByTwoHoverIdleAutoplay
local fFlagLuaAppTileVideoCandidateOnly = require(parent.SharedFlags).FFlagLuaAppTileVideoCandidateOnly
local fFlagLuaAppFixHiddenTileVideoCleanup = require(parent.SharedFlags).FFlagLuaAppFixHiddenTileVideoCleanup
local fFlagLuaAppVideoAutoplayFeedElection = require(parent.SharedFlags).FFlagLuaAppVideoAutoplayFeedElection
local fFlagLuaAppVideoAutoplayOneByTwoTileCandidatePercentageUpdate = require(parent.SharedFlags).FFlagLuaAppVideoAutoplayOneByTwoTileCandidatePercentageUpdate
local fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor = require(parent.SharedFlags).FFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor
local fFlagLuaAppVideoAutoplayElectOnNewCandidateModule = require(script.Parent.FFlagLuaAppVideoAutoplayElectOnNewCandidate)

local function _(p1)
	-- upvalues: fFlagLuaAppTileVideoCandidateOnly (ref)
	return not fFlagLuaAppTileVideoCandidateOnly or p1 == true
end

local _ = function(p1, p2, p3)
	-- upvalues: fFlagLuaAppFixHiddenTileVideoCleanup (ref), fFlagLuaAppTileVideoCandidateOnly (ref)
	local var1 = not (fFlagLuaAppFixHiddenTileVideoCleanup and p2)
	
	if var1 then
		var1 = (if fFlagLuaAppTileVideoCandidateOnly then p1 == true else not fFlagLuaAppTileVideoCandidateOnly) or p3
	end
	return var1
end

local _ = function(p1, p2)
	-- upvalues: fFlagLuaAppVideoAutoplayFeedElection (ref), fFlagLuaAppVideoAutoplayElectOnNewCandidateModule (ref)
	return p1 or fFlagLuaAppVideoAutoplayFeedElection and (p2 or fFlagLuaAppVideoAutoplayElectOnNewCandidateModule)
end

return function(value, p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: fFlagLuaAppOneByTwoHoverIdleAutoplay (ref), reactModule (ref), fFlagLuaAppFixHiddenTileVideoCleanup (ref), fFlagLuaAppTileVideoCandidateOnly (ref), fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor (ref), alignmentType (ref), viewportAutoplayVideoKeyAttributeModule (ref), fFlagLuaAppVideoAutoplayOneByTwoTileCandidatePercentageUpdate (ref), viewportAutoplayRowSpanAttributeModule (ref), viewportAutoplayCellVerticalPaddingAttributeModule (ref), viewportAutoplayAlignmentTypeAttributeModule (ref), collectionService (ref), viewportAutoplayCandidateTagModule (ref), userIntentModeAutoplayCandidateTagModule (ref), fFlagLuaAppVideoAutoplayFeedElection (ref), fFlagLuaAppVideoAutoplayElectOnNewCandidateModule (ref), videoEndReason (ref)
	local var1 = if p1 then p1.viewportVideoAutoplayController else nil
	local var2 = if fFlagLuaAppOneByTwoHoverIdleAutoplay and p7 then p7.videoKey else nil
	local var3 = fFlagLuaAppOneByTwoHoverIdleAutoplay and (p7 ~= nil and p7.isUserIntentModeAutoplayCandidate)
	local var4 = fFlagLuaAppOneByTwoHoverIdleAutoplay and p7 ~= nil
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), fFlagLuaAppOneByTwoHoverIdleAutoplay (copy), p2 (ref), p3 (ref), var3 (ref), fFlagLuaAppFixHiddenTileVideoCleanup (copy), fFlagLuaAppTileVideoCandidateOnly (copy), value (ref), fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor (copy), p4 (ref), p6 (ref), alignmentType (copy), var2 (ref), viewportAutoplayVideoKeyAttributeModule (copy), fFlagLuaAppVideoAutoplayOneByTwoTileCandidatePercentageUpdate (copy), viewportAutoplayRowSpanAttributeModule (copy), viewportAutoplayCellVerticalPaddingAttributeModule (copy), p5 (ref), viewportAutoplayAlignmentTypeAttributeModule (copy), collectionService (copy), viewportAutoplayCandidateTagModule (copy), userIntentModeAutoplayCandidateTagModule (copy), var4 (ref), fFlagLuaAppVideoAutoplayFeedElection (copy), fFlagLuaAppVideoAutoplayElectOnNewCandidateModule (copy), videoEndReason (copy)
		if not var1 then return end
		if fFlagLuaAppOneByTwoHoverIdleAutoplay then
			local var5 = p2
			local var6 = var3
			local var7 = not (fFlagLuaAppFixHiddenTileVideoCleanup and p3)
			
			if var7 then
				var7 = (if fFlagLuaAppTileVideoCandidateOnly then var5 == true else not fFlagLuaAppTileVideoCandidateOnly) or var6
			end
			if not var7 then return end
		elseif fFlagLuaAppTileVideoCandidateOnly and not p2 then return end
		if fFlagLuaAppFixHiddenTileVideoCleanup and p3 then return end
		local current = value.current
		
		if not current then return end
		if fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor and p4 == 2 and (p6 ~= alignmentType.LeftPin and p6 ~= alignmentType.RightPin) then return end
		if fFlagLuaAppOneByTwoHoverIdleAutoplay and var2 then
			current:SetAttribute(viewportAutoplayVideoKeyAttributeModule, var2)
		end
		if (fFlagLuaAppVideoAutoplayOneByTwoTileCandidatePercentageUpdate or fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor) and p4 ~= nil then
			current:SetAttribute(viewportAutoplayRowSpanAttributeModule, p4)
			
			if fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor then
				current:SetAttribute(viewportAutoplayCellVerticalPaddingAttributeModule, p5)
				current:SetAttribute(viewportAutoplayAlignmentTypeAttributeModule, p6)
			end
		end
		if not fFlagLuaAppOneByTwoHoverIdleAutoplay or (not fFlagLuaAppTileVideoCandidateOnly or p2 == true) then
			collectionService:AddTag(current, viewportAutoplayCandidateTagModule)
		end
		if fFlagLuaAppOneByTwoHoverIdleAutoplay and var3 then
			collectionService:AddTag(current, userIntentModeAutoplayCandidateTagModule)
		end
		if fFlagLuaAppOneByTwoHoverIdleAutoplay then
			if var4 and var1:isUserIntentWithSelectiveAutoplay() or fFlagLuaAppVideoAutoplayFeedElection and (var1.electOnNewCandidate or fFlagLuaAppVideoAutoplayElectOnNewCandidateModule) then
				var1:onCandidateRegistered(current)
			end
		elseif fFlagLuaAppVideoAutoplayFeedElection and (var1.electOnNewCandidate or fFlagLuaAppVideoAutoplayElectOnNewCandidateModule) then
			var1:onCandidateRegistered(current)
		end
		return function()
			-- upvalues: collectionService (copy), current (ref), viewportAutoplayCandidateTagModule (copy), fFlagLuaAppOneByTwoHoverIdleAutoplay (copy), userIntentModeAutoplayCandidateTagModule (copy), fFlagLuaAppVideoAutoplayOneByTwoTileCandidatePercentageUpdate (copy), fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor (copy), p4 (copy), viewportAutoplayRowSpanAttributeModule (copy), viewportAutoplayCellVerticalPaddingAttributeModule (copy), viewportAutoplayAlignmentTypeAttributeModule (copy), viewportAutoplayVideoKeyAttributeModule (copy), var1 (copy), videoEndReason (copy)
			collectionService:RemoveTag(current, viewportAutoplayCandidateTagModule)
			
			if fFlagLuaAppOneByTwoHoverIdleAutoplay then
				collectionService:RemoveTag(current, userIntentModeAutoplayCandidateTagModule)
			end
			if (fFlagLuaAppVideoAutoplayOneByTwoTileCandidatePercentageUpdate or fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor) and p4 ~= nil then
				current:SetAttribute(viewportAutoplayRowSpanAttributeModule, nil)
				
				if fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor then
					current:SetAttribute(viewportAutoplayCellVerticalPaddingAttributeModule, nil)
					current:SetAttribute(viewportAutoplayAlignmentTypeAttributeModule, nil)
				end
			end
			if fFlagLuaAppOneByTwoHoverIdleAutoplay then
				current:SetAttribute(viewportAutoplayVideoKeyAttributeModule, nil)
			end
			var1:resetIfActiveInstance(current, videoEndReason.Unmounted)
		end
	end, {
		var1, value, if fFlagLuaAppTileVideoCandidateOnly then p2 else nil,
		if fFlagLuaAppFixHiddenTileVideoCleanup then p3 else nil,
		if fFlagLuaAppVideoAutoplayOneByTwoTileCandidatePercentageUpdate or fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor then p4 else nil,
		if fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor then p5 else nil,
		if fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor then p6 else nil,
		if fFlagLuaAppOneByTwoHoverIdleAutoplay then var2 else nil,
		if fFlagLuaAppOneByTwoHoverIdleAutoplay then var3 else nil,
		if fFlagLuaAppOneByTwoHoverIdleAutoplay then var4 else nil
	})
end