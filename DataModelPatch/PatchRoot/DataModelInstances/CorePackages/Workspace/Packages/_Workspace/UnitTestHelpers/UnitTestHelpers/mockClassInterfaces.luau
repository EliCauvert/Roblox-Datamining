local Jest = require(script.Parent.Parent.JestGlobals).jest

return {
	new = function(p1, p2)
		-- upvalues: Jest (copy)
		local MockService = {}
		
		for i, value in p1.new() do
			if type(value) == "function" then
				MockService[i] = Jest.fn()
			else
				MockService[i] = value
			end
		end
		setmetatable(MockService, {
			__tostring = function(): string
				-- upvalues: p2 (copy)
				return string.format("Service(%s)", p2)
			end
		})
		
		return { mockService = MockService }
	end
}