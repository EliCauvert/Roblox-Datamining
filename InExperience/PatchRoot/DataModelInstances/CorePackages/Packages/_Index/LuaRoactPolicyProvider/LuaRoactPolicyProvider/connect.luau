local parent = script.Parent.Parent
local roactModule = require(parent.Roact)
local cryoModule = require(parent.Cryo)
local loggerModule = require(script.Parent.Logger)
local appPolicyContextModule = require(script.Parent.AppPolicyContext)

local function mergePolicies(p0, p1)
	-- upvalues: cryoModule (ref)
	local t = {}
	
	for i, v in ipairs(p1) do
		t = cryoModule.Dictionary.join(t, v(p0))
	end
	return t
end

return function(p2)
	-- upvalues: loggerModule (ref), roactModule (ref), mergePolicies (ref), cryoModule (ref), appPolicyContextModule (ref)
	assert(p2, "expected getPolicyImpl")
	
	return function(p3)
		-- upvalues: loggerModule (copy), roactModule (copy), mergePolicies (copy), p2 (ref), cryoModule (copy), appPolicyContextModule (copy)
		assert(type(p3) == "function", "connect expects mapper to be a function")
		
		return function(p4)
			-- upvalues: loggerModule (copy), roactModule (copy), mergePolicies (copy), p2 (copy), p3 (ref), cryoModule (copy), appPolicyContextModule (copy)
			local var6 = ("AppPolicy(%s)"):format(tostring(p4))
			local var7 = loggerModule:new(var6)
			var7:setContext({ prefix = string.format("%s: ", var6) })
			local formattedText = string.format("%s: Not a descendent of PolicyProvider", var6)
			local var9 = roactModule.PureComponent:extend(var6)
			var7:trace("Connected to component: {}", tostring(p4))
			
			function var9.init(p5, p6)
				-- upvalues: formattedText (ref), mergePolicies (copy), p2 (copy), var7 (ref)
				p5.policyContext = p6.policy
				assert(p5.policyContext, formattedText)
				
				function p5.setWithEmptyPolicy()
					-- upvalues: p5 (ref), mergePolicies (copy)
					p5.state = {
						policy = mergePolicies({}, p5.policyContext.presentationPolicy)
					}
				end
				
				if p5.policyContext.staticExternalPolicy then
					p5.state = {
						policy = mergePolicies(p5.policyContext.staticExternalPolicy, p5.policyContext.presentationPolicy)
					}
					
					return
				end
				local var10 = p2.read()
				
				if var10 then
					p5.state = {
						policy = mergePolicies(var10, p5.policyContext.presentationPolicy)
					}
				else
					p5.setWithEmptyPolicy()
					var7:trace("No app policy data available")
				end
				function p5.onPolicyChanged(p7)
					-- upvalues: p5 (ref), mergePolicies (copy)
					p5:setState({
						policy = mergePolicies(p7, p5.policyContext.presentationPolicy)
					})
				end
			end
			
			function var9.didMount(p8)
				-- upvalues: p2 (copy), var7 (ref)
				if p8.policyContext.staticExternalPolicy then
					return
				end
				p8.connection = p2.onPolicyChanged(function(p9)
					-- upvalues: var7 (copy), p8 (ref)
					var7:trace("Received policy update from MemStorageService")
					p8.onPolicyChanged(p9)
				end)
			end
			
			function var9.render(p10)
				-- upvalues: p3 (copy), cryoModule (copy), roactModule (copy), p4 (ref)
				return roactModule.createElement(p4, cryoModule.Dictionary.join(p10.props.innerProps, p3(p10.state.policy, p10.props.innerProps)))
			end
			
			function var9.willUnmount(p11)
				if p11.connection then
					p11.connection:Disconnect()
				end
				p11.onPolicyChange = nil
			end
			
			return function(p12)
				-- upvalues: roactModule (copy), appPolicyContextModule (copy), var9 (ref)
				return roactModule.createElement(appPolicyContextModule.Consumer, {
					render = function(p13)
						-- upvalues: roactModule (copy), var9 (copy), p12 (ref)
						return roactModule.createElement(var9, { innerProps = p12, policy = p13 })
					end
				})
			end
		end
	end
end