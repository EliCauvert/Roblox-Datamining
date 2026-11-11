local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local InspectCTAModule = require(Parent.Components.FeedOverlay.InspectCTA)
local ShareCTAModule = require(Parent.Components.FeedOverlay.ShareCTA)
local View = require(Parent1.Foundation).View
local GetAvatarItemIdsModule = require(Parent.Utils.getAvatarItemIds)
local UseAppPolicyFunction = require(Parent1.UniversalAppPolicy).useAppPolicy
local UseUserExperimentFunction = require(Parent1.RoactAppExperiment).useUserExperiment
local FFlagContentFeedInspectEnabledForAllModule = require(Parent.Flags.FFlagContentFeedInspectEnabledForAll)
local FFlagContentFeedInspectExperimentEnabledModule = require(Parent.Flags.FFlagContentFeedInspectExperimentEnabled)
local FStringContentFeedIXPLayerModule = require(Parent.Flags.FStringContentFeedIXPLayer)

return function(p1)
	-- upvalues: UseAppPolicyFunction (copy), ReactModule (copy), GetAvatarItemIdsModule (copy), FFlagContentFeedInspectEnabledForAllModule (copy), FFlagContentFeedInspectExperimentEnabledModule (copy), UseUserExperimentFunction (copy), FStringContentFeedIXPLayerModule (copy), View (copy), InspectCTAModule (copy), ShareCTAModule (copy)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
		return p2.getEligibleForExternalContentSharing()
	end)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetAvatarItemIdsModule (upval), p1 (copy)
		return GetAvatarItemIdsModule(p1.additionalInfo)
	end, { p1.additionalInfo })
	local UseUserExperimentResult = if FFlagContentFeedInspectEnabledForAllModule then true elseif FFlagContentFeedInspectExperimentEnabledModule then UseUserExperimentFunction({ FStringContentFeedIXPLayerModule }, function(p2)
		-- upvalues: FStringContentFeedIXPLayerModule (upval)
		return (p2[FStringContentFeedIXPLayerModule] or {}).ContentFeedInspectEnabled
	end) else false
	
	return ReactModule.createElement(View, {
		tag = "align-x-center align-y-center col auto-xy bg-action-subtle items-center gap-medium",
		LayoutOrder = p1.layoutOrder
	}, {
		InspectCTA = if UseUserExperimentResult and UseMemoResult then ReactModule.createElement(InspectCTAModule, {
			layoutOrder = 1,
			avatarItemIds = UseMemoResult,
			postId = p1.postId
		}) else nil,
		ShareCTA = if UseAppPolicyResult then ReactModule.createElement(ShareCTAModule, {
			layoutOrder = 2,
			creatorUserId = p1.creatorUserId,
			postId = p1.postId
		}) else nil
	})
end