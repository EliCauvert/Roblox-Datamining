local components = script.Parent.Parent.Components
local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local immutableModule = require(script.Parent.Parent.Immutable)
local dataContextModule = require(components.DataContext)

return function(p0, ...) --[[ line: 8 ]]
	-- upvalues: roactModule (ref), immutableModule (ref), dataContextModule (ref)
	if not p0 then
		error("Expected component to be passed to connection, got nil.")
	end
	local t = {}
	
	for i = 1, select("#", ...) do
		t[i] = select(i, ...)
	end
	local var4 = roactModule.Component:extend(string.format("Consumer(%s)_DependsOn_%s", tostring(p0), t[1]))
	
	function var4.init(p1) --[[ line: 21 ]]
		-- upvalues: t (ref)
		local t_1 = {}
		
		for i, v in pairs(t) do
			local var6 = p1.props.DevConsoleData[v]
			
			if var6 then
				t_1[v] = var6
				continue
			end
			error(string.format("%s %s", tostring(v), "could not be found. Make sure DataProvider is above this consumer"))
			
			return
		end
		p1:setState(t_1)
	end
	
	function var4.render(p2) --[[ line: 40 ]]
		-- upvalues: immutableModule (copy), roactModule (copy), p0 (ref)
		return roactModule.createElement(p0, immutableModule.JoinDictionaries(p2.props.componentProps, p2.state))
	end
	
	return function(p3) --[[ line: 45 | named "DataConsumerWrapper" ]]
		-- upvalues: roactModule (copy), dataContextModule (copy), var4 (ref)
		return roactModule.createElement(dataContextModule.Consumer, {
			render = function(p4) --[[ line: 47 ]]
				-- upvalues: roactModule (copy), var4 (copy), p3 (ref)
				return roactModule.createElement(var4, { componentProps = p3, DevConsoleData = p4 })
			end
		})
	end
end