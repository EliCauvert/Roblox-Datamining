local Parent = script.Parent.Parent
local PolicyProviderModule = require(Parent.PolicyProvider)
local Logger = PolicyProviderModule.Logger
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local _ = require(script.Parent.PolicyTypes)
local UniversalAppPolicySkipUnchangedPolicy2 = game:DefineFastFlag("UniversalAppPolicySkipUnchangedPolicy2", false)

local function _(p1, p2): boolean
	if p1.n ~= p2.n then
		return false
	end
	for i = 1, p1.n do
		if p1[i] ~= p2[i] then
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

return function(p3)
	-- upvalues: ReactModule (copy), PolicyProviderModule (copy), mergePolicies (copy), Logger (copy), UniversalAppPolicySkipUnchangedPolicy2 (copy)
	assert(p3, "expected getPolicyImpl")
	
	return function(Callback)
		-- upvalues: ReactModule (upval), PolicyProviderModule (upval), mergePolicies (upval), p3 (copy), Logger (upval), UniversalAppPolicySkipUnchangedPolicy2 (upval)
		local UseContextResult = ReactModule.useContext(PolicyProviderModule.AppPolicyContext)
		assert(UseContextResult, "Not a descendent of PolicyProvider")
		local UseStateResult, UseStateResult2 = ReactModule.useState(function()
			-- upvalues: UseContextResult (copy), mergePolicies (upval), p3 (upval), Logger (upval)
			if UseContextResult.staticExternalPolicy then
				return (mergePolicies(UseContextResult.staticExternalPolicy, UseContextResult.presentationPolicy))
			end
			local ReadResult = p3.read()
			
			if ReadResult then
				return (mergePolicies(ReadResult, UseContextResult.presentationPolicy))
			else
				Logger:trace("No app policy data available")
				
				return (mergePolicies({}, UseContextResult.presentationPolicy))
			end
		end)
		local UseRefResult = nil
		local UseRefResult1 = nil
		local UseRefResult2 = nil
		
		if UniversalAppPolicySkipUnchangedPolicy2 then
			UseRefResult = ReactModule.useRef(Callback)
			assert(UseRefResult, "latestMapPolicies")
			UseRefResult.current = Callback
			UseRefResult1 = ReactModule.useRef(UseStateResult)
			UseRefResult2 = ReactModule.useRef(nil)
		end
		ReactModule.useEffect(function()
			-- upvalues: UseContextResult (copy), p3 (upval), Logger (upval), UniversalAppPolicySkipUnchangedPolicy2 (upval), UseRefResult (ref), UseRefResult1 (ref), UseRefResult2 (ref), mergePolicies (upval), UseStateResult2 (copy)
			local OnPolicyChangedResult = if UseContextResult.staticExternalPolicy then nil else p3.onPolicyChanged(function(p4)
				-- upvalues: Logger (upval), UniversalAppPolicySkipUnchangedPolicy2 (upval), UseRefResult (upval), UseRefResult1 (upval), UseRefResult2 (upval), mergePolicies (upval), UseContextResult (upval), UseStateResult2 (upval)
				Logger:trace("Received policy update")
				
				if UniversalAppPolicySkipUnchangedPolicy2 and UseRefResult and UseRefResult1 and UseRefResult2 then
					local MergePoliciesResult = mergePolicies(p4, UseContextResult.presentationPolicy)
					UseRefResult1.current = MergePoliciesResult
					local Current = UseRefResult2.current
					
					if Current ~= nil then
						local Packed = table.pack(UseRefResult.current(MergePoliciesResult))
						local Flag = nil
						
						if Current.n == Packed.n then
							Flag = true
							
							for i = 1, Current.n do
								if Current[i] == Packed[i] then
									continue
								end
								Flag = false
								break
							end
						else
							Flag = false
						end
						if Flag then return end
					end
					UseStateResult2(MergePoliciesResult)
					
					return
				else
					UseStateResult2((mergePolicies(p4, UseContextResult.presentationPolicy)))
				end
			end)
			
			return function()
				-- upvalues: OnPolicyChangedResult (ref)
				if OnPolicyChangedResult then
					OnPolicyChangedResult:Disconnect()
				end
			end
		end, { UseContextResult })
		
		if UniversalAppPolicySkipUnchangedPolicy2 and UseRefResult1 and UseRefResult2 then
			local Packed = table.pack(Callback(UseRefResult1.current))
			UseRefResult2.current = Packed
			
			return table.unpack(Packed, 1, Packed.n)
		else
			return Callback(UseStateResult)
		end
	end
end