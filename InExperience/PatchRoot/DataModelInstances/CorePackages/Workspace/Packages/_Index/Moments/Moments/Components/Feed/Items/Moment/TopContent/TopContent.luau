local parent = script:FindFirstAncestor("Moments").Parent
local reactModule = require(parent.React)
local _ = require(parent.MomentsTypes)
local view = require(parent.Foundation).View
local actionRailModule = require(script.Parent.ActionRail)
local videoInfoModule = require(script.Parent.VideoInfo)

return reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), view (ref), videoInfoModule (ref), actionRailModule (ref)
	return reactModule.createElement(view, {
		tag = "row align-x-left align-y-bottom gap-large size-full-0 auto-y",
		LayoutOrder = p0.LayoutOrder
	}, {
		VideoInfo = reactModule.createElement(videoInfoModule, { LayoutOrder = 1 }),
		ActionRail = reactModule.createElement(actionRailModule, { LayoutOrder = 2, moment = p0.moment })
	})
end)