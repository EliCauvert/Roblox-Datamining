local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ImmutableModule = require(script.Parent.Parent.Immutable)
local DataContextModule = require(script.Parent.Parent.Components.DataContext)

return function(p1, ...)
	-- upvalues: RoactModule (copy), ImmutableModule (copy), DataContextModule (copy)
	if not p1 then
		error("Expected component to be passed to connection, got nil.")
	end
	local t = {}
	
	for i = 1, select("#", ...) do
		t[i] = select(i, ...)
	end
	local ExtendResult = RoactModule.Component:extend((string.format("Consumer(%s)_DependsOn_%s", tostring(p1), t[1])))
	
	function ExtendResult.init(p2)
		-- upvalues: t (copy)
		local DevConsoles = {}
		
		for _, value in pairs(t) do
			local DevConsole = p2.props.DevConsoleData[value]
			
			if not DevConsole then
				error((string.format("%s %s", tostring(value), "could not be found. Make sure DataProvider is above this consumer")))
				
				return
			end
			DevConsoles[value] = DevConsole
		end
		p2:setState(DevConsoles)
	end
	
	function ExtendResult.render(p3)
		-- upvalues: ImmutableModule (upval), RoactModule (upval), p1 (copy)
		return RoactModule.createElement(p1, (ImmutableModule.JoinDictionaries(p3.props.componentProps, p3.state)))
	end
	
	return function(ComponentProps)
		-- upvalues: RoactModule (upval), DataContextModule (upval), ExtendResult (copy)
		return RoactModule.createElement(DataContextModule.Consumer, {
			render = function(DevConsoleData)
				-- upvalues: RoactModule (upval), ExtendResult (upval), ComponentProps (copy)
				return RoactModule.createElement(ExtendResult, {
					componentProps = ComponentProps,
					DevConsoleData = DevConsoleData
				})
			end
		})
	end
end