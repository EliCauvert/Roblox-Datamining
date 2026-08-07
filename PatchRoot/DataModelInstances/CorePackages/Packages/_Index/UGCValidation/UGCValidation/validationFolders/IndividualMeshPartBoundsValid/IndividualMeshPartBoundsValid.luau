-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:47 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateIndividualMeshPartBoundsModule = require(parent.flags.getFFlagUGCValidateIndividualMeshPartBounds)
game:DefineFastInt("UGCValidateMeshPartBoundsMinHundredths", 10)
game:DefineFastInt("UGCValidateMeshPartBoundsMaxHundredths", 200)
local var3 = game:GetFastInt("UGCValidateMeshPartBoundsMinHundredths") / 100
local var4 = game:GetFastInt("UGCValidateMeshPartBoundsMaxHundredths") / 100

return {
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = {
		validationEnumsModule.SharedDataMember.rootInstance,
		validationEnumsModule.SharedDataMember.uploadEnum,
		validationEnumsModule.SharedDataMember.renderMeshesData
	},
	conditionalData = {},
	fflag = getFFlagUGCValidateIndividualMeshPartBoundsModule,
	expectedFailures = {},
	prereqTests = {},
	run = function(p0, p1) --[[ line: 31 ]]
		-- upvalues: var3 (ref), errorSourceStringsModule (ref), var4 (ref)
		local rootInstance = p1.rootInstance
		
		for i, v in p1.renderMeshesData do
			local var5 = v.originalSize * v.scale
			
			local function checkAxis(p2, p3) --[[ line: 38 ]]
				-- upvalues: var3 (copy), p0 (ref), errorSourceStringsModule (copy), i (ref), rootInstance (ref), var4 (copy)
				if p3 < var3 then
					p0:fail(errorSourceStringsModule.Keys.MeshPartBounds_TooSmall, {
						partName = i,
						axis = p2,
						currentSize = string.format("%.2f", p3),
						minSize = string.format("%.2f", var3)
					}, rootInstance)
					
					return
				elseif var4 < p3 then
					p0:fail(errorSourceStringsModule.Keys.MeshPartBounds_TooLarge, {
						partName = i,
						axis = p2,
						currentSize = string.format("%.2f", p3),
						maxSize = string.format("%.2f", var4)
					}, rootInstance)
				end
			end
			
			checkAxis("X", var5.X)
			checkAxis("Y", var5.Y)
			checkAxis("Z", var5.Z)
		end
	end
}