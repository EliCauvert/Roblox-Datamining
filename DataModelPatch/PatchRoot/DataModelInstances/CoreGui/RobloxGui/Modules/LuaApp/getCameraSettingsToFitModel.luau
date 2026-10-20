local TModule = require(game:GetService("CorePackages").Packages.t)
local StrictInterfaceResult = TModule.strictInterface({
	model = TModule.instanceIsA("Model"),
	cameraFieldOfView = TModule.optional(TModule.numberConstrained(1, 120)),
	upVector = TModule.optional(TModule.Vector3),
	lookVector = TModule.optional(TModule.Vector3),
	bottomOffset = TModule.optional(TModule.numberMin(0)),
	topOffset = TModule.optional(TModule.numberMin(0))
})

return function(p1)
	-- upvalues: StrictInterfaceResult (copy)
	assert(StrictInterfaceResult(p1))
	local Model = p1.model:Clone()
	local CameraFieldOfView = p1.cameraFieldOfView or 70
	local Unit = p1.upVector.Unit or Vector3.fromAxis(Enum.Axis.Y)
	local Unit1 = p1.lookVector.Unit or Vector3.fromAxis(Enum.Axis.Z)
	local CrossProduct = Unit:Cross(Unit1)
	local BottomOffset = p1.bottomOffset or 0
	local Y = p1.topOffset or 0
	assert(math.abs((Unit:Dot(Unit1))) < 0.00001, "upVector and lookVector must be perpendicular")
	local PrimaryPart = Model.PrimaryPart
	local Position = PrimaryPart and PrimaryPart.CFrame.Position or Vector3.new()
	local _CFrame = CFrame.fromMatrix(Vector3.new(), CrossProduct, Unit)
	local Part = Instance.new("Part", Model)
	Part.Size = vector.create(0, 0, 0)
	Model.PrimaryPart = Part
	Part.CFrame = _CFrame * CFrame.fromMatrix(Vector3.new(), Vector3.fromAxis(Enum.Axis.X), (Vector3.new(0, math.cos(CameraFieldOfView * 3.141592653589793 / 360), (math.sin(CameraFieldOfView * 3.141592653589793 / 360))))) + Position
	local BoundingCFrame, BoundingSize = Model:GetBoundingBox()
	local NewBoundingCFrame = BoundingCFrame + _CFrame * Vector3.new(0, -BottomOffset, 0)
	local PositionDelta = Part.Position - (NewBoundingCFrame:VectorToWorldSpace(Vector3.fromAxis(Enum.Axis.Y)):Dot(Position - NewBoundingCFrame.Position) + BoundingSize.Y / 2) * NewBoundingCFrame.UpVector
	local LookVector = NewBoundingCFrame.LookVector
	Part.CFrame = _CFrame * CFrame.fromMatrix(Vector3.new(), Vector3.fromAxis(Enum.Axis.X), (Vector3.new(0, math.cos(CameraFieldOfView * 3.141592653589793 / 360), -math.sin(CameraFieldOfView * 3.141592653589793 / 360)))) + Position
	local BoundingCFrame1, BoundingSize1 = Model:GetBoundingBox()
	local NewBoundingCFrame1 = BoundingCFrame1 + _CFrame * Vector3.new(0, Y, 0)
	local NewPosition = Part.Position + (NewBoundingCFrame1:VectorToWorldSpace(Vector3.fromAxis(Enum.Axis.Y)):Dot(NewBoundingCFrame1.Position - Position) + BoundingSize1.Y / 2) * NewBoundingCFrame1.UpVector
	local LookVector1 = NewBoundingCFrame1.LookVector
	Model:Destroy()
	local NewPositionDelta = PositionDelta + LookVector * LookVector1:Cross(NewPosition - PositionDelta).Magnitude / LookVector1:Cross(LookVector).Magnitude
	local DotProduct = (Position - NewPositionDelta):Dot(Unit1)
	
	return {
		distance = DotProduct,
		focusPoint = NewPositionDelta + DotProduct * Unit1
	}
end