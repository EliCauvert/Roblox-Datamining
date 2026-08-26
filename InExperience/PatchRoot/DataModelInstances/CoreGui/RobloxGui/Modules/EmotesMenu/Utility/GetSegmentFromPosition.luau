local constantsModule = require(script.Parent.Parent.Constants)

return function(p1)
	-- upvalues: constantsModule (ref)
	local degrees = math.deg(math.atan2(p1.X, p1.Y))
	
	if degrees < 0 then
		degrees += 360
	end
	local var1 = 360 / constantsModule.EmotesPerPage
	local ceiled = math.ceil(math.ceil(math.fmod(degrees + math.ceil(var1 / 2), 360) / var1) + (constantsModule.SegmentsStartRotation + 90) / var1)
	
	if constantsModule.EmotesPerPage < ceiled then
		ceiled -= constantsModule.EmotesPerPage
		
		return ceiled
	elseif ceiled < 1 then
		ceiled += constantsModule.EmotesPerPage
	end
	return ceiled
end