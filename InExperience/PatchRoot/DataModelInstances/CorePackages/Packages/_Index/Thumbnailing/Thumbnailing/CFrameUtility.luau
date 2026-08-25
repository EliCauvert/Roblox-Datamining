local t = {
	CalculateTargetCFrame = function(p0)
		local var1 = if math.abs(p0.LookVector.Y) > 0.9 then p0.UpVector else p0.LookVector
		
		return CFrame.lookAt(p0.Position, p0.Position + Vector3.new(var1.X, 0, var1.Z).Unit)
	end,
	AdjustTargetCFrameWithExtents = function(p1, p2, p3)
		return p1 + (p1 - p1.Position) * ((p2 + p3) / 2)
	end
}

function t.CalculateTargetCFrameWithExtents(p4, p5, p6)
	-- upvalues: t (ref)
	return t.AdjustTargetCFrameWithExtents(t.CalculateTargetCFrame(p4), p5, p6)
end

return t