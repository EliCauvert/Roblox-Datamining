local Parent = script.Parent.Parent
local RoactModule = require(Parent.Roact)
local Immutable = require(Parent.AppCommonLib).Immutable
local Symbol = require(Parent.AppCommonLib).Symbol
local RoactServicesContextModule = require(script.Parent.RoactServicesContext)
local _ = require(script.Parent.RoactServicesTypes)
local ServiceProvider = RoactModule.PureComponent:extend("ServiceProvider")

function ServiceProvider.init(p1, p2)
	local Services = {}
	
	if p2 and p2.services then
		assert(p2.services, "Expected some services to connect, found none")
		assert(type(p2.services) == "table", "Expected the provided services to be a map")
		
		for i, service in pairs(p2.services) do
			if type(i) == "table" then
				i.set(Services, service)
			end
		end
	end
	p1:setState({ services = Services })
end

function ServiceProvider.render(p3)
	-- upvalues: RoactModule (copy), RoactServicesContextModule (copy)
	return RoactModule.createElement(RoactServicesContextModule.Provider, { value = p3.state.services }, RoactModule.oneChild(p3.props[RoactModule.Children]))
end

return {
	ServiceProvider = ServiceProvider,
	createService = function(p3)
		-- upvalues: Symbol (copy)
		assert(type(p3) == "string", "Expected serviceName to be a string")
		local NamedResult = Symbol.named(p3)
		
		return {
			get = function(Services)
				-- upvalues: NamedResult (copy)
				return if Services then Services[NamedResult] else nil
			end,
			set = function(Services, p4)
				-- upvalues: NamedResult (copy)
				Services[NamedResult] = p4
			end
		}
	end,
	connect = function(p3)
		-- upvalues: RoactModule (copy), Immutable (copy), RoactServicesContextModule (copy)
		assert(p3 ~= nil, "Expected some services to connect, found none.")
		
		return function(p4)
			-- upvalues: RoactModule (upval), p3 (copy), Immutable (upval), RoactServicesContextModule (upval)
			assert(p4 ~= nil, "Expected a component to connect, found none.")
			local GetResults = {}
			local ExtendResult = RoactModule.PureComponent:extend((("Services(%s)"):format((tostring(p4)))))
			
			function ExtendResult:init(p5)
				-- upvalues: p3 (upval), GetResults (copy)
				for i, value in pairs(p3) do
					assert(type(i) == "string", string.format("serviceMap must be indexed by strings, not %s", (type(i))))
					assert(type(value) == "table", "serviceMap must have a service created by createService()")
					assert(type(value.get) == "function", "serviceMap must have a service created by createService()")
					assert(p5.innerProps[i] == nil, "Naming conflict with prop : " .. i)
					GetResults[i] = value.get(p5.services)
				end
			end
			
			function ExtendResult.render(p6)
				-- upvalues: Immutable (upval), GetResults (copy), RoactModule (upval), p4 (copy)
				return RoactModule.createElement(p4, (Immutable.JoinDictionaries(p6.props.innerProps, GetResults)))
			end
			
			local ConnectionWrapper = RoactModule.PureComponent:extend("ConnectionWrapper")
			
			function ConnectionWrapper.render(p6)
				-- upvalues: RoactModule (upval), RoactServicesContextModule (upval), ExtendResult (copy)
				return RoactModule.createElement(RoactServicesContextModule.Consumer, {
					render = function(Services)
						-- upvalues: RoactModule (upval), ExtendResult (upval), p6 (copy)
						return RoactModule.createElement(ExtendResult, { innerProps = p6.props, services = Services })
					end
				})
			end
			
			return ConnectionWrapper
		end
	end
}