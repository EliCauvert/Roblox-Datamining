local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local MotionModule = require(Parent.Motion)
local ReactModule = require(Parent.React)
local FIntBuildExperienceHomeTabsSlideMillisecondsModule = require(BuildExperience.Flags.FIntBuildExperienceHomeTabsSlideMilliseconds)

return function(p1)
	-- upvalues: FIntBuildExperienceHomeTabsSlideMillisecondsModule (copy), FoundationModule (copy), ReactModule (copy), MotionModule (copy)
	local LargestRatio = math.max(0, FIntBuildExperienceHomeTabsSlideMillisecondsModule) / 1000
	local ReducedMotion = FoundationModule.Hooks.usePreferences().reducedMotion
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy)
		local t = {}
		
		for i, tab in p1.tabs do
			t[tostring(tab.id)] = i - 1
		end
		return t
	end, { p1.tabs })
	local UseMemoResultEntry = UseMemoResult[p1.activeTab] or 0
	local UseMotionResult, UseMotionResult2 = MotionModule.useMotion({ page = UseMemoResultEntry })
	local UseRefResult = ReactModule.useRef(p1.showTabs)
	local ShowTabs = p1.showTabs
	ReactModule.useLayoutEffect(function()
		-- upvalues: ShowTabs (copy), UseRefResult (copy), ReducedMotion (copy), UseMotionResult2 (copy), MotionModule (upval), UseMemoResultEntry (copy), LargestRatio (copy)
		local NoReducedMotion: boolean = ShowTabs and (UseRefResult.current and not ReducedMotion)
		UseRefResult.current = ShowTabs
		UseMotionResult2(MotionModule.createState({ page = UseMemoResultEntry }, {
			default = MotionModule.transition({
				duration = if NoReducedMotion then LargestRatio else 0,
				easingStyle = Enum.EasingStyle.Quad
			})
		}))
	end, {
		UseMemoResultEntry,
		UseMotionResult2,
		ReducedMotion,
		ShowTabs,
		LargestRatio
	})
	
	return {
		pageOffset = UseMotionResult.page,
		tabOrder = UseMemoResult
	}
end