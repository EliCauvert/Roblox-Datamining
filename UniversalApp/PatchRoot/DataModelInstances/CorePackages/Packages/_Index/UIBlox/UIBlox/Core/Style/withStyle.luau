local parent = script.Parent
local parent_1 = parent.Parent.Parent
local roactModule = require(parent_1.Parent.Roact)
local styleConsumerModule = require(parent.StyleConsumer)
local _ = require(parent_1.App.Style.StyleTypes)

return function(p1)
	-- upvalues: roactModule (ref), styleConsumerModule (ref)
	assert(type(p1) == "function", "Expect renderCallback to be a function.")
	
	return roactModule.createElement(styleConsumerModule, {
		render = function(p2)
			-- upvalues: p1 (ref)
			return p1(p2.style)
		end
	})
end