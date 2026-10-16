local Parent = script.Parent.Parent.Parent
local PublishService = game:GetService("PublishService")
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
game:DefineFastFlag("UGCValidateEmoteAttributes", false)
local EmoteIsUGCAttributeName = ConstantsModule.EmoteIsUGCAttributeName
local EmoteMaxPartTranslationAttributeName = ConstantsModule.EmoteMaxPartTranslationAttributeName

local function _(p1: number) --[[ Line: 18 | Named "toFiniteNumber" ]]
	return if typeof(p1) == "number" and p1 > -1e999 and p1 < 1e999 then p1 else nil
end

return {
	categories = { ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION },
	requiredData = {},
	conditionalData = { ValidationEnumsModule.SharedDataMember.curveAnimations },
	fflag = function() --[[ Line: 30 ]]
		return game:GetFastFlag("UGCValidateEmoteAttributes") and game:GetEngineFeature("EngineTagEmoteMaxPartTranslation")
	end,
	expectedFailures = {},
	prereqTests = {},
	run = function(p1, p2) --[[ Line: 36 ]]
		-- upvalues: EmoteIsUGCAttributeName (copy), ErrorSourceStringsModule (copy), EmoteMaxPartTranslationAttributeName (copy), PublishService (copy)
		local Attribute2 = nil
		local Attribute1 = nil
		for _, curveAnimation in p2.curveAnimations do
			if curveAnimation:GetAttribute(EmoteIsUGCAttributeName) ~= true then
				p1:fail(ErrorSourceStringsModule.Keys.EmoteAnimation_InvalidUGCAttribute)
				break
			end
			local Attribute: number = curveAnimation:GetAttribute(EmoteMaxPartTranslationAttributeName)
			Attribute1 = if typeof(Attribute) == "number" and Attribute > -1e999 and Attribute < 1e999 then Attribute else nil
			
			if Attribute1 == nil then
				p1:fail(ErrorSourceStringsModule.Keys.EmoteAnimation_InvalidMaxPartTranslationAttribute)
				break
			end
			local CurveAnimationClone = curveAnimation:Clone()
			PublishService:TagEmoteAnimation(CurveAnimationClone)
			local Attribute3: number = CurveAnimationClone:GetAttribute(EmoteMaxPartTranslationAttributeName)
			Attribute2 = if typeof(Attribute3) == "number" and Attribute3 > -1e999 and Attribute3 < 1e999 then Attribute3 else nil
			CurveAnimationClone:Destroy()
			
			if Attribute2 == nil then
				p1:fail(ErrorSourceStringsModule.Keys.EmoteAnimation_MaxPartTranslationCalcFailed)
				break
			end
			if math.abs(Attribute1 - Attribute2) > 0.00001 then
				p1:fail(ErrorSourceStringsModule.Keys.EmoteAnimation_MaxPartTranslationMismatch, {
					taggedTranslation = tostring(Attribute1),
					calculatedTranslation = tostring(Attribute2)
				})
				break
			end
		end
	end
}