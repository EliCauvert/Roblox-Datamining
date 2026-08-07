local parent = script.Parent
local parent_1 = parent.Parent.Parent
local roactModule = require(parent_1.Parent.Roact)
local styleConsumerModule = require(parent.StyleConsumer)
local _ = require(parent_1.App.Style.StyleTypes)

return function(p0) --[[ line: 9 ]]
	-- upvalues: roactModule (ref), styleConsumerModule (ref)
	assert(type(p0) == "function", "Expect renderCallback to be a function.")
	
	return roactModule.createElement(styleConsumerModule, {
		render = function(p1) --[[ line: 12 ]]
			-- upvalues: p0 (ref)
			return p0(p1.style)
		end
	})
end