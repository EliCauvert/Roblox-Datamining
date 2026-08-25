local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local getFFlagUGCValidateMeshMaxScaleModule = require(parent.flags.getFFlagUGCValidateMeshMaxScale)
local getFIntUGCValidateMeshCenteringHundredsThresholdModule = require(parent.flags.getFIntUGCValidateMeshCenteringHundredsThreshold)
local getMeshMinMaxModule = require(parent.util.getMeshMinMax)
local analyticsModule = require(parent.Analytics)
local UGCValidationScaleMinimumThousandths = game:DefineFastInt("UGCValidationScaleMinimumThousandths", 10)
local fIntUGCValidationScaleMaximumThousandths = game:DefineFastInt("FIntUGCValidationScaleMaximumThousandths", 10000)

local function pointInBounds(p1, p2, p3)
	local var1 = p2:PointToObjectSpace(p1)
	
	return -p3.X / 2 <= var1.X and (var1.X <= p3.X / 2 and (-p3.Y / 2 <= var1.Y and (var1.Y <= p3.Y / 2 and (-p3.Z / 2 <= var1.Z and var1.Z <= p3.Z / 2))))
end

local function _(p1, p2, p3)
	local var1 = (p3 * p1.Size):Abs()
	
	return var1.X <= p2.X and (var1.Y <= p2.Y and var1.Z <= p2.Z)
end

local _ = function(p1)
	return math.floor(p1 * 100) / 100
end

local function getErrors(p1, p2, p3)
	return {
		string.format("%s has size larger than max allowed bounding size. The max size for type %s is [%.2f, %.2f, %.2f]", p1, p2, math.floor(p3.X * 100) / 100, math.floor(p3.Y * 100) / 100, math.floor(p3.Z * 100) / 100)
	}
end

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: UGCValidationScaleMinimumThousandths (ref), getFFlagUGCValidateMeshMaxScaleModule (ref), fIntUGCValidationScaleMaximumThousandths (ref), UGCValidationService (ref), analyticsModule (ref), pointInBounds (ref), getErrors (ref), getMeshMinMaxModule (ref), getFIntUGCValidateMeshCenteringHundredsThresholdModule (ref)
	local isServer = p7.isServer
	local size = p5.size
	local var1 = p1.CFrame * p2.CFrame * CFrame.new(p5.offset or Vector3.new(0, 0, 0))
	
	if p1.Position.X > 10000 or p1.Position.X < -10000 or (p1.Position.Y > 10000 or p1.Position.Y < -10000) or (p1.Position.Z > 10000 or p1.Position.Z < -10000) then
		return false, { "Position is outside of bounds" }
	elseif var1.Position.X > 10000 or var1.Position.X < -10000 or (var1.Position.Y > 10000 or var1.Position.Y < -10000) or (var1.Position.Z > 10000 or var1.Position.Z < -10000) then
		return false, { "Position is outside of bounds" }
	elseif p4.X < UGCValidationScaleMinimumThousandths / 1000 or p4.Y < UGCValidationScaleMinimumThousandths / 1000 or p4.Z < UGCValidationScaleMinimumThousandths / 1000 then
		return false, { "Mesh scale is too small" }
	elseif getFFlagUGCValidateMeshMaxScaleModule() and (fIntUGCValidationScaleMaximumThousandths / 1000 < p4.X or fIntUGCValidationScaleMaximumThousandths / 1000 < p4.Y or fIntUGCValidationScaleMaximumThousandths / 1000 < p4.Z) then
		return false, { `{p1.Name} mesh scale is too large` }
	end
	local ok, status = pcall(function()
		-- upvalues: UGCValidationService (copy), p3 (ref)
		return UGCValidationService:GetEditableMeshVerts(p3.editableMesh)
	end)
	
	if ok then
		local v
		for i, v in pairs(status) do
			if not pointInBounds(p1.CFrame:PointToWorldSpace(v * p4), var1, size) then
				analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshBounds_TooLarge, nil, p7)
				
				return false, getErrors(p3.context, p6, size)
			end
		end
		local var2 = (p2.CFrame.Rotation * p1.Size):Abs()
		
		if not (var2.X <= size.X and (var2.Y <= size.Y and var2.Z <= size.Z)) then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshBounds_TooLarge, nil, p7)
			
			return false, getErrors(p1:GetFullName(), p6, size)
		end
		local cloned = table.clone(p3)
		cloned.scale = p4
		var14, var15, v, var16 = getMeshMinMaxModule(cloned, p7)
		
		if not var14 then
			return false, var15
		elseif p7.allowEditableInstances or getFIntUGCValidateMeshCenteringHundredsThresholdModule() / 100 >= ((v + var16) / 2).Magnitude then
			return true
		end
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshBounds_Shifted, nil, p7)
		
		return false, {
			`{p3.fullName}.{p3.fieldName} has mesh data that is not centered. Please reimport this mesh with the roblox 3d importer, and ensure there is no loose geometry in the source file.`
		}
	else
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshBounds_FailedToLoadMesh, nil, p7)
		
		if isServer ~= nil and isServer then
			error(string.format("Failed to load body part mesh %s. Make sure body part exists and try again.", p3.fullName))
		end
		return false, {
			string.format("Failed to load body part mesh %s. Make sure body part exists and try again.", p3.fullName)
		}
	end
end