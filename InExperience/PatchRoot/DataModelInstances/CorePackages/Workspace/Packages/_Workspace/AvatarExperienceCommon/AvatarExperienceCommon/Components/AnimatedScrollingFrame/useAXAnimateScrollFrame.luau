local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local useAnimateScrollViewToSelection = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.AppBlox).useAnimateScrollViewToSelection
local AXAnimatedScrollingFrameScrollTimeMs = game:DefineFastInt("AXAnimatedScrollingFrameScrollTimeMs", 200)
local var2 = if AXAnimatedScrollingFrameScrollTimeMs > 0 then AXAnimatedScrollingFrameScrollTimeMs / 1000 else 0.2

return function(p0, p1) --[[ line: 12 | named "useAXAnimateScrollFrame" ]]
	-- upvalues: useAnimateScrollViewToSelection (ref), userGameSettingsService (ref), var2 (ref)
	return useAnimateScrollViewToSelection(p0, if userGameSettingsService.ReducedMotion then 0 else p1 or var2)
end