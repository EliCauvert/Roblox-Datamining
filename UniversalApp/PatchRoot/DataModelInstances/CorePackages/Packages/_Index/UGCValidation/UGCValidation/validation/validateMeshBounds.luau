local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local getFFlagUGCValidateMeshMaxScaleModule = require(parent.flags.getFFlagUGCValidateMeshMaxScale)
local getFIntUGCValidateMeshCenteringHundredsThresholdModule = require(parent.flags.getFIntUGCValidateMeshCenteringHundredsThreshold)
local getMeshMinMaxModule = require(parent.util.getMeshMinMax)
local analyticsModule = require(parent.Analytics)
local UGCValidationScaleMinimumThousandths = game:DefineFastInt("UGCValidationScaleMinimumThousandths", 10)
local fIntUGCValidationScaleMaximumThousandths = game:DefineFastInt("FIntUGCValidationScaleMaximumThousandths", 10000)
local renderBoundsCheckAttachmentOrientation = game:DefineFastFlag("RenderBoundsCheckAttachmentOrientation", false)

local function pointInBounds(p0, p1, p2) --[[ line: 19 ]]
	local var10 = p1:PointToObjectSpace(p0)
	
	return -p2.X / 2 <= var10.X and (var10.X <= p2.X / 2 and (-p2.Y / 2 <= var10.Y and (var10.Y <= p2.Y / 2 and (-p2.Z / 2 <= var10.Z and var10.Z <= p2.Z / 2))))
end

local function _(p3, p4) --[[ line: 29 | named "isSizeWithinBounds_deprecated" ]]
	return p3.Size.X <= p4.X and (p3.Size.Y <= p4.Y and p3.Size.Z <= p4.Z)
end

local _ = function(p5, p6, p7) --[[ line: 33 | named "isSizeWithinBounds" ]]
	local var11 = (p7 * p5.Size):Abs()
	
	return var11.X <= p6.X and (var11.Y <= p6.Y and var11.Z <= p6.Z)
end

local _ = function(p8) --[[ line: 40 | named "truncate" ]]
	return math.floor(p8 * 100) / 100
end

local function getErrors(p9, p10, p11) --[[ line: 44 ]]
	return {
		string.format("%s has size larger than max allowed bounding size. The max size for type %s is [%.2f, %.2f, %.2f]", p9, p10, math.floor(p11.X * 100) / 100, math.floor(p11.Y * 100) / 100, math.floor(p11.Z * 100) / 100)
	}
end

return function(p12, p13, p14, p15, p16, p17, p18) --[[ line: 57 | named "validateMeshBounds" ]]
	-- upvalues: UGCValidationScaleMinimumThousandths (ref), getFFlagUGCValidateMeshMaxScaleModule (ref), fIntUGCValidationScaleMaximumThousandths (ref), UGCValidationService (ref), analyticsModule (ref), pointInBounds (ref), getErrors (ref), renderBoundsCheckAttachmentOrientation (ref), getMeshMinMaxModule (ref), getFIntUGCValidateMeshCenteringHundredsThresholdModule (ref)
	local isServer = p18.isServer
	local size = p16.size
	local var12 = p12.CFrame * p13.CFrame * CFrame.new(p16.offset or Vector3.new(0, 0, 0))
	
	if p12.Position.X > 10000 or p12.Position.X < -10000 or (p12.Position.Y > 10000 or p12.Position.Y < -10000) or (p12.Position.Z > 10000 or p12.Position.Z < -10000) then
		return false, { "Position is outside of bounds" }
	elseif var12.Position.X > 10000 or var12.Position.X < -10000 or (var12.Position.Y > 10000 or var12.Position.Y < -10000) or (var12.Position.Z > 10000 or var12.Position.Z < -10000) then
		return false, { "Position is outside of bounds" }
	elseif p15.X < UGCValidationScaleMinimumThousandths / 1000 or p15.Y < UGCValidationScaleMinimumThousandths / 1000 or p15.Z < UGCValidationScaleMinimumThousandths / 1000 then
		return false, { "Mesh scale is too small" }
	elseif getFFlagUGCValidateMeshMaxScaleModule() and (fIntUGCValidationScaleMaximumThousandths / 1000 < p15.X or fIntUGCValidationScaleMaximumThousandths / 1000 < p15.Y or fIntUGCValidationScaleMaximumThousandths / 1000 < p15.Z) then
		return false, { `{p12.Name} mesh scale is too large` }
	end
	local ok, status = pcall(function() --[[ line: 110 ]]
		-- upvalues: UGCValidationService (copy), p14 (ref)
		return UGCValidationService:GetEditableMeshVerts(p14.editableMesh)
	end)
	
	if ok then
		local v
		for i, v in pairs(status) do
			if not pointInBounds(p12.CFrame:PointToWorldSpace(v * p15), var12, size) then
				analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshBounds_TooLarge, nil, p18)
				
				return false, getErrors(p14.context, p17, size)
			end
		end
		if renderBoundsCheckAttachmentOrientation then
			local var13 = (p13.CFrame.Rotation * p12.Size):Abs()
			
			if not (var13.X <= size.X and (var13.Y <= size.Y and var13.Z <= size.Z)) then
				analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshBounds_TooLarge, nil, p18)
				
				return false, getErrors(p12:GetFullName(), p17, size)
			end
		elseif not (p12.Size.X <= size.X and (p12.Size.Y <= size.Y and p12.Size.Z <= size.Z)) then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshBounds_TooLarge, nil, p18)
			
			return false, getErrors(p12:GetFullName(), p17, size)
		end
		local cloned = table.clone(p14)
		cloned.scale = p15
		var15, var16, var17, v = getMeshMinMaxModule(cloned, p18)
		
		if not var15 then
			return false, var16
		elseif p18.allowEditableInstances or getFIntUGCValidateMeshCenteringHundredsThresholdModule() / 100 >= ((var17 + v) / 2).Magnitude then
			return true
		end
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshBounds_Shifted, nil, p18)
		
		return false, {
			`{p14.fullName}.{p14.fieldName} has mesh data that is not centered. Please reimport this mesh with the roblox 3d importer, and ensure there is no loose geometry in the source file.`
		}
	else
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshBounds_FailedToLoadMesh, nil, p18)
		
		if isServer ~= nil and isServer then
			error(string.format("Failed to load body part mesh %s. Make sure body part exists and try again.", p14.fullName))
		end
		return false, {
			string.format("Failed to load body part mesh %s. Make sure body part exists and try again.", p14.fullName)
		}
	end
end