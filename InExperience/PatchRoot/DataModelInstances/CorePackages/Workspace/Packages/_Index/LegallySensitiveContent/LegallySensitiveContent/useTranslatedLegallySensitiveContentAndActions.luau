local LegallySensitiveContent = script:FindFirstAncestor("LegallySensitiveContent")
local _ = require(LegallySensitiveContent.Parent.React)
local UpdateUserSettingFunction = require(LegallySensitiveContent.Services.userSettingsService).updateUserSetting
local GrantOneTimeUserConsentFunction = require(LegallySensitiveContent.Services.usersConsentsService).grantOneTimeUserConsent
local UseLocalizationFunction = require(LegallySensitiveContent.dependencies).Localization.Hooks.useLocalization
local LegallySensitiveContentConstantsModule = require(LegallySensitiveContent.Constants.LegallySensitiveContentConstants)
local GetEncodedAuditHeaderFunction = require(LegallySensitiveContent.Utils.AuditUtils).getEncodedAuditHeader
local ConsentNameModule = require(LegallySensitiveContent.Enums.ConsentName)
local _ = require(LegallySensitiveContent.Types.LegallySensitiveContentTypes)

return function(p1, p2)
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
		photoToAvatarCancelButton = LegallySensitiveContentConstantsModule.photoToAvatar.cancelButton
	})
	
	return ({
		[ConsentNameModule.phoneNumberDiscoverabilityUpsell] = {
			wordsOfConsent = {
				notNow = UseLocalizationResult.phoneNumberDiscoverabilityUpsellNotNow,
				turnOn = UseLocalizationResult.phoneNumberDiscoverabilityUpsellTurnOn,
				title = UseLocalizationResult.phoneNumberDiscoverabilityUpsellTitle,
				content = UseLocalizationResult.phoneNumberDiscoverabilityUpsellContent
			}
		}
	})[p1], {
		getBase64EncodedAuditHeader = function(p3)
			-- upvalues: GetEncodedAuditHeaderFunction (upval), p1 (copy), UseLocalizationResult (copy), p2 (copy)
			return GetEncodedAuditHeaderFunction(p1, UseLocalizationResult, p2, p3)
		end,
		updateSettingWithAuditing = function(p3, p4, p5)
			-- upvalues: GetEncodedAuditHeaderFunction (upval), p1 (copy), UseLocalizationResult (copy), p2 (copy), UpdateUserSettingFunction (upval)
			local EncodedAuditHeader = GetEncodedAuditHeaderFunction(p1, UseLocalizationResult, p2, p5)
			local Success, Result = pcall(function()
				-- upvalues: UpdateUserSettingFunction (upval), p3 (copy), p4 (copy), EncodedAuditHeader (copy)
				UpdateUserSettingFunction(p3, p4, EncodedAuditHeader)
			end)
			
			if not Success then
				warn("Failed to update setting with auditing:", Result)
			end
		end,
		grantOneTimeUserConsentWithAuditing = function(p3, p4)
			-- upvalues: GetEncodedAuditHeaderFunction (upval), p1 (copy), UseLocalizationResult (copy), p2 (copy), GrantOneTimeUserConsentFunction (upval)
			local EncodedAuditHeader = GetEncodedAuditHeaderFunction(p1, UseLocalizationResult, p2, p4)
			local Success, Result = pcall(function()
				-- upvalues: GrantOneTimeUserConsentFunction (upval), p1 (upval), p3 (copy), EncodedAuditHeader (copy)
				GrantOneTimeUserConsentFunction(p1, p3, EncodedAuditHeader)
			end)
			
			if not Success then
				warn("Failed to grant one time user consent with auditing:", Result)
			end
		end
	}
end