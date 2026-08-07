local parent = script.Parent
local roactModule = require(parent.Parent.Parent.Parent.Roact)
local styleConsumerModule = require(parent.StyleConsumer)

return function(p0) --[[ line: 9 ]]
	-- upvalues: roactModule (ref), styleConsumerModule (ref)
	assert(type(p0) == "function", "Expect renderCallback to be a function.")
	
	return roactModule.createElement(styleConsumerModule, {
		render = function(p1) --[[ line: 12 ]]
			-- upvalues: p0 (ref)
			return p0(p1.derivedValues.textSizeOffset)
		end
	})
end