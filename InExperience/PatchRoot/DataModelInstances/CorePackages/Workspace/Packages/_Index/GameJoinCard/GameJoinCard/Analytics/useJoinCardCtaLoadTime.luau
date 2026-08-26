local gameJoinCard = script:FindFirstAncestor("GameJoinCard")
local parent = gameJoinCard.Parent
local reactModule = require(parent.React)
local gameJoinCardTTIModule = require(gameJoinCard.Telemetry.GameJoinCardTTI)
local useGameJoinCardAnalyticsModule = require(script.Parent.useGameJoinCardAnalytics)
local fFlagJoinCardAgeCheckUpsell = require(parent.SharedFlags).FFlagJoinCardAgeCheckUpsell

return function(p1)
	-- upvalues: reactModule (ref), fFlagJoinCardAgeCheckUpsell (ref), gameJoinCardTTIModule (ref), useGameJoinCardAnalyticsModule (ref)
	local var1 = reactModule.useRef(tick())
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useRef(false)
	local var4 = reactModule.useRef(false)
	local var5 = reactModule.useRef(p1.ctaType)
	var5.current = p1.ctaType
	local var6 = reactModule.useRef(p1.wasCached)
	var6.current = p1.wasCached
	reactModule.useEffect(function()
		-- upvalues: fFlagJoinCardAgeCheckUpsell (copy), var3 (ref), var2 (ref), gameJoinCardTTIModule (copy), var4 (ref), p1 (ref), var1 (ref), useGameJoinCardAnalyticsModule (copy), var5 (ref), var6 (ref)
		if not fFlagJoinCardAgeCheckUpsell then return end
		if not var3.current then
			var3.current = true
			var2.current = gameJoinCardTTIModule.consumeMobileCardClickStartMs()
		end
		if var4.current or p1.isLoading then
			return
		end
		var4.current = true
		useGameJoinCardAnalyticsModule.logJoinCardCtaLoadTime({
			durationMs = tick() * 1000 - (var2.current or var1.current * 1000),
			ctaType = var5.current,
			wasCached = var6.current == true
		})
	end, { p1.isLoading })
end