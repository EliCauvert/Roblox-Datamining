local parent = script.Parent
local roactModule = require(parent.Parent.Parent.Parent.Roact)
local styleConsumerModule = require(parent.StyleConsumer)

return function(p1)
	-- upvalues: roactModule (ref), styleConsumerModule (ref)
	assert(type(p1) == "function", "Expect renderCallback to be a function.")
	
	return roactModule.createElement(styleConsumerModule, {
		render = function(p2)
			-- upvalues: p1 (ref)
			return p1(p2.derivedValues.textSizeOffset)
		end
	})
end