local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Enums.ControlState)
local _ = require(Foundation.Enums.ControlStateEvent)
local LoggerModule = require(Foundation.Utility.Logger)
local StateTableModule = {}
StateTableModule.__index = StateTableModule

function StateTableModule.new(Name, CurrentState, List) --[[ Line: 53 ]]
	-- upvalues: StateTableModule (copy)
	assert(#Name > 0, "name must not be an empty string")
	assert(List[CurrentState] ~= nil, "initialState must be present in transitionTable")
	local t = {}
	setmetatable(t, StateTableModule)
	t.name = Name
	t.currentState = CurrentState
	t.transitionTable = {}
	t.events = {}
	
	for i, value in List do
		local t1 = {}
		
		for i1, value1 in value do
			local NextState = value1.nextState
			
			if NextState ~= nil then
				assert(List[NextState] ~= nil, "nextState does not exist in transitionTable")
			end
			t1[i1] = value1
			
			if t.events[i1] == nil then
				t.events[i1] = function() --[[ Line: 79 ]]
					-- upvalues: t (copy), i1 (copy)
					return t:handleEvent(i1)
				end
			end
		end
		t.transitionTable[i] = t1
	end
	setmetatable(t.events, {
		__index = function(_, p1) --[[ Line: 90 ]]
			-- upvalues: t (copy)
			error(string.format("'%s' is not a valid event in StateTable '%s'", tostring(p1), t.name), 2)
		end
	})
	
	return t
end

function StateTableModule:handleEvent(Text) --[[ Line: 109 ]]
	-- upvalues: LoggerModule (copy)
	local CurrentState = self.currentState
	local TransitionEntry = self.transitionTable[CurrentState][Text]
	
	if TransitionEntry == nil then
		LoggerModule:debug("No transition found for event " .. Text .. " in state " .. CurrentState)
		
		return
	end
	local NextState = TransitionEntry.nextState
	self.currentState = NextState
	
	if self.stateChangeHandler ~= nil then
		self.stateChangeHandler(NextState)
	end
end

function StateTableModule:onStateChange(StateChangeHandler) --[[ Line: 137 ]]
	self.stateChangeHandler = StateChangeHandler
end

return StateTableModule