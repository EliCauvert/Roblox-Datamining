local parent = script.Parent.Parent
local cryptoUtilsModule = require(script.Parent.CryptoUtils)
local legallySensitiveContentConstantsModule = require(parent.Constants.LegallySensitiveContentConstants)
local base64 = require(parent.dependencies).Base64
local consentNameModule = require(parent.Enums.ConsentName)
local _ = require(parent.Types.LegallySensitiveContentTypes)

local function getAuditDataForConsent(p1, p2)
	-- upvalues: consentNameModule (ref), legallySensitiveContentConstantsModule (ref)
	local var1 = ({
		[consentNameModule.phoneNumberDiscoverabilityUpsell] = {
			{
				consentStringTemplate = p2.phoneNumberDiscoverabilityUpsellNotNow,
				sourceContentId = legallySensitiveContentConstantsModule.phoneNumberDiscoverabilityUpsell.notNowSourceContentId
			},
			{
				consentStringTemplate = p2.phoneNumberDiscoverabilityUpsellTurnOn,
				sourceContentId = legallySensitiveContentConstantsModule.phoneNumberDiscoverabilityUpsell.turnOnSourceContentId
			},
			{
				consentStringTemplate = p2.phoneNumberDiscoverabilityUpsellTitle,
				sourceContentId = legallySensitiveContentConstantsModule.phoneNumberDiscoverabilityUpsell.titleSourceContentId
			},
			{
				consentStringTemplate = p2.phoneNumberDiscoverabilityUpsellContent,
				sourceContentId = legallySensitiveContentConstantsModule.phoneNumberDiscoverabilityUpsell.contentSourceContentId
			}
		},
		[consentNameModule.PhotoToAvatar] = {
			{
				consentStringTemplate = p2.photoToAvatarTitle,
				sourceContentId = legallySensitiveContentConstantsModule.photoToAvatar.titleSourceContentId
			},
			{
				consentStringTemplate = p2.photoToAvatarBodyText,
				sourceContentId = legallySensitiveContentConstantsModule.photoToAvatar.bodyTextSourceContentId
			},
			{
				consentStringTemplate = p2.photoToAvatarPrivacyLinkText,
				sourceContentId = legallySensitiveContentConstantsModule.photoToAvatar.privacyLinkTextSourceContentId
			},
			{
				consentStringTemplate = p2.photoToAvatarAgreeButton,
				sourceContentId = legallySensitiveContentConstantsModule.photoToAvatar.agreeButtonSourceContentId
			},
			{
				consentStringTemplate = p2.photoToAvatarCancelButton,
				sourceContentId = legallySensitiveContentConstantsModule.photoToAvatar.cancelButtonSourceContentId
			}
		}
	})[p1]
	
	return var1 or {}
end

local function getAuditHeaderValue(p1, p2, p3)
	-- upvalues: cryptoUtilsModule (ref)
	local t = {}
	
	for i, v in ipairs(p1) do
		local t_1 = {
			hash = cryptoUtilsModule.hashStringWithFnv1a32(v.consentStringTemplate)
		}
		
		if v.vars ~= nil then
			for i_1, v_1 in pairs(v.vars) do
				t_1[i_1] = v_1
			end
		end
		t[v.sourceContentId] = t_1
	end
	local t_1 = { surface = p2, content = t }
	
	if p3 then
		for i_1, v_1 in pairs(p3) do
			t_1[i_1] = v_1
		end
	end
	return game:GetService("HttpService"):JSONEncode(t_1)
end

return {
	getAuditDataForConsent = getAuditDataForConsent,
	getAuditHeaderValue = getAuditHeaderValue,
	getEncodedAuditHeader = function(p4, p5, p6, p7)
		-- upvalues: getAuditDataForConsent (ref), getAuditHeaderValue (ref), base64 (ref)
		return base64.EncodeUrl(getAuditHeaderValue(getAuditDataForConsent(p4, p5), p6, p7))
	end
}