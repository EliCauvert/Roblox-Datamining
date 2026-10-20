local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local RoactModule = require(Parent1.Parent.Roact)
local StyleConsumerModule = require(Parent.StyleConsumer)
local _ = require(Parent1.App.Style.StyleTypes)

return function(Callback)
	-- upvalues: RoactModule (copy), StyleConsumerModule (copy)
	assert(type(Callback) == "function", "Expect renderCallback to be a function.")
	
	return RoactModule.createElement(StyleConsumerModule, {
		render = function(p1)
			-- upvalues: Callback (copy)
			return Callback(p1.style)
		end
	})
end