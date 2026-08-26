local t = {
	CalculateTargetCFrame = function(p1)
		local var1 = if math.abs(p1.LookVector.Y) > 0.9 then p1.UpVector else p1.LookVector
		
		return CFrame.lookAt(p1.Position, p1.Position + Vector3.new(var1.X, 0, var1.Z).Unit)
	end,
	AdjustTargetCFrameWithExtents = function(p1, p2, p3)
		return p1 + (p1 - p1.Position) * ((p2 + p3) / 2)
	end
}

function t.CalculateTargetCFrameWithExtents(p1, p2, p3)
	-- upvalues: t (ref)
	return t.AdjustTargetCFrameWithExtents(t.CalculateTargetCFrame(p1), p2, p3)
end

return t