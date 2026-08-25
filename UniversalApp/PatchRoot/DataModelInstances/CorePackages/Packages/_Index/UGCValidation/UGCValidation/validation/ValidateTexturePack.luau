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

local function validateTexturePackURL(p0, p1, p2)
	-- upvalues: failureReasonsAccumulatorModule (ref), texturePackUtilsModule (ref), analyticsModule (ref)
	local var9 = failureReasonsAccumulatorModule.new()
	local var10 = texturePackUtilsModule.findSurfaceAppearancesMissingTexturePacks(p0, p1)
	
	for i, v in var10 do
		var9:updateReasons(false, {
			`'{v:GetFullName()}' has a 'TexturePack' property with an invalid URL. Please fix the URL.`
		})
	end
	if #var10 > 0 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateTexturePack_InvalidTexturePackURL, nil, p2)
	end
	return var9:getFinalResults()
end

local function validateSurfaceAppearanceTexturePackMatch(p3, p4)
	-- upvalues: failureReasonsAccumulatorModule (ref), texturePackUtilsModule (ref), UGCValidationService (ref), analyticsModule (ref)
	local var11 = failureReasonsAccumulatorModule.new()
	local var12 = false
	local var13 = false
	
	for i, v in texturePackUtilsModule.findSurfaceAppearancesWithTexturePacks(p3) do
		local ok, status = pcall(function()
			-- upvalues: UGCValidationService (copy), v (ref)
			return UGCValidationService:DoesSurfaceAppearanceMatchTexturePackAsync(v)
		end)
		
		if ok then
			var11:updateReasons(status, {
				`The textures in SurfaceAppearance '{v:GetFullName()}' do not match those in its TexturePack. Please fix the TexturePack`
			})
			
			if not var12 then
				var12 = not status
			end
		else
			local var14 = `Failed to download TexturePack for SurfaceAppearance '{v:GetFullName()}'.`
			
			if p4.isServer then
				error(var14)
			end
			var13 = true
			var11:updateReasons(false, { var14 })
		end
	end
	if var13 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateTexturePack_FailedToDownloadTexturePack, nil, p4)
	end
	if var12 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateTexturePack_TexturePackMismatch, nil, p4)
	end
	return var11:getFinalResults()
end

function t.validate(p5, p6, p7)
	-- upvalues: getFFlagUGCValidateTexturePackModule (ref), getFFlagUGCValidateTexturePackOnRCCOnlyModule (ref), failureReasonsAccumulatorModule (ref), validateTexturePackURL (ref), validateSurfaceAppearanceTexturePackMatch (ref), analyticsModule (ref)
	if not getFFlagUGCValidateTexturePackModule() then
		return true
	end
	local var15 = if getFFlagUGCValidateTexturePackOnRCCOnlyModule() then if p7.isServer then true else false else nil
	
	if p7.allowEditableInstances then
		return true
	end
	local currentTime = tick()
	local var17 = failureReasonsAccumulatorModule.new()
	
	if not getFFlagUGCValidateTexturePackOnRCCOnlyModule() then
		var17:updateReasons(validateTexturePackURL(p5, p6, p7))
	elseif var15 then
		var17:updateReasons(validateTexturePackURL(p5, p6, p7))
	end
	var17:updateReasons(validateSurfaceAppearanceTexturePackMatch(p5, p7))
	analyticsModule.recordScriptTime(script.Name, currentTime, p7)
	
	return var17:getFinalResults()
end

return t