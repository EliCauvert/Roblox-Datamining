local parent = script.Parent.Parent
local carouselIndexSelectedModule = require(parent.Actions.CarouselIndexSelected)
local constantsModule = require(parent.Constants)

return function(p0) --[[ line: 6 ]]
	-- upvalues: constantsModule (ref), carouselIndexSelectedModule (ref)
	return function(p1) --[[ line: 7 ]]
		-- upvalues: constantsModule (copy), p0 (ref), carouselIndexSelectedModule (copy)
		p1:dispatch(carouselIndexSelectedModule(math.clamp(p0, 1, #p1:getState()[constantsModule.RoduxKey].Captures)))
	end
end