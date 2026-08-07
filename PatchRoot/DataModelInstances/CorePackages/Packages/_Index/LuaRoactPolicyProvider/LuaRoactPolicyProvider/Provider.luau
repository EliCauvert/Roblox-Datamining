-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:43 2026 Pacific Standard Time.

local roactModule = require(script.Parent.Parent.Roact)
local appPolicyContextModule = require(script.Parent.AppPolicyContext)

return function() --[[ line: 6 ]]
	-- upvalues: roactModule (ref), appPolicyContextModule (ref)
	local policyProvider = roactModule.Component:extend("PolicyProvider")
	
	function policyProvider.init(p0, p1) --[[ line: 9 ]]
		assert(type(p1.policy) == "table", "Provider expects props.policy to be a table")
		p0.policy = {
			presentationPolicy = p1.policy,
			staticExternalPolicy = p1.policyData
		}
	end
	
	function policyProvider.render(p2) --[[ line: 18 ]]
		-- upvalues: roactModule (copy), appPolicyContextModule (copy)
		return roactModule.createElement(appPolicyContextModule.Provider, { value = p2.policy }, p2.props[roactModule.Children])
	end
	
	return policyProvider
end