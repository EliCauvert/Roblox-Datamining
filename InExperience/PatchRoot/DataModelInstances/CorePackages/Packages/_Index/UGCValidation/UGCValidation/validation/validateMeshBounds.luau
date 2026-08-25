local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local getFFlagUGCValidateMeshMaxScaleModule = require(parent.flags.getFFlagUGCValidateMeshMaxScale)
local getFIntUGCValidateMeshCenteringHundredsThresholdModule = require(parent.flags.getFIntUGCValidateMeshCenteringHundredsThreshold)
local getMeshMinMaxModule = require(parent.util.getMeshMinMax)
local analyticsModule = require(parent.Analytics)
local UGCValidationScaleMinimumThousandths = game:DefineFastInt("UGCValidationScaleMinimumThousandths", 10)
local fIntUGCValidationScaleMaximumThousandths = game:DefineFastInt("FIntUGCValidationScaleMaximumThousandths", 10000)

local function pointInBounds(p0, p1, p2)
	local var9 = p1:PointToObjectSpace(p0)
	
	return -p2.X / 2 <= var9.X and (var9.X <= p2.X / 2 and (-p2.Y / 2 <= var9.Y and (var9.Y <= p2.Y / 2 and (-p2.Z / 2 <= var9.Z and var9.Z <= p2.Z / 2))))
end

local function _(p3, p4, p5)
	local var10 = (p5 * p3.Size):Abs()
	
	return var10.X <= p4.X and (var10.Y <= p4.Y and var10.Z <= p4.Z)
end

local _ = function(p6)
	return math.floor(p6 * 100) / 100
end

local function getErrors(p7, p8, p9)
	return {
		string.format("%s has size larger than max allowed bounding size. The max size for type %s is [%.2f, %.2f, %.2f]", p7, p8, math.floor(p9.X * 100) / 100, math.floor(p9.Y * 100) / 100, math.floor(p9.Z * 100) / 100)
	}
end

return function(p10, p11, p12, p13, p14, p15, p16)
	-- upvalues: UGCValidationScaleMinimumThousandths (ref), getFFlagUGCValidateMeshMaxScaleModule (ref), fIntUGCValidationScaleMaximumThousandths (ref), UGCValidationService (ref), analyticsModule (ref), pointInBounds (ref), getErrors (ref), getMeshMinMaxModule (ref), getFIntUGCValidateMeshCenteringHundredsThresholdModule (ref)
	local isServer = p16.isServer
	local size = p14.size
	local var11 = p10.CFrame * p11.CFrame * CFrame.new(p14.offset or Vector3.new(0, 0, 0))
	
	if p10.Position.X > 10000 or p10.Position.X < -10000 or (p10.Position.Y > 10000 or p10.Position.Y < -10000) or (p10.Position.Z > 10000 or p10.Position.Z < -10000) then
		return false, { "Position is outside of bounds" }
	elseif var11.Position.X > 10000 or var11.Position.X < -10000 or (var11.Position.Y > 10000 or var11.Position.Y < -10000) or (var11.Position.Z > 10000 or var11.Position.Z < -10000) then
		return false, { "Position is outside of bounds" }
	elseif p13.X < UGCValidationScaleMinimumThousandths / 1000 or p13.Y < UGCValidationScaleMinimumThousandths / 1000 or p13.Z < UGCValidationScaleMinimumThousandths / 1000 then
		return false, { "Mesh scale is too small" }
	elseif getFFlagUGCValidateMeshMaxScaleModule() and (fIntUGCValidationScaleMaximumThousandths / 1000 < p13.X or fIntUGCValidationScaleMaximumThousandths / 1000 < p13.Y or fIntUGCValidationScaleMaximumThousandths / 1000 < p13.Z) then
		return false, { `{p10.Name} mesh scale is too large` }
	end
	local ok, status = pcall(function()
		-- upvalues: UGCValidationService (copy), p12 (ref)
		return UGCValidationService:GetEditableMeshVerts(p12.editableMesh)
	end)
	
	if ok then
		local v
		for i, v in pairs(status) do
			if not pointInBounds(p10.CFrame:PointToWorldSpace(v * p13), var11, size) then
				analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshBounds_TooLarge, nil, p16)
				
				return false, getErrors(p12.context, p15, size)
			end
		end
		local var12 = (p11.CFrame.Rotation * p10.Size):Abs()
		
		if not (var12.X <= size.X and (var12.Y <= size.Y and var12.Z <= size.Z)) then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshBounds_TooLarge, nil, p16)
			
			return false, getErrors(p10:GetFullName(), p15, size)
		end
		local cloned = table.clone(p12)
		cloned.scale = p13
		var14, var15, v, var16 = getMeshMinMaxModule(cloned, p16)
		
		if not var14 then
			return false, var15
		elseif p16.allowEditableInstances or getFIntUGCValidateMeshCenteringHundredsThresholdModule() / 100 >= ((v + var16) / 2).Magnitude then
			return true
		end
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshBounds_Shifted, nil, p16)
		
		return false, {
			`{p12.fullName}.{p12.fieldName} has mesh data that is not centered. Please reimport this mesh with the roblox 3d importer, and ensure there is no loose geometry in the source file.`
		}
	else
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshBounds_FailedToLoadMesh, nil, p16)
		
		if isServer ~= nil and isServer then
			error(string.format("Failed to load body part mesh %s. Make sure body part exists and try again.", p12.fullName))
		end
		return false, {
			string.format("Failed to load body part mesh %s. Make sure body part exists and try again.", p12.fullName)
		}
	end
end