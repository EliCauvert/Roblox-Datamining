local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local GetFFlagUGCValidateMeshMaxScaleModule = require(Parent.flags.getFFlagUGCValidateMeshMaxScale)
local GetFIntUGCValidateMeshCenteringHundredsThresholdModule = require(Parent.flags.getFIntUGCValidateMeshCenteringHundredsThreshold)
local GetMeshMinMaxModule = require(Parent.util.getMeshMinMax)
local AnalyticsModule = require(Parent.Analytics)
local UGCValidationScaleMinimumThousandths = game:DefineFastInt("UGCValidationScaleMinimumThousandths", 10)
local FIntUGCValidationScaleMaximumThousandths = game:DefineFastInt("FIntUGCValidationScaleMaximumThousandths", 10000)
local RenderBoundsCheckAttachmentOrientation = game:DefineFastFlag("RenderBoundsCheckAttachmentOrientation", false)

local function pointInBounds(p1, CF, Vector): boolean
	local Vector1 = CF:PointToObjectSpace(p1)
	
	return -Vector.X / 2 <= Vector1.X and (Vector1.X <= Vector.X / 2 and (-Vector.Y / 2 <= Vector1.Y and (Vector1.Y <= Vector.Y / 2 and -Vector.Z / 2 <= Vector1.Z))) and Vector1.Z <= Vector.Z / 2
end

local function _(p1, Vector): boolean
	return p1.Size.X <= Vector.X and p1.Size.Y <= Vector.Y and p1.Size.Z <= Vector.Z
end

local _ = function(p1, Vector, p2): boolean
	local AbsResult = (p2 * p1.Size):Abs()
	
	return AbsResult.X <= Vector.X and AbsResult.Y <= Vector.Y and AbsResult.Z <= Vector.Z
end

local _ = function(p1: number): number
	return math.floor(p1 * 100) / 100
end

local function getErrors(FullName, p1, Size)
	return {
		string.format("%s has size larger than max allowed bounding size. The max size for type %s is [%.2f, %.2f, %.2f]", FullName, p1, math.floor(Size.X * 100) / 100, math.floor(Size.Y * 100) / 100, math.floor(Size.Z * 100) / 100)
	}
end

return function(Object, p1, Tbl, Vector, p2, p3, p4)
	-- upvalues: UGCValidationScaleMinimumThousandths (copy), GetFFlagUGCValidateMeshMaxScaleModule (copy), FIntUGCValidationScaleMaximumThousandths (copy), UGCValidationService (copy), AnalyticsModule (copy), pointInBounds (copy), getErrors (copy), RenderBoundsCheckAttachmentOrientation (copy), GetMeshMinMaxModule (copy), GetFIntUGCValidateMeshCenteringHundredsThresholdModule (copy)
	local IsServer = p4.isServer
	local Size = p2.size
	local CF = Object.CFrame * p1.CFrame * CFrame.new(p2.offset or vector.create(0, 0, 0))
	
	if Object.Position.X > 10000 or Object.Position.X < -10000 or Object.Position.Y > 10000 or Object.Position.Y < -10000 or Object.Position.Z > 10000 or Object.Position.Z < -10000 then
		return false, { "Position is outside of bounds" }
	end
	if CF.Position.X > 10000 or CF.Position.X < -10000 or CF.Position.Y > 10000 or CF.Position.Y < -10000 or CF.Position.Z > 10000 or CF.Position.Z < -10000 then
		return false, { "Position is outside of bounds" }
	end
	if Vector.X < UGCValidationScaleMinimumThousandths / 1000 or Vector.Y < UGCValidationScaleMinimumThousandths / 1000 or Vector.Z < UGCValidationScaleMinimumThousandths / 1000 then
		return false, { "Mesh scale is too small" }
	end
	if GetFFlagUGCValidateMeshMaxScaleModule() and (FIntUGCValidationScaleMaximumThousandths / 1000 < Vector.X or FIntUGCValidationScaleMaximumThousandths / 1000 < Vector.Y or FIntUGCValidationScaleMaximumThousandths / 1000 < Vector.Z) then
		return false, { `{Object.Name} mesh scale is too large` }
	end
	local Success, Result = pcall(function()
		-- upvalues: UGCValidationService (upval), Tbl (copy)
		return UGCValidationService:GetEditableMeshVerts(Tbl.editableMesh)
	end)
	
	if Success then
		for _, value in pairs(Result) do
			if not pointInBounds(Object.CFrame:PointToWorldSpace(value * Vector), CF, Size) then
				AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateMeshBounds_TooLarge, nil, p4)
				
				return false, (getErrors(Tbl.context, p3, Size))
			end
		end
		if RenderBoundsCheckAttachmentOrientation then
			local AbsResult = (p1.CFrame.Rotation * Object.Size):Abs()
			
			if AbsResult.X > Size.X or (AbsResult.Y > Size.Y or AbsResult.Z > Size.Z) then
				AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateMeshBounds_TooLarge, nil, p4)
				
				return false, (getErrors(Object:GetFullName(), p3, Size))
			end
		elseif Object.Size.X > Size.X or (Object.Size.Y > Size.Y or Object.Size.Z > Size.Z) then
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateMeshBounds_TooLarge, nil, p4)
			
			return false, (getErrors(Object:GetFullName(), p3, Size))
		end
		local Copy = table.clone(Tbl)
		Copy.scale = Vector
		local MeshMinMaxModule, MeshMinMaxModule2, MeshMinMaxModule3, MeshMinMaxModule4 = GetMeshMinMaxModule(Copy, p4)
		
		if not MeshMinMaxModule then
			return false, MeshMinMaxModule2
		elseif p4.allowEditableInstances or GetFIntUGCValidateMeshCenteringHundredsThresholdModule() / 100 >= ((MeshMinMaxModule3 + MeshMinMaxModule4) / 2).Magnitude then
			return true
		else
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateMeshBounds_Shifted, nil, p4)
			
			return false, {
				`{Tbl.fullName}.{Tbl.fieldName} has mesh data that is not centered. Please reimport this mesh with the roblox 3d importer, and ensure there is no loose geometry in the source file.`
			}
		end
	else
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateMeshBounds_FailedToLoadMesh, nil, p4)
		
		if IsServer ~= nil and IsServer then
			error(string.format("Failed to load body part mesh %s. Make sure body part exists and try again.", Tbl.fullName))
		end
		return false, {
			string.format("Failed to load body part mesh %s. Make sure body part exists and try again.", Tbl.fullName)
		}
	end
end