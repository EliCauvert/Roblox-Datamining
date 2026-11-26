local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.MomentsTypes)
local FFlagMomentsServeEDPVideos = require(Parent.SharedFlags).FFlagMomentsServeEDPVideos
local FFlagMomentsPostFeedback = require(Parent.SharedFlags).FFlagMomentsPostFeedback
local FFlagMomentsReactionCountOpensPostInsightsModule = require(Moments.Flags.FFlagMomentsReactionCountOpensPostInsights)
local FFlagMomentsReactionCountAnalyticsModule = require(Moments.Flags.FFlagMomentsReactionCountAnalytics)
local View = FoundationModule.View
local ActionRailModule = require(script.Parent.ActionRail)
local MomentContextModule = require(script.Parent.Parent.MomentContext)
local VideoInfoModule = require(script.Parent.VideoInfo)

return ReactModule.memo(function(Frame)
	-- upvalues: FFlagMomentsPostFeedback (copy), MomentContextModule (copy), ReactModule (copy), View (copy), VideoInfoModule (copy), FFlagMomentsServeEDPVideos (copy), FFlagMomentsReactionCountOpensPostInsightsModule (copy), FFlagMomentsReactionCountAnalyticsModule (copy), ActionRailModule (copy)
	local Data = if FFlagMomentsPostFeedback then MomentContextModule.useMoment().store.getData(false) else nil
	local IsIsPending: boolean = Data ~= nil and (Data.kind == "experience" and Data.isPending == true)
	
	return ReactModule.createElement(View, {
		tag = "row align-x-left align-y-bottom gap-large size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, {
		VideoInfo = ReactModule.createElement(VideoInfoModule, {
			LayoutOrder = 1,
			moment = if FFlagMomentsServeEDPVideos or FFlagMomentsReactionCountOpensPostInsightsModule or FFlagMomentsReactionCountAnalyticsModule then Frame.moment else nil
		}),
		ActionRail = if IsIsPending then nil else ReactModule.createElement(ActionRailModule, {
			LayoutOrder = 2,
			moment = Frame.moment,
			onOpenComments = Frame.onOpenComments
		})
	})
end)