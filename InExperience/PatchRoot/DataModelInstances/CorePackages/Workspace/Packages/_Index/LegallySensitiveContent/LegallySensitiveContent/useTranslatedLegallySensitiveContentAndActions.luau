local legallySensitiveContent = script:FindFirstAncestor("LegallySensitiveContent")
local _ = require(legallySensitiveContent.Parent.React)
local updateUserSetting = require(legallySensitiveContent.Services.userSettingsService).updateUserSetting
local grantOneTimeUserConsent = require(legallySensitiveContent.Services.usersConsentsService).grantOneTimeUserConsent
local useLocalization = require(legallySensitiveContent.dependencies).Localization.Hooks.useLocalization
local legallySensitiveContentConstantsModule = require(legallySensitiveContent.Constants.LegallySensitiveContentConstants)
local getEncodedAuditHeader = require(legallySensitiveContent.Utils.AuditUtils).getEncodedAuditHeader
local consentNameModule = require(legallySensitiveContent.Enums.ConsentName)
local _ = require(legallySensitiveContent.Types.LegallySensitiveContentTypes)

return function(value, p0) --[[ line: 31 | named "useTranslatedLegallySensitiveContentAndActions" ]]
	-- upvalues: useLocalization (ref), legallySensitiveContentConstantsModule (ref), consentNameModule (ref), getEncodedAuditHeader (ref), updateUserSetting (ref), grantOneTimeUserConsent (ref)
	local var3 = useLocalization({
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
				notNow = var3.phoneNumberDiscoverabilityUpsellNotNow,
				turnOn = var3.phoneNumberDiscoverabilityUpsellTurnOn,
				title = var3.phoneNumberDiscoverabilityUpsellTitle,
				content = var3.phoneNumberDiscoverabilityUpsellContent
			}
		}
	})[value], {
		getBase64EncodedAuditHeader = function(p1) --[[ line: 101 ]]
			-- upvalues: getEncodedAuditHeader (copy), value (ref), var3 (ref), p0 (ref)
			return getEncodedAuditHeader(value, var3, p0, p1)
		end,
		updateSettingWithAuditing = function(value_1, p2, p3) --[[ line: 85 ]]
			-- upvalues: getEncodedAuditHeader (copy), value (ref), var3 (ref), p0 (ref), updateUserSetting (copy)
			local var4 = getEncodedAuditHeader(value, var3, p0, p3)
			local ok, status = pcall(function() --[[ line: 92 ]]
				-- upvalues: updateUserSetting (copy), value_1 (ref), p2 (ref), var4 (ref)
				updateUserSetting(value_1, p2, var4)
			end)
			
			if not ok then
				warn("Failed to update setting with auditing:", status)
			end
		end,
		grantOneTimeUserConsentWithAuditing = function(p4, p5) --[[ line: 105 ]]
			-- upvalues: getEncodedAuditHeader (copy), value (ref), var3 (ref), p0 (ref), grantOneTimeUserConsent (copy)
			local var5 = getEncodedAuditHeader(value, var3, p0, p5)
			local ok, status = pcall(function() --[[ line: 111 ]]
				-- upvalues: grantOneTimeUserConsent (copy), value (copy), p4 (ref), var5 (ref)
				grantOneTimeUserConsent(value, p4, var5)
			end)
			
			if not ok then
				warn("Failed to grant one time user consent with auditing:", status)
			end
		end
	}
end