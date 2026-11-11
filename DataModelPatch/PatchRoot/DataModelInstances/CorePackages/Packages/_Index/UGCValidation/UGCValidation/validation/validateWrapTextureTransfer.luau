local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local ConstantsModule = require(Parent.Constants)
local WrapTargetCageUVReferenceValuesModule = require(Parent.WrapTargetCageUVReferenceValues)
local _ = require(Parent.util.Types)
local PcallDeferredModule = require(Parent.util.pcallDeferred)
local GetEditableMeshFromContextModule = require(Parent.util.getEditableMeshFromContext)

local function validateReferenceCageMeshContent(Object, p1)
	-- upvalues: GetEditableMeshFromContextModule (copy), AnalyticsModule (copy), PcallDeferredModule (copy), UGCValidationService (copy), WrapTargetCageUVReferenceValuesModule (copy)
	local ReferenceCageMeshContent = Object.ReferenceCageMeshContent
	local IsNotUriMatch: boolean = ReferenceCageMeshContent.Uri ~= nil and ReferenceCageMeshContent.Uri ~= ""
	local ReferenceCageMeshContent1, ReferenceCageMeshContent2 = GetEditableMeshFromContextModule(Object, "ReferenceCageMeshContent", p1)
	
	if ReferenceCageMeshContent1 then
		local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function()
			-- upvalues: UGCValidationService (upval), WrapTargetCageUVReferenceValuesModule (upval), ReferenceCageMeshContent2 (copy)
			return UGCValidationService:ValidateEditableMeshUVValuesInReference(WrapTargetCageUVReferenceValuesModule.Head, ReferenceCageMeshContent2)
		end, p1)
		
		if not PcallDeferredModuleResult then
			local Formatted = string.format("Failed to load UVs for '%s'. Make sure the UV map exists and try again.", Object:GetFullName())
			
			if p1.isServer then
				error(Formatted)
			end
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateWrapTextureTransfer_FailedToLoadUV, nil, p1)
			
			return false, { Formatted }
		elseif PcallDeferredModuleResult2 then
			return true
		else
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateWrapTextureTransfer_InvalidUV, nil, p1)
			
			return false, {
				string.format("Found invalid UV value for cage of '%s'. You need to edit the UV map to fix this issue.", Object:GetFullName())
			}
		end
	else
		local Formatted = nil
		if IsNotUriMatch then
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateWrapTextureTransfer_FailedToLoadCage, nil, p1)
			Formatted = string.format("Failed to load ReferenceCageContent for %s", Object:GetFullName())
		else
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateWrapTextureTransfer_NoCage, nil, p1)
			Formatted = string.format("No ReferenceCageContent provided for %s", Object:GetFullName())
		end
		return false, { Formatted }
	end
end

return function(Object, p1)
	-- upvalues: ConstantsModule (copy), validateReferenceCageMeshContent (copy), AnalyticsModule (copy)
	local CurrentTime = tick()
	local MAKEUPINFO = ConstantsModule.MAKEUP_INFO
	local WrapTextureTransfer = Object:FindFirstChildOfClass("WrapTextureTransfer")
	assert(WrapTextureTransfer ~= nil, string.format("WrapTextureTransfer child not found for %s", Object.Name))
	local ValidateReferenceCageMeshContentResult, ValidateReferenceCageMeshContentResult2 = validateReferenceCageMeshContent(WrapTextureTransfer, p1)
	
	if not ValidateReferenceCageMeshContentResult then
		return false, ValidateReferenceCageMeshContentResult2
	elseif not WrapTextureTransfer.UVMinBound:FuzzyEq(MAKEUPINFO.WrapTextureTransferUVBounds.MinBound) then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateWrapTextureTransfer_InvalidMinBound, nil, p1)
		
		return false, {
			string.format("%s.UVMinBound [%s] does not match required UVMinBound of [%s]", WrapTextureTransfer:GetFullName(), tostring(WrapTextureTransfer.UVMinBound), (tostring(MAKEUPINFO.WrapTextureTransferUVBounds.MinBound)))
		}
	elseif WrapTextureTransfer.UVMaxBound:FuzzyEq(MAKEUPINFO.WrapTextureTransferUVBounds.MaxBound) then
		AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p1)
		
		return true
	else
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateWrapTextureTransfer_InvalidMaxBound, nil, p1)
		
		return false, {
			string.format("%s.UVMaxBound [%s] does not match required UVMaxBound of [%s]", WrapTextureTransfer:GetFullName(), tostring(WrapTextureTransfer.UVMaxBound), (tostring(MAKEUPINFO.WrapTextureTransferUVBounds.MaxBound)))
		}
	end
end