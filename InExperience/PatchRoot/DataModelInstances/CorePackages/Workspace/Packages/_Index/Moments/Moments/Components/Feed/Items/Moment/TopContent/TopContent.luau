local parent = script:FindFirstAncestor("Moments").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(parent.MomentsTypes)
local fFlagMomentsServeEDPVideos = require(parent.SharedFlags).FFlagMomentsServeEDPVideos
local view = foundationModule.View
local actionRailModule = require(script.Parent.ActionRail)
local videoInfoModule = require(script.Parent.VideoInfo)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), view (ref), videoInfoModule (ref), fFlagMomentsServeEDPVideos (ref), actionRailModule (ref)
	return reactModule.createElement(view, {
		tag = "row align-x-left align-y-bottom gap-large size-full-0 auto-y",
		LayoutOrder = p1.LayoutOrder
	}, {
		VideoInfo = reactModule.createElement(videoInfoModule, {
			LayoutOrder = 1,
			moment = if fFlagMomentsServeEDPVideos then p1.moment else nil
		}),
		ActionRail = reactModule.createElement(actionRailModule, {
			LayoutOrder = 2,
			moment = p1.moment,
			onOpenComments = p1.onOpenComments
		})
	})
end)