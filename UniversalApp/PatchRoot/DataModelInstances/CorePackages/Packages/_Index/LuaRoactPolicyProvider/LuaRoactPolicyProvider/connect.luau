local Parent = script.Parent.Parent
local RoactModule = require(Parent.Roact)
local CryoModule = require(Parent.Cryo)
local LoggerModule = require(script.Parent.Logger)
local AppPolicyContextModule = require(script.Parent.AppPolicyContext)

local function mergePolicies(ReadResult, PresentationPolicy)
	-- upvalues: CryoModule (copy)
	local JoinResult = {}
	
	for _, value in ipairs(PresentationPolicy) do
		JoinResult = CryoModule.Dictionary.join(JoinResult, value(ReadResult))
	end
	return JoinResult
end

return function(p1)
	-- upvalues: LoggerModule (copy), RoactModule (copy), mergePolicies (copy), CryoModule (copy), AppPolicyContextModule (copy)
	assert(p1, "expected getPolicyImpl")
	
	return function(Callback)
		-- upvalues: LoggerModule (upval), RoactModule (upval), mergePolicies (upval), p1 (copy), CryoModule (upval), AppPolicyContextModule (upval)
		assert(type(Callback) == "function", "connect expects mapper to be a function")
		
		return function(p2)
			-- upvalues: LoggerModule (upval), RoactModule (upval), mergePolicies (upval), p1 (upval), Callback (copy), CryoModule (upval), AppPolicyContextModule (upval)
			local AppPolicyName: string = ("AppPolicy(%s)"):format((tostring(p2)))
			local NewResult = LoggerModule:new(AppPolicyName)
			NewResult:setContext({ prefix = string.format("%s: ", AppPolicyName) })
			local Formatted = string.format("%s: Not a descendent of PolicyProvider", AppPolicyName)
			local ExtendResult = RoactModule.PureComponent:extend(AppPolicyName)
			NewResult:trace("Connected to component: {}", (tostring(p2)))
			
			function ExtendResult.init(p3, p4)
				-- upvalues: Formatted (copy), mergePolicies (upval), p1 (upval), NewResult (copy)
				p3.policyContext = p4.policy
				assert(p3.policyContext, Formatted)
				
				function p3.setWithEmptyPolicy()
					-- upvalues: p3 (copy), mergePolicies (upval)
					p3.state = {
						policy = mergePolicies({}, p3.policyContext.presentationPolicy)
					}
				end
				
				if p3.policyContext.staticExternalPolicy then
					p3.state = {
						policy = mergePolicies(p3.policyContext.staticExternalPolicy, p3.policyContext.presentationPolicy)
					}
					
					return
				end
				local ReadResult = p1.read()
				
				if ReadResult then
					p3.state = {
						policy = mergePolicies(ReadResult, p3.policyContext.presentationPolicy)
					}
				else
					p3.setWithEmptyPolicy()
					NewResult:trace("No app policy data available")
				end
				function p3.onPolicyChanged(p5)
					-- upvalues: p3 (copy), mergePolicies (upval)
					p3:setState({
						policy = mergePolicies(p5, p3.policyContext.presentationPolicy)
					})
				end
			end
			
			function ExtendResult.didMount(p3)
				-- upvalues: p1 (upval), NewResult (copy)
				if not p3.policyContext.staticExternalPolicy then
					p3.connection = p1.onPolicyChanged(function(p4)
						-- upvalues: NewResult (upval), p3 (copy)
						NewResult:trace("Received policy update from MemStorageService")
						p3.onPolicyChanged(p4)
					end)
					
					return
				end
			end
			
			function ExtendResult.render(p3)
				-- upvalues: Callback (upval), CryoModule (upval), RoactModule (upval), p2 (copy)
				return RoactModule.createElement(p2, (CryoModule.Dictionary.join(p3.props.innerProps, (Callback(p3.state.policy, p3.props.innerProps)))))
			end
			
			function ExtendResult.willUnmount(p3)
				if p3.connection then
					p3.connection:Disconnect()
				end
				p3.onPolicyChange = nil
			end
			
			return function(InnerProps)
				-- upvalues: RoactModule (upval), AppPolicyContextModule (upval), ExtendResult (copy)
				return RoactModule.createElement(AppPolicyContextModule.Consumer, {
					render = function(Policy)
						-- upvalues: RoactModule (upval), ExtendResult (upval), InnerProps (copy)
						return RoactModule.createElement(ExtendResult, { innerProps = InnerProps, policy = Policy })
					end
				})
			end
		end
	end
end