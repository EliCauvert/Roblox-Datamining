local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local util = parent.util
local _ = require(util.Types)
local texturePackUtilsModule = require(util.TexturePackUtils)
local failureReasonsAccumulatorModule = require(util.FailureReasonsAccumulator)
local getFFlagUGCValidateTexturePackModule = require(parent.flags.getFFlagUGCValidateTexturePack)
local getFFlagUGCValidateTexturePackOnRCCOnlyModule = require(parent.flags.getFFlagUGCValidateTexturePackOnRCCOnly)
local t = {}

local function validateTexturePackURL(p1, p2, p3)
	-- upvalues: failureReasonsAccumulatorModule (ref), texturePackUtilsModule (ref), analyticsModule (ref)
	local var1 = failureReasonsAccumulatorModule.new()
	local var2 = texturePackUtilsModule.findSurfaceAppearancesMissingTexturePacks(p1, p2)
	
	for i, v in var2 do
		var1:updateReasons(false, {
			`'{v:GetFullName()}' has a 'TexturePack' property with an invalid URL. Please fix the URL.`
		})
	end
	if #var2 > 0 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateTexturePack_InvalidTexturePackURL, nil, p3)
	end
	return var1:getFinalResults()
end

local function validateSurfaceAppearanceTexturePackMatch(p4, p5)
	-- upvalues: failureReasonsAccumulatorModule (ref), texturePackUtilsModule (ref), UGCValidationService (ref), analyticsModule (ref)
	local var3 = failureReasonsAccumulatorModule.new()
	local var4 = false
	local var5 = false
	
	for i, v in texturePackUtilsModule.findSurfaceAppearancesWithTexturePacks(p4) do
		local ok, status = pcall(function()
			-- upvalues: UGCValidationService (copy), v (ref)
			return UGCValidationService:DoesSurfaceAppearanceMatchTexturePackAsync(v)
		end)
		
		if ok then
			var3:updateReasons(status, {
				`The textures in SurfaceAppearance '{v:GetFullName()}' do not match those in its TexturePack. Please fix the TexturePack`
			})
			
			if not var4 then
				var4 = not status
			end
		else
			local var6 = `Failed to download TexturePack for SurfaceAppearance '{v:GetFullName()}'.`
			
			if p5.isServer then
				error(var6)
			end
			var5 = true
			var3:updateReasons(false, { var6 })
		end
	end
	if var5 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateTexturePack_FailedToDownloadTexturePack, nil, p5)
	end
	if var4 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateTexturePack_TexturePackMismatch, nil, p5)
	end
	return var3:getFinalResults()
end

function t.validate(p6, p7, p8)
	-- upvalues: getFFlagUGCValidateTexturePackModule (ref), getFFlagUGCValidateTexturePackOnRCCOnlyModule (ref), failureReasonsAccumulatorModule (ref), validateTexturePackURL (ref), validateSurfaceAppearanceTexturePackMatch (ref), analyticsModule (ref)
	if not getFFlagUGCValidateTexturePackModule() then
		return true
	end
	local var7 = if getFFlagUGCValidateTexturePackOnRCCOnlyModule() then if p8.isServer then true else false else nil
	
	if p8.allowEditableInstances then
		return true
	end
	local currentTime = tick()
	local var8 = failureReasonsAccumulatorModule.new()
	
	if not getFFlagUGCValidateTexturePackOnRCCOnlyModule() then
		var8:updateReasons(validateTexturePackURL(p6, p7, p8))
	elseif var7 then
		var8:updateReasons(validateTexturePackURL(p6, p7, p8))
	end
	var8:updateReasons(validateSurfaceAppearanceTexturePackMatch(p6, p8))
	analyticsModule.recordScriptTime(script.Name, currentTime, p8)
	
	return var8:getFinalResults()
end

return t