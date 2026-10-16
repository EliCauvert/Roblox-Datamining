local Parent = script.Parent
local RoactModule = require(Parent.Parent.Parent.Parent.Roact)
local StyleConsumerModule = require(Parent.StyleConsumer)

return function(Callback) --[[ Line: 9 ]]
	-- upvalues: RoactModule (copy), StyleConsumerModule (copy)
	assert(type(Callback) == "function", "Expect renderCallback to be a function.")
	
	return RoactModule.createElement(StyleConsumerModule, {
		render = function(p1) --[[ Line: 12 ]]
			-- upvalues: Callback (copy)
			return Callback(p1.derivedValues.textSizeOffset)
		end
	})
end