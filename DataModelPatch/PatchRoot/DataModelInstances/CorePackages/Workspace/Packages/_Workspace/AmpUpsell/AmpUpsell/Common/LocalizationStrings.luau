local EnumsModule = require(script.Parent.Enums)
local _ = require(script.Parent.Types)
local ActionTypeEnum = EnumsModule.ActionTypeEnum
local VPCErrorCategoriesEnum = EnumsModule.VPCErrorCategoriesEnum
local AccountSettingsUpsellStrings = {
	[ActionTypeEnum.GovernmentId] = {
		title = "Feature.AgeVerificationUpsell.Modal.Title",
		message = "Feature.AgeVerificationUpsell.Modal.ContentText",
		buttonCancel = "Feature.AgeVerificationUpsell.Button.Cancel",
		buttonSettings = "Feature.AgeVerificationUpsell.Button.Settings"
	},
	[ActionTypeEnum.Phone] = {
		title = "Amp.AccountSettingsUpsell.Phone.Modal.Title",
		message = "Amp.AccountSettingsUpsell.Phone.Modal.ContentText",
		buttonCancel = "Amp.AccountSettingsUpsell.Phone.Button.Cancel",
		buttonSettings = "Amp.AccountSettingsUpsell.Phone.Button.Settings"
	},
	[ActionTypeEnum.Email] = {
		title = "Amp.AccountSettingsUpsell.Email.Modal.Title",
		message = "Amp.AccountSettingsUpsell.Email.Modal.ContentText",
		buttonCancel = "Amp.AccountSettingsUpsell.Email.Button.Cancel",
		buttonSettings = "Amp.AccountSettingsUpsell.Email.Button.Settings"
	},
	[ActionTypeEnum.AddedEmail] = {
		title = "Amp.AccountSettingsUpsell.Email.Modal.Title",
		message = "Amp.AccountSettingsUpsell.Email.Modal.ContentText",
		buttonCancel = "Amp.AccountSettingsUpsell.Email.Button.Cancel",
		buttonSettings = "Amp.AccountSettingsUpsell.Email.Button.Settings"
	}
}
local config = {
	[EnumsModule.UserSettingsSettingNameEnum.AllowFacialAgeEstimation] = {
		title = "Feature.AgeVerificationUpsell.Title.AgeSettingsRedirect",
		message = "Feature.AgeVerificationUpsell.Body.AgeSettingsRedirect",
		buttonCancel = "Feature.AgeVerificationUpsell.Button.Cancel",
		buttonSettings = "Feature.AgeVerificationUpsell.Button.Continue"
	}
}

return {
	accountSettingsUpsellStringsFn = function(p1)
		-- upvalues: ActionTypeEnum (copy), config (copy), AccountSettingsUpsellStrings (copy)
		local Action = p1.action
		
		if Action == ActionTypeEnum.UserSettings then
			local UserSettings = p1.userSettings
			
			return if UserSettings and UserSettings.settingName then config[UserSettings.settingName] else nil
		else
			return AccountSettingsUpsellStrings[Action]
		end
	end,
	accountSettingsUpsellStrings = AccountSettingsUpsellStrings,
	idvWithQRCodeUpsellStrings = {
		title = "Amp.IDVUpsell.Modal.Title",
		beginText = "Amp.IDVUpsell.Modal.QRHeaderText",
		disclaimer = "Amp.IDVUpsell.Modal.Disclaimer",
		privacyLinkText = "Amp.IDVUpsell.Modal.PrivacyLinkText",
		idDirectionsHeader = "Amp.IDVUpsell.Directions.IDHeader",
		idDirectionsBody = "Amp.IDVUpsell.Directions.IDBody",
		phoneDirectionsHeader = "Amp.IDVUpsell.Directions.PhoneHeader",
		phoneDirectionsBody = "Amp.IDVUpsell.Directions.PhoneBody",
		privacyPageHeader = "Amp.IDVUpsell.PrivacyPageHeader",
		ageVerifyPrompt = "Verification.Identity.Label.AgeVerifyPrompt",
		verifyInBrowser = "Verification.Identity.Label.VerifyInBrowser",
		dontCloseWindowDisclaimer = "Verification.Identity.Label.PleaseDoNotClose",
		havingTroubleInfoText = "Verification.Identity.Label.HavingTroubleScanCode",
		startVerification = "Amp.IDVUpsell.Button.StartVerification",
		cancel = "Amp.IDVUpsell.Button.Cancel"
	},
	idvErrorScreenStrings = {
		timeout = "Amp.IDVErrorScreen.Timeout",
		declined = "Amp.IDVErrorScreen.Declined",
		retry = "Amp.IDVErrorScreen.Retry",
		close = "Amp.IDVErrorScreen.Close",
		title = "Amp.IDVErrorScreen.Title"
	},
	vpcUpsellGatherEmailStrings = {
		titleText = "Feature.Parents.Title.EnterParentEmailV2",
		buttonText = "Feature.Parents.Action.SendEmail",
		textFieldHeaderText = "Feature.Parents.Label.ParentEmail",
		errorText = "Feature.Parents.Message.InvalidEmail",
		emailPlaceholder = "Feature.Parents.Label.Email",
		privacyLinkText = "Amp.IDVUpsell.PrivacyPageHeader",
		childInstructions = "Feature.Parents.Description.EnterParentEmail.ChildInstructions",
		parentInstructionsPC = "Feature.Parents.Description.EnterParentEmail.PC",
		parentInstructionsNoPC = "Feature.Parents.Description.EnterParentEmail.NoPC"
	},
	vpcErrorCategoryToMessageStrings = {
		[VPCErrorCategoriesEnum.InternalVPCError] = {
			title = "Feature.Parents.Title.SomethingWentWrong",
			body = "Feature.Parents.Message.SomethingWentWrong"
		},
		[VPCErrorCategoriesEnum.InvalidEmail] = {
			title = "Feature.Parents.Title.SomethingWentWrong",
			body = "Feature.Parents.Message.EmailIneligible"
		},
		[VPCErrorCategoriesEnum.Flooded] = {
			title = "Feature.Parents.Title.SomethingWentWrong",
			body = "Feature.Parents.Message.TooManyAttempts"
		},
		[VPCErrorCategoriesEnum.SenderFlooded] = {
			title = "Feature.Parents.Title.SomethingWentWrong",
			body = "Feature.Parents.Message.TooManyAttemptAskParent"
		},
		[VPCErrorCategoriesEnum.ReceiverFlooded] = {
			title = "Feature.Parents.Title.SomethingWentWrong",
			body = "Feature.Parents.Message.TooManyAttempts"
		},
		[VPCErrorCategoriesEnum.BadUserInput] = {
			title = "Feature.Parents.Title.SomethingWentWrong",
			body = "Feature.Parents.Message.SomethingWentWrong"
		},
		[VPCErrorCategoriesEnum.UserStateRecoursePathMismatch] = {
			title = "Feature.Parents.Title.SomethingWentWrong",
			body = "Feature.Parents.Message.SomethingWentWrong"
		},
		[VPCErrorCategoriesEnum.SenderFloodedRequestCreated] = {
			title = "Amp.Upsell.Title.RequestSent",
			body = "Feature.Parents.Message.RequestCreatedEmailNotSent"
		},
		[VPCErrorCategoriesEnum.GenericError] = {
			title = "Feature.Parents.Title.SomethingWentWrong",
			body = "Feature.Parents.Message.SomethingWentWrong"
		},
		[VPCErrorCategoriesEnum.ConflictingPendingConsent] = {
			title = "Feature.Parents.Title.SomethingWentWrong",
			body = "Feature.Parents.Message.ConflictingPendingConsent"
		}
	},
	vpcErrorScreenStrings = {
		retryButton = "Amp.ErrorScreen.Retry",
		cancelButton = "Amp.ErrorScreen.Cancel",
		okButton = "CommonUI.Controls.Action.OK"
	},
	vpcConfirmationScreenStrings = {
		title = "Amp.Upsell.Title.RequestSent",
		oneParentBody = "Amp.Upsell.Message.EmailSent",
		multipleParentsBody = "Amp.Upsell.Message.EmailSentPluralParent",
		buttonText = "CommonUI.Controls.Action.OK"
	},
	vpcPrologueStrings = {
		title = "Amp.Upsell.Title.AskYourParent",
		bodyGeneric = "Amp.Upsell.Description.PrologueTextVpc",
		bodyPurchases = "Amp.Upsell.Description.PrologueEnablePurchase",
		bodyContentRestriction = "Amp.Upsell.Description.PrologueJoinExperience",
		bodyUnblock = "Amp.Upsell.Description.PrologueUnblockUser",
		buttonAsk = "Amp.Upsell.Action.AskNow",
		buttonCancel = "CommonUI.Controls.Action.Cancel"
	}
}