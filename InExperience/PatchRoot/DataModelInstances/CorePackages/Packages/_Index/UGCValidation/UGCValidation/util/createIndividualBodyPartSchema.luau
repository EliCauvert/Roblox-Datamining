local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local constantsModule = require(parent.Constants)
local r15plusUtilsModule = require(parent.util.R15plusUtils)
local getFFlagUGCValidationEnforceHRDUploadModule = require(parent.flags.getFFlagUGCValidationEnforceHRDUpload)
local t = { LeftHand = "LeftHand", RightHand = "RightHand" }

return function(p0, p1, _)
	-- upvalues: constantsModule (ref), r15plusUtilsModule (ref), getFFlagUGCValidationEnforceHRDUploadModule (ref), t (ref)
	local var4 = constantsModule.ASSET_TYPE_INFO[p0].subParts[p1]
	local t_1 = {
		ClassName = "MeshPart",
		Name = { p1 },
		_children = {
			{
				ClassName = "StringValue",
				Name = { "AvatarPartScaleType" }
			},
			{
				ClassName = "WrapTarget",
				Name = { p1, p1 .. "WrapTarget", "WrapTarget" }
			},
			{
				ClassName = "SurfaceAppearance",
				_optional = true,
				Name = { "SurfaceAppearance" }
			}
		}
	}
	table.insert(t_1._children, {
		ClassName = "Attachment",
		Name = { var4.rigAttachmentToParent.name }
	})
	
	for i in pairs(var4.otherAttachments) do
		table.insert(t_1._children, { ClassName = "Attachment", Name = { i } })
	end
	if r15plusUtilsModule.checkFlagEnabledForAllowHrd() then
		table.insert(t_1._children, {
			ClassName = "HumanoidRigDescription",
			Name = { "HumanoidRigDescription" },
			_optional = not getFFlagUGCValidationEnforceHRDUploadModule()
		})
		
		if t[p1] ~= nil then
			table.insert(t_1._children, {
				ClassName = "DigitsRigDescription",
				_optional = true,
				Name = { "DigitsRigDescription", `{t[p1]}Description` }
			})
		end
		local avatarBoneSchema = r15plusUtilsModule.getAvatarBoneSchema(p1)
		local attachment = r15plusUtilsModule.getNameWhitelistOfClassInSchema(avatarBoneSchema, "Attachment")
		
		for i_1, v in t_1._children do
			if v.ClassName == "Attachment" and attachment[v.Name[1]] then
				v._optional = true
			end
			if string.find(v.Name[1], "ShoulderRigAttachment") then
				if v._children == nil then
					v._children = {}
				end
				table.insert(v._children, {
					ClassName = "Attachment",
					_optional = true,
					Name = { r15plusUtilsModule.JointRotationName }
				})
			end
		end
		for i_2, v_1 in r15plusUtilsModule.getNameWhitelistOfClassInSchema(avatarBoneSchema, "Bone") do
			if v_1 then
				table.insert(t_1._children, {
					ClassName = "Bone",
					_optional = true,
					_ignoreDescendants = true,
					Name = { i_2 }
				})
			end
		end
	end
	return t_1
end