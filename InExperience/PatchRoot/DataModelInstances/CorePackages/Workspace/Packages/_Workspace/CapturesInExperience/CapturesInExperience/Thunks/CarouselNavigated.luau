local parent = script.Parent.Parent
local carouselIndexSelectedModule = require(parent.Actions.CarouselIndexSelected)
local constantsModule = require(parent.Constants)

return function(p0)
	-- upvalues: constantsModule (ref), carouselIndexSelectedModule (ref)
	return function(p1)
		-- upvalues: constantsModule (copy), p0 (ref), carouselIndexSelectedModule (copy)
		p1:dispatch(carouselIndexSelectedModule(math.clamp(p1:getState()[constantsModule.RoduxKey].Carousel.SelectedCaptureIndex + (if p0 == constantsModule.CarouselDirection.Left then -1 else 1), 1, #p1:getState()[constantsModule.RoduxKey].Captures)))
	end
end