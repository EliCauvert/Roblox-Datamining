local parent = script.Parent.Parent
local cryptoUtilsModule = require(script.Parent.CryptoUtils)
local legallySensitiveContentConstantsModule = require(parent.Constants.LegallySensitiveContentConstants)
local base64 = require(parent.dependencies).Base64
local consentNameModule = require(parent.Enums.ConsentName)
local _ = require(parent.Types.LegallySensitiveContentTypes)

local function getAuditDataForConsent(p0, p1) --[[ line: 18 ]]
	-- upvalues: consentNameModule (ref), legallySensitiveContentConstantsModule (ref)
	local var5 = ({
		[consentNameModule.phoneNumberDiscoverabilityUpsell] = {
			{
				consentStringTemplate = p1.phoneNumberDiscoverabilityUpsellNotNow,
				sourceContentId = legallySensitiveContentConstantsModule.phoneNumberDiscoverabilityUpsell.notNowSourceContentId
			},
			{
				consentStringTemplate = p1.phoneNumberDiscoverabilityUpsellTurnOn,
				sourceContentId = legallySensitiveContentConstantsModule.phoneNumberDiscoverabilityUpsell.turnOnSourceContentId
			},
			{
				consentStringTemplate = p1.phoneNumberDiscoverabilityUpsellTitle,
				sourceContentId = legallySensitiveContentConstantsModule.phoneNumberDiscoverabilityUpsell.titleSourceContentId
			},
			{
				consentStringTemplate = p1.phoneNumberDiscoverabilityUpsellContent,
				sourceContentId = legallySensitiveContentConstantsModule.phoneNumberDiscoverabilityUpsell.contentSourceContentId
			}
		},
		[consentNameModule.PhotoToAvatar] = {
			{
				consentStringTemplate = p1.photoToAvatarTitle,
				sourceContentId = legallySensitiveContentConstantsModule.photoToAvatar.titleSourceContentId
			},
			{
				consentStringTemplate = p1.photoToAvatarBodyText,
				sourceContentId = legallySensitiveContentConstantsModule.photoToAvatar.bodyTextSourceContentId
			},
			{
				consentStringTemplate = p1.photoToAvatarPrivacyLinkText,
				sourceContentId = legallySensitiveContentConstantsModule.photoToAvatar.privacyLinkTextSourceContentId
			},
			{
				consentStringTemplate = p1.photoToAvatarAgreeButton,
				sourceContentId = legallySensitiveContentConstantsModule.photoToAvatar.agreeButtonSourceContentId
			},
			{
				consentStringTemplate = p1.photoToAvatarCancelButton,
				sourceContentId = legallySensitiveContentConstantsModule.photoToAvatar.cancelButtonSourceContentId
			}
		}
	})[p0]
	
	return var5 or {}
end

local function getAuditHeaderValue(p2, p3, p4) --[[ line: 98 ]]
	-- upvalues: cryptoUtilsModule (ref)
	local t = {}
	
	for i, v in ipairs(p2) do
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
	local t_1 = { surface = p3, content = t }
	
	if p4 then
		for i_1, v_1 in pairs(p4) do
			t_1[i_1] = v_1
		end
	end
	return game:GetService("HttpService"):JSONEncode(t_1)
end

return {
	getAuditDataForConsent = getAuditDataForConsent,
	getAuditHeaderValue = getAuditHeaderValue,
	getEncodedAuditHeader = function(p5, p6, p7, p8) --[[ line: 138 ]]
		-- upvalues: getAuditDataForConsent (ref), getAuditHeaderValue (ref), base64 (ref)
		return base64.EncodeUrl(getAuditHeaderValue(getAuditDataForConsent(p5, p6), p7, p8))
	end
}