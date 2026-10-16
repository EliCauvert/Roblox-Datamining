local Parent = script.Parent.Parent
local CarouselIndexSelectedModule = require(Parent.Actions.CarouselIndexSelected)
local ConstantsModule = require(Parent.Constants)

return function(Left) --[[ Line: 6 ]]
	-- upvalues: ConstantsModule (copy), CarouselIndexSelectedModule (copy)
	return function(p1) --[[ Line: 7 ]]
		-- upvalues: ConstantsModule (upval), Left (copy), CarouselIndexSelectedModule (upval)
		p1:dispatch(CarouselIndexSelectedModule((math.clamp(p1:getState()[ConstantsModule.RoduxKey].Carousel.SelectedCaptureIndex + (if Left == ConstantsModule.CarouselDirection.Left then -1 else 1), 1, #p1:getState()[ConstantsModule.RoduxKey].Captures))))
	end
end