local GamePlayButton = script:FindFirstAncestor("GamePlayButton")
local UseCountdownTextModule = require(GamePlayButton.EarlyAccess.useCountdownText)
local UseLocalizationFunction = require(GamePlayButton.Parent.Localization).Hooks.useLocalization

return function(p1) --[[ Line: 8 | Named "useEarlyAccessCaption" ]]
	-- upvalues: UseCountdownTextModule (copy), UseLocalizationFunction (copy)
	local UseCountdownTextModuleResult = UseCountdownTextModule(if p1 then p1.unlockTimestamp else nil)
	local UseLocalizationResult = UseLocalizationFunction({
		joinIn = {
			"Feature.RobloxSubscription.Action.JoinIn",
			time = UseCountdownTextModuleResult
		}
	})
	
	return if UseCountdownTextModuleResult == "" then nil else UseLocalizationResult.joinIn
end