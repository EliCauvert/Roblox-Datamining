local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local FloatEqualsModule = require(Parent.util.floatEquals)

local function validateMeshMin(p1, OriginalSize, MeshName)
	-- upvalues: FloatEqualsModule (copy), ErrorSourceStringsModule (copy)
	local List = {}
	
	for _, value in { "X", "Y", "Z" } do
		if FloatEqualsModule(OriginalSize[value], 0, 0.0001) then
			table.insert(List, "Size on " .. value .. " axis is zero")
		end
	end
	if #List > 0 then
		p1:fail(ErrorSourceStringsModule.Keys.BodyBlocking_ZeroMeshSize, { meshName = MeshName, details = table.concat(List, ". ") })
	end
end

return {
	categories = {
		ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD,
		ValidationEnumsModule.UploadCategory.FULL_BODY
	},
	requiredData = {
		ValidationEnumsModule.SharedDataMember.rootInstance,
		ValidationEnumsModule.SharedDataMember.renderMeshesData
	},
	fflag = require(Parent.flags.getFFlagUGCValidateMigratePoseBlocking),
	expectedFailures = {},
	run = function(p2, p3)
		-- upvalues: validateMeshMin (copy)
		for i, value in p3.renderMeshesData do
			validateMeshMin(p2, value.originalSize, i)
		end
	end
}