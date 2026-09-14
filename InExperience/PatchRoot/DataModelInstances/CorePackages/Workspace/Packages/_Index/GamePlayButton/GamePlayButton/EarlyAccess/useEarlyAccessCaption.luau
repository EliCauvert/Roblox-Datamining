local gamePlayButton = script:FindFirstAncestor("GamePlayButton")
local useCountdownTextModule = require(gamePlayButton.EarlyAccess.useCountdownText)
local useLocalization = require(gamePlayButton.Parent.Localization).Hooks.useLocalization

return function(p1)
	-- upvalues: useCountdownTextModule (ref), useLocalization (ref)
	local var1 = useCountdownTextModule(if p1 then p1.unlockTimestamp else nil)
	
	return if var1 == "" then nil else useLocalization({
		joinIn = { "Feature.RobloxSubscription.Action.JoinIn", time = var1 }
	}).joinIn
end