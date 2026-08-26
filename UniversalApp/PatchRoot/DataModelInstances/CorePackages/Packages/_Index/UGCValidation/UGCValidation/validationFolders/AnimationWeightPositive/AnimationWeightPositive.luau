local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)

return {
	categories = { validationEnumsModule.UploadCategory.ANIMATION },
	requiredData = {
		validationEnumsModule.SharedDataMember.rootInstance,
		validationEnumsModule.SharedDataMember.uploadEnum
	},
	fflag = require(parent.flags.getFFlagUGCValidationAnimationPackSupport),
	expectedFailures = {},
	prereqTests = {
		validationEnumsModule.ValidationModule.ExpectedRootSchema
	},
	run = function(p1, p2)
		-- upvalues: errorSourceStringsModule (ref)
		if p2.uploadEnum.assetType ~= Enum.AssetType.IdleAnimation then return end
		for i, v in p2.rootInstance:GetDescendants() do
			if v:IsA("NumberValue") and v.Name == "Weight" then
				local value = v.Value
				
				if value <= 0 then
					p1:fail(errorSourceStringsModule.Keys.Animation_WeightNotPositive, {
						animationName = if v.Parent then v.Parent:GetFullName() else "Unknown",
						weight = tostring(value)
					})
				end
			end
		end
	end
}