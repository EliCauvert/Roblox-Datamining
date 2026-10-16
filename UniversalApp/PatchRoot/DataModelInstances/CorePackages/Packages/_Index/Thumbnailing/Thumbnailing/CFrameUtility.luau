local CFrameUtilityModule = {
	CalculateTargetCFrame = function(CF): CFrame --[[ Line: 9 ]]
		local UpVector = if math.abs(CF.LookVector.Y) > 0.9 then CF.UpVector else CF.LookVector
		
		return CFrame.lookAt(CF.Position, CF.Position + Vector3.new(UpVector.X, 0, UpVector.Z).Unit)
	end,
	AdjustTargetCFrameWithExtents = function(TargetCFrame, p1, p2) --[[ Line: 24 ]]
		return TargetCFrame + (TargetCFrame - TargetCFrame.Position) * ((p1 + p2) / 2)
	end
}

function CFrameUtilityModule.CalculateTargetCFrameWithExtents(CF, p1, p2) --[[ Line: 47 ]]
	-- upvalues: CFrameUtilityModule (copy)
	return CFrameUtilityModule.AdjustTargetCFrameWithExtents(CFrameUtilityModule.CalculateTargetCFrame(CF), p1, p2)
end

return CFrameUtilityModule