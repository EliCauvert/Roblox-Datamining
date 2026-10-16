local Parent = script.Parent.Parent
local PolicyProviderModule = require(Parent.PolicyProvider)
local Logger = PolicyProviderModule.Logger
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local _ = require(script.Parent.PolicyTypes)

local function mergePolicies(ReadResult, PresentationPolicy) --[[ Line: 15 ]]
	-- upvalues: CryoModule (copy)
	local JoinResult = {}
	
	for _, value in ipairs(PresentationPolicy) do
		JoinResult = CryoModule.Dictionary.join(JoinResult, value(ReadResult))
	end
	return JoinResult
end

return function(p1) --[[ Line: 25 ]]
	-- upvalues: ReactModule (copy), PolicyProviderModule (copy), mergePolicies (copy), Logger (copy)
	assert(p1, "expected getPolicyImpl")
	
	return function(Callback) --[[ Line: 28 | Named "useAppPolicy" ]]
		-- upvalues: ReactModule (upval), PolicyProviderModule (upval), mergePolicies (upval), p1 (copy), Logger (upval)
		local UseContextResult = ReactModule.useContext(PolicyProviderModule.AppPolicyContext)
		assert(UseContextResult, "Not a descendent of PolicyProvider")
		local UseStateResult, UseStateResult2 = ReactModule.useState(function() --[[ Line: 32 | Named "getInitialPolicy" ]]
			-- upvalues: UseContextResult (copy), mergePolicies (upval), p1 (upval), Logger (upval)
			if UseContextResult.staticExternalPolicy then
				return (mergePolicies(UseContextResult.staticExternalPolicy, UseContextResult.presentationPolicy))
			end
			local ReadResult = p1.read()
			
			if ReadResult then
				return (mergePolicies(ReadResult, UseContextResult.presentationPolicy))
			else
				Logger:trace("No app policy data available")
				
				return (mergePolicies({}, UseContextResult.presentationPolicy))
			end
		end)
		ReactModule.useEffect(function() --[[ Line: 50 ]]
			-- upvalues: UseContextResult (copy), p1 (upval), Logger (upval), UseStateResult2 (copy), mergePolicies (upval)
			local OnPolicyChangedResult = if UseContextResult.staticExternalPolicy then nil else p1.onPolicyChanged(function(p2) --[[ Line: 53 ]]
				-- upvalues: Logger (upval), UseStateResult2 (upval), mergePolicies (upval), UseContextResult (upval)
				Logger:trace("Received policy update")
				UseStateResult2((mergePolicies(p2, UseContextResult.presentationPolicy)))
			end)
			
			return function() --[[ Line: 59 ]]
				-- upvalues: OnPolicyChangedResult (ref)
				if OnPolicyChangedResult then
					OnPolicyChangedResult:Disconnect()
				end
			end
		end, { UseContextResult })
		
		return Callback(UseStateResult)
	end
end