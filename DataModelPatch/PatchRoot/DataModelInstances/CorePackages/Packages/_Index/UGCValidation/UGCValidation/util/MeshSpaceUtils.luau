local Parent = script.Parent.Parent
local BoundsDataUtilsModule = require(Parent.util.BoundsDataUtils)
local GetAttachmentCFrameInPartSpaceModule = require(Parent.util.getAttachmentCFrameInPartSpace)

local function _(p1, p2: number)
	return p1 * (p2 / 2)
end

local _ = function(p1, p2): CFrame
	return CFrame.new(p1.Rotation:Inverse() * (p2.Position - p1.Position)) * (p1.Rotation:Inverse() * p2.Rotation)
end

local _ = function(p1, p2: number, p3)
	local ScaledMin = p1.min * (p2 / 2)
	local ScaledMax = p1.max * (p2 / 2)
	
	return (ScaledMin + ScaledMax) * 0.5 + p3, ScaledMax - ScaledMin
end

return {
	clampAttachmentToBounds = function(p1, p2, p3, p4): CFrame
		-- upvalues: GetAttachmentCFrameInPartSpaceModule (copy), BoundsDataUtilsModule (copy)
		local P10 = p4 or 0.001
		local ScaledCframe = p2.cframe * GetAttachmentCFrameInPartSpaceModule(p1)
		local BoundsCenters = BoundsDataUtilsModule.calculateBoundsCenters(p2.boundsData)
		local BoundsDimensions: number = BoundsDataUtilsModule.calculateBoundsDimensions(p2.boundsData)
		assert(BoundsCenters, "meshCenterPos is nil")
		assert(BoundsDimensions, "meshDimensions is nil")
		local PositionDelta = ScaledCframe.Position - BoundsCenters
		local ScaledMin = p3.min * (BoundsDimensions / 2)
		local ScaledMax = p3.max * (BoundsDimensions / 2)
		local Vector = {}
		
		for _, value in { "X", "Y", "Z" } do
			Vector[value] = {}
			local VectorEntry = Vector[value]
			local ScaledMaxEntryDelta = ScaledMax[value] - P10
			Vector[value].min = ScaledMin[value] + P10
			VectorEntry.max = ScaledMaxEntryDelta
			
			if Vector[value].max < Vector[value].min then
				local ScaledScaledMinEntry = (ScaledMin[value] + ScaledMax[value]) * 0.5
				Vector[value].min = ScaledScaledMinEntry
				Vector[value].max = ScaledScaledMinEntry
			end
		end
		local NewRotation = ScaledCframe.Rotation + (BoundsCenters + Vector3.new(math.clamp(PositionDelta.X, Vector.X.min, Vector.X.max), math.clamp(PositionDelta.Y, Vector.Y.min, Vector.Y.max), (math.clamp(PositionDelta.Z, Vector.Z.min, Vector.Z.max))))
		local Cframe = p2.cframe
		
		return CFrame.new(Cframe.Rotation:Inverse() * (NewRotation.Position - Cframe.Position)) * (Cframe.Rotation:Inverse() * NewRotation.Rotation)
	end,
	calculateAcceptableBoundsLocalSpace = function(p5, p6, p7: number, p8)
		local ScaledMin = p5.min * (p7 / 2)
		local ScaledMax = p5.max * (p7 / 2)
		local X = (ScaledMin + ScaledMax) * 0.5 + p8
		local ScaledMaxDelta = ScaledMax - ScaledMin
		local Cframe = p6.cframe
		local _CFrame = CFrame.new(X)
		
		return CFrame.new(Cframe.Rotation:Inverse() * (_CFrame.Position - Cframe.Position)) * (Cframe.Rotation:Inverse() * _CFrame.Rotation), ScaledMaxDelta
	end
}