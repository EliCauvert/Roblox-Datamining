local httpService = game:GetService("HttpService")
local squadsCore = script:FindFirstAncestor("SquadsCore")
local default = require(squadsCore.Parent.CrossExperienceVoice).CrossExperienceVoiceManager.default
local SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY = require(squadsCore.Common.Constants).SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY
local SQUAD_VOICE_EU_MODAL_SEEN_KEY = require(squadsCore.Common.Constants).SQUAD_VOICE_EU_MODAL_SEEN_KEY
local squadPromptTypeModule = require(squadsCore.Enums.SquadPromptType)
local setTableAppStorageKey = require(squadsCore.Utils.appStorageAccess).setTableAppStorageKey

return function(p1, p2, p3, p4)
	-- upvalues: squadPromptTypeModule (ref), setTableAppStorageKey (ref), SQUAD_VOICE_EU_MODAL_SEEN_KEY (ref), httpService (ref), SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY (ref), default (ref)
	return function(p5)
		-- upvalues: p1 (ref), squadPromptTypeModule (copy), p3 (ref), p2 (ref), p4 (ref), setTableAppStorageKey (copy), SQUAD_VOICE_EU_MODAL_SEEN_KEY (copy), httpService (copy), SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY (copy), default (copy)
		p1(p5, {
			promptType = squadPromptTypeModule.EuVoiceConsentPrompt,
			onConfirm = function()
				-- upvalues: p3 (copy), p2 (copy), p4 (copy), setTableAppStorageKey (copy), SQUAD_VOICE_EU_MODAL_SEEN_KEY (copy), httpService (copy), SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY (copy), default (copy)
				p3[p2] = true
				p4[p2] = true
				setTableAppStorageKey(SQUAD_VOICE_EU_MODAL_SEEN_KEY, httpService:JSONEncode(p3))
				setTableAppStorageKey(SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY, httpService:JSONEncode(p4))
				default.default.VoiceEuModalConsented:Fire()
			end,
			onCancel = function()
				-- upvalues: p3 (copy), p2 (copy), setTableAppStorageKey (copy), SQUAD_VOICE_EU_MODAL_SEEN_KEY (copy), httpService (copy), default (copy)
				p3[p2] = true
				setTableAppStorageKey(SQUAD_VOICE_EU_MODAL_SEEN_KEY, httpService:JSONEncode(p3))
				default.default.VoiceEuModalRefused:Fire()
			end
		})
	end
end