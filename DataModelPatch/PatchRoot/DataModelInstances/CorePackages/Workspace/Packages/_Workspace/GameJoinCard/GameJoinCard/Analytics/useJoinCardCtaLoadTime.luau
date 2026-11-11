local GameJoinCard = script:FindFirstAncestor("GameJoinCard")
local Parent = GameJoinCard.Parent
local ReactModule = require(Parent.React)
local GameJoinCardTTIModule = require(GameJoinCard.Telemetry.GameJoinCardTTI)
local UseGameJoinCardAnalyticsModule = require(script.Parent.useGameJoinCardAnalytics)
local FFlagJoinCardAgeCheckUpsell = require(Parent.SharedFlags).FFlagJoinCardAgeCheckUpsell

return function(p1)
	-- upvalues: ReactModule (copy), FFlagJoinCardAgeCheckUpsell (copy), GameJoinCardTTIModule (copy), UseGameJoinCardAnalyticsModule (copy)
	local UseRefResult = ReactModule.useRef(tick())
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(false)
	local UseRefResult3 = ReactModule.useRef(false)
	local UseRefResult4 = ReactModule.useRef(p1.ctaType)
	UseRefResult4.current = p1.ctaType
	local UseRefResult5 = ReactModule.useRef(p1.wasCached)
	UseRefResult5.current = p1.wasCached
	ReactModule.useEffect(function()
		-- upvalues: FFlagJoinCardAgeCheckUpsell (upval), UseRefResult2 (copy), UseRefResult1 (copy), GameJoinCardTTIModule (upval), UseRefResult3 (copy), p1 (copy), UseRefResult (copy), UseGameJoinCardAnalyticsModule (upval), UseRefResult4 (copy), UseRefResult5 (copy)
		if not FFlagJoinCardAgeCheckUpsell then return end
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
	end, { p1.isLoading })
end