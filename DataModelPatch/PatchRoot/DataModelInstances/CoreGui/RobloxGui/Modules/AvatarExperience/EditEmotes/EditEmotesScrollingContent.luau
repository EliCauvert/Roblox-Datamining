local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseAdaptiveScrollingFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Hooks.useAdaptiveScrolling
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local AXRefreshScrollingFrameWithLoadMoreModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Components.AXRefreshScrollingFrameWithLoadMore)

return function(p1)
	-- upvalues: UseAdaptiveScrollingFunction (copy), ReactModule (copy), AXRefreshScrollingFrameWithLoadMoreModule (copy), AvatarScreen (copy)
	local UseAdaptiveScrollingResult = UseAdaptiveScrollingFunction()
	
	return ReactModule.createElement(AXRefreshScrollingFrameWithLoadMoreModule, {
		createEndOfScrollElement = true,
		preventInitialLoadMore = true,
		Size = UDim2.fromScale(1, 1),
		Position = UDim2.fromScale(0, 0),
		parentAppPage = AvatarScreen.EditEmotes,
		ScrollingEnabled = not UseAdaptiveScrollingResult or UseAdaptiveScrollingResult.scrollingEnabledBinding,
		onCanvasPositionChanged = ReactModule.useCallback(function(ScrollFrame)
			-- upvalues: p1 (copy), UseAdaptiveScrollingResult (copy)
			if p1.onCanvasPositionChanged then
				p1.onCanvasPositionChanged(ScrollFrame)
			end
			if UseAdaptiveScrollingResult and UseAdaptiveScrollingResult.onCanvasYChanged and ScrollFrame then
				UseAdaptiveScrollingResult.onCanvasYChanged(ScrollFrame.CanvasPosition.Y)
			end
		end, { UseAdaptiveScrollingResult, p1.onCanvasPositionChanged }),
		onThresholdReached = p1.onThresholdReached
	}, p1.children)
end