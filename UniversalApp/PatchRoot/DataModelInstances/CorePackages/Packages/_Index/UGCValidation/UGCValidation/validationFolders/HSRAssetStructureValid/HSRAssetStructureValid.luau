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
	run = function(p1, p2)
		-- upvalues: validationEnumsModule (ref), errorSourceStringsModule (ref)
		if p2.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.IEC or p2.consumerConfig.source == "AutoSetup" then return end
		local rootInstance = p2.rootInstance
		local descendants = rootInstance:GetDescendants()
		table.insert(descendants, rootInstance)
		
		for i, v in descendants do
			if v:IsA("BaseWrap") and not v:IsHSRReady() then
				p1:fail(errorSourceStringsModule.Keys.HSRDataNotReady, { InstancePath = v:GetFullName() })
			end
		end
	end
}