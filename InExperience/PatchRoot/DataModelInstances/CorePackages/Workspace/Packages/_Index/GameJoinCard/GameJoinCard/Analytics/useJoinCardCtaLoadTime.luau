local gameJoinCard = script:FindFirstAncestor("GameJoinCard")
local parent = gameJoinCard.Parent
local reactModule = require(parent.React)
local gameJoinCardTTIModule = require(gameJoinCard.Telemetry.GameJoinCardTTI)
local useGameJoinCardAnalyticsModule = require(script.Parent.useGameJoinCardAnalytics)
local fFlagJoinCardAgeCheckUpsell = require(parent.SharedFlags).FFlagJoinCardAgeCheckUpsell

return function(p0) --[[ line: 46 | named "useJoinCardCtaLoadTime" ]]
	-- upvalues: reactModule (ref), fFlagJoinCardAgeCheckUpsell (ref), gameJoinCardTTIModule (ref), useGameJoinCardAnalyticsModule (ref)
	local var4 = reactModule.useRef(tick())
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useRef(false)
	local var7 = reactModule.useRef(false)
	local var8 = reactModule.useRef(p0.ctaType)
	var8.current = p0.ctaType
	local var9 = reactModule.useRef(p0.wasCached)
	var9.current = p0.wasCached
	reactModule.useEffect(function() --[[ line: 57 ]]
		-- upvalues: fFlagJoinCardAgeCheckUpsell (copy), var6 (ref), var5 (ref), gameJoinCardTTIModule (copy), var7 (ref), p0 (ref), var4 (ref), useGameJoinCardAnalyticsModule (copy), var8 (ref), var9 (ref)
		if not fFlagJoinCardAgeCheckUpsell then return end
		if not var6.current then
			var6.current = true
			var5.current = gameJoinCardTTIModule.consumeMobileCardClickStartMs()
		end
		if var7.current or p0.isLoading then
			return
		end
		var7.current = true
		useGameJoinCardAnalyticsModule.logJoinCardCtaLoadTime({
			durationMs = tick() * 1000 - (var5.current or var4.current * 1000),
			ctaType = var8.current,
			wasCached = var9.current == true
		})
	end, { p0.isLoading })
end