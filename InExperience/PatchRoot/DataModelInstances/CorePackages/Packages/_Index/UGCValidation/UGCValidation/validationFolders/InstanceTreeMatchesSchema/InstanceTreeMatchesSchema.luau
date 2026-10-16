local Parent = script.Parent.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)

return {
	categories = {
		ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		ValidationEnumsModule.UploadCategory.EYEBROW_EYELASH,
		ValidationEnumsModule.UploadCategory.RIGID_ACCESSORY,
		ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION,
		ValidationEnumsModule.UploadCategory.MAKEUP
	},
	requiredData = { ValidationEnumsModule.SharedDataMember.rootInstance },
	expectedFailures = {},
	run = function(p1, p2) --[[ Line: 22 ]]
		-- upvalues: ConstantsModule (copy), ErrorSourceStringsModule (copy)
		local RootInstance = p2.rootInstance
		
		if ConstantsModule.BANNED_NAMES[RootInstance.Name] then
			p1:fail(ErrorSourceStringsModule.Keys.InstanceTreeBannedName, { InstancePath = RootInstance:GetFullName() })
		end
		for _, descendant in RootInstance:GetDescendants() do
			for _, bANNEDCLASSNAME in ConstantsModule.BANNED_CLASS_NAMES do
				if descendant:IsA(bANNEDCLASSNAME) then
					p1:fail(ErrorSourceStringsModule.Keys.InstanceTreeBannedClass, {
						InstancePath = descendant:GetFullName(),
						ClassName = bANNEDCLASSNAME
					})
				end
			end
			if ConstantsModule.BANNED_NAMES[descendant.Name] then
				p1:fail(ErrorSourceStringsModule.Keys.InstanceTreeBannedName, { InstancePath = descendant:GetFullName() })
			end
		end
	end
}