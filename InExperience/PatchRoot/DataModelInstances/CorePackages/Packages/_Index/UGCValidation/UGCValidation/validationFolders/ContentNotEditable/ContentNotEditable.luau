local Parent = script.Parent.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)

return {
	categories = ConstantsModule.AllAssetUploadCategoriesIncludingMakeup,
	requiredData = {
		ValidationEnumsModule.SharedDataMember.rootInstance,
		ValidationEnumsModule.SharedDataMember.consumerConfig
	},
	fflag = require(Parent.flags.getFFlagUGCValidateBackendContentNotEditable),
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: ValidationEnumsModule (copy), ConstantsModule (copy), ErrorSourceStringsModule (copy)
		if p2.consumerConfig.consumerEnv == ValidationEnumsModule.ConsumerEnv.IEC then return end
		local Descendants = p2.rootInstance:GetDescendants()
		table.insert(Descendants, p2.rootInstance)
		
		for _, descendant in Descendants do
			local CONTENTTYPEDPROPERTIESBYCLASSEntry = ConstantsModule.CONTENT_TYPED_PROPERTIES_BY_CLASS[descendant.ClassName]
			
			if CONTENTTYPEDPROPERTIESBYCLASSEntry then
				for _, FieldName in CONTENTTYPEDPROPERTIESBYCLASSEntry do
					if descendant[FieldName].Object ~= nil then
						p1:fail(ErrorSourceStringsModule.Keys.ContentNotEditable, {
							InstanceFullName = descendant:GetFullName(),
							FieldName = FieldName
						})
					end
				end
			end
		end
	end
}