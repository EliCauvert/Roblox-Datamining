game:DefineFastInt("LuaAppBacktraceErrorReportPercentage", 5)
local RandomValue = math.random(1, 100)

return function(): boolean
	-- upvalues: RandomValue (copy)
	return RandomValue <= math.clamp(game:GetFastInt("LuaAppBacktraceErrorReportPercentage"), 0, 100)
end