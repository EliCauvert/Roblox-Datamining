local FFlagViewRecyclerReact084 = require(script:FindFirstAncestor("ViewRecyclerReact").Flags).FFlagViewRecyclerReact084
local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local ReactModule = require(ViewRecyclerReact.Parent.React)
local RecyclableViewContextModule = require(ViewRecyclerReact.ReactAdapter.Private.RecyclableViewContext)
local SignalsModule = require(ViewRecyclerReact.Parent.Signals)

local function _(Callback)
	return if type(Callback) == "function" then Callback() else Callback
end

local _ = function()
	-- upvalues: ReactModule (copy), RecyclableViewContextModule (copy)
	local UseContextResult = ReactModule.useContext(RecyclableViewContextModule)
	assert(type(UseContextResult) == "table", "Recycling hooks must be called within a Recyclable view")
	
	return UseContextResult
end

local config = {
	useRecyclingItem = function()
		-- upvalues: ReactModule (copy), RecyclableViewContextModule (copy)
		local UseContextResult = ReactModule.useContext(RecyclableViewContextModule)
		assert(type(UseContextResult) == "table", "Recycling hooks must be called within a Recyclable view")
		
		return UseContextResult.itemSignal
	end,
	useRecyclingAssignment = function()
		-- upvalues: ReactModule (copy), RecyclableViewContextModule (copy)
		local UseContextResult = ReactModule.useContext(RecyclableViewContextModule)
		assert(type(UseContextResult) == "table", "Recycling hooks must be called within a Recyclable view")
		
		return UseContextResult.assignmentSignal
	end,
	useRecyclingIndex = function()
		-- upvalues: ReactModule (copy), RecyclableViewContextModule (copy)
		local UseContextResult = ReactModule.useContext(RecyclableViewContextModule)
		assert(type(UseContextResult) == "table", "Recycling hooks must be called within a Recyclable view")
		
		return UseContextResult.indexSignal
	end
}

local _ = function(p1, List): boolean
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

local Callback: ((any) -> any)? = nil
local Callback1: ((any, any) -> any)? = nil
local Callback2: ((any) -> any)? = nil

if FFlagViewRecyclerReact084 then
	Callback = function(List)
		-- upvalues: ReactModule (copy), RecyclableViewContextModule (copy)
		local Buffer = table.create(#(List or {}) + 1)
		local UseContextResult = ReactModule.useContext(RecyclableViewContextModule)
		assert(type(UseContextResult) == "table", "Recycling hooks must be called within a Recyclable view")
		Buffer[1] = UseContextResult.itemKeySignal
		
		if List ~= nil then
			for _, value in List do
				table.insert(Buffer, value)
			end
		end
		return Buffer
	end
	
	Callback1 = function(List, p2)
		local Buffer = table.create(#List)
		
		for i, value in List do
			Buffer[i] = value(p2)
		end
		return Buffer
	end
else
	Callback2 = function(List)
		-- upvalues: ReactModule (copy), RecyclableViewContextModule (copy), SignalsModule (copy)
		local UseContextResult = ReactModule.useContext(RecyclableViewContextModule)
		assert(type(UseContextResult) == "table", "Recycling hooks must be called within a Recyclable view")
		local Buffer = table.create(#(List or {}) + 1)
		Buffer[1] = UseContextResult.itemKeySignal
		
		if List ~= nil then
			for _, value in List do
				table.insert(Buffer, value)
			end
		end
		local Buffer1 = table.create(#Buffer)
		
		for i, value1 in Buffer do
			Buffer1[i] = value1(false)
		end
		local UseStateResult, UseStateResult2 = ReactModule.useState(function()
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
		ReactModule.useLayoutEffect(function()
			-- upvalues: SignalsModule (upval), Buffer (copy), UseStateResult2 (copy)
			return SignalsModule.createEffect(function(p3)
				-- upvalues: Buffer (upval), UseStateResult2 (upval)
				local Buffer1 = table.create(#Buffer)
				
				for i, value in Buffer do
					Buffer1[i] = value(p3)
				end
				UseStateResult2(function(p4)
					-- upvalues: Buffer1 (copy)
					local Values = p4.values
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
					return if Flag then p4 else { token = {}, values = Buffer1 }
				end)
			end)
		end, Buffer)
		
		return UseStateResult.token
	end
end
function config.useRecyclingState(Callback3, p3, ResetCallback)
	-- upvalues: FFlagViewRecyclerReact084 (copy), Callback (ref), Callback1 (ref), Callback2 (ref), ReactModule (copy), SignalsModule (copy)
	local v1 = nil
	local v2 = nil
	local Token = nil
	
	if FFlagViewRecyclerReact084 then
		v1 = Callback(p3)
		v2 = Callback1(v1, false)
	else
		Token = Callback2(p3)
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		-- upvalues: FFlagViewRecyclerReact084 (upval), Token (ref), v2 (ref), Callback3 (copy)
		return {
			token = if FFlagViewRecyclerReact084 then {} else Token,
			values = if FFlagViewRecyclerReact084 then v2 else nil,
			value = if type(Callback3) == "function" then Callback3() else Callback3
		}
	end)
	local IsNotTokenMatch = nil
	
	if FFlagViewRecyclerReact084 then
		local Values = UseStateResult.values
		local v3 = v2
		local Flag = nil
		
		if #Values == #v3 then
			Flag = true
			
			for i, value in v3 do
				if Values[i] ~= value then
					Flag = false
					break
				end
			end
		else
			Flag = false
		end
		IsNotTokenMatch = not Flag
	else
		IsNotTokenMatch = UseStateResult.token ~= Token
	end
	if IsNotTokenMatch then
		UseStateResult = {
			token = if FFlagViewRecyclerReact084 then {} else Token,
			values = if FFlagViewRecyclerReact084 then v2 else nil,
			value = if type(Callback3) == "function" then Callback3() else Callback3
		}
		UseStateResult2(UseStateResult)
	end
	local UseRefResult = nil
	
	if FFlagViewRecyclerReact084 then
		UseRefResult = ReactModule.useRef({ initialState = Callback3, resetCallback = ResetCallback })
		ReactModule.useLayoutEffect(function()
			-- upvalues: UseRefResult (ref), Callback3 (copy), ResetCallback (copy)
			UseRefResult.current = { initialState = Callback3, resetCallback = ResetCallback }
		end)
		ReactModule.useLayoutEffect(function()
			-- upvalues: SignalsModule (upval), Callback1 (upval), v1 (ref), UseStateResult2 (copy), UseRefResult (ref)
			return SignalsModule.createEffect(function(p4)
				-- upvalues: Callback1 (upval), v1 (upval), UseStateResult2 (upval), UseRefResult (upval)
				local CallbackResult = Callback1(v1, p4)
				UseStateResult2(function(p5)
					-- upvalues: CallbackResult (copy), UseRefResult (upval)
					local Values = p5.values
					local Flag = nil
					
					if #Values == #CallbackResult then
						Flag = true
						
						for i, value in CallbackResult do
							if Values[i] ~= value then
								Flag = false
								break
							end
						end
					else
						Flag = false
					end
					if Flag then
						return p5
					else
						local InitialStateFunction = UseRefResult.current.initialState
						
						return {
							token = {},
							values = CallbackResult,
							value = if type(InitialStateFunction) == "function" then InitialStateFunction() else InitialStateFunction
						}
					end
				end)
			end)
		end, v1)
		Token = UseStateResult.token
	end
	local UseRefResult1 = ReactModule.useRef(false)
	local UseRefResult2 = if FFlagViewRecyclerReact084 then nil else ReactModule.useRef(ResetCallback)
	ReactModule.useLayoutEffect(function()
		-- upvalues: FFlagViewRecyclerReact084 (upval), UseRefResult1 (copy), UseRefResult (ref), UseRefResult2 (ref), ResetCallback (copy)
		if not FFlagViewRecyclerReact084 then
			UseRefResult2.current = ResetCallback
		elseif not UseRefResult1.current then
			UseRefResult1.current = true
			
			return
		else
			local ResetCallbackFunction: () -> () = UseRefResult.current.resetCallback
			
			if ResetCallbackFunction ~= nil then
				ResetCallbackFunction()
				
				return
			end
		end
	end, {
		if FFlagViewRecyclerReact084 then Token else ResetCallback
	})
	local v4 = nil
	
	if not FFlagViewRecyclerReact084 then
		ReactModule.useLayoutEffect(function()
			-- upvalues: UseRefResult1 (copy), UseRefResult2 (ref)
			if UseRefResult1.current then
				local CurrentFunction: () -> () = UseRefResult2.current
				
				if CurrentFunction ~= nil then
					CurrentFunction()
					
					return
				end
			else
				UseRefResult1.current = true
			end
		end, { Token })
		v4 = Token
	end
	return UseStateResult.value, (ReactModule.useCallback(function(Callback)
		-- upvalues: UseStateResult2 (copy), FFlagViewRecyclerReact084 (upval), Token (ref), v4 (ref)
		UseStateResult2(function(p4)
			-- upvalues: FFlagViewRecyclerReact084 (upval), Token (upval), v4 (upval), Callback (copy)
			return if p4.token == (if FFlagViewRecyclerReact084 then Token else v4) then {
				token = p4.token,
				values = if FFlagViewRecyclerReact084 then p4.values else nil,
				value = if type(Callback) == "function" then Callback(p4.value) else Callback
			} else p4
		end)
	end, { if FFlagViewRecyclerReact084 then Token else v4 }))
end

function config.useRecyclingSignal(Callback3, p4, Callback4)
	-- upvalues: FFlagViewRecyclerReact084 (copy), Callback (ref), Callback2 (ref), ReactModule (copy), SignalsModule (copy), Callback1 (ref)
	local v5 = nil
	local CommittedToken = nil
	
	if FFlagViewRecyclerReact084 then
		v5 = Callback(p4)
	else
		CommittedToken = Callback2(p4)
	end
	local UseStateResult = ReactModule.useState(function()
		-- upvalues: SignalsModule (upval), Callback3 (copy), FFlagViewRecyclerReact084 (upval), Callback1 (upval), v5 (ref), CommittedToken (ref)
		local Signal, Signal2 = SignalsModule.createSignal(if type(Callback3) == "function" then Callback3() else Callback3)
		
		return {
			getter = Signal,
			setter = Signal2,
			values = if FFlagViewRecyclerReact084 then Callback1(v5, false) else nil,
			unmounted = not FFlagViewRecyclerReact084 and nil,
			committedToken = if FFlagViewRecyclerReact084 then nil else CommittedToken
		}
	end)
	local UseRefResult = nil
	local UseRefResult1 = nil
	local CommittedToken1 = nil
	
	if FFlagViewRecyclerReact084 then
		UseRefResult = ReactModule.useRef({ initialState = Callback3, resetCallback = Callback4 })
		ReactModule.useLayoutEffect(function()
			-- upvalues: UseRefResult (ref), Callback3 (copy), Callback4 (copy)
			UseRefResult.current = { initialState = Callback3, resetCallback = Callback4 }
		end)
		ReactModule.useLayoutEffect(function()
			-- upvalues: UseStateResult (copy)
			UseStateResult.unmounted = false
			
			return function()
				-- upvalues: UseStateResult (upval)
				UseStateResult.unmounted = true
			end
		end, { UseStateResult })
		ReactModule.useLayoutEffect(function()
			-- upvalues: SignalsModule (upval), Callback1 (upval), v5 (ref), UseStateResult (copy), UseRefResult (ref)
			return SignalsModule.createEffect(function(p5)
				-- upvalues: Callback1 (upval), v5 (upval), UseStateResult (upval), UseRefResult (upval)
				local CallbackResult = Callback1(v5, p5)
				local Values = UseStateResult.values
				local Flag = nil
				
				if #Values == #CallbackResult then
					Flag = true
					
					for i, value in CallbackResult do
						if Values[i] ~= value then
							Flag = false
							break
						end
					end
				else
					Flag = false
				end
				if Flag then return end
				UseStateResult.values = CallbackResult
				local InitialStateFunction = UseRefResult.current.initialState
				UseStateResult.setter(if type(InitialStateFunction) == "function" then InitialStateFunction() else InitialStateFunction)
				local ResetCallbackFunction: () -> () = UseRefResult.current.resetCallback
				
				if ResetCallbackFunction ~= nil then
					ResetCallbackFunction()
				end
			end)
		end, v5)
	else
		UseRefResult1 = ReactModule.useRef(false)
		ReactModule.useLayoutEffect(function()
			-- upvalues: UseRefResult1 (ref), UseStateResult (copy), CommittedToken (ref), Callback3 (copy), Callback4 (copy)
			if UseRefResult1.current then
				UseStateResult.committedToken = CommittedToken
				UseStateResult.setter(if type(Callback3) == "function" then Callback3() else Callback3)
				
				if Callback4 ~= nil then
					Callback4()
					
					return
				end
			else
				UseRefResult1.current = true
			end
		end, { CommittedToken })
		CommittedToken1 = CommittedToken
	end
	return UseStateResult.getter, (ReactModule.useCallback(function(p5)
		-- upvalues: FFlagViewRecyclerReact084 (upval), UseStateResult (copy), CommittedToken1 (ref)
		if if FFlagViewRecyclerReact084 then not UseStateResult.unmounted else UseStateResult.committedToken == CommittedToken1 then
			UseStateResult.setter(p5)
		end
	end, if FFlagViewRecyclerReact084 then { UseStateResult } else { CommittedToken1, UseStateResult }))
end

return table.freeze(config)