local PlayerFeedback = script:FindFirstAncestor("PlayerFeedback")
local Parent = PlayerFeedback.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local InlinePrompt = require(Parent.AppBlox).InlinePrompt
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local AppEventIngestService = require(Parent.RoactServiceTags).AppEventIngestService
local PlayerFeedbackEventsModule = require(PlayerFeedback.Analytics.Events.PlayerFeedbackEvents)
local GetFFlagEdpPlayerFeedbackPromptTitleOnlyFunction = require(Parent.SharedFlags).GetFFlagEdpPlayerFeedbackPromptTitleOnly
local Images = UIBloxModule.App.ImageSet.Images
local StandardButtonSize = UIBloxModule.App.Button.Enum.StandardButtonSize
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType

return function(Frame)
	-- upvalues: UseLocalizationFunction (copy), GetFFlagEdpPlayerFeedbackPromptTitleOnlyFunction (copy), UseRoactServiceFunction (copy), AppEventIngestService (copy), ReactModule (copy), PlayerFeedbackEventsModule (copy), InlinePrompt (copy), Images (copy), ButtonType (copy), StandardButtonSize (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		buttonLabelKey = "PlayerFeedbacks.VoteForm.PromptBanner.GiveFeedbackButton",
		messageKey = "PlayerFeedbacks.VoteForm.PromptBanner.Message",
		titleKey = "PlayerFeedbacks.VoteForm.PromptBanner.Title",
		titleOnlyKey = if GetFFlagEdpPlayerFeedbackPromptTitleOnlyFunction() then "PlayerFeedbacks.VoteForm.PromptBanner.TitleOnly" else nil
	})
	local UseRoactServiceResult = UseRoactServiceFunction(AppEventIngestService)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: PlayerFeedbackEventsModule (upval), UseRoactServiceResult (copy), Frame (copy)
		PlayerFeedbackEventsModule.ClickPlayerFeedbackPromptCta(UseRoactServiceResult, Frame.placeId)
		Frame.onButtonClick()
	end, {
		UseRoactServiceResult,
		Frame.placeId,
		Frame.onButtonClick
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: PlayerFeedbackEventsModule (upval), UseRoactServiceResult (copy), Frame (copy)
		PlayerFeedbackEventsModule.DismissPlayerFeedbackPrompt(UseRoactServiceResult, Frame.placeId)
		Frame.onDimiss()
	end, { UseRoactServiceResult, Frame.placeId, Frame.onDimiss })
	ReactModule.useEffect(function()
		-- upvalues: PlayerFeedbackEventsModule (upval), UseRoactServiceResult (copy), Frame (copy)
		PlayerFeedbackEventsModule.PlayerFeedbackPromptMounted(UseRoactServiceResult, Frame.placeId)
	end, { UseRoactServiceResult, Frame.placeId })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = if Frame.width then UDim2.new(0, Frame.width, 0, 0) else UDim2.new(1, 0, 0, 0),
		LayoutOrder = Frame.LayoutOrder
	}, {
		InlinePrompt = ReactModule.createElement(InlinePrompt, {
			showDismiss = true,
			iconImage = if GetFFlagEdpPlayerFeedbackPromptTitleOnlyFunction() then nil else Images["icons/menu/platformChatOff"],
			titleMessage = if GetFFlagEdpPlayerFeedbackPromptTitleOnlyFunction() then UseLocalizationResult.titleOnlyKey else UseLocalizationResult.titleKey,
			sublineMessage = if GetFFlagEdpPlayerFeedbackPromptTitleOnlyFunction() then nil else UseLocalizationResult.messageKey,
			buttonProps = {
				text = UseLocalizationResult.buttonLabelKey,
				buttonType = ButtonType.Secondary,
				standardSize = StandardButtonSize.XSmall,
				onActivated = UseResult
			},
			onDismiss = UseResult1,
			backgroundTransparency = Frame.backgroundTransparency,
			backgroundColor3 = Frame.backgroundColor3
		})
	})
end