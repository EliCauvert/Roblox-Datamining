local constantsModule = require(script.Parent.Parent.Constants)

return function(p0) --[[ line: 6 | named "GetSegmentIndexFromPosition" ]]
	-- upvalues: constantsModule (ref)
	local degrees = math.deg(math.atan2(p0.X, p0.Y))
	
	if degrees < 0 then
		degrees += 360
	end
	local var2 = 360 / constantsModule.EmotesPerPage
	local ceiled = math.ceil(math.ceil(math.fmod(degrees + math.ceil(var2 / 2), 360) / var2) + (constantsModule.SegmentsStartRotation + 90) / var2)
	
	if constantsModule.EmotesPerPage < ceiled then
		ceiled -= constantsModule.EmotesPerPage
		
		return ceiled
	elseif ceiled < 1 then
		ceiled += constantsModule.EmotesPerPage
	end
	return ceiled
end