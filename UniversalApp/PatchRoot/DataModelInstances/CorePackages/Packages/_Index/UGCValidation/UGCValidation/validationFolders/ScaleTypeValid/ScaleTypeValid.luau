local Parent = script.Parent.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)

return {
	categories = {
		ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD,
		ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		ValidationEnumsModule.UploadCategory.EYEBROW_EYELASH,
		ValidationEnumsModule.UploadCategory.RIGID_ACCESSORY
	},
	requiredData = { ValidationEnumsModule.SharedDataMember.rootInstance },
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: ConstantsModule (copy), ErrorSourceStringsModule (copy)
		local RootInstance = p2.rootInstance
		local Descendants = RootInstance:GetDescendants()
		table.insert(Descendants, RootInstance)
		
		for _, StringValue in Descendants do
			if StringValue:IsA("StringValue") and StringValue.Name == "AvatarPartScaleType" and not ConstantsModule.AvatarPartScaleTypes[StringValue.Value] then
				p1:fail(ErrorSourceStringsModule.Keys.ScaleTypeInvalid, {
					ParentName = if StringValue.Parent then StringValue.Parent.Name else StringValue.Name
				})
			end
		end
	end
}