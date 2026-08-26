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

return function(p1)
	-- upvalues: useLocalization (ref), getFFlagEdpPlayerFeedbackPromptTitleOnly (ref), useRoactService (ref), appEventIngestService (ref), reactModule (ref), playerFeedbackEventsModule (ref), inlinePrompt (ref), images (ref), buttonType (ref), standardButtonSize (ref)
	local var1 = useLocalization({
		buttonLabelKey = "PlayerFeedbacks.VoteForm.PromptBanner.GiveFeedbackButton",
		messageKey = "PlayerFeedbacks.VoteForm.PromptBanner.Message",
		titleKey = "PlayerFeedbacks.VoteForm.PromptBanner.Title",
		titleOnlyKey = if getFFlagEdpPlayerFeedbackPromptTitleOnly() then "PlayerFeedbacks.VoteForm.PromptBanner.TitleOnly" else nil
	})
	local var2 = useRoactService(appEventIngestService)
	local var3 = reactModule.useCallback(function()
		-- upvalues: playerFeedbackEventsModule (copy), var2 (ref), p1 (ref)
		playerFeedbackEventsModule.ClickPlayerFeedbackPromptCta(var2, p1.placeId)
		p1.onButtonClick()
	end, { var2, p1.placeId, p1.onButtonClick })
	local var4 = reactModule.useCallback(function()
		-- upvalues: playerFeedbackEventsModule (copy), var2 (ref), p1 (ref)
		playerFeedbackEventsModule.DismissPlayerFeedbackPrompt(var2, p1.placeId)
		p1.onDimiss()
	end, { var2, p1.placeId, p1.onDimiss })
	reactModule.useEffect(function()
		-- upvalues: playerFeedbackEventsModule (copy), var2 (ref), p1 (ref)
		playerFeedbackEventsModule.PlayerFeedbackPromptMounted(var2, p1.placeId)
	end, { var2, p1.placeId })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = if p1.width then UDim2.new(0, p1.width, 0, 0) else UDim2.new(1, 0, 0, 0),
		LayoutOrder = p1.LayoutOrder
	}, {
		InlinePrompt = reactModule.createElement(inlinePrompt, {
			showDismiss = true,
			iconImage = if getFFlagEdpPlayerFeedbackPromptTitleOnly() then nil else images["icons/menu/platformChatOff"],
			titleMessage = if getFFlagEdpPlayerFeedbackPromptTitleOnly() then var1.titleOnlyKey else var1.titleKey,
			sublineMessage = if getFFlagEdpPlayerFeedbackPromptTitleOnly() then nil else var1.messageKey,
			buttonProps = {
				text = var1.buttonLabelKey,
				buttonType = buttonType.Secondary,
				standardSize = standardButtonSize.XSmall,
				onActivated = var3
			},
			onDismiss = var4,
			backgroundTransparency = p1.backgroundTransparency,
			backgroundColor3 = p1.backgroundColor3
		})
	})
end