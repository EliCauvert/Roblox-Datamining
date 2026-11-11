local HttpService = game:GetService("HttpService")
local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Default = require(SquadsCore.Parent.CrossExperienceVoice).CrossExperienceVoiceManager.default
local SQUADVOICEEUMODALCONSENTGIVENKEY = require(SquadsCore.Common.Constants).SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY
local SQUADVOICEEUMODALSEENKEY = require(SquadsCore.Common.Constants).SQUAD_VOICE_EU_MODAL_SEEN_KEY
local SquadPromptTypeModule = require(SquadsCore.Enums.SquadPromptType)
local SetTableAppStorageKeyFunction = require(SquadsCore.Utils.appStorageAccess).setTableAppStorageKey

return function(Callback, p1, Input, Input1)
	-- upvalues: SquadPromptTypeModule (copy), SetTableAppStorageKeyFunction (copy), SQUADVOICEEUMODALSEENKEY (copy), HttpService (copy), SQUADVOICEEUMODALCONSENTGIVENKEY (copy), Default (copy)
	return function(p2)
		-- upvalues: Callback (copy), SquadPromptTypeModule (upval), Input (copy), p1 (copy), Input1 (copy), SetTableAppStorageKeyFunction (upval), SQUADVOICEEUMODALSEENKEY (upval), HttpService (upval), SQUADVOICEEUMODALCONSENTGIVENKEY (upval), Default (upval)
		Callback(p2, {
			promptType = SquadPromptTypeModule.EuVoiceConsentPrompt,
			onConfirm = function()
				-- upvalues: Input (upval), p1 (upval), Input1 (upval), SetTableAppStorageKeyFunction (upval), SQUADVOICEEUMODALSEENKEY (upval), HttpService (upval), SQUADVOICEEUMODALCONSENTGIVENKEY (upval), Default (upval)
				Input[p1] = true
				Input1[p1] = true
				SetTableAppStorageKeyFunction(SQUADVOICEEUMODALSEENKEY, HttpService:JSONEncode(Input))
				SetTableAppStorageKeyFunction(SQUADVOICEEUMODALCONSENTGIVENKEY, HttpService:JSONEncode(Input1))
				Default.default.VoiceEuModalConsented:Fire()
			end,
			onCancel = function()
				-- upvalues: Input (upval), p1 (upval), SetTableAppStorageKeyFunction (upval), SQUADVOICEEUMODALSEENKEY (upval), HttpService (upval), Default (upval)
				Input[p1] = true
				SetTableAppStorageKeyFunction(SQUADVOICEEUMODALSEENKEY, HttpService:JSONEncode(Input))
				Default.default.VoiceEuModalRefused:Fire()
			end
		})
	end
end