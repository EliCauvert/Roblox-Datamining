-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:44 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)
local constantsInterfaceModule = require(parent.ConstantsInterface)
local _ = require(parent.util.Types)
local validateTextureSizeModule = require(parent.validation.validateTextureSize)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local getEditableImageFromContextModule = require(parent.util.getEditableImageFromContext)
local parseContentIdsModule = require(parent.util.ParseContentIds)
local getFFlagUGCValidateAccessoryAssetSurfaceAppearanceTextureLimitsModule = require(parent.flags.getFFlagUGCValidateAccessoryAssetSurfaceAppearanceTextureLimits)
local t = {
	ColorMap = game:DefineFastInt("AccessoryColorMapMaxSize", 1024),
	MetalnessMap = game:DefineFastInt("AccessoryMetalnessMapMaxSize", 256),
	NormalMap = game:DefineFastInt("AccessoryNormalMapMaxSize", 256),
	RoughnessMap = game:DefineFastInt("AccessoryRoughnessMapMaxSize", 256)
}

return function(p0, p1) --[[ line: 34 | named "validateSurfaceAppearanceTextureSize" ]]
	-- upvalues: failureReasonsAccumulatorModule (ref), parseContentIdsModule (ref), constantsModule (ref), getEditableImageFromContextModule (ref), getFFlagUGCValidateAccessoryAssetSurfaceAppearanceTextureLimitsModule (ref), constantsInterfaceModule (ref), t (ref), validateTextureSizeModule (ref), analyticsModule (ref)
	local currentTime = tick()
	local descendants = p0:GetDescendants()
	table.insert(descendants, p0)
	local var11 = failureReasonsAccumulatorModule.new()
	
	for i, v in descendants do
		if v:IsA("MeshPart") then
			local surfaceAppearance = v:FindFirstChildWhichIsA("SurfaceAppearance")
			
			if surfaceAppearance then
				for i_1, v_1 in parseContentIdsModule.parse(surfaceAppearance, constantsModule.TEXTURE_CONTENT_ID_FIELDS, p1) do
					local t_1 = {
						fullName = v_1.instance:GetFullName() .. "." .. v_1.fieldName,
						fieldName = v_1.fieldName,
						contentId = v_1.instance[v_1.fieldName]
					}
					local var14, var15 = getEditableImageFromContextModule(v_1.instance, v_1.fieldName, p1)
					
					if var14 then
						t_1.editableImage = var15
						local _ = nil
						var11:updateReasons(validateTextureSizeModule(t_1, nil, p1, if getFFlagUGCValidateAccessoryAssetSurfaceAppearanceTextureLimitsModule() and p1.assetTypeEnum then constantsInterfaceModule.getTextureLimit(p1.assetTypeEnum, v_1.instance, v_1.fieldName) else t[v_1.fieldName]))
					end
					return false, { "Failed to load texture data" }
				end
			end
		end
	end
	analyticsModule.recordScriptTime(script.Name, currentTime, p1)
	
	return var11:getFinalResults()
end