local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)

return {
	categories = constantsModule.AllAssetUploadCategoriesIncludingMakeup,
	requiredData = {
		validationEnumsModule.SharedDataMember.rootInstance,
		validationEnumsModule.SharedDataMember.consumerConfig
	},
	fflag = require(parent.flags.getFFlagUGCValidateBackendContentNotEditable),
	expectedFailures = {},
	run = function(p0, p1) --[[ line: 20 ]]
		-- upvalues: validationEnumsModule (ref), constantsModule (ref), errorSourceStringsModule (ref)
		if p1.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.IEC then return end
		local descendants = p1.rootInstance:GetDescendants()
		table.insert(descendants, p1.rootInstance)
		
		for i, v in descendants do
			local className = constantsModule.CONTENT_TYPED_PROPERTIES_BY_CLASS[v.ClassName]
			
			if className then
				for i_1, v_1 in className do
					if v[v_1].Object ~= nil then
						p0:fail(errorSourceStringsModule.Keys.ContentNotEditable, { InstanceFullName = v:GetFullName(), FieldName = v_1 })
					end
				end
			end
		end
	end
}