local Parent = script:FindFirstAncestor("Moments").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.MomentsTypes)
local FFlagMomentsServeEDPVideos = require(Parent.SharedFlags).FFlagMomentsServeEDPVideos
local FFlagMomentsPostFeedback = require(Parent.SharedFlags).FFlagMomentsPostFeedback
local View = require(Parent.Foundation).View
local ActionRailModule = require(script.Parent.ActionRail)
local MomentContextModule = require(script.Parent.Parent.MomentContext)
local VideoInfoModule = require(script.Parent.VideoInfo)

return ReactModule.memo(function(Frame)
	-- upvalues: FFlagMomentsPostFeedback (copy), MomentContextModule (copy), ReactModule (copy), View (copy), VideoInfoModule (copy), FFlagMomentsServeEDPVideos (copy), ActionRailModule (copy)
	local Data = if FFlagMomentsPostFeedback then MomentContextModule.useMoment().store.getData(false) else nil
	local IsIsPending: boolean = Data ~= nil and (Data.kind == "experience" and Data.isPending == true)
	
	return ReactModule.createElement(View, {
		tag = "row align-x-left align-y-bottom gap-large size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, {
		VideoInfo = ReactModule.createElement(VideoInfoModule, {
			LayoutOrder = 1,
			moment = if FFlagMomentsServeEDPVideos then Frame.moment else nil
		}),
		ActionRail = if IsIsPending then nil else ReactModule.createElement(ActionRailModule, {
			LayoutOrder = 2,
			moment = Frame.moment,
			onOpenComments = Frame.onOpenComments
		})
	})
end)