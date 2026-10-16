local UserGameSettings = UserSettings():GetService("UserGameSettings")
local UseAnimateScrollViewToSelectionFunction = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.AppBlox).useAnimateScrollViewToSelection
local AXAnimatedScrollingFrameScrollTimeMs: number = game:DefineFastInt("AXAnimatedScrollingFrameScrollTimeMs", 200)
local AXAnimatedScrollingFrameScrollTimeMsRatio = if AXAnimatedScrollingFrameScrollTimeMs > 0 then AXAnimatedScrollingFrameScrollTimeMs / 1000 else 0.2

return function(p1, p2) --[[ Line: 12 | Named "useAXAnimateScrollFrame" ]]
	-- upvalues: UseAnimateScrollViewToSelectionFunction (copy), UserGameSettings (copy), AXAnimatedScrollingFrameScrollTimeMsRatio (copy)
	return UseAnimateScrollViewToSelectionFunction(p1, if UserGameSettings.ReducedMotion then 0 elseif p2 then p2 else AXAnimatedScrollingFrameScrollTimeMsRatio)
end