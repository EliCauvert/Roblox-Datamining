local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local MotionModule = require(Parent.Motion)
local ReactModule = require(Parent.React)
local _ = require(BuildExperience.Stores.GetSearchQueryStore.createSearchQueryStore)
local ReleaseFocusWithinModule = require(BuildExperience.utils.releaseFocusWithin)

return function(p1)
	-- upvalues: ReactModule (copy), FoundationModule (copy), MotionModule (copy), ReleaseFocusWithinModule (copy)
	local SearchQueryStore = p1.searchQueryStore
	local UseRefResult = ReactModule.useRef(nil)
	local UseIsSearchActiveResult = SearchQueryStore.useIsSearchActive()
	local UseIsSearchActiveResult1 = p1.isCompact and UseIsSearchActiveResult
	local ReducedMotion = FoundationModule.Hooks.usePreferences().reducedMotion
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseMotionResult, UseMotionResult2 = MotionModule.useMotion({ progress = if UseIsSearchActiveResult1 then 1 else 0 })
	ReactModule.useEffect(function()
		-- upvalues: UseIsSearchActiveResult (copy), ReleaseFocusWithinModule (upval), UseRefResult (copy)
		if not UseIsSearchActiveResult then
			ReleaseFocusWithinModule(UseRefResult.current)
		end
	end, { UseIsSearchActiveResult })
	local UseRefResult1 = ReactModule.useRef(p1.isCompact)
	UseRefResult1.current = p1.isCompact
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), SearchQueryStore (copy)
		return function()
			-- upvalues: UseRefResult1 (upval), SearchQueryStore (upval)
			if UseRefResult1.current then
				SearchQueryStore.endSearch()
				
				return
			else
				SearchQueryStore.setIsSearchActive(false)
			end
		end
	end, { SearchQueryStore })
	ReactModule.useEffect(function()
		-- upvalues: UseMotionResult2 (copy), MotionModule (upval), UseIsSearchActiveResult1 (copy), ReducedMotion (copy), UseTokensResult (copy)
		UseMotionResult2(MotionModule.createState({ progress = if UseIsSearchActiveResult1 then 1 else 0 }, {
			default = MotionModule.transition({
				duration = if ReducedMotion then 0 else UseTokensResult.Time.Time_200,
				easingStyle = Enum.EasingStyle.Quad
			})
		}))
	end, {
		UseMotionResult2,
		UseIsSearchActiveResult1,
		ReducedMotion,
		UseTokensResult
	})
	
	return {
		isCompactSearchOpen = UseIsSearchActiveResult1,
		fadeProgress = UseMotionResult.progress,
		headerRef = UseRefResult
	}
end