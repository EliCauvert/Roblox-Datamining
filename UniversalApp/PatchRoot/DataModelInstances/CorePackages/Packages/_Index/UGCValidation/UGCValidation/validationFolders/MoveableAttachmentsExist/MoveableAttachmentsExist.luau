local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getAllInstancesIsAModule = require(parent.util.getAllInstancesIsA)
local getAllInstancesWithNameModule = require(parent.util.getAllInstancesWithName)
local r15plusUtilsModule = require(parent.util.R15plusUtils)

return {
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = { validationEnumsModule.SharedDataMember.rootInstance },
	fflag = r15plusUtilsModule.checkFlagEnabledForAllowHrd,
	run = function(p0, p1) --[[ line: 16 ]]
		-- upvalues: getAllInstancesIsAModule (ref), r15plusUtilsModule (ref), getAllInstancesWithNameModule (ref), errorSourceStringsModule (ref)
		for i, v in getAllInstancesIsAModule(p1.rootInstance, "MeshPart") do
			p0:setReportingInstance(v)
			
			for i_1, v_1 in r15plusUtilsModule.getNameWhitelistOfClassInSchema(r15plusUtilsModule.getAvatarBoneSchema(v.Name), "Attachment") do
				if v_1 then
					local var5 = getAllInstancesWithNameModule(v, i_1)
					
					if #var5 ~= 1 or var5[1].ClassName ~= "Attachment" then
						p0:fail(errorSourceStringsModule.Keys.MissingRequiredAttachment, { attName = i_1, partName = v.Name })
					end
				end
			end
		end
	end
}