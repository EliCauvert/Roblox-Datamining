local CryoModule = require(script.Parent.Parent.Parent.Cryo)
local StateTableModule = {}
StateTableModule.__index = StateTableModule

local function _(p1, p2)
	local ValueType = typeof(p1)
	assert(ValueType == "string" or ValueType == "userdata", string.format("%s '%s' must be a string or userdata but is a %s", p2, tostring(p1), ValueType))
end

function StateTableModule.new(Name, CurrentState, p1, List)
	-- upvalues: StateTableModule (copy)
	assert(typeof(Name) == "string", "name must be a string")
	assert(#Name > 0, "name must not be an empty string")
	local ValueType = typeof(CurrentState)
	assert(ValueType == "string" or ValueType == "userdata", string.format("%s '%s' must be a string or userdata but is a %s", "initialState", tostring(CurrentState), ValueType))
	assert(p1 == nil or typeof(p1) == "table", "initialContext must be a table or nil")
	assert(typeof(List) == "table", "transitionTable must be a table")
	assert(typeof(List[CurrentState]) == "table", "initialState must be present in transitionTable")
	local t = {}
	setmetatable(t, StateTableModule)
	t.name = Name
	t.currentState = CurrentState
	t.currentContext = p1 or {}
	t.transitionTable = {}
	t.events = {}
	
	for i, value in pairs(List) do
		local ValueType1 = typeof(i)
		assert(ValueType1 == "string" or ValueType1 == "userdata", string.format("%s '%s' must be a string or userdata but is a %s", "state", tostring(i), ValueType1))
		assert(typeof(value) == "table", string.format("state '%s' must map to a table", (tostring(i))))
		local t1 = {}
		
		for i1, value1 in pairs(value) do
			local ValueType2 = typeof(i1)
			assert(ValueType2 == "string" or ValueType2 == "userdata", string.format("%s '%s' must be a string or userdata but is a %s", "event", tostring(i1), ValueType2))
			assert(typeof(value1) == "table", string.format("event '%s' must map to a table", (tostring(i1))))
			local NextState = value1.nextState
			local Action = value1.action
			
			if NextState ~= nil then
				local ValueType3 = typeof(NextState)
				assert(ValueType3 == "string" or ValueType3 == "userdata", string.format("%s '%s' must be a string or userdata but is a %s", "nextState", tostring(NextState), ValueType3))
				assert(List[NextState] ~= nil, string.format("nextState '%s' does not exist in transitionTable", (tostring(NextState))))
			end
			assert(Action == nil or typeof(Action) == "function", "action must be a function")
			t1[i1] = value1
			
			if t.events[i1] == nil then
				t.events[i1] = function(p2)
					-- upvalues: t (copy), i1 (copy)
					return t:handleEvent(i1, p2)
				end
			end
		end
		t.transitionTable[i] = t1
	end
	setmetatable(t.events, {
		__index = function(_, p2)
			-- upvalues: t (copy)
			error(string.format("'%s' is not a valid event in StateTable '%s'", tostring(p2), t.name), 2)
		end
	})
	
	return t
end

function StateTableModule:handleEvent(p2, p3)
	-- upvalues: CryoModule (copy)
	local ValueType = typeof(p2)
	assert(ValueType == "string" or ValueType == "userdata", string.format("%s '%s' must be a string or userdata but is a %s", "event", tostring(p2), ValueType))
	assert(p3 == nil or typeof(p3) == "table", "args must be nil or valid table")
	local CurrentState = self.currentState
	local Transition = self.transitionTable[CurrentState]
	assert(Transition ~= nil, "no transition events for current state")
	
	if Transition[p2] ~= nil then
		local TransitionEntry = Transition[p2]
		local NextState = TransitionEntry.nextState or CurrentState
		local ActionFunction = TransitionEntry.action
		local CurrentContext = self.currentContext
		
		if ActionFunction ~= nil then
			CurrentContext = CryoModule.Dictionary.join(self.currentContext, ActionFunction(CurrentState, NextState, p3, self.currentContext) or {})
			self.currentContext = CurrentContext
		end
		self.currentState = NextState
		
		if self.stateChangeHandler ~= nil then
			self.stateChangeHandler(CurrentState, NextState, CurrentContext)
		end
	end
end

function StateTableModule:onStateChange(StateChangeHandler)
	assert(StateChangeHandler == nil or typeof(StateChangeHandler) == "function", "stateChangeHandler must be nil or a function")
	self.stateChangeHandler = StateChangeHandler
end

return StateTableModule