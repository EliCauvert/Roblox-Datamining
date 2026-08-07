local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local t = { InExpServer = true, InExpClient = true }

return {
	fflag = require(parent.flags.getFFlagUGCValidateMigrateSurfaceAppearanceMeshQuality),
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD,
		validationEnumsModule.UploadCategory.RIGID_ACCESSORY
	},
	requiredData = {},
	expectedFailures = {},
	run = function(p0, p1) --[[ line: 39 ]]
		-- upvalues: t (ref), errorSourceStringsModule (ref)
		local rootInstance = p1.rootInstance
		local var3 = t[p1.consumerConfig.source] == true
		local descendants = rootInstance:GetDescendants()
		table.insert(descendants, rootInstance)
		
		for i, v in descendants do
			if v:IsA("MeshPart") then
				local var5 = v.TextureID ~= ""
				
				if var3 and not var5 then
					local var6
					local textureContent = v.TextureContent
					
					if textureContent.Uri ~= nil then
						var6 = if textureContent.Uri == "" then textureContent.Object ~= nil else true
					end
					var5 = var6
				end
				local surfaceAppearance = v:FindFirstChildWhichIsA("SurfaceAppearance")
				
				if var5 then
					if surfaceAppearance then
						p0:fail(errorSourceStringsModule.Keys.SurfaceAppearance_TextureAndSABothDefined, { MeshPartFullName = v:GetFullName() }, v)
					end
				elseif not surfaceAppearance then
					p0:fail(errorSourceStringsModule.Keys.SurfaceAppearance_MissingSA, { MeshPartFullName = v:GetFullName() }, v)
				end
			end
		end
	end
}