local StateTableModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.StateTable)
local StateTableBuilderModule = {}
StateTableBuilderModule.__index = StateTableBuilderModule

function StateTableBuilderModule.new()
	-- upvalues: StateTableBuilderModule (copy)
	local config = { transitionTable = {} }
	setmetatable(config, StateTableBuilderModule)
	
	return config
end

function StateTableBuilderModule:withName(StateTableName)
	assert(typeof(StateTableName) == "string", "stateTableName must be a string")
	assert(#StateTableName > 0, "stateTableName must not be empty")
	assert(self.stateTableName == nil, "Cannot call withName twice")
	self.stateTableName = StateTableName
	
	return self
end

function StateTableBuilderModule:withInitialState(InitialState)
	assert(typeof(InitialState) == "string", "initialState must be a string")
	assert(#InitialState > 0, "initialState must not be empty")
	assert(self.initialState == nil, "Cannot call withInitialState twice")
	self.initialState = InitialState
	
	return self
end

function StateTableBuilderModule:withInitialContext(InitialContext)
	assert(typeof(InitialContext) == "table", "initialContext must be a table")
	assert(self.initialContext == nil, "Cannot call withInitialContext twice")
	self.initialContext = InitialContext
	
	return self
end

function StateTableBuilderModule:addState(CurrentStateName)
	assert(typeof(CurrentStateName) == "string", "stateName must be a string")
	assert(#CurrentStateName > 0, "stateName must not be empty")
	assert(self.transitionTable[CurrentStateName] == nil, string.format("Cannot add the same state '%s' twice", CurrentStateName))
	self.transitionTable[CurrentStateName] = {}
	self.currentStateName = CurrentStateName
	self.currentEventName = nil
	
	return self
end

function StateTableBuilderModule:withEvent(CurrentEventName)
	assert(typeof(CurrentEventName) == "string", "eventName must be a string")
	assert(#CurrentEventName > 0, "eventName must not be empty")
	assert(self.currentStateName ~= nil, "Cannot add an event without first specifying a state via addState()")
	assert(self.transitionTable[self.currentStateName][CurrentEventName] == nil, "Cannot add an event to the same state more than once")
	self.transitionTable[self.currentStateName][CurrentEventName] = {}
	self.currentEventName = CurrentEventName
	
	return self
end

function StateTableBuilderModule:nextState(NextState)
	assert(typeof(NextState) == "string", "stateName must be a string")
	assert(#NextState > 0, "stateName must not be empty")
	assert(self.currentEventName ~= nil, "Must specify an event before attaching nextState, via withEvent()")
	assert(self.transitionTable[self.currentStateName][self.currentEventName].nextState == nil, "Cannot set nextState twice for the same event transition")
	self.transitionTable[self.currentStateName][self.currentEventName].nextState = NextState
	
	return self
end

function StateTableBuilderModule:action(Action)
	assert(typeof(Action) == "function", "actionFunctor must be a function")
	assert(self.currentEventName ~= nil, "Must specify an event before attaching action, via withEvent()")
	assert(self.transitionTable[self.currentStateName][self.currentEventName].action == nil, "Cannot set action twice for the same event transition")
	self.transitionTable[self.currentStateName][self.currentEventName].action = Action
	
	return self
end

function StateTableBuilderModule:build()
	-- upvalues: StateTableModule (copy)
	assert(self.stateTableName ~= nil and #self.stateTableName > 0, "State table name was not set via withName()")
	assert(self.initialState ~= nil and #self.initialState > 0, "Initial state was not set via withInitialState()")
	assert(typeof(self.transitionTable[self.initialState]) == "table", "Initial state was not added to state table")
	
	return StateTableModule.new(self.stateTableName, self.initialState, self.initialContext, self.transitionTable)
end

return StateTableBuilderModule