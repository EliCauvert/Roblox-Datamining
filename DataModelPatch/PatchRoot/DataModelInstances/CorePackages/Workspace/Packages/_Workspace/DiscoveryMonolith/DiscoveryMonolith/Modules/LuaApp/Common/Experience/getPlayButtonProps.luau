local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local PlayButtonStates = require(Parent.GamePlayButton).PlayButtonStates
local ButtonType = require(Parent.UIBlox).App.Button.Enum.ButtonType
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local FFlagLuaAppPlayButtonLoadingPrimary = require(Parent.SharedFlags).FFlagLuaAppPlayButtonLoadingPrimary
local FFlagUpdateActionNeededPlayButtonUi = require(Parent.SharedFlags).FFlagUpdateActionNeededPlayButtonUi
local FFlagLuaAppTextOnlyPlayButton = require(Parent.SharedFlags).FFlagLuaAppTextOnlyPlayButton
local FFlagLuaAppIconTextPlayButton = require(Parent.SharedFlags).FFlagLuaAppIconTextPlayButton
local FFlagLuaAppUpdatePlayButtonText = require(Parent.SharedFlags).FFlagLuaAppUpdatePlayButtonText

return function(ActionNeeded, p1)
	-- upvalues: PlayButtonStates (copy), FFlagLuaAppPlayButtonLoadingPrimary (copy), ButtonType (copy), FFlagLuaAppTextOnlyPlayButton (copy), FFlagLuaAppIconTextPlayButton (copy), FFlagLuaAppUpdatePlayButtonText (copy), GetFFlagIsSquadEnabledFunction (copy), FFlagUpdateActionNeededPlayButtonUi (copy)
	assert(ActionNeeded ~= nil, "Expect playButtonState ~= nil")
	local t = {}
	
	if ActionNeeded == PlayButtonStates.Loading then
		t.icon = "icons/status/unavailable"
		t.isLoading = true
		t.isDisabled = true
		t.buttonType = if FFlagLuaAppPlayButtonLoadingPrimary then ButtonType.PrimaryContextual else ButtonType.Secondary
		
		return t
	end
	if ActionNeeded == PlayButtonStates.Playable then
		if FFlagLuaAppTextOnlyPlayButton or FFlagLuaAppIconTextPlayButton then
			t.textKey = if FFlagLuaAppUpdatePlayButtonText then "Feature.ExperienceDetails.PlayButtonText.Play" else "Feature.ExperienceDetails.PlayButtonText.ActionNeeded"
		end
		if not FFlagLuaAppTextOnlyPlayButton then
			t.icon = "icons/common/play"
		end
		t.isDisabled = false
		
		return t
	else
		if ActionNeeded == PlayButtonStates.PaidAccess then
			assert(p1 ~= nil, "gameProductInfo cannot be nil when PlayButtonStates.PaidAccess")
			t.price = p1.price
			t.icon = "icons/common/robux"
			t.isDisabled = false
			
			return t
		end
		if ActionNeeded == PlayButtonStates.FiatPaidAccess then
			assert(p1 ~= nil, "gameProductInfo cannot be nil when PlayButtonStates.FiatPaidAccess")
			t.localizedFiatPrice = p1.localizedFiatPrice
			t.isDisabled = false
			
			return t
		end
		if ActionNeeded == PlayButtonStates.UnplayableOther then
			t.icon = "icons/status/unavailable"
			t.textKey = "Feature.ExperienceDetails.PlayButtonText.Unavailable"
			t.isDisabled = true
			t.buttonType = ButtonType.Secondary
			
			return t
		end
		if GetFFlagIsSquadEnabledFunction() and ActionNeeded == PlayButtonStates.PlayableWithParty then
			t.icon = "icons/common/play"
			t.textKey = "Feature.Squads.Action.JoinWithParty"
			t.isDisabled = false
			t.showSquadButton = true
			
			return t
		end
		if GetFFlagIsSquadEnabledFunction() and ActionNeeded == PlayButtonStates.WaitingForParty then
			t.icon = "icons/common/play"
			t.textKey = "Feature.Squads.Action.WaitingForParty"
			t.isDisabled = true
			t.showSquadButton = true
			t.isSquadButtonDisabled = true
			
			return t
		end
		if ActionNeeded ~= PlayButtonStates.ActionNeeded then
			t.icon = "icons/status/unavailable"
			t.textKey = "Feature.ExperienceDetails.PlayButtonText.Unavailable"
			t.isDisabled = true
			t.buttonType = ButtonType.Secondary
			
			return t
		end
		if FFlagUpdateActionNeededPlayButtonUi then
			t.textKey = "Feature.ExperienceDetails.PlayButtonText.Unlock"
		else
			t.textKey = "Feature.ExperienceDetails.PlayButtonText.ActionNeeded"
			t.icon = "icons/status/private"
			t.buttonType = ButtonType.PrimarySystem
		end
		t.isDisabled = false
		
		return t
	end
end