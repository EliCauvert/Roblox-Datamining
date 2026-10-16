local FlagsModule = require(script:FindFirstAncestor("Foundation").Utility.Flags)

return function(p1, p2, p3, p4, p5) --[[ Line: 7 | Named "calculateNumberInputValueFromPositions" ]]
	-- upvalues: FlagsModule (copy)
	return p1 + (if FlagsModule.FoundationNumberInputBeta then math.floor((p3 - p2) * (p5 or 1)) else p3 - p2) * p4
end