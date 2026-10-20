local Parent = script.Parent.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)

local function buildAcceptedMaterialList(): string
	-- upvalues: ConstantsModule (copy)
	local List = {}
	
	for i in pairs(ConstantsModule.MATERIAL_WHITELIST) do
		table.insert(List, i.Name)
	end
	return table.concat(List, ", ")
end

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
		-- upvalues: ConstantsModule (copy), buildAcceptedMaterialList (copy), ErrorSourceStringsModule (copy)
		local RootInstance = p2.rootInstance
		local Descendants = RootInstance:GetDescendants()
		table.insert(Descendants, RootInstance)
		local AllowedMaterials = nil
		
		for _, Part in Descendants do
			if Part:IsA("BasePart") and not ConstantsModule.MATERIAL_WHITELIST[Part.Material] then
				AllowedMaterials = AllowedMaterials or buildAcceptedMaterialList()
				p1:fail(ErrorSourceStringsModule.Keys.MaterialNotAllowed, {
					InstanceNameList = Part:GetFullName(),
					AllowedMaterials = AllowedMaterials
				})
			end
		end
	end
}