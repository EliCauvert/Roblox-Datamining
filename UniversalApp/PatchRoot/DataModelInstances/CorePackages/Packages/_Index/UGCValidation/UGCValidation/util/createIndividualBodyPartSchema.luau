local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local ConstantsModule = require(Parent.Constants)
local R15plusUtilsModule = require(Parent.util.R15plusUtils)
local GetFFlagUGCValidationEnforceHRDUploadModule = require(Parent.flags.getFFlagUGCValidationEnforceHRDUpload)
local config = { LeftHand = "LeftHand", RightHand = "RightHand" }

return function(p1, Text, _) --[[ Line: 14 | Named "createIndividualBodyPartSchema" ]]
	-- upvalues: ConstantsModule (copy), R15plusUtilsModule (copy), GetFFlagUGCValidationEnforceHRDUploadModule (copy), config (copy)
	local SubPart = ConstantsModule.ASSET_TYPE_INFO[p1].subParts[Text]
	local config1 = {
		ClassName = "MeshPart",
		Name = { Text },
		_children = {
			{
				ClassName = "StringValue",
				Name = { "AvatarPartScaleType" }
			},
			{
				ClassName = "WrapTarget",
				Name = { Text, Text .. "WrapTarget", "WrapTarget" }
			},
			{
				ClassName = "SurfaceAppearance",
				_optional = true,
				Name = { "SurfaceAppearance" }
			}
		}
	}
	table.insert(config1._children, {
		ClassName = "Attachment",
		Name = { SubPart.rigAttachmentToParent.name }
	})
	
	for otherAttachment in pairs(SubPart.otherAttachments) do
		table.insert(config1._children, { ClassName = "Attachment", Name = { otherAttachment } })
	end
	if R15plusUtilsModule.checkFlagEnabledForAllowHrd() then
		table.insert(config1._children, {
			ClassName = "HumanoidRigDescription",
			Name = { "HumanoidRigDescription" },
			_optional = not GetFFlagUGCValidationEnforceHRDUploadModule()
		})
		
		if config[Text] ~= nil then
			table.insert(config1._children, {
				ClassName = "DigitsRigDescription",
				_optional = true,
				Name = { "DigitsRigDescription", `{config[Text]}Description` }
			})
		end
		local AvatarBoneSchema = R15plusUtilsModule.getAvatarBoneSchema(Text)
		local AttachmentNameWhitelistOfClassInSchema = R15plusUtilsModule.getNameWhitelistOfClassInSchema(AvatarBoneSchema, "Attachment")
		
		for _, Attachment in config1._children do
			if Attachment.ClassName == "Attachment" and AttachmentNameWhitelistOfClassInSchema[Attachment.Name[1]] then
				Attachment._optional = true
			end
			if string.find(Attachment.Name[1], "ShoulderRigAttachment") then
				if Attachment._children == nil then
					Attachment._children = {}
				end
				table.insert(Attachment._children, {
					ClassName = "Attachment",
					_optional = true,
					Name = { R15plusUtilsModule.JointRotationName }
				})
			end
		end
		for i, value in R15plusUtilsModule.getNameWhitelistOfClassInSchema(AvatarBoneSchema, "Bone") do
			if value then
				table.insert(config1._children, {
					ClassName = "Bone",
					_optional = true,
					_ignoreDescendants = true,
					Name = { i }
				})
			end
		end
	end
	return config1
end