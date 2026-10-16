local DependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local Roact = DependenciesModule.Roact
local Llama = DependenciesModule.llama

return function(p1) --[[ Line: 6 ]]
	-- upvalues: Roact (copy), Llama (copy)
	return function(Callback) --[[ Line: 7 ]]
		-- upvalues: Roact (upval), p1 (copy), Llama (upval)
		return function(p2) --[[ Line: 8 ]]
			-- upvalues: Roact (upval), p1 (upval), Llama (upval), Callback (copy)
			local ExtendResult = Roact.Component:extend("Connected-" .. tostring(p2))
			
			function ExtendResult.render(p3) --[[ Line: 11 ]]
				-- upvalues: Roact (upval), p1 (upval), p2 (copy), Llama (upval), Callback (upval)
				return Roact.createElement(p1.Consumer, {
					render = function(p4) --[[ Line: 13 ]]
						-- upvalues: Roact (upval), p2 (upval), Llama (upval), p3 (copy), Callback (upval)
						return Roact.createElement(p2, Llama.Dictionary.join(p3.props, Callback(p4)))
					end
				})
			end
			
			return ExtendResult
		end
	end
end