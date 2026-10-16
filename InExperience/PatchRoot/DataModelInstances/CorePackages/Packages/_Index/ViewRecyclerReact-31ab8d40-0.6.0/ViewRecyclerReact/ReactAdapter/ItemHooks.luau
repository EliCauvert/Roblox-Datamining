local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local ReactModule = require(ViewRecyclerReact.Parent.React)
local RecyclableViewContextModule = require(ViewRecyclerReact.ReactAdapter.Private.RecyclableViewContext)
local SignalsModule = require(ViewRecyclerReact.Parent.Signals)

local function _(Callback) --[[ Line: 33 | Named "initialize" ]]
	return if type(Callback) == "function" then Callback() else Callback
end

local _ = function() --[[ Line: 37 | Named "useRecyclableViewContext" ]]
	-- upvalues: ReactModule (copy), RecyclableViewContextModule (copy)
	local UseContextResult = ReactModule.useContext(RecyclableViewContextModule)
	assert(type(UseContextResult) == "table", "Recycling hooks must be called within a Recyclable view")
	
	return UseContextResult
end

local _ = function(p1, List): boolean --[[ Line: 55 | Named "sameValues" ]]
	if #p1 ~= #List then
		return false
	end
	for i, value in List do
		if p1[i] ~= value then
			return false
		end
	end
	return true
end

local function useRecyclingToken(List) --[[ Line: 67 ]]
	-- upvalues: ReactModule (copy), RecyclableViewContextModule (copy), SignalsModule (copy)
	local UseContextResult = ReactModule.useContext(RecyclableViewContextModule)
	assert(type(UseContextResult) == "table", "Recycling hooks must be called within a Recyclable view")
	local ItemKeySignal = UseContextResult.itemKeySignal
	local Buffer = table.create(#(List or {}) + 1)
	Buffer[1] = ItemKeySignal
	
	if List ~= nil then
		for _, value in List do
			table.insert(Buffer, value)
		end
	end
	local Buffer1 = table.create(#Buffer)
	
	for i, value1 in Buffer do
		Buffer1[i] = value1(false)
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(function() --[[ Line: 81 ]]
		-- upvalues: Buffer1 (copy)
		return { token = {}, values = Buffer1 }
	end)
	local Values = UseStateResult.values
	local Flag = nil
	
	if #Values == #Buffer1 then
		Flag = true
		
		for i1, value2 in Buffer1 do
			if Values[i1] ~= value2 then
				Flag = false
				break
			end
		end
	else
		Flag = false
	end
	if not Flag then
		UseStateResult = { token = {}, values = Buffer1 }
		UseStateResult2(UseStateResult)
	end
	ReactModule.useLayoutEffect(function() --[[ Line: 95 ]]
		-- upvalues: SignalsModule (upval), Buffer (copy), UseStateResult2 (copy)
		return SignalsModule.createEffect(function(p2) --[[ Line: 96 ]]
			-- upvalues: Buffer (upval), UseStateResult2 (upval)
			local Buffer1 = table.create(#Buffer)
			
			for i, value in Buffer do
				Buffer1[i] = value(p2)
			end
			UseStateResult2(function(p3) --[[ Line: 101 ]]
				-- upvalues: Buffer1 (copy)
				local Values = p3.values
				local Flag = nil
				
				if #Values == #Buffer1 then
					Flag = true
					
					for i, value in Buffer1 do
						if Values[i] ~= value then
							Flag = false
							break
						end
					end
				else
					Flag = false
				end
				return if Flag then p3 else { token = {}, values = Buffer1 }
			end)
		end)
	end, Buffer)
	
	return UseStateResult.token
end

return table.freeze({
	useRecyclingItem = function() --[[ Line: 43 ]]
		-- upvalues: ReactModule (copy), RecyclableViewContextModule (copy)
		local UseContextResult = ReactModule.useContext(RecyclableViewContextModule)
		assert(type(UseContextResult) == "table", "Recycling hooks must be called within a Recyclable view")
		
		return UseContextResult.itemSignal
	end,
	useRecyclingAssignment = function() --[[ Line: 47 ]]
		-- upvalues: ReactModule (copy), RecyclableViewContextModule (copy)
		local UseContextResult = ReactModule.useContext(RecyclableViewContextModule)
		assert(type(UseContextResult) == "table", "Recycling hooks must be called within a Recyclable view")
		
		return UseContextResult.assignmentSignal
	end,
	useRecyclingIndex = function() --[[ Line: 51 ]]
		-- upvalues: ReactModule (copy), RecyclableViewContextModule (copy)
		local UseContextResult = ReactModule.useContext(RecyclableViewContextModule)
		assert(type(UseContextResult) == "table", "Recycling hooks must be called within a Recyclable view")
		
		return UseContextResult.indexSignal
	end,
	useRecyclingState = function(Callback, p2, Current) --[[ Line: 116 ]]
		-- upvalues: useRecyclingToken (copy), ReactModule (copy)
		local UseRecyclingTokenResult = useRecyclingToken(p2)
		local UseStateResult, UseStateResult2 = ReactModule.useState(function() --[[ Line: 122 ]]
			-- upvalues: UseRecyclingTokenResult (copy), Callback (copy)
			return {
				token = UseRecyclingTokenResult,
				value = if type(Callback) == "function" then Callback() else Callback
			}
		end)
		
		if UseStateResult.token ~= UseRecyclingTokenResult then
			UseStateResult = {
				token = UseRecyclingTokenResult,
				value = if type(Callback) == "function" then Callback() else Callback
			}
			UseStateResult2(UseStateResult)
		end
		local UseRefResult = ReactModule.useRef(false)
		local UseRefResult1 = ReactModule.useRef(Current)
		ReactModule.useLayoutEffect(function() --[[ Line: 137 ]]
			-- upvalues: UseRefResult1 (copy), Current (copy)
			UseRefResult1.current = Current
		end, { Current })
		ReactModule.useLayoutEffect(function() --[[ Line: 140 ]]
			-- upvalues: UseRefResult (copy), UseRefResult1 (copy)
			if UseRefResult.current then
				local CurrentFunction: () -> () = UseRefResult1.current
				
				if CurrentFunction ~= nil then
					CurrentFunction()
					
					return
				end
			else
				UseRefResult.current = true
			end
		end, { UseRecyclingTokenResult })
		
		return UseStateResult.value, (ReactModule.useCallback(function(Callback) --[[ Line: 152 ]]
			-- upvalues: UseStateResult2 (copy), UseRecyclingTokenResult (copy)
			UseStateResult2(function(p3) --[[ Line: 153 ]]
				-- upvalues: UseRecyclingTokenResult (upval), Callback (copy)
				return if p3.token == UseRecyclingTokenResult then {
					token = p3.token,
					value = if type(Callback) == "function" then Callback(p3.value) else Callback
				} else p3
			end)
		end, { UseRecyclingTokenResult }))
	end,
	useRecyclingSignal = function(Callback1, p2, Callback) --[[ Line: 167 ]]
		-- upvalues: useRecyclingToken (copy), ReactModule (copy), SignalsModule (copy)
		local UseRecyclingTokenResult = useRecyclingToken(p2)
		local UseStateResult = ReactModule.useState(function() --[[ Line: 173 ]]
			-- upvalues: SignalsModule (upval), Callback1 (copy), UseRecyclingTokenResult (copy)
			local Signal, Signal2 = SignalsModule.createSignal(if type(Callback1) == "function" then Callback1() else Callback1)
			
			return {
				getter = Signal,
				setter = Signal2,
				committedToken = UseRecyclingTokenResult
			}
		end)
		local UseRefResult = ReactModule.useRef(false)
		ReactModule.useLayoutEffect(function() --[[ Line: 183 ]]
			-- upvalues: UseRefResult (copy), UseStateResult (copy), UseRecyclingTokenResult (copy), Callback1 (copy), Callback (copy)
			if UseRefResult.current then
				UseStateResult.committedToken = UseRecyclingTokenResult
				UseStateResult.setter(if type(Callback1) == "function" then Callback1() else Callback1)
				
				if Callback ~= nil then
					Callback()
					
					return
				end
			else
				UseRefResult.current = true
			end
		end, { UseRecyclingTokenResult })
		
		return UseStateResult.getter, (ReactModule.useCallback(function(p3) --[[ Line: 196 ]]
			-- upvalues: UseStateResult (copy), UseRecyclingTokenResult (copy)
			if UseStateResult.committedToken == UseRecyclingTokenResult then
				UseStateResult.setter(p3)
			end
		end, { UseRecyclingTokenResult, UseStateResult }))
	end
})