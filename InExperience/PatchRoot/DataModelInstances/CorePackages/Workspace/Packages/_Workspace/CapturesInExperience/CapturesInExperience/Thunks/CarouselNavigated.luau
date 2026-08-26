local parent = script.Parent.Parent
local carouselIndexSelectedModule = require(parent.Actions.CarouselIndexSelected)
local constantsModule = require(parent.Constants)

return function(p1)
	-- upvalues: constantsModule (ref), carouselIndexSelectedModule (ref)
	return function(p2)
		-- upvalues: constantsModule (copy), p1 (ref), carouselIndexSelectedModule (copy)
		p2:dispatch(carouselIndexSelectedModule(math.clamp(p2:getState()[constantsModule.RoduxKey].Carousel.SelectedCaptureIndex + (if p1 == constantsModule.CarouselDirection.Left then -1 else 1), 1, #p2:getState()[constantsModule.RoduxKey].Captures)))
	end
end