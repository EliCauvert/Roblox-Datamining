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
	run = function(p1, p2)
		-- upvalues: t (ref), errorSourceStringsModule (ref)
		local rootInstance = p2.rootInstance
		local var1 = t[p2.consumerConfig.source] == true
		local descendants = rootInstance:GetDescendants()
		table.insert(descendants, rootInstance)
		
		for i, v in descendants do
			if v:IsA("MeshPart") then
				local var2 = v.TextureID ~= ""
				
				if var1 and not var2 then
					local var3
					local textureContent = v.TextureContent
					
					if textureContent.Uri ~= nil then
						var3 = if textureContent.Uri == "" then textureContent.Object ~= nil else true
					end
					var2 = var3
				end
				local surfaceAppearance = v:FindFirstChildWhichIsA("SurfaceAppearance")
				
				if var2 then
					if surfaceAppearance then
						p1:fail(errorSourceStringsModule.Keys.SurfaceAppearance_TextureAndSABothDefined, { MeshPartFullName = v:GetFullName() }, v)
					end
				elseif not surfaceAppearance then
					p1:fail(errorSourceStringsModule.Keys.SurfaceAppearance_MissingSA, { MeshPartFullName = v:GetFullName() }, v)
				end
			end
		end
	end
}