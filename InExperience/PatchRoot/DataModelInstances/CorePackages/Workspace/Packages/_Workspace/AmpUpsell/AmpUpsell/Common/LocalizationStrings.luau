local enumsModule = require(script.Parent.Enums)
local _ = require(script.Parent.Types)
local actionTypeEnum = enumsModule.ActionTypeEnum
local userSettingsSettingNameEnum = enumsModule.UserSettingsSettingNameEnum
local VPCErrorCategoriesEnum = enumsModule.VPCErrorCategoriesEnum
local t = {
	[actionTypeEnum.GovernmentId] = {
		title = "Feature.AgeVerificationUpsell.Modal.Title",
		message = "Feature.AgeVerificationUpsell.Modal.ContentText",
		buttonCancel = "Feature.AgeVerificationUpsell.Button.Cancel",
		buttonSettings = "Feature.AgeVerificationUpsell.Button.Settings"
	},
	[actionTypeEnum.Phone] = {
		title = "Amp.AccountSettingsUpsell.Phone.Modal.Title",
		message = "Amp.AccountSettingsUpsell.Phone.Modal.ContentText",
		buttonCancel = "Amp.AccountSettingsUpsell.Phone.Button.Cancel",
		buttonSettings = "Amp.AccountSettingsUpsell.Phone.Button.Settings"
	},
	[actionTypeEnum.Email] = {
		title = "Amp.AccountSettingsUpsell.Email.Modal.Title",
		message = "Amp.AccountSettingsUpsell.Email.Modal.ContentText",
		buttonCancel = "Amp.AccountSettingsUpsell.Email.Button.Cancel",
		buttonSettings = "Amp.AccountSettingsUpsell.Email.Button.Settings"
	},
	[actionTypeEnum.AddedEmail] = {
		title = "Amp.AccountSettingsUpsell.Email.Modal.Title",
		message = "Amp.AccountSettingsUpsell.Email.Modal.ContentText",
		buttonCancel = "Amp.AccountSettingsUpsell.Email.Button.Cancel",
		buttonSettings = "Amp.AccountSettingsUpsell.Email.Button.Settings"
	}
}
local t_1 = {
	[userSettingsSettingNameEnum.AllowFacialAgeEstimation] = {
		title = "Feature.AgeVerificationUpsell.Title.AgeSettingsRedirect",
		message = "Feature.AgeVerificationUpsell.Body.AgeSettingsRedirect",
		buttonCancel = "Feature.AgeVerificationUpsell.Button.Cancel",
		buttonSettings = "Feature.AgeVerificationUpsell.Button.Continue"
	}
}

return {
	accountSettingsUpsellStringsFn = function(value) --[[ line: 53 ]]
		-- upvalues: actionTypeEnum (ref), t_1 (ref), t (ref)
		local action = value.action
		
		if action ~= actionTypeEnum.UserSettings then
			return t[action]
		end
		local userSettings = value.userSettings
		
		return if userSettings and userSettings.settingName then t_1[userSettings.settingName] else nil
	end,
	accountSettingsUpsellStrings = t,
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