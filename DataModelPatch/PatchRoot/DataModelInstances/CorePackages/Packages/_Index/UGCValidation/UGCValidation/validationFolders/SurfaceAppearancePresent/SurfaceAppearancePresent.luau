local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local config = { InExpServer = true, InExpClient = true }

return {
	fflag = require(Parent.flags.getFFlagUGCValidateMigrateSurfaceAppearanceMeshQuality),
	categories = {
		ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD,
		ValidationEnumsModule.UploadCategory.RIGID_ACCESSORY
	},
	requiredData = {},
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: config (copy), ErrorSourceStringsModule (copy)
		local RootInstance = p2.rootInstance
		local IsEntry = config[p2.consumerConfig.source] == true
		local Descendants = RootInstance:GetDescendants()
		table.insert(Descendants, RootInstance)
		
		for _, Part in Descendants do
			if Part:IsA("MeshPart") then
				local IsNotTextureIDMatch = Part.TextureID ~= ""
				
				if IsEntry and not IsNotTextureIDMatch then
					local TextureContent = Part.TextureContent
					IsNotTextureIDMatch = if TextureContent.Uri == nil then TextureContent.Object ~= nil else TextureContent.Uri ~= "" or TextureContent.Object ~= nil
				end
				local SurfaceAppearance = Part:FindFirstChildWhichIsA("SurfaceAppearance")
				
				if IsNotTextureIDMatch then
					if SurfaceAppearance then
						p1:fail(ErrorSourceStringsModule.Keys.SurfaceAppearance_TextureAndSABothDefined, { MeshPartFullName = Part:GetFullName() }, Part)
					end
				elseif not SurfaceAppearance then
					p1:fail(ErrorSourceStringsModule.Keys.SurfaceAppearance_MissingSA, { MeshPartFullName = Part:GetFullName() }, Part)
				end
			end
		end
	end
}