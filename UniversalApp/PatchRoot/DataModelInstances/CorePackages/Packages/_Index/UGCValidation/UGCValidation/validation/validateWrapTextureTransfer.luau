local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)
local wrapTargetCageUVReferenceValuesModule = require(parent.WrapTargetCageUVReferenceValues)
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local getEditableMeshFromContextModule = require(parent.util.getEditableMeshFromContext)

local function validateReferenceCageMeshContent(p1, p2)
	-- upvalues: getEditableMeshFromContextModule (ref), analyticsModule (ref), pcallDeferredModule (ref), UGCValidationService (ref), wrapTargetCageUVReferenceValuesModule (ref)
	local referenceCageMeshContent = p1.ReferenceCageMeshContent
	local var1 = referenceCageMeshContent.Uri ~= nil and referenceCageMeshContent.Uri ~= ""
	local var2, var3 = getEditableMeshFromContextModule(p1, "ReferenceCageMeshContent", p2)
	
	if var2 then
		local var4, var5 = pcallDeferredModule(function()
			-- upvalues: UGCValidationService (copy), wrapTargetCageUVReferenceValuesModule (copy), var3 (ref)
			return UGCValidationService:ValidateEditableMeshUVValuesInReference(wrapTargetCageUVReferenceValuesModule.Head, var3)
		end, p2)
		
		if var4 then
			if var5 then
				return true
			end
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateWrapTextureTransfer_InvalidUV, nil, p2)
			
			return false, {
				string.format("Found invalid UV value for cage of '%s'. You need to edit the UV map to fix this issue.", p1:GetFullName())
			}
		else
			local formattedText_1 = string.format("Failed to load UVs for '%s'. Make sure the UV map exists and try again.", p1:GetFullName())
			
			if p2.isServer then
				error(formattedText_1)
			end
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateWrapTextureTransfer_FailedToLoadUV, nil, p2)
			
			return false, { formattedText_1 }
		end
	else
		local formattedText
		local _ = nil
		
		if var1 then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateWrapTextureTransfer_FailedToLoadCage, nil, p2)
			formattedText = string.format("Failed to load ReferenceCageContent for %s", p1:GetFullName())
		else
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateWrapTextureTransfer_NoCage, nil, p2)
			formattedText = string.format("No ReferenceCageContent provided for %s", p1:GetFullName())
		end
		return false, { formattedText }
	end
end

return function(p1, p2)
	-- upvalues: constantsModule (ref), validateReferenceCageMeshContent (ref), analyticsModule (ref)
	local currentTime = tick()
	local MAKEUP_INFO = constantsModule.MAKEUP_INFO
	local wrapTextureTransfer = p1:FindFirstChildOfClass("WrapTextureTransfer")
	assert(wrapTextureTransfer ~= nil, string.format("WrapTextureTransfer child not found for %s", p1.Name))
	local var1, var2 = validateReferenceCageMeshContent(wrapTextureTransfer, p2)
	
	if not var1 then
		return false, var2
	elseif not wrapTextureTransfer.UVMinBound:FuzzyEq(MAKEUP_INFO.WrapTextureTransferUVBounds.MinBound) then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateWrapTextureTransfer_InvalidMinBound, nil, p2)
		
		return false, {
			string.format("%s.UVMinBound [%s] does not match required UVMinBound of [%s]", wrapTextureTransfer:GetFullName(), tostring(wrapTextureTransfer.UVMinBound), tostring(MAKEUP_INFO.WrapTextureTransferUVBounds.MinBound))
		}
	elseif wrapTextureTransfer.UVMaxBound:FuzzyEq(MAKEUP_INFO.WrapTextureTransferUVBounds.MaxBound) then
		analyticsModule.recordScriptTime(script.Name, currentTime, p2)
		
		return true
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateWrapTextureTransfer_InvalidMaxBound, nil, p2)
	
	return false, {
		string.format("%s.UVMaxBound [%s] does not match required UVMaxBound of [%s]", wrapTextureTransfer:GetFullName(), tostring(wrapTextureTransfer.UVMaxBound), tostring(MAKEUP_INFO.WrapTextureTransferUVBounds.MaxBound))
	}
end