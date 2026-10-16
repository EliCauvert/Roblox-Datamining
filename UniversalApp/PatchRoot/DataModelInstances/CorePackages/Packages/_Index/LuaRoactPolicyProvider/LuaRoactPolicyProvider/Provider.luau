local RoactModule = require(script.Parent.Parent.Roact)
local AppPolicyContextModule = require(script.Parent.AppPolicyContext)

return function() --[[ Line: 6 ]]
	-- upvalues: RoactModule (copy), AppPolicyContextModule (copy)
	local PolicyProvider = RoactModule.Component:extend("PolicyProvider")
	
	function PolicyProvider.init(p1, p2) --[[ Line: 9 ]]
		assert(type(p2.policy) == "table", "Provider expects props.policy to be a table")
		p1.policy = {
			presentationPolicy = p2.policy,
			staticExternalPolicy = p2.policyData
		}
	end
	
	function PolicyProvider.render(p1) --[[ Line: 18 ]]
		-- upvalues: RoactModule (upval), AppPolicyContextModule (upval)
		return RoactModule.createElement(AppPolicyContextModule.Provider, { value = p1.policy }, p1.props[RoactModule.Children])
	end
	
	return PolicyProvider
end