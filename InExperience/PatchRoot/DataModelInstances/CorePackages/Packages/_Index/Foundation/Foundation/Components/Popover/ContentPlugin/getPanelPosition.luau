local Foundation = script:FindFirstAncestor("Foundation")
local PopoverAlignModule = require(Foundation.Enums.PopoverAlign)
local PopoverSideModule = require(Foundation.Enums.PopoverSide)
local _ = require(Foundation.Providers.StudioPanels.Types)

return function(Position, Position1, p1, p2, p3) --[[ Line: 24 | Named "getPanelPosition" ]]
	-- upvalues: PopoverAlignModule (copy), PopoverSideModule (copy)
	local Offset = 0
	local X = 0
	local Position2 = Position
	local Position3 = Position1
	
	if type(Position) == "table" then
		Offset = Position.offset
		Position2 = Position.position
	end
	if type(Position1) == "table" then
		X = Position1.offset
		Position3 = Position1.position
	end
	local X2: number = X
	local Y = Offset + (p3 or 0)
	local X1 = 0
	
	if Position3 == PopoverAlignModule.Center then
		X1 = 0.5
		X = 0
	elseif Position3 == PopoverAlignModule.End then
		X1 = 1
		X = -X
	end
	local NewVector: Vector2? = nil
	local ZeroVector = nil
	local SubjectAnchorPoint: Vector2? = nil
	
	if Position2 == PopoverSideModule.Top then
		NewVector = Vector2.new(X, -Y)
		ZeroVector = Vector2.new(X1, 0)
		SubjectAnchorPoint = Vector2.new(X1, 1)
	elseif Position2 == PopoverSideModule.Bottom then
		NewVector = Vector2.new(X, Y)
		ZeroVector = Vector2.new(X1, 1)
		SubjectAnchorPoint = Vector2.new(X1, 0)
	elseif Position2 == PopoverSideModule.Left then
		NewVector = Vector2.new(-Y, X)
		ZeroVector = Vector2.new(0, X1)
		SubjectAnchorPoint = Vector2.new(1, X1)
	elseif Position2 == PopoverSideModule.Right then
		NewVector = Vector2.new(Y, X)
		ZeroVector = Vector2.new(1, X1)
		SubjectAnchorPoint = Vector2.new(0, X1)
	end
	local P3 = p2 or 0
	
	if P3 > 0 then
		local ScaledP = P3 * 2
		local ScaledP1 = P3 * 2
		local NewScaledP = nil
		local NewScaledP1 = nil
		
		if Position2 == PopoverSideModule.Top or Position2 == PopoverSideModule.Bottom then
			NewScaledP = ScaledP + X2
			NewScaledP1 = ScaledP1 + Y
		else
			NewScaledP = ScaledP + Y
			NewScaledP1 = ScaledP1 + X2
		end
		NewVector += Vector2.new(SubjectAnchorPoint.X * NewScaledP - P3, SubjectAnchorPoint.Y * NewScaledP1 - P3)
	end
	if p1 then
		NewVector = p1
		ZeroVector = Vector2.zero
	end
	return {
		targetAnchorPoint = ZeroVector,
		subjectAnchorPoint = SubjectAnchorPoint,
		offset = NewVector
	}
end