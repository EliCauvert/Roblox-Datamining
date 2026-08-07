local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)
local wrapTargetCageUVReferenceValuesModule = require(parent.WrapTargetCageUVReferenceValues)
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local getEditableMeshFromContextModule = require(parent.util.getEditableMeshFromContext)

local function validateReferenceCageMeshContent(p0, p1) --[[ line: 17 ]]
	-- upvalues: getEditableMeshFromContextModule (ref), analyticsModule (ref), pcallDeferredModule (ref), UGCValidationService (ref), wrapTargetCageUVReferenceValuesModule (ref)
	local referenceCageMeshContent = p0.ReferenceCageMeshContent
	local var7 = referenceCageMeshContent.Uri ~= nil and referenceCageMeshContent.Uri ~= ""
	local var8, var9 = getEditableMeshFromContextModule(p0, "ReferenceCageMeshContent", p1)
	
	if var8 then
		local var11, var12 = pcallDeferredModule(function() --[[ line: 41 ]]
			-- upvalues: UGCValidationService (copy), wrapTargetCageUVReferenceValuesModule (copy), var9 (ref)
			return UGCValidationService:ValidateEditableMeshUVValuesInReference(wrapTargetCageUVReferenceValuesModule.Head, var9)
		end, p1)
		
		if var11 then
			if var12 then
				return true
			end
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateWrapTextureTransfer_InvalidUV, nil, p1)
			
			return false, {
				string.format("Found invalid UV value for cage of '%s'. You need to edit the UV map to fix this issue.", p0:GetFullName())
			}
		else
			local formattedText_1 = string.format("Failed to load UVs for '%s'. Make sure the UV map exists and try again.", p0:GetFullName())
			
			if p1.isServer then
				error(formattedText_1)
			end
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateWrapTextureTransfer_FailedToLoadUV, nil, p1)
			
			return false, { formattedText_1 }
		end
	else
		local formattedText
		local _ = nil
		
		if var7 then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateWrapTextureTransfer_FailedToLoadCage, nil, p1)
			formattedText = string.format("Failed to load ReferenceCageContent for %s", p0:GetFullName())
		else
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateWrapTextureTransfer_NoCage, nil, p1)
			formattedText = string.format("No ReferenceCageContent provided for %s", p0:GetFullName())
		end
		return false, { formattedText }
	end
end

return function(p2, p3) --[[ line: 75 | named "validateWrapTextureTransfer" ]]
	-- upvalues: constantsModule (ref), validateReferenceCageMeshContent (ref), analyticsModule (ref)
	local currentTime = tick()
	local MAKEUP_INFO = constantsModule.MAKEUP_INFO
	local wrapTextureTransfer = p2:FindFirstChildOfClass("WrapTextureTransfer")
	assert(wrapTextureTransfer ~= nil, string.format("WrapTextureTransfer child not found for %s", p2.Name))
	local var16, var17 = validateReferenceCageMeshContent(wrapTextureTransfer, p3)
	
	if not var16 then
		return false, var17
	elseif not wrapTextureTransfer.UVMinBound:FuzzyEq(MAKEUP_INFO.WrapTextureTransferUVBounds.MinBound) then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateWrapTextureTransfer_InvalidMinBound, nil, p3)
		
		return false, {
			string.format("%s.UVMinBound [%s] does not match required UVMinBound of [%s]", wrapTextureTransfer:GetFullName(), tostring(wrapTextureTransfer.UVMinBound), tostring(MAKEUP_INFO.WrapTextureTransferUVBounds.MinBound))
		}
	elseif wrapTextureTransfer.UVMaxBound:FuzzyEq(MAKEUP_INFO.WrapTextureTransferUVBounds.MaxBound) then
		analyticsModule.recordScriptTime(script.Name, currentTime, p3)
		
		return true
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateWrapTextureTransfer_InvalidMaxBound, nil, p3)
	
	return false, {
		string.format("%s.UVMaxBound [%s] does not match required UVMaxBound of [%s]", wrapTextureTransfer:GetFullName(), tostring(wrapTextureTransfer.UVMaxBound), tostring(MAKEUP_INFO.WrapTextureTransferUVBounds.MaxBound))
	}
end