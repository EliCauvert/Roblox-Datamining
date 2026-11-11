local Parent = script.Parent.Parent
local CarouselIndexSelectedModule = require(Parent.Actions.CarouselIndexSelected)
local ConstantsModule = require(Parent.Constants)

return function(Value)
	-- upvalues: ConstantsModule (copy), CarouselIndexSelectedModule (copy)
	return function(p1)
		-- upvalues: ConstantsModule (upval), Value (copy), CarouselIndexSelectedModule (upval)
		p1:dispatch(CarouselIndexSelectedModule((math.clamp(Value, 1, #p1:getState()[ConstantsModule.RoduxKey].Captures))))
	end
end