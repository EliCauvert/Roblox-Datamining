local dependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local roact = dependenciesModule.Roact
local llama = dependenciesModule.llama

return function(p0)
	-- upvalues: roact (ref), llama (ref)
	return function(p1)
		-- upvalues: roact (copy), p0 (ref), llama (copy)
		return function(p2)
			-- upvalues: roact (copy), p0 (copy), llama (copy), p1 (ref)
			local var1 = roact.Component:extend("Connected-" .. tostring(p2))
			
			function var1.render(p3)
				-- upvalues: roact (copy), p0 (copy), p2 (ref), llama (copy), p1 (copy)
				return roact.createElement(p0.Consumer, {
					render = function(p4)
						-- upvalues: roact (copy), p2 (copy), llama (copy), p3 (ref), p1 (copy)
						return roact.createElement(p2, llama.Dictionary.join(p3.props, p1(p4)))
					end
				})
			end
			
			return var1
		end
	end
end