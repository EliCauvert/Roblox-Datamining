local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Enums.ControlState)
local _ = require(foundation.Enums.ControlStateEvent)
local loggerModule = require(foundation.Utility.Logger)
local t = {}
t.__index = t

function t.new(p0, p1, p2)
	-- upvalues: t (ref)
	assert(#p0 > 0, "name must not be an empty string")
	assert(p2[p1] ~= nil, "initialState must be present in transitionTable")
	local t_1 = {}
	setmetatable(t_1, t)
	t_1.name = p0
	t_1.currentState = p1
	t_1.transitionTable = {}
	t_1.events = {}
	
	for i, v in p2 do
		local t_2 = {}
		
		for i_1, v_1 in v do
			local nextState = v_1.nextState
			
			if nextState ~= nil then
				assert(p2[nextState] ~= nil, "nextState does not exist in transitionTable")
			end
			t_2[i_1] = v_1
			
			if t_1.events[i_1] == nil then
				t_1.events[i_1] = function()
					-- upvalues: t_1 (ref), i_1 (ref)
					return t_1:handleEvent(i_1)
				end
			end
		end
		t_1.transitionTable[i] = t_2
	end
	setmetatable(t_1.events, {
		__index = function(_, p3)
			-- upvalues: t_1 (ref)
			error(string.format("'%s' is not a valid event in StateTable '%s'", tostring(p3), t_1.name), 2)
		end
	})
	
	return t_1
end

function t:handleEvent(p4)
	-- upvalues: loggerModule (ref)
	local currentState = self.currentState
	local var5 = self.transitionTable[currentState][p4]
	
	if var5 == nil then
		loggerModule:debug("No transition found for event " .. p4 .. " in state " .. currentState)
		
		return
	end
	local nextState = var5.nextState
	self.currentState = nextState
	
	if self.stateChangeHandler ~= nil then
		self.stateChangeHandler(nextState)
	end
end

function t:onStateChange(p5)
	self.stateChangeHandler = p5
end

return t