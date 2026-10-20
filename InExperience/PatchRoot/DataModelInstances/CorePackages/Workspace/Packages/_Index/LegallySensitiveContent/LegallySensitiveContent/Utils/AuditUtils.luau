local Parent = script.Parent.Parent
local CryptoUtilsModule = require(script.Parent.CryptoUtils)
local LegallySensitiveContentConstantsModule = require(Parent.Constants.LegallySensitiveContentConstants)
local Base64 = require(Parent.dependencies).Base64
local ConsentNameModule = require(Parent.Enums.ConsentName)
local _ = require(Parent.Types.LegallySensitiveContentTypes)

local function getAuditDataForConsent(p1, p2)
	-- upvalues: ConsentNameModule (copy), LegallySensitiveContentConstantsModule (copy)
	local Entry = ({
		[ConsentNameModule.phoneNumberDiscoverabilityUpsell] = {
			{
				consentStringTemplate = p2.phoneNumberDiscoverabilityUpsellNotNow,
				sourceContentId = LegallySensitiveContentConstantsModule.phoneNumberDiscoverabilityUpsell.notNowSourceContentId
			},
			{
				consentStringTemplate = p2.phoneNumberDiscoverabilityUpsellTurnOn,
				sourceContentId = LegallySensitiveContentConstantsModule.phoneNumberDiscoverabilityUpsell.turnOnSourceContentId
			},
			{
				consentStringTemplate = p2.phoneNumberDiscoverabilityUpsellTitle,
				sourceContentId = LegallySensitiveContentConstantsModule.phoneNumberDiscoverabilityUpsell.titleSourceContentId
			},
			{
				consentStringTemplate = p2.phoneNumberDiscoverabilityUpsellContent,
				sourceContentId = LegallySensitiveContentConstantsModule.phoneNumberDiscoverabilityUpsell.contentSourceContentId
			}
		},
		[ConsentNameModule.PhotoToAvatar] = {
			{
				consentStringTemplate = p2.photoToAvatarTitle,
				sourceContentId = LegallySensitiveContentConstantsModule.photoToAvatar.titleSourceContentId
			},
			{
				consentStringTemplate = p2.photoToAvatarBodyText,
				sourceContentId = LegallySensitiveContentConstantsModule.photoToAvatar.bodyTextSourceContentId
			},
			{
				consentStringTemplate = p2.photoToAvatarPrivacyLinkText,
				sourceContentId = LegallySensitiveContentConstantsModule.photoToAvatar.privacyLinkTextSourceContentId
			},
			{
				consentStringTemplate = p2.photoToAvatarAgreeButton,
				sourceContentId = LegallySensitiveContentConstantsModule.photoToAvatar.agreeButtonSourceContentId
			},
			{
				consentStringTemplate = p2.photoToAvatarCancelButton,
				sourceContentId = LegallySensitiveContentConstantsModule.photoToAvatar.cancelButtonSourceContentId
			}
		},
		[ConsentNameModule.allowMarketingEmailCheckboxAccountUpgrade] = {
			{
				consentStringTemplate = p2.allowMarketingEmailCheckboxAccountUpgradeConsent,
				sourceContentId = LegallySensitiveContentConstantsModule.allowMarketingEmailCheckboxAccountUpgrade.consentSourceContentId
			}
		},
		[ConsentNameModule.allowMarketingEmailAutoOptInAccountUpgrade] = {}
	})[p1]
	
	return if Entry then Entry else {}
end

local function getAuditHeaderValue(List, Surface, List1)
	-- upvalues: CryptoUtilsModule (copy)
	local t = {}
	
	for _, value in ipairs(List) do
		local config = {
			hash = CryptoUtilsModule.hashStringWithFnv1a32(value.consentStringTemplate)
		}
		
		if value.vars ~= nil then
			for i, var in pairs(value.vars) do
				config[i] = var
			end
		end
		t[value.sourceContentId] = config
	end
	local config = {
		surface = Surface,
		content = if next(t) == nil then nil else t
	}
	
	if List1 then
		for i1, value1 in pairs(List1) do
			config[i1] = value1
		end
	end
	return game:GetService("HttpService"):JSONEncode(config)
end

return {
	getAuditDataForConsent = getAuditDataForConsent,
	getAuditHeaderValue = getAuditHeaderValue,
	getEncodedAuditHeader = function(p1, p2, Surface, p3)
		-- upvalues: getAuditDataForConsent (copy), getAuditHeaderValue (copy), Base64 (copy)
		return (Base64.EncodeUrl((getAuditHeaderValue(getAuditDataForConsent(p1, p2), Surface, p3))))
	end
}