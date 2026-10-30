local Parent = script.Parent.Parent
local PolicyProviderModule = require(Parent.PolicyProvider)
local Logger = PolicyProviderModule.Logger
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local _ = require(script.Parent.PolicyTypes)
local UniversalAppPolicySkipUnchangedPolicy = game:DefineFastFlag("UniversalAppPolicySkipUnchangedPolicy", false)

local function mapsToSameValues(Callback, Current, Current1): boolean
	local Packed = table.pack(Callback(Current))
	local Packed1 = table.pack(Callback(Current1))
	
	if Packed.n ~= Packed1.n then
		return false
	end
	for i = 1, Packed.n do
		if Packed[i] ~= Packed1[i] then
			return false
		end
	end
	return true
end

local function mergePolicies(ReadResult, PresentationPolicy)
	-- upvalues: CryoModule (copy)
	local JoinResult = {}
	
	for _, value in ipairs(PresentationPolicy) do
		JoinResult = CryoModule.Dictionary.join(JoinResult, value(ReadResult))
	end
	return JoinResult
end

return function(p1)
	-- upvalues: ReactModule (copy), PolicyProviderModule (copy), mergePolicies (copy), Logger (copy), UniversalAppPolicySkipUnchangedPolicy (copy), mapsToSameValues (copy)
	assert(p1, "expected getPolicyImpl")
	
	return function(Callback)
		-- upvalues: ReactModule (upval), PolicyProviderModule (upval), mergePolicies (upval), p1 (copy), Logger (upval), UniversalAppPolicySkipUnchangedPolicy (upval), mapsToSameValues (upval)
		local UseContextResult = ReactModule.useContext(PolicyProviderModule.AppPolicyContext)
		assert(UseContextResult, "Not a descendent of PolicyProvider")
		local UseStateResult, UseStateResult2 = ReactModule.useState(function()
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
		local UseRefResult = nil
		local UseRefResult1 = nil
		
		if UniversalAppPolicySkipUnchangedPolicy then
			UseRefResult = ReactModule.useRef(Callback)
			assert(UseRefResult, "latestMapPolicies")
			UseRefResult.current = Callback
			UseRefResult1 = ReactModule.useRef(UseStateResult)
		end
		ReactModule.useEffect(function()
			-- upvalues: UseContextResult (copy), p1 (upval), Logger (upval), UniversalAppPolicySkipUnchangedPolicy (upval), UseRefResult (ref), UseRefResult1 (ref), mergePolicies (upval), mapsToSameValues (upval), UseStateResult2 (copy)
			local OnPolicyChangedResult = if UseContextResult.staticExternalPolicy then nil else p1.onPolicyChanged(function(p2)
				-- upvalues: Logger (upval), UniversalAppPolicySkipUnchangedPolicy (upval), UseRefResult (upval), UseRefResult1 (upval), mergePolicies (upval), UseContextResult (upval), mapsToSameValues (upval), UseStateResult2 (upval)
				Logger:trace("Received policy update")
				
				if UniversalAppPolicySkipUnchangedPolicy and UseRefResult and UseRefResult1 then
					local MergePoliciesResult = mergePolicies(p2, UseContextResult.presentationPolicy)
					UseRefResult1.current = MergePoliciesResult
					
					if not mapsToSameValues(UseRefResult.current, UseRefResult1.current, MergePoliciesResult) then
						UseStateResult2(MergePoliciesResult)
						
						return
					end
				else
					UseStateResult2((mergePolicies(p2, UseContextResult.presentationPolicy)))
				end
			end)
			
			return function()
				-- upvalues: OnPolicyChangedResult (ref)
				if OnPolicyChangedResult then
					OnPolicyChangedResult:Disconnect()
				end
			end
		end, { UseContextResult })
		
		return if UniversalAppPolicySkipUnchangedPolicy and UseRefResult1 then Callback(UseRefResult1.current) else Callback(UseStateResult)
	end
end