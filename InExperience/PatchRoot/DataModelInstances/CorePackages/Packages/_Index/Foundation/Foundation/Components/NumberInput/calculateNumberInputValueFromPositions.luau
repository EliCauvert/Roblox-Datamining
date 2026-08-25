local flagsModule = require(script:FindFirstAncestor("Foundation").Utility.Flags)

return function(p0, p1, p2, p3, p4)
	-- upvalues: flagsModule (ref)
	return p0 + (if flagsModule.FoundationNumberInputBeta then math.floor((p2 - p1) * (p4 or 1)) else p2 - p1) * p3
end