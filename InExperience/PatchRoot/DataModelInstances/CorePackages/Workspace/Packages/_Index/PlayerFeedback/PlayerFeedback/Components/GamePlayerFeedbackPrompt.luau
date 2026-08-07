local playerFeedback = script:FindFirstAncestor("PlayerFeedback")
local parent = playerFeedback.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local inlinePrompt = require(parent.AppBlox).InlinePrompt
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local appEventIngestService = require(parent.RoactServiceTags).AppEventIngestService
local playerFeedbackEventsModule = require(playerFeedback.Analytics.Events.PlayerFeedbackEvents)
local getFFlagEdpPlayerFeedbackPromptTitleOnly = require(parent.SharedFlags).GetFFlagEdpPlayerFeedbackPromptTitleOnly
local images = UIBloxModule.App.ImageSet.Images
local standardButtonSize = UIBloxModule.App.Button.Enum.StandardButtonSize
local buttonType = UIBloxModule.App.Button.Enum.ButtonType

return function(p0) --[[ line: 26 | named "GamePlayerFeedbackPrompt" ]]
	-- upvalues: useLocalization (ref), getFFlagEdpPlayerFeedbackPromptTitleOnly (ref), useRoactService (ref), appEventIngestService (ref), reactModule (ref), playerFeedbackEventsModule (ref), inlinePrompt (ref), images (ref), buttonType (ref), standardButtonSize (ref)
	local var4 = useLocalization({
		buttonLabelKey = "PlayerFeedbacks.VoteForm.PromptBanner.GiveFeedbackButton",
		messageKey = "PlayerFeedbacks.VoteForm.PromptBanner.Message",
		titleKey = "PlayerFeedbacks.VoteForm.PromptBanner.Title",
		titleOnlyKey = if getFFlagEdpPlayerFeedbackPromptTitleOnly() then "PlayerFeedbacks.VoteForm.PromptBanner.TitleOnly" else nil
	})
	local var5 = useRoactService(appEventIngestService)
	local var6 = reactModule.useCallback(function() --[[ line: 36 ]]
		-- upvalues: playerFeedbackEventsModule (copy), var5 (ref), p0 (ref)
		playerFeedbackEventsModule.ClickPlayerFeedbackPromptCta(var5, p0.placeId)
		p0.onButtonClick()
	end, { var5, p0.placeId, p0.onButtonClick })
	local var7 = reactModule.useCallback(function() --[[ line: 41 ]]
		-- upvalues: playerFeedbackEventsModule (copy), var5 (ref), p0 (ref)
		playerFeedbackEventsModule.DismissPlayerFeedbackPrompt(var5, p0.placeId)
		p0.onDimiss()
	end, { var5, p0.placeId, p0.onDimiss })
	reactModule.useEffect(function() --[[ line: 46 ]]
		-- upvalues: playerFeedbackEventsModule (copy), var5 (ref), p0 (ref)
		playerFeedbackEventsModule.PlayerFeedbackPromptMounted(var5, p0.placeId)
	end, { var5, p0.placeId })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = if p0.width then UDim2.new(0, p0.width, 0, 0) else UDim2.new(1, 0, 0, 0),
		LayoutOrder = p0.LayoutOrder
	}, {
		InlinePrompt = reactModule.createElement(inlinePrompt, {
			showDismiss = true,
			iconImage = if getFFlagEdpPlayerFeedbackPromptTitleOnly() then nil else images["icons/menu/platformChatOff"],
			titleMessage = if getFFlagEdpPlayerFeedbackPromptTitleOnly() then var4.titleOnlyKey else var4.titleKey,
			sublineMessage = if getFFlagEdpPlayerFeedbackPromptTitleOnly() then nil else var4.messageKey,
			buttonProps = {
				text = var4.buttonLabelKey,
				buttonType = buttonType.Secondary,
				standardSize = standardButtonSize.XSmall,
				onActivated = var6
			},
			onDismiss = var7,
			backgroundTransparency = p0.backgroundTransparency,
			backgroundColor3 = p0.backgroundColor3
		})
	})
end