local cryoModule = require(script.Parent.Parent.Parent.Cryo)
local t = {}
t.__index = t

local function _(p0, p1) --[[ line: 9 | named "validateStateTableItem" ]]
	local var2 = typeof(p0)
	assert(if var2 ~= "string" then var2 == "userdata" else true, string.format("%s '%s' must be a string or userdata but is a %s", p1, tostring(p0), var2))
end

function t.new(p2, p3, p4, p5) --[[ line: 72 ]]
	-- upvalues: t (ref)
	assert(typeof(p2) == "string", "name must be a string")
	assert(#p2 > 0, "name must not be an empty string")
	local var3 = typeof(p3)
	assert(if var3 ~= "string" then var3 == "userdata" else true, string.format("%s '%s' must be a string or userdata but is a %s", "initialState", tostring(p3), var3))
	assert(if p4 ~= nil then typeof(p4) == "table" else true, "initialContext must be a table or nil")
	assert(typeof(p5) == "table", "transitionTable must be a table")
	assert(typeof(p5[p3]) == "table", "initialState must be present in transitionTable")
	local t_1 = {}
	setmetatable(t_1, t)
	t_1.name = p2
	t_1.currentState = p3
	t_1.currentContext = p4 or {}
	t_1.transitionTable = {}
	t_1.events = {}
	
	for i, v in pairs(p5) do
		local var5 = typeof(i)
		assert(if var5 ~= "string" then var5 == "userdata" else true, string.format("%s '%s' must be a string or userdata but is a %s", "state", tostring(i), var5))
		assert(typeof(v) == "table", string.format("state '%s' must map to a table", tostring(i)))
		local t_2 = {}
		
		for i_1, v_1 in pairs(v) do
			local var7 = typeof(i_1)
			assert(if var7 ~= "string" then var7 == "userdata" else true, string.format("%s '%s' must be a string or userdata but is a %s", "event", tostring(i_1), var7))
			assert(typeof(v_1) == "table", string.format("event '%s' must map to a table", tostring(i_1)))
			local nextState = v_1.nextState
			local action = v_1.action
			
			if nextState ~= nil then
				local var8 = typeof(nextState)
				assert(if var8 ~= "string" then var8 == "userdata" else true, string.format("%s '%s' must be a string or userdata but is a %s", "nextState", tostring(nextState), var8))
				assert(p5[nextState] ~= nil, string.format("nextState '%s' does not exist in transitionTable", tostring(nextState)))
			end
			assert(if action ~= nil then typeof(action) == "function" else true, "action must be a function")
			t_2[i_1] = v_1
			
			if t_1.events[i_1] == nil then
				t_1.events[i_1] = function(p6) --[[ line: 119 ]]
					-- upvalues: t_1 (ref), i_1 (ref)
					return t_1:handleEvent(i_1, p6)
				end
			end
		end
		t_1.transitionTable[i] = t_2
	end
	setmetatable(t_1.events, {
		__index = function(_, p7) --[[ line: 130 ]]
			-- upvalues: t_1 (ref)
			error(string.format("'%s' is not a valid event in StateTable '%s'", tostring(p7), t_1.name), 2)
		end
	})
	
	return t_1
end

function t:handleEvent(p8, p9) --[[ line: 150 ]]
	-- upvalues: cryoModule (ref)
	local var9 = typeof(p8)
	assert(if var9 ~= "string" then var9 == "userdata" else true, string.format("%s '%s' must be a string or userdata but is a %s", "event", tostring(p8), var9))
	assert(if p9 ~= nil then typeof(p9) == "table" else true, "args must be nil or valid table")
	local currentState = self.currentState
	local var10 = self.transitionTable[currentState]
	assert(var10 ~= nil, "no transition events for current state")
	
	if var10[p8] ~= nil then
		local var11 = var10[p8]
		local nextState = var11.nextState or currentState
		local action = var11.action
		local currentContext = self.currentContext
		
		if action ~= nil then
			currentContext = cryoModule.Dictionary.join(self.currentContext, action(currentState, nextState, p9, self.currentContext) or {})
			self.currentContext = currentContext
		end
		self.currentState = nextState
		
		if self.stateChangeHandler ~= nil then
			self.stateChangeHandler(currentState, nextState, currentContext)
		end
	end
end

function t:onStateChange(p10) --[[ line: 191 ]]
	assert(if p10 ~= nil then typeof(p10) == "function" else true, "stateChangeHandler must be nil or a function")
	self.stateChangeHandler = p10
end

return t