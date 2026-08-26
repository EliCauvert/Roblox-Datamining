local roactModule = require(script.Parent.Parent.Roact)
local appPolicyContextModule = require(script.Parent.AppPolicyContext)

return function()
	-- upvalues: roactModule (ref), appPolicyContextModule (ref)
	local policyProvider = roactModule.Component:extend("PolicyProvider")
	
	function policyProvider.init(p1, p2)
		assert(type(p2.policy) == "table", "Provider expects props.policy to be a table")
		p1.policy = {
			presentationPolicy = p2.policy,
			staticExternalPolicy = p2.policyData
		}
	end
	
	function policyProvider.render(p1)
		-- upvalues: roactModule (copy), appPolicyContextModule (copy)
		return roactModule.createElement(appPolicyContextModule.Provider, { value = p1.policy }, p1.props[roactModule.Children])
	end
	
	return policyProvider
end