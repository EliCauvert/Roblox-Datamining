local parent = script.Parent.Parent.Parent
local publishService = game:GetService("PublishService")
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateMigrateCurveAnimModule = require(parent.flags.getFFlagUGCValidateMigrateCurveAnim)
local UGCValidateEmoteTranslationTag = game:DefineFastFlag("UGCValidateEmoteTranslationTag", false)

local function _(p0) --[[ line: 19 | named "toFiniteNumber" ]]
	return if typeof(p0) == "number" and p0 > -1e999 and p0 < 1e999 then p0 else nil
end

return {
	categories = { validationEnumsModule.UploadCategory.EMOTE_ANIMATION },
	requiredData = {},
	conditionalData = { validationEnumsModule.SharedDataMember.curveAnimations },
	fflag = function() --[[ line: 31 ]]
		-- upvalues: getFFlagUGCValidateMigrateCurveAnimModule (ref), UGCValidateEmoteTranslationTag (ref)
		return getFFlagUGCValidateMigrateCurveAnimModule() and (UGCValidateEmoteTranslationTag and game:GetEngineFeature("EngineTagEmoteMaxPartTranslation"))
	end,
	expectedFailures = {},
	prereqTests = {},
	run = function(p1, p2) --[[ line: 39 ]]
		-- upvalues: publishService (ref), errorSourceStringsModule (ref)
		for i, v in p2.curveAnimations do
			local RBXmaxPartTranslationAttribute = v:GetAttribute("RBXmaxPartTranslation")
			local var6 = if typeof(RBXmaxPartTranslationAttribute) == "number" and RBXmaxPartTranslationAttribute > -1e999 and RBXmaxPartTranslationAttribute < 1e999 then RBXmaxPartTranslationAttribute else nil
			
			if var6 ~= nil then
				RBXmaxPartTranslationAttribute = v:Clone()
				publishService:TagEmoteAnimation(RBXmaxPartTranslationAttribute)
				local RBXmaxPartTranslationAttribute_1 = RBXmaxPartTranslationAttribute:GetAttribute("RBXmaxPartTranslation")
				local var8 = if typeof(RBXmaxPartTranslationAttribute_1) == "number" and RBXmaxPartTranslationAttribute_1 > -1e999 and RBXmaxPartTranslationAttribute_1 < 1e999 then RBXmaxPartTranslationAttribute_1 else nil
				RBXmaxPartTranslationAttribute:Destroy()
				
				if var8 ~= nil then
					if math.abs(var6 - var8) > 0.00001 then
						p1:fail(errorSourceStringsModule.Keys.CurveAnim_TranslationTagMismatch, {
							taggedTranslation = tostring(var6),
							calculatedTranslation = tostring(var8)
						})
						
						return
					end
				end
				p1:err("Engine did not author a finite maximum part translation on the CurveAnimation")
				
				return
			end
			p1:err("RBXmaxPartTranslation must be a finite number")
			
			return
		end
	end
}