local roactModule = require(script.Parent.Parent.Roact)
local appPolicyContextModule = require(script.Parent.AppPolicyContext)

return function()
	-- upvalues: roactModule (ref), appPolicyContextModule (ref)
	local policyProvider = roactModule.Component:extend("PolicyProvider")
	
	function policyProvider.init(p0, p1)
		assert(type(p1.policy) == "table", "Provider expects props.policy to be a table")
		p0.policy = {
			presentationPolicy = p1.policy,
			staticExternalPolicy = p1.policyData
		}
	end
	
	function policyProvider.render(p2)
		-- upvalues: roactModule (copy), appPolicyContextModule (copy)
		return roactModule.createElement(appPolicyContextModule.Provider, { value = p2.policy }, p2.props[roactModule.Children])
	end
	
	return policyProvider
end