local GameJoinCard = script:FindFirstAncestor("GameJoinCard")
local Parent = GameJoinCard.Parent
local ReactModule = require(Parent.React)
local GameJoinCardTTIModule = require(GameJoinCard.Telemetry.GameJoinCardTTI)
local UseGameJoinCardAnalyticsModule = require(script.Parent.useGameJoinCardAnalytics)
local FFlagGameJoinCardOptionalActions = require(Parent.SharedFlags).FFlagGameJoinCardOptionalActions

return function(p1) --[[ Line: 45 | Named "useJoinCardCtaLoadTime" ]]
	-- upvalues: ReactModule (copy), FFlagGameJoinCardOptionalActions (copy), GameJoinCardTTIModule (copy), UseGameJoinCardAnalyticsModule (copy)
	local UseRefResult = ReactModule.useRef(tick())
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(false)
	local UseRefResult3 = ReactModule.useRef(false)
	local UseRefResult4 = ReactModule.useRef(p1.ctaType)
	UseRefResult4.current = p1.ctaType
	local UseRefResult5 = ReactModule.useRef(p1.wasCached)
	UseRefResult5.current = p1.wasCached
	ReactModule.useEffect(function() --[[ Line: 56 ]]
		-- upvalues: FFlagGameJoinCardOptionalActions (upval), p1 (copy), UseRefResult2 (copy), UseRefResult1 (copy), GameJoinCardTTIModule (upval), UseRefResult3 (copy), UseRefResult (copy), UseGameJoinCardAnalyticsModule (upval), UseRefResult4 (copy), UseRefResult5 (copy)
		if FFlagGameJoinCardOptionalActions and p1.isDisabled then return end
		if not UseRefResult2.current then
			UseRefResult2.current = true
			UseRefResult1.current = GameJoinCardTTIModule.consumeMobileCardClickStartMs()
		end
		if not UseRefResult3.current and not p1.isLoading then
			UseRefResult3.current = true
			UseGameJoinCardAnalyticsModule.logJoinCardCtaLoadTime({
				durationMs = tick() * 1000 - (UseRefResult1.current or UseRefResult.current * 1000),
				ctaType = UseRefResult4.current,
				wasCached = UseRefResult5.current == true
			})
			
			return
		end
	end, {
		p1.isLoading,
		if FFlagGameJoinCardOptionalActions then p1.isDisabled else nil
	})
end