local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)

return {
	categories = {
		ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD,
		ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		ValidationEnumsModule.UploadCategory.EYEBROW_EYELASH
	},
	requiredData = { ValidationEnumsModule.SharedDataMember.rootInstance },
	expectedFailures = {},
	run = function(p1, p2) --[[ Line: 20 ]]
		-- upvalues: ValidationEnumsModule (copy), ErrorSourceStringsModule (copy)
		if p2.consumerConfig.consumerEnv == ValidationEnumsModule.ConsumerEnv.IEC or p2.consumerConfig.source == "AutoSetup" then return end
		local RootInstance = p2.rootInstance
		local Descendants = RootInstance:GetDescendants()
		table.insert(Descendants, RootInstance)
		
		for _, BaseWrap in Descendants do
			if BaseWrap:IsA("BaseWrap") and not BaseWrap:IsHSRReady() then
				p1:fail(ErrorSourceStringsModule.Keys.HSRDataNotReady, { InstancePath = BaseWrap:GetFullName() })
			end
		end
	end
}