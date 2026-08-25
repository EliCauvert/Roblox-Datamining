local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)

return {
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD,
		validationEnumsModule.UploadCategory.LAYERED_CLOTHING
	},
	requiredData = { validationEnumsModule.SharedDataMember.rootInstance },
	fflag = require(parent.flags.getFFlagUGCValidateMigrateSchemaProperties),
	expectedFailures = {},
	run = function(p0, p1)
		-- upvalues: validationEnumsModule (ref), errorSourceStringsModule (ref)
		if p1.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.IEC or p1.consumerConfig.source == "AutoSetup" then return end
		local rootInstance = p1.rootInstance
		local descendants = rootInstance:GetDescendants()
		table.insert(descendants, rootInstance)
		
		for i, v in descendants do
			if v:IsA("BaseWrap") and not v:IsHSRReady() then
				p0:fail(errorSourceStringsModule.Keys.HSRDataNotReady, { InstancePath = v:GetFullName() })
			end
		end
	end
}