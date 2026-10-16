local ConstantsModule = require(script.Parent.Parent.Constants)

return function(Vector): number --[[ Line: 6 | Named "GetSegmentIndexFromPosition" ]]
	-- upvalues: ConstantsModule (copy)
	local Degrees = math.deg((math.atan2(Vector.X, Vector.Y)))
	
	if Degrees < 0 then
		Degrees += 360
	end
	local v1 = 360 / ConstantsModule.EmotesPerPage
	local Ceiled = math.ceil(math.ceil(math.fmod(Degrees + math.ceil(v1 / 2), 360) / v1) + (ConstantsModule.SegmentsStartRotation + 90) / v1)
	
	if ConstantsModule.EmotesPerPage < Ceiled then
		Ceiled -= ConstantsModule.EmotesPerPage
		
		return Ceiled
	end
	if Ceiled < 1 then
		Ceiled += ConstantsModule.EmotesPerPage
	end
	return Ceiled
end