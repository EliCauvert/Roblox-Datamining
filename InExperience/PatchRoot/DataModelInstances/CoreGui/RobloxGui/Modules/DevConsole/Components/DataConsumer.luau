local components = script.Parent.Parent.Components
local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local immutableModule = require(script.Parent.Parent.Immutable)
local dataContextModule = require(components.DataContext)

return function(p1, ...)
	-- upvalues: roactModule (ref), immutableModule (ref), dataContextModule (ref)
	if not p1 then
		error("Expected component to be passed to connection, got nil.")
	end
	local t = {}
	
	for i = 1, select("#", ...) do
		t[i] = select(i, ...)
	end
	local var1 = roactModule.Component:extend(string.format("Consumer(%s)_DependsOn_%s", tostring(p1), t[1]))
	
	function var4.init(p2)
		-- upvalues: t (ref)
		local t_1 = {}
		
		for i, v in pairs(t) do
			local var2 = p2.props.DevConsoleData[v]
			
			if var2 then
				t_1[v] = var2
				continue
			end
			error(string.format("%s %s", tostring(v), "could not be found. Make sure DataProvider is above this consumer"))
			
			return
		end
		p2:setState(t_1)
	end
	
	function var4.render(p3)
		-- upvalues: immutableModule (copy), roactModule (copy), p1 (ref)
		return roactModule.createElement(p1, immutableModule.JoinDictionaries(p3.props.componentProps, p3.state))
	end
	
	return function(p3)
		-- upvalues: roactModule (copy), dataContextModule (copy), var1 (ref)
		return roactModule.createElement(dataContextModule.Consumer, {
			render = function(p4)
				-- upvalues: roactModule (copy), var1 (copy), p3 (ref)
				return roactModule.createElement(var1, { componentProps = p3, DevConsoleData = p4 })
			end
		})
	end
end