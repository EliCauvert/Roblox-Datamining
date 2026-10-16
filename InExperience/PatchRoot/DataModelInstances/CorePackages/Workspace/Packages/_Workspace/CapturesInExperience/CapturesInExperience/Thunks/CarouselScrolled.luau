local Parent = script.Parent.Parent
local CarouselIndexSelectedModule = require(Parent.Actions.CarouselIndexSelected)
local ConstantsModule = require(Parent.Constants)

return function(Value) --[[ Line: 6 ]]
	-- upvalues: ConstantsModule (copy), CarouselIndexSelectedModule (copy)
	return function(p1) --[[ Line: 7 ]]
		-- upvalues: ConstantsModule (upval), Value (copy), CarouselIndexSelectedModule (upval)
		p1:dispatch(CarouselIndexSelectedModule((math.clamp(Value, 1, #p1:getState()[ConstantsModule.RoduxKey].Captures))))
	end
end