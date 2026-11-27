local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local _ = require(BuildExperience.Chat.useChatSessionCore)
local _ = require(BuildExperience.Components.ModelPicker.ModelPickerTypes)
local UseCreatorCreditChatUpsellViewModelModule = require(BuildExperience.Components.BuildChatPage.useCreatorCreditChatUpsellViewModel)
local _ = require(BuildExperience.Components.BuildPillMenu.BuildPillMenuPageHost)

return function(p1, p2, UniverseId, PlaceId, SessionId)
	-- upvalues: ReactModule (copy), UseCreatorCreditChatUpsellViewModelModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseStateResult2 (copy)
		local Current = p1.textBoxRef.current
		
		if Current ~= nil then
			Current.releaseFocus()
		end
		UseStateResult2(true)
	end, { p1.textBoxRef })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, { UniverseId, SessionId })
	local FundingFailure = p1.fundingFailure
	
	return {
		card = UseCreatorCreditChatUpsellViewModelModule({
			namedTier = if p2 and p2.selectedId == "advanced" and (not p2.internalTesting or not p2.internalTesting.isSelected) then "advanced" else "default",
			isAssistantResponding = p1.isAssistantResponding,
			outOfCreditsPromptFailureCount = if FundingFailure then FundingFailure.count else nil,
			outOfCreditsPromptFailureReason = if FundingFailure then FundingFailure.reason else nil,
			onOpenCreatorCreditPage = if UniverseId == nil then nil else UseResult
		}),
		page = if UseStateResult and UniverseId ~= nil then {
			activePage = { type = "creator-credit" },
			target = {
				isNewGameTarget = false,
				universeId = UniverseId,
				placeId = PlaceId,
				sessionId = SessionId
			},
			onClose = UseResult1
		} else nil
	}
end