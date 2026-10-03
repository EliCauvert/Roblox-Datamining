local httpService = game:GetService("HttpService")
local topicSourceModule = require(script.Parent.TopicSource)
local t = {}
t.__index = t
local t_1 = { disconnect = function() end }

local function _(p1)
	if type(p1) ~= "string" then
		return nil
	end
	local match = string.match(p1, "^([^%.]+)%.")
	
	return if match == nil or string.find(match, "!", 1, true) == nil then nil else match
end

local _ = function(p1)
	-- upvalues: httpService (ref)
	if p1 == "" then
		return {}
	end
	local ok, status = pcall(httpService.JSONDecode, httpService, p1)
	
	return if ok then status else nil
end

local _ = function(p1, p2, p3)
	local ok, status = pcall(p2.callback, p3)
	
	if not ok then
		warn(`TopicEventReceiver: a callback for {p1} failed: {status}`)
	end
end

function t.new(p4)
	-- upvalues: topicSourceModule (ref), t (ref)
	return setmetatable({ _source = topicSourceModule.new(p4), _topics = {} }, t)
end

function t:observeTopic(p4, p5)
	-- upvalues: t_1 (ref)
	local var1, match
	assert(type(p5) == "function", "Expected a topic callback")
	
	if type(p4) == "string" then
		match = string.match(p4, "^([^%.]+)%.")
		var1 = if match == nil or string.find(match, "!", 1, true) == nil then nil else match
	else
		var1 = nil
	end
	if var1 == nil then
		warn("TopicEventReceiver: ignoring a malformed topic token")
		
		return t_1
	elseif next(self._topics) == nil then
		self:_startListening()
	end
	match, var7 = self:_trackToken(var1, p4)
	local t = { callback = p5 }
	table.insert(match.observers, t)
	self._source:subscribe(p4, var7)
	
	return {
		disconnect = function()
			-- upvalues: self (ref), var1 (ref), t (ref)
			self:_removeObserver(var1, t)
		end
	}
end

function t:_startListening()
	self._source:startListening(function(p4, p5)
		-- upvalues: self (ref)
		self:_dispatch(p4, p5)
	end, function()
		-- upvalues: self (ref)
		self:_resubscribeAll()
	end)
end

function t:_trackToken(p4, p5)
	local var1 = self._topics[p4]
	
	if var1 == nil then
		var1 = { token = p5, observers = {} }
		self._topics[p4] = var1
		
		return var1, nil
	elseif var1.token == p5 then
		return var1, nil
	end
	local token = var1.token
	var1.token = p5
	
	return var1, token
end

function t:_removeObserver(p4, p5)
	local var1 = self._topics[p4]
	local var2 = if var1 then table.find(var1.observers, p5) else nil
	
	if var1 == nil or var2 == nil then return end
	table.remove(var1.observers, var2)
	
	if #var1.observers > 0 then return end
	self._topics[p4] = nil
	self._source:unsubscribe(var1.token)
	
	if next(self._topics) == nil then
		self._source:stopListening()
	end
end

function t:_dispatch(p4, p5)
	-- upvalues: httpService (ref)
	local t
	local var1 = self._topics[p4]
	
	if var1 == nil then return end
	if p5 == "" then
		t = {}
	else
		local ok, status = pcall(httpService.JSONDecode, httpService, p5)
		t = if ok then status else nil
	end
	if t == nil then
		warn(`TopicEventReceiver: dropped a notification for {p4} whose detail is not valid JSON`)
		
		return
	end
	for i, v in table.clone(var1.observers) do
		if table.find(var1.observers, v) then
			local ok, status = pcall(v.callback, t)
			
			if not ok then
				warn(`TopicEventReceiver: a callback for {p4} failed: {status}`)
			end
		end
	end
end

function t:_resubscribeAll()
	for i, v in self._topics do
		self._source:subscribe(v.token)
	end
end

return t