local ImmutableModule = require(game:GetService("CoreGui").RobloxGui.Modules.Common.Immutable)
local Logging = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Logging
local StateTableModule = {}
StateTableModule.__index = StateTableModule

function StateTableModule.new(Name, CurrentState, p1, List)
	-- upvalues: StateTableModule (copy)
	assert(typeof(Name) == "string", "name must be a string")
	assert(#Name > 0, "name must not be an empty string")
	assert(typeof(CurrentState) == "string", "initialState must be a string")
	assert(#CurrentState > 0, "initialState must not be an empty string")
	assert(p1 == nil or typeof(p1) == "table", "initialContext must be a table or nil")
	assert(typeof(List) == "table", "transitionTable must be a table")
	assert(typeof(List[CurrentState]) == "table", "initialState must be present in transitionTable")
	local t = {}
	setmetatable(t, StateTableModule)
	t.loggingEnabled = false
	t.name = Name
	t.currentState = CurrentState
	t.currentContext = p1 or {}
	t.transitionTable = {}
	t.events = {}
	
	for i, value in pairs(List) do
		assert(typeof(i) == "string", string.format("state name '%s' must be a string", (tostring(i))))
		assert(typeof(value) == "table", string.format("state name '%s' must map to a table", i))
		local t1 = {}
		
		for i1, value1 in pairs(value) do
			assert(typeof(i1) == "string", string.format("event name '%s' must be a string", (tostring(i1))))
			assert(typeof(value1) == "table", string.format("event name '%s' must map to a table", i1))
			local NextState = value1.nextState
			local Action = value1.action
			
			if NextState ~= nil then
				assert(typeof(NextState) == "string", string.format("nextState '%s' must be a string or nil", (tostring(NextState))))
				assert(List[NextState] ~= nil, string.format("nextState '%s' does not exist in transitionTable", NextState))
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
	-- upvalues: ImmutableModule (copy), Logging (copy)
	assert(typeof(p2) == "string", "eventKey must be a string")
	assert(#p2 > 0, "eventKey must not be an empty string")
	assert(p3 == nil or typeof(p3) == "table", "args must be nil or valid table")
	local CurrentState = self.currentState
	local Transition = self.transitionTable[CurrentState]
	assert(Transition ~= nil)
	
	if Transition[p2] ~= nil then
		local TransitionEntry = Transition[p2]
		local NextState = TransitionEntry.nextState or CurrentState
		local ActionFunction = TransitionEntry.action
		
		if self.loggingEnabled then
			print(string.format("%s: changing state, '%s' [%s] --> '%s'", self.name, CurrentState, p2, NextState))
		end
		local CurrentContext = self.currentContext
		
		if ActionFunction ~= nil then
			CurrentContext = ImmutableModule.JoinDictionaries(self.currentContext, ActionFunction(CurrentState, NextState, p3, self.currentContext) or {})
			self.currentContext = CurrentContext
		end
		self.currentState = NextState
		
		if self.stateChangeHandler ~= nil then
			self.stateChangeHandler(CurrentState, NextState, CurrentContext)
			
			return
		end
	elseif self.loggingEnabled then
		Logging.warn(string.format("%s: unhandled state transition (%s[%s])", self.name, CurrentState, p2))
	end
end

function StateTableModule:onStateChange(StateChangeHandler)
	assert(StateChangeHandler == nil or typeof(StateChangeHandler) == "function", "stateChangeHandler must be nil or a function")
	self.stateChangeHandler = StateChangeHandler
end

return StateTableModule