local dependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local roact = dependenciesModule.Roact
local llama = dependenciesModule.llama

return function(p1)
	-- upvalues: roact (ref), llama (ref)
	return function(p2)
		-- upvalues: roact (copy), p1 (ref), llama (copy)
		return function(p3)
			-- upvalues: roact (copy), p1 (copy), llama (copy), p2 (ref)
			local var1 = roact.Component:extend("Connected-" .. tostring(p3))
			
			function var1.render(p4)
				-- upvalues: roact (copy), p1 (copy), p3 (ref), llama (copy), p2 (copy)
				return roact.createElement(p1.Consumer, {
					render = function(p5)
						-- upvalues: roact (copy), p3 (copy), llama (copy), p4 (ref), p2 (copy)
						return roact.createElement(p3, llama.Dictionary.join(p4.props, p2(p5)))
					end
				})
			end
			
			return var1
		end
	end
end