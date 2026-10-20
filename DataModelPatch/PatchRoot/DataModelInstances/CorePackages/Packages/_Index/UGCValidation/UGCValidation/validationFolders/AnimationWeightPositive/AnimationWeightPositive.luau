local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)

return {
	categories = { ValidationEnumsModule.UploadCategory.ANIMATION },
	requiredData = {
		ValidationEnumsModule.SharedDataMember.rootInstance,
		ValidationEnumsModule.SharedDataMember.uploadEnum
	},
	fflag = require(Parent.flags.getFFlagUGCValidationAnimationPackSupport),
	expectedFailures = {},
	prereqTests = {
		ValidationEnumsModule.ValidationModule.ExpectedRootSchema
	},
	run = function(p1, p2)
		-- upvalues: ErrorSourceStringsModule (copy)
		if p2.uploadEnum.assetType ~= Enum.AssetType.IdleAnimation then return end
		for _, NumberValue in p2.rootInstance:GetDescendants() do
			if NumberValue:IsA("NumberValue") and NumberValue.Name == "Weight" then
				local Value: number = NumberValue.Value
				
				if Value <= 0 then
					p1:fail(ErrorSourceStringsModule.Keys.Animation_WeightNotPositive, {
						animationName = if NumberValue.Parent then NumberValue.Parent:GetFullName() else "Unknown",
						weight = tostring(Value)
					})
				end
			end
		end
	end
}