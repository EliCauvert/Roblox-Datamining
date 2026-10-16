local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local ReactModule = require(ViewRecyclerReact.Parent.React)
local RecyclableViewContextModule = require(ViewRecyclerReact.ReactAdapter.Private.RecyclableViewContext)
local SignalsModule = require(ViewRecyclerReact.Parent.Signals)

local function _(Callback) --[[ Line: 23 | Named "initialize" ]]
	return if type(Callback) == "function" then Callback() else Callback
end

local _ = function() --[[ Line: 27 | Named "useRecyclableViewContext" ]]
	-- upvalues: ReactModule (copy), RecyclableViewContextModule (copy)
	local UseContextResult = ReactModule.useContext(RecyclableViewContextModule)
	assert(type(UseContextResult) == "table", "Recycling hooks must be called within a Recyclable view")
	
	return UseContextResult
end

local function useRecyclingToken(List) --[[ Line: 41 ]]
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
	local _, UseStateResult2 = ReactModule.useState(0)
	local UseRefResult = ReactModule.useRef({})
	local UseRefResult1 = ReactModule.useRef({})
	local Flag = #UseRefResult.current ~= #Buffer
	local Buffer1 = table.create(#Buffer)
	
	for i, value1 in Buffer do
		local CurrentEntry = value1(false)
		Buffer1[i] = CurrentEntry
		
		if UseRefResult.current[i] ~= CurrentEntry then
			Flag = true
		end
	end
	if Flag then
		UseRefResult.current = Buffer1
		UseRefResult1.current = {}
	end
	ReactModule.useLayoutEffect(function() --[[ Line: 67 ]]
		-- upvalues: SignalsModule (upval), Buffer (copy), UseRefResult (copy), UseRefResult1 (copy), UseStateResult2 (copy)
		return SignalsModule.createEffect(function(p1) --[[ Line: 68 ]]
			-- upvalues: Buffer (upval), UseRefResult (upval), UseRefResult1 (upval), UseStateResult2 (upval)
			local Buffer1 = table.create(#Buffer)
			local Flag = #UseRefResult.current ~= #Buffer
			for i, value in Buffer do
				local CurrentEntry = value(p1)
				Buffer1[i] = CurrentEntry
				
				if UseRefResult.current[i] ~= CurrentEntry then
					Flag = true
				end
			end
			if Flag then
				UseRefResult.current = Buffer1
				UseRefResult1.current = {}
				UseStateResult2(function(p2: number): number --[[ Line: 81 ]]
					return p2 + 1
				end)
			end
		end)
	end, Buffer)
	
	return UseRefResult1.current
end

return table.freeze({
	useRecyclingItem = function() --[[ Line: 33 ]]
		-- upvalues: ReactModule (copy), RecyclableViewContextModule (copy)
		local UseContextResult = ReactModule.useContext(RecyclableViewContextModule)
		assert(type(UseContextResult) == "table", "Recycling hooks must be called within a Recyclable view")
		
		return UseContextResult.itemSignal
	end,
	useRecyclingAssignment = function() --[[ Line: 37 ]]
		-- upvalues: ReactModule (copy), RecyclableViewContextModule (copy)
		local UseContextResult = ReactModule.useContext(RecyclableViewContextModule)
		assert(type(UseContextResult) == "table", "Recycling hooks must be called within a Recyclable view")
		
		return UseContextResult.assignmentSignal
	end,
	useRecyclingState = function(Callback, p1, Current) --[[ Line: 93 ]]
		-- upvalues: useRecyclingToken (copy), ReactModule (copy)
		local UseRecyclingTokenResult = useRecyclingToken(p1)
		local UseStateResult, UseStateResult2 = ReactModule.useState(function() --[[ Line: 99 ]]
			-- upvalues: UseRecyclingTokenResult (copy), Callback (copy)
			return {
				token = UseRecyclingTokenResult,
				value = if type(Callback) == "function" then Callback() else Callback
			}
		end)
		local Config = if UseStateResult.token == UseRecyclingTokenResult then nil else {
			token = UseRecyclingTokenResult,
			value = if type(Callback) == "function" then Callback() else Callback
		}
		
		if Config ~= nil then
			UseStateResult2(Config)
		end
		local Config1 = Config or UseStateResult
		local UseRefResult = ReactModule.useRef(false)
		local UseRefResult1 = ReactModule.useRef(Current)
		UseRefResult1.current = Current
		ReactModule.useLayoutEffect(function() --[[ Line: 118 ]]
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
		
		return Config1.value, (ReactModule.useCallback(function(Callback) --[[ Line: 130 ]]
			-- upvalues: UseStateResult2 (copy), UseRecyclingTokenResult (copy)
			UseStateResult2(function(p2) --[[ Line: 131 ]]
				-- upvalues: UseRecyclingTokenResult (upval), Callback (copy)
				return if p2.token == UseRecyclingTokenResult then {
					token = p2.token,
					value = if type(Callback) == "function" then Callback(p2.value) else Callback
				} else p2
			end)
		end, { UseRecyclingTokenResult }))
	end,
	useRecyclingSignal = function(Callback, p1, Current) --[[ Line: 145 ]]
		-- upvalues: useRecyclingToken (copy), ReactModule (copy), SignalsModule (copy)
		local UseRecyclingTokenResult = useRecyclingToken(p1)
		local UseStateResult = ReactModule.useState(function() --[[ Line: 151 ]]
			-- upvalues: SignalsModule (upval), Callback (copy), UseRecyclingTokenResult (copy)
			local Signal, Signal2 = SignalsModule.createSignal(if type(Callback) == "function" then Callback() else Callback)
			
			return {
				getter = Signal,
				setter = Signal2,
				token = UseRecyclingTokenResult
			}
		end)
		
		if UseStateResult.token ~= UseRecyclingTokenResult then
			UseStateResult.token = UseRecyclingTokenResult
			UseStateResult.setter(if type(Callback) == "function" then Callback() else Callback)
		end
		local UseRefResult = ReactModule.useRef(false)
		local UseRefResult1 = ReactModule.useRef(Current)
		UseRefResult1.current = Current
		ReactModule.useLayoutEffect(function() --[[ Line: 167 ]]
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
		
		return UseStateResult.getter, (ReactModule.useCallback(function(p2) --[[ Line: 179 ]]
			-- upvalues: UseStateResult (copy), UseRecyclingTokenResult (copy)
			if UseStateResult.token == UseRecyclingTokenResult then
				UseStateResult.setter(p2)
			end
		end, { UseRecyclingTokenResult, UseStateResult }))
	end
})