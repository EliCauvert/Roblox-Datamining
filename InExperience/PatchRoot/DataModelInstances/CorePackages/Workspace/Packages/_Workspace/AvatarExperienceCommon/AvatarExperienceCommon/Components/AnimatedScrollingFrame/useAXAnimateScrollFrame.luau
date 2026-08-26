local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local useAnimateScrollViewToSelection = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.AppBlox).useAnimateScrollViewToSelection
local AXAnimatedScrollingFrameScrollTimeMs = game:DefineFastInt("AXAnimatedScrollingFrameScrollTimeMs", 200)
local var1 = if AXAnimatedScrollingFrameScrollTimeMs > 0 then AXAnimatedScrollingFrameScrollTimeMs / 1000 else 0.2

return function(p1, p2)
	-- upvalues: useAnimateScrollViewToSelection (ref), userGameSettingsService (ref), var1 (ref)
	return useAnimateScrollViewToSelection(p1, if userGameSettingsService.ReducedMotion then 0 else p2 or var1)
end