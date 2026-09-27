local collectionService = game:GetService("CollectionService")
local videoUtils = script:FindFirstAncestor("VideoUtils")
local parent = videoUtils.Parent
local reactModule = require(parent.React)
local _ = require(script.Parent.FeedVideoPlaybackContext)
local videoEndReason = require(videoUtils.Analytics.Enums).VideoEndReason
local viewportAutoplayCandidateTagModule = require(script.Parent.ViewportAutoplayCandidateTag)
local viewportAutoplayRowSpanAttributeModule = require(script.Parent.ViewportAutoplayRowSpanAttribute)
local viewportAutoplayCellVerticalPaddingAttributeModule = require(script.Parent.ViewportAutoplayCellVerticalPaddingAttribute)
local viewportAutoplayAlignmentTypeAttributeModule = require(script.Parent.ViewportAutoplayAlignmentTypeAttribute)
local alignmentType = require(parent.DiscoveryTypes).GameCollectionItemTypes.AlignmentType
local fFlagLuaAppTileVideoCandidateOnly = require(parent.SharedFlags).FFlagLuaAppTileVideoCandidateOnly
local fFlagLuaAppFixHiddenTileVideoCleanup = require(parent.SharedFlags).FFlagLuaAppFixHiddenTileVideoCleanup
local fFlagLuaAppVideoAutoplayFeedElection = require(parent.SharedFlags).FFlagLuaAppVideoAutoplayFeedElection
local fFlagLuaAppVideoAutoplayOneByTwoTileCandidatePercentageUpdate = require(parent.SharedFlags).FFlagLuaAppVideoAutoplayOneByTwoTileCandidatePercentageUpdate
local fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor = require(parent.SharedFlags).FFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor
local fFlagLuaAppVideoAutoplayElectOnNewCandidateModule = require(script.Parent.FFlagLuaAppVideoAutoplayElectOnNewCandidate)

return function(value, p1, p2, p3, p4, p5, p6)
	-- upvalues: reactModule (ref), fFlagLuaAppTileVideoCandidateOnly (ref), fFlagLuaAppFixHiddenTileVideoCleanup (ref), fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor (ref), alignmentType (ref), fFlagLuaAppVideoAutoplayOneByTwoTileCandidatePercentageUpdate (ref), viewportAutoplayRowSpanAttributeModule (ref), viewportAutoplayCellVerticalPaddingAttributeModule (ref), viewportAutoplayAlignmentTypeAttributeModule (ref), collectionService (ref), viewportAutoplayCandidateTagModule (ref), fFlagLuaAppVideoAutoplayFeedElection (ref), fFlagLuaAppVideoAutoplayElectOnNewCandidateModule (ref), videoEndReason (ref)
	local var1 = if p1 then p1.viewportVideoAutoplayController else nil
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), fFlagLuaAppTileVideoCandidateOnly (copy), p2 (ref), fFlagLuaAppFixHiddenTileVideoCleanup (copy), p3 (ref), value (ref), fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor (copy), p4 (ref), p6 (ref), alignmentType (copy), fFlagLuaAppVideoAutoplayOneByTwoTileCandidatePercentageUpdate (copy), viewportAutoplayRowSpanAttributeModule (copy), viewportAutoplayCellVerticalPaddingAttributeModule (copy), p5 (ref), viewportAutoplayAlignmentTypeAttributeModule (copy), collectionService (copy), viewportAutoplayCandidateTagModule (copy), fFlagLuaAppVideoAutoplayFeedElection (copy), fFlagLuaAppVideoAutoplayElectOnNewCandidateModule (copy), videoEndReason (copy)
		if not var1 then return end
		if fFlagLuaAppTileVideoCandidateOnly and not p2 then return end
		if fFlagLuaAppFixHiddenTileVideoCleanup and p3 then return end
		local current = value.current
		
		if not current then return end
		if fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor and p4 == 2 and (p6 ~= alignmentType.LeftPin and p6 ~= alignmentType.RightPin) then return end
		if (fFlagLuaAppVideoAutoplayOneByTwoTileCandidatePercentageUpdate or fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor) and p4 ~= nil then
			current:SetAttribute(viewportAutoplayRowSpanAttributeModule, p4)
			
			if fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor then
				current:SetAttribute(viewportAutoplayCellVerticalPaddingAttributeModule, p5)
				current:SetAttribute(viewportAutoplayAlignmentTypeAttributeModule, p6)
			end
		end
		collectionService:AddTag(current, viewportAutoplayCandidateTagModule)
		
		if fFlagLuaAppVideoAutoplayFeedElection and (var1.electOnNewCandidate or fFlagLuaAppVideoAutoplayElectOnNewCandidateModule) then
			var1:onCandidateRegistered(current)
		end
		return function()
			-- upvalues: collectionService (copy), current (ref), viewportAutoplayCandidateTagModule (copy), fFlagLuaAppVideoAutoplayOneByTwoTileCandidatePercentageUpdate (copy), fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor (copy), p4 (copy), viewportAutoplayRowSpanAttributeModule (copy), viewportAutoplayCellVerticalPaddingAttributeModule (copy), viewportAutoplayAlignmentTypeAttributeModule (copy), var1 (copy), videoEndReason (copy)
			collectionService:RemoveTag(current, viewportAutoplayCandidateTagModule)
			
			if (fFlagLuaAppVideoAutoplayOneByTwoTileCandidatePercentageUpdate or fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor) and p4 ~= nil then
				current:SetAttribute(viewportAutoplayRowSpanAttributeModule, nil)
				
				if fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor then
					current:SetAttribute(viewportAutoplayCellVerticalPaddingAttributeModule, nil)
					current:SetAttribute(viewportAutoplayAlignmentTypeAttributeModule, nil)
				end
			end
			var1:resetIfActiveInstance(current, videoEndReason.Unmounted)
		end
	end, {
		var1, value, if fFlagLuaAppTileVideoCandidateOnly then p2 else nil,
		if fFlagLuaAppFixHiddenTileVideoCleanup then p3 else nil,
		if fFlagLuaAppVideoAutoplayOneByTwoTileCandidatePercentageUpdate or fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor then p4 else nil,
		if fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor then p5 else nil,
		if fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor then p6 else nil
	})
end