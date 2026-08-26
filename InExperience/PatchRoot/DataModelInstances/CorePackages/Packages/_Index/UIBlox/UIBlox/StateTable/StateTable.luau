local cryoModule = require(script.Parent.Parent.Parent.Cryo)
local t = {}
t.__index = t

local function _(p1, p2)
	local var1 = typeof(p1)
	assert(if var1 ~= "string" then var1 == "userdata" else true, string.format("%s '%s' must be a string or userdata but is a %s", p2, tostring(p1), var1))
end

function t.new(p1, p2, p3, p4)
	-- upvalues: t (ref)
	assert(typeof(p1) == "string", "name must be a string")
	assert(#p1 > 0, "name must not be an empty string")
	local var1 = typeof(p2)
	assert(if var1 ~= "string" then var1 == "userdata" else true, string.format("%s '%s' must be a string or userdata but is a %s", "initialState", tostring(p2), var1))
	assert(if p3 ~= nil then typeof(p3) == "table" else true, "initialContext must be a table or nil")
	assert(typeof(p4) == "table", "transitionTable must be a table")
	assert(typeof(p4[p2]) == "table", "initialState must be present in transitionTable")
	local t_1 = {}
	setmetatable(t_1, t)
	t_1.name = p1
	t_1.currentState = p2
	t_1.currentContext = p3 or {}
	t_1.transitionTable = {}
	t_1.events = {}
	
	for i, v in pairs(p4) do
		local var2 = typeof(i)
		assert(if var2 ~= "string" then var2 == "userdata" else true, string.format("%s '%s' must be a string or userdata but is a %s", "state", tostring(i), var2))
		assert(typeof(v) == "table", string.format("state '%s' must map to a table", tostring(i)))
		local t_2 = {}
		
		for i_1, v_1 in pairs(v) do
			local var3 = typeof(i_1)
			assert(if var3 ~= "string" then var3 == "userdata" else true, string.format("%s '%s' must be a string or userdata but is a %s", "event", tostring(i_1), var3))
			assert(typeof(v_1) == "table", string.format("event '%s' must map to a table", tostring(i_1)))
			local nextState = v_1.nextState
			local action = v_1.action
			
			if nextState ~= nil then
				local var4 = typeof(nextState)
				assert(if var4 ~= "string" then var4 == "userdata" else true, string.format("%s '%s' must be a string or userdata but is a %s", "nextState", tostring(nextState), var4))
				assert(p4[nextState] ~= nil, string.format("nextState '%s' does not exist in transitionTable", tostring(nextState)))
			end
			assert(if action ~= nil then typeof(action) == "function" else true, "action must be a function")
			t_2[i_1] = v_1
			
			if t_1.events[i_1] == nil then
				t_1.events[i_1] = function(p5)
					-- upvalues: t_1 (ref), i_1 (ref)
					return t_1:handleEvent(i_1, p5)
				end
			end
		end
		t_1.transitionTable[i] = t_2
	end
	setmetatable(t_1.events, {
		__index = function(_, p5)
			-- upvalues: t_1 (ref)
			error(string.format("'%s' is not a valid event in StateTable '%s'", tostring(p5), t_1.name), 2)
		end
	})
	
	return t_1
end

function t:handleEvent(p5, p6)
	-- upvalues: cryoModule (ref)
	local var5 = typeof(p5)
	assert(if var5 ~= "string" then var5 == "userdata" else true, string.format("%s '%s' must be a string or userdata but is a %s", "event", tostring(p5), var5))
	assert(if p6 ~= nil then typeof(p6) == "table" else true, "args must be nil or valid table")
	local currentState = self.currentState
	local var6 = self.transitionTable[currentState]
	assert(var6 ~= nil, "no transition events for current state")
	
	if var6[p5] ~= nil then
		local var7 = var6[p5]
		local nextState = var7.nextState or currentState
		local action = var7.action
		local currentContext = self.currentContext
		
		if action ~= nil then
			currentContext = cryoModule.Dictionary.join(self.currentContext, action(currentState, nextState, p6, self.currentContext) or {})
			self.currentContext = currentContext
		end
		self.currentState = nextState
		
		if self.stateChangeHandler ~= nil then
			self.stateChangeHandler(currentState, nextState, currentContext)
		end
	end
end

function t:onStateChange(p5)
	assert(if p5 ~= nil then typeof(p5) == "function" else true, "stateChangeHandler must be nil or a function")
	self.stateChangeHandler = p5
end

return t