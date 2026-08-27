local parent = script.Parent.Parent.Parent
local publishService = game:GetService("PublishService")
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateMigrateCurveAnimModule = require(parent.flags.getFFlagUGCValidateMigrateCurveAnim)
game:DefineFastFlag("UGCValidateEmoteAttributes", false)
local t = {
	categories = { validationEnumsModule.UploadCategory.EMOTE_ANIMATION },
	requiredData = {},
	conditionalData = { validationEnumsModule.SharedDataMember.curveAnimations },
	fflag = function()
		-- upvalues: getFFlagUGCValidateMigrateCurveAnimModule (ref)
		return getFFlagUGCValidateMigrateCurveAnimModule() and (game:GetFastFlag("UGCValidateEmoteAttributes") and game:GetEngineFeature("EngineTagEmoteMaxPartTranslation"))
	end,
	expectedFailures = {},
	prereqTests = {}
}
local emoteIsUGCAttributeName = constantsModule.EmoteIsUGCAttributeName
local emoteMaxPartTranslationAttributeName = constantsModule.EmoteMaxPartTranslationAttributeName

local function _(p1)
	return if typeof(p1) == "number" and p1 > -1e999 and p1 < 1e999 then p1 else nil
end

function t.run(p1, p2)
	-- upvalues: emoteIsUGCAttributeName (ref), errorSourceStringsModule (ref), emoteMaxPartTranslationAttributeName (ref), publishService (ref)
	for i, v in p2.curveAnimations do
		if v:GetAttribute(emoteIsUGCAttributeName) == true then
			local var1 = v:GetAttribute(emoteMaxPartTranslationAttributeName)
			local var2 = if typeof(var1) == "number" and var1 > -1e999 and var1 < 1e999 then var1 else nil
			
			if var2 ~= nil then
				var1 = v:Clone()
				publishService:TagEmoteAnimation(var1)
				local var3 = var1:GetAttribute(emoteMaxPartTranslationAttributeName)
				local var4 = if typeof(var3) == "number" and var3 > -1e999 and var3 < 1e999 then var3 else nil
				var1:Destroy()
				
				if var4 ~= nil then
					if math.abs(var2 - var4) > 0.00001 then
						p1:fail(errorSourceStringsModule.Keys.EmoteAnimation_MaxPartTranslationMismatch, {
							taggedTranslation = tostring(var2),
							calculatedTranslation = tostring(var4)
						})
						
						return
					end
				end
				p1:fail(errorSourceStringsModule.Keys.EmoteAnimation_MaxPartTranslationCalcFailed)
				
				return
			end
			p1:fail(errorSourceStringsModule.Keys.EmoteAnimation_InvalidMaxPartTranslationAttribute)
			
			return
		end
		p1:fail(errorSourceStringsModule.Keys.EmoteAnimation_InvalidUGCAttribute)
		
		return
	end
end

return t