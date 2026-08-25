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

local function validateSurfaceAppearanceTexturePackMatch(p1, p2)
	-- upvalues: failureReasonsAccumulatorModule (ref), texturePackUtilsModule (ref), UGCValidationService (ref), analyticsModule (ref)
	local var1 = failureReasonsAccumulatorModule.new()
	local var2 = false
	local var3 = false
	
	for i, v in texturePackUtilsModule.findSurfaceAppearancesWithTexturePacks(p1) do
		local ok, status = pcall(function()
			-- upvalues: UGCValidationService (copy), v (ref)
			return UGCValidationService:DoesSurfaceAppearanceMatchTexturePackAsync(v)
		end)
		
		if ok then
			var1:updateReasons(status, {
				`The textures in SurfaceAppearance '{v:GetFullName()}' do not match those in its TexturePack. Please fix the TexturePack`
			})
			
			if not var2 then
				var2 = not status
			end
		else
			local var4 = `Failed to download TexturePack for SurfaceAppearance '{v:GetFullName()}'.`
			
			if p2.isServer then
				error(var4)
			end
			var3 = true
			var1:updateReasons(false, { var4 })
		end
	end
	if var3 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateTexturePack_FailedToDownloadTexturePack, nil, p2)
	end
	if var2 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateTexturePack_TexturePackMismatch, nil, p2)
	end
	return var1:getFinalResults()
end

function t.validate(p1, p2, p3)
	-- upvalues: getFFlagUGCValidateTexturePackModule (ref), getFFlagUGCValidateTexturePackOnRCCOnlyModule (ref), failureReasonsAccumulatorModule (ref), validateTexturePackURL (ref), validateSurfaceAppearanceTexturePackMatch (ref), analyticsModule (ref)
	if not getFFlagUGCValidateTexturePackModule() then
		return true
	end
	local var1 = if getFFlagUGCValidateTexturePackOnRCCOnlyModule() then if p3.isServer then true else false else nil
	
	if p3.allowEditableInstances then
		return true
	end
	local currentTime = tick()
	local var2 = failureReasonsAccumulatorModule.new()
	
	if not getFFlagUGCValidateTexturePackOnRCCOnlyModule() then
		var2:updateReasons(validateTexturePackURL(p1, p2, p3))
	elseif var1 then
		var2:updateReasons(validateTexturePackURL(p1, p2, p3))
	end
	var2:updateReasons(validateSurfaceAppearanceTexturePackMatch(p1, p3))
	analyticsModule.recordScriptTime(script.Name, currentTime, p3)
	
	return var2:getFinalResults()
end

return t