local parent = script.Parent.Parent
local roactModule = require(parent.Roact)
local cryoModule = require(parent.Cryo)
local loggerModule = require(script.Parent.Logger)
local appPolicyContextModule = require(script.Parent.AppPolicyContext)

local function mergePolicies(p1, p2)
	-- upvalues: cryoModule (ref)
	local t = {}
	
	for i, v in ipairs(p2) do
		t = cryoModule.Dictionary.join(t, v(p1))
	end
	return t
end

return function(p3)
	-- upvalues: loggerModule (ref), roactModule (ref), mergePolicies (ref), cryoModule (ref), appPolicyContextModule (ref)
	assert(p3, "expected getPolicyImpl")
	
	return function(p4)
		-- upvalues: loggerModule (copy), roactModule (copy), mergePolicies (copy), p3 (ref), cryoModule (copy), appPolicyContextModule (copy)
		assert(type(p4) == "function", "connect expects mapper to be a function")
		
		return function(p5)
			-- upvalues: loggerModule (copy), roactModule (copy), mergePolicies (copy), p3 (copy), p4 (ref), cryoModule (copy), appPolicyContextModule (copy)
			local var1 = ("AppPolicy(%s)"):format(tostring(p5))
			local var2 = loggerModule:new(var1)
			var2:setContext({ prefix = string.format("%s: ", var1) })
			local formattedText = string.format("%s: Not a descendent of PolicyProvider", var1)
			local var3 = roactModule.PureComponent:extend(var1)
			var2:trace("Connected to component: {}", tostring(p5))
			
			function var9.init(p6, p7)
				-- upvalues: formattedText (ref), mergePolicies (copy), p3 (copy), var2 (ref)
				p6.policyContext = p7.policy
				assert(p6.policyContext, formattedText)
				
				function p5.setWithEmptyPolicy()
					-- upvalues: p6 (ref), mergePolicies (copy)
					p6.state = {
						policy = mergePolicies({}, p6.policyContext.presentationPolicy)
					}
				end
				
				if p6.policyContext.staticExternalPolicy then
					p6.state = {
						policy = mergePolicies(p6.policyContext.staticExternalPolicy, p6.policyContext.presentationPolicy)
					}
					
					return
				end
				local var4 = p3.read()
				
				if var4 then
					p6.state = {
						policy = mergePolicies(var4, p6.policyContext.presentationPolicy)
					}
				else
					p6.setWithEmptyPolicy()
					var2:trace("No app policy data available")
				end
				function p5.onPolicyChanged(p8)
					-- upvalues: p6 (ref), mergePolicies (copy)
					p6:setState({
						policy = mergePolicies(p8, p6.policyContext.presentationPolicy)
					})
				end
			end
			
			function var9.didMount(p6)
				-- upvalues: p3 (copy), var2 (ref)
				if p6.policyContext.staticExternalPolicy then
					return
				end
				p6.connection = p3.onPolicyChanged(function(p7)
					-- upvalues: var2 (copy), p6 (ref)
					var2:trace("Received policy update from MemStorageService")
					p6.onPolicyChanged(p7)
				end)
			end
			
			function var9.render(p6)
				-- upvalues: p4 (copy), cryoModule (copy), roactModule (copy), p5 (ref)
				return roactModule.createElement(p5, cryoModule.Dictionary.join(p6.props.innerProps, p4(p6.state.policy, p6.props.innerProps)))
			end
			
			function var9.willUnmount(p6)
				if p6.connection then
					p6.connection:Disconnect()
				end
				p6.onPolicyChange = nil
			end
			
			return function(p6)
				-- upvalues: roactModule (copy), appPolicyContextModule (copy), var3 (ref)
				return roactModule.createElement(appPolicyContextModule.Consumer, {
					render = function(p7)
						-- upvalues: roactModule (copy), var3 (copy), p6 (ref)
						return roactModule.createElement(var3, { innerProps = p6, policy = p7 })
					end
				})
			end
		end
	end
end