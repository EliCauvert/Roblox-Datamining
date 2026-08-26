local legallySensitiveContent = script:FindFirstAncestor("LegallySensitiveContent")
local _ = require(legallySensitiveContent.Parent.React)
local updateUserSetting = require(legallySensitiveContent.Services.userSettingsService).updateUserSetting
local grantOneTimeUserConsent = require(legallySensitiveContent.Services.usersConsentsService).grantOneTimeUserConsent
local useLocalization = require(legallySensitiveContent.dependencies).Localization.Hooks.useLocalization
local legallySensitiveContentConstantsModule = require(legallySensitiveContent.Constants.LegallySensitiveContentConstants)
local getEncodedAuditHeader = require(legallySensitiveContent.Utils.AuditUtils).getEncodedAuditHeader
local consentNameModule = require(legallySensitiveContent.Enums.ConsentName)
local _ = require(legallySensitiveContent.Types.LegallySensitiveContentTypes)

return function(value, p1)
	-- upvalues: useLocalization (ref), legallySensitiveContentConstantsModule (ref), consentNameModule (ref), getEncodedAuditHeader (ref), updateUserSetting (ref), grantOneTimeUserConsent (ref)
	local var1 = useLocalization({
		phoneNumberDiscoverabilityUpsellNotNow = legallySensitiveContentConstantsModule.phoneNumberDiscoverabilityUpsell.notNow,
		phoneNumberDiscoverabilityUpsellTurnOn = legallySensitiveContentConstantsModule.phoneNumberDiscoverabilityUpsell.turnOn,
		phoneNumberDiscoverabilityUpsellTitle = legallySensitiveContentConstantsModule.phoneNumberDiscoverabilityUpsell.title,
		phoneNumberDiscoverabilityUpsellContent = legallySensitiveContentConstantsModule.phoneNumberDiscoverabilityUpsell.content,
		photoToAvatarTitle = legallySensitiveContentConstantsModule.photoToAvatar.title,
		photoToAvatarBodyText = legallySensitiveContentConstantsModule.photoToAvatar.bodyText,
		photoToAvatarPrivacyLinkText = legallySensitiveContentConstantsModule.photoToAvatar.privacyLinkText,
		photoToAvatarAgreeButton = legallySensitiveContentConstantsModule.photoToAvatar.agreeButton,
		photoToAvatarCancelButton = legallySensitiveContentConstantsModule.photoToAvatar.cancelButton
	})
	
	return ({
		[consentNameModule.phoneNumberDiscoverabilityUpsell] = {
			wordsOfConsent = {
				notNow = var1.phoneNumberDiscoverabilityUpsellNotNow,
				turnOn = var1.phoneNumberDiscoverabilityUpsellTurnOn,
				title = var1.phoneNumberDiscoverabilityUpsellTitle,
				content = var1.phoneNumberDiscoverabilityUpsellContent
			}
		}
	})[value], {
		getBase64EncodedAuditHeader = function(p2)
			-- upvalues: getEncodedAuditHeader (copy), value (ref), var1 (ref), p1 (ref)
			return getEncodedAuditHeader(value, var1, p1, p2)
		end,
		updateSettingWithAuditing = function(value_1, p2, p3)
			-- upvalues: getEncodedAuditHeader (copy), value (ref), var1 (ref), p1 (ref), updateUserSetting (copy)
			local var2 = getEncodedAuditHeader(value, var1, p1, p3)
			local ok, status = pcall(function()
				-- upvalues: updateUserSetting (copy), value_1 (ref), p2 (ref), var2 (ref)
				updateUserSetting(value_1, p2, var2)
			end)
			
			if not ok then
				warn("Failed to update setting with auditing:", status)
			end
		end,
		grantOneTimeUserConsentWithAuditing = function(p2, p3)
			-- upvalues: getEncodedAuditHeader (copy), value (ref), var1 (ref), p1 (ref), grantOneTimeUserConsent (copy)
			local var2 = getEncodedAuditHeader(value, var1, p1, p3)
			local ok, status = pcall(function()
				-- upvalues: grantOneTimeUserConsent (copy), value (copy), p2 (ref), var2 (ref)
				grantOneTimeUserConsent(value, p2, var2)
			end)
			
			if not ok then
				warn("Failed to grant one time user consent with auditing:", status)
			end
		end
	}
end