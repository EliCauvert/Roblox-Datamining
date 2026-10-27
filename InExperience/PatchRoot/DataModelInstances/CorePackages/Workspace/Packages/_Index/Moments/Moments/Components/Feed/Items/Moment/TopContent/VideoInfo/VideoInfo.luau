local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local MomentsCommonModule = require(Parent.MomentsCommon)
local _ = require(Parent.MomentsTypes)
local MomentContextModule = require(script.Parent.Parent.Parent.MomentContext)
local FFlagMomentsEngagementMetricsFeature = MomentsCommonModule.Flags.FFlagMomentsEngagementMetricsFeature
local FFlagMomentsServeEDPVideos = require(Parent.SharedFlags).FFlagMomentsServeEDPVideos
local FFlagMomentsRenderAvatarPostsInFeed = require(Parent.SharedFlags).FFlagMomentsRenderAvatarPostsInFeed
local CreatorAttributionModule = require(script.Parent.CreatorAttribution)
local DebugInfoModule = require(script.Parent.DebugInfo)
local DescriptionModule = require(script.Parent.Description)
local ReactionsModule = require(script.Parent.Reactions)
local StatusChipModule = require(script.Parent.StatusChip)
local UseMomentsSessionFunction = require(Moments.Stores.GetMomentsStore.MomentsSessionContext).useMomentsSession
local View = require(Parent.Foundation).View
local GetMomentsCapabilitiesFunction = MomentsCommonModule.Stores.GetMomentsCapabilities
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState

return ReactModule.memo(function(Frame)
	-- upvalues: MomentContextModule (copy), UseSignalStateFunction (copy), FFlagMomentsRenderAvatarPostsInFeed (copy), FFlagMomentsServeEDPVideos (copy), FFlagMomentsEngagementMetricsFeature (copy), GetMomentsCapabilitiesFunction (copy), UseMomentsSessionFunction (copy), ReactModule (copy), DebugInfoModule (copy), CreatorAttributionModule (copy), DescriptionModule (copy), ReactionsModule (copy), StatusChipModule (copy), View (copy)
	local Kind = UseSignalStateFunction(MomentContextModule.useMoment().store.getData).kind
	local IsExperience: boolean = Kind == "experience" or FFlagMomentsRenderAvatarPostsInFeed and Kind == "avatar"
	local IsEdpVideo = if FFlagMomentsServeEDPVideos then Frame.moment ~= nil and Frame.moment.entityType == "edpVideo" else nil
	local UseSignalStateResult = if FFlagMomentsEngagementMetricsFeature then UseSignalStateFunction(GetMomentsCapabilitiesFunction(false).getIsEngagementMetricsEnabled) else nil
	local t = {}
	
	if not UseSignalStateFunction(UseMomentsSessionFunction().getHideDetails) then
		t.DebugInfo = ReactModule.createElement(DebugInfoModule, { LayoutOrder = 0 })
		t.CreatorAttribution = if IsExperience and (not FFlagMomentsServeEDPVideos or not IsEdpVideo) then ReactModule.createElement(CreatorAttributionModule, { LayoutOrder = 1 }) else nil
		t.Description = ReactModule.createElement(DescriptionModule, { LayoutOrder = 2 })
		t.Reactions = if IsExperience and (not FFlagMomentsEngagementMetricsFeature or UseSignalStateResult) then ReactModule.createElement(ReactionsModule, { LayoutOrder = 3 }) else nil
		t.StatusChip = ReactModule.createElement(StatusChipModule, { LayoutOrder = 4 })
	end
	return ReactModule.createElement(View, {
		tag = "col align-x-left align-y-bottom grow gap-small auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, t)
end)