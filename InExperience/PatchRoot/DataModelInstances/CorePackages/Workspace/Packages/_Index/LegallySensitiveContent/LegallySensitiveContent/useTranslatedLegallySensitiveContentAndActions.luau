local LegallySensitiveContent = script:FindFirstAncestor("LegallySensitiveContent")
local _ = require(LegallySensitiveContent.Parent.React)
local UpdateUserSettingFunction = require(LegallySensitiveContent.Services.userSettingsService).updateUserSetting
local GrantOneTimeUserConsentFunction = require(LegallySensitiveContent.Services.usersConsentsService).grantOneTimeUserConsent
local UseLocalizationFunction = require(LegallySensitiveContent.dependencies).Localization.Hooks.useLocalization
local LegallySensitiveContentConstantsModule = require(LegallySensitiveContent.Constants.LegallySensitiveContentConstants)
local GetEncodedAuditHeaderFunction = require(LegallySensitiveContent.Utils.AuditUtils).getEncodedAuditHeader
local ConsentNameModule = require(LegallySensitiveContent.Enums.ConsentName)
local _ = require(LegallySensitiveContent.Types.LegallySensitiveContentTypes)

return function(AllowMarketingEmailCheckboxAccountUpgrade, p1)
	-- upvalues: UseLocalizationFunction (copy), LegallySensitiveContentConstantsModule (copy), ConsentNameModule (copy), GetEncodedAuditHeaderFunction (copy), UpdateUserSettingFunction (copy), GrantOneTimeUserConsentFunction (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		phoneNumberDiscoverabilityUpsellNotNow = LegallySensitiveContentConstantsModule.phoneNumberDiscoverabilityUpsell.notNow,
		phoneNumberDiscoverabilityUpsellTurnOn = LegallySensitiveContentConstantsModule.phoneNumberDiscoverabilityUpsell.turnOn,
		phoneNumberDiscoverabilityUpsellTitle = LegallySensitiveContentConstantsModule.phoneNumberDiscoverabilityUpsell.title,
		phoneNumberDiscoverabilityUpsellContent = LegallySensitiveContentConstantsModule.phoneNumberDiscoverabilityUpsell.content,
		photoToAvatarTitle = LegallySensitiveContentConstantsModule.photoToAvatar.title,
		photoToAvatarBodyText = LegallySensitiveContentConstantsModule.photoToAvatar.bodyText,
		photoToAvatarPrivacyLinkText = LegallySensitiveContentConstantsModule.photoToAvatar.privacyLinkText,
		photoToAvatarAgreeButton = LegallySensitiveContentConstantsModule.photoToAvatar.agreeButton,
		photoToAvatarCancelButton = LegallySensitiveContentConstantsModule.photoToAvatar.cancelButton,
		allowMarketingEmailCheckboxAccountUpgradeConsent = if AllowMarketingEmailCheckboxAccountUpgrade == ConsentNameModule.allowMarketingEmailCheckboxAccountUpgrade and LegallySensitiveContentConstantsModule.allowMarketingEmailCheckboxAccountUpgrade.consentSourceContentId ~= "" then LegallySensitiveContentConstantsModule.allowMarketingEmailCheckboxAccountUpgrade.consent else nil
	})
	
	return ({
		[ConsentNameModule.phoneNumberDiscoverabilityUpsell] = {
			wordsOfConsent = {
				notNow = UseLocalizationResult.phoneNumberDiscoverabilityUpsellNotNow,
				turnOn = UseLocalizationResult.phoneNumberDiscoverabilityUpsellTurnOn,
				title = UseLocalizationResult.phoneNumberDiscoverabilityUpsellTitle,
				content = UseLocalizationResult.phoneNumberDiscoverabilityUpsellContent
			}
		},
		[ConsentNameModule.allowMarketingEmailCheckboxAccountUpgrade] = {
			wordsOfConsent = {
				consent = UseLocalizationResult.allowMarketingEmailCheckboxAccountUpgradeConsent
			}
		},
		[ConsentNameModule.allowMarketingEmailAutoOptInAccountUpgrade] = { wordsOfConsent = {} }
	})[AllowMarketingEmailCheckboxAccountUpgrade], {
		getBase64EncodedAuditHeader = function(p2)
			-- upvalues: GetEncodedAuditHeaderFunction (upval), AllowMarketingEmailCheckboxAccountUpgrade (copy), UseLocalizationResult (copy), p1 (copy)
			return GetEncodedAuditHeaderFunction(AllowMarketingEmailCheckboxAccountUpgrade, UseLocalizationResult, p1, p2)
		end,
		updateSettingWithAuditing = function(p2, p3, p4)
			-- upvalues: GetEncodedAuditHeaderFunction (upval), AllowMarketingEmailCheckboxAccountUpgrade (copy), UseLocalizationResult (copy), p1 (copy), UpdateUserSettingFunction (upval)
			local EncodedAuditHeader = GetEncodedAuditHeaderFunction(AllowMarketingEmailCheckboxAccountUpgrade, UseLocalizationResult, p1, p4)
			local Success, Result = pcall(function()
				-- upvalues: UpdateUserSettingFunction (upval), p2 (copy), p3 (copy), EncodedAuditHeader (copy)
				UpdateUserSettingFunction(p2, p3, EncodedAuditHeader)
			end)
			
			if not Success then
				warn("Failed to update setting with auditing:", Result)
			end
		end,
		grantOneTimeUserConsentWithAuditing = function(p2, p3)
			-- upvalues: GetEncodedAuditHeaderFunction (upval), AllowMarketingEmailCheckboxAccountUpgrade (copy), UseLocalizationResult (copy), p1 (copy), GrantOneTimeUserConsentFunction (upval)
			local EncodedAuditHeader = GetEncodedAuditHeaderFunction(AllowMarketingEmailCheckboxAccountUpgrade, UseLocalizationResult, p1, p3)
			local Success, Result = pcall(function()
				-- upvalues: GrantOneTimeUserConsentFunction (upval), AllowMarketingEmailCheckboxAccountUpgrade (upval), p2 (copy), EncodedAuditHeader (copy)
				GrantOneTimeUserConsentFunction(AllowMarketingEmailCheckboxAccountUpgrade, p2, EncodedAuditHeader)
			end)
			
			if not Success then
				warn("Failed to grant one time user consent with auditing:", Result)
			end
		end
	}
end