local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)

return {
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD,
		validationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		validationEnumsModule.UploadCategory.RIGID_ACCESSORY
	},
	requiredData = { validationEnumsModule.SharedDataMember.rootInstance },
	fflag = require(parent.flags.getFFlagUGCValidateMigrateSchemaProperties),
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: constantsModule (ref), errorSourceStringsModule (ref)
		local rootInstance = p2.rootInstance
		local descendants = rootInstance:GetDescendants()
		table.insert(descendants, rootInstance)
		
		for i, v in descendants do
			if v:IsA("StringValue") and v.Name == "AvatarPartScaleType" and not constantsModule.AvatarPartScaleTypes[v.Value] then
				p1:fail(errorSourceStringsModule.Keys.ScaleTypeInvalid, { ParentName = if v.Parent then v.Parent.Name else v.Name })
			end
		end
	end
}