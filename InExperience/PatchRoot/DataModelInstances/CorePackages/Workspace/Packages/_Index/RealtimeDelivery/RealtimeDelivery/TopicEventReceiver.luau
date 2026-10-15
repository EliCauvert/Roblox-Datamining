local httpService = game:GetService("HttpService")
local _ = require(script.Parent.RealtimeTypes)
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

local _ = function(p4, p5, p6)
	local onError = p5.onError
	
	if onError == nil then return end
	local ok, status = pcall(onError, p6)
	
	if not ok then
		warn(`TopicEventReceiver: an error handler for {p4} failed: {status}`)
	end
end

function t.new(p7)
	-- upvalues: topicSourceModule (ref), t (ref)
	return setmetatable({ _source = topicSourceModule.new(p7), _topics = {} }, t)
end

function t:observeTopic(p7, p8, p9)
	-- upvalues: t_1 (ref)
	local var1, match
	assert(type(p8) == "function", "Expected a topic callback")
	
	if type(p7) == "string" then
		match = string.match(p7, "^([^%.]+)%.")
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
	match, var7 = self:_trackToken(var1, p7)
	local t = {
		callback = p8,
		onError = if p9 then p9.onError else nil
	}
	table.insert(match.observers, t)
	self._source:subscribe(p7, var7)
	
	return {
		disconnect = function()
			-- upvalues: self (ref), var1 (ref), match (ref), t (ref)
			self:_removeObserver(var1, match, t)
		end
	}
end

function t:_startListening()
	self._source:startListening({
		onNotification = function(p7, p8)
			-- upvalues: self (ref)
			self:_dispatch(p7, p8)
		end,
		onConnected = function()
			-- upvalues: self (ref)
			self:_resubscribeAll()
		end,
		onTokenExpiry = function(p7, p8, p9)
			-- upvalues: self (ref)
			self:_onTokenExpiry(p7, p8, p9)
		end,
		onSubscriptionError = function(p7, p8, p9)
			-- upvalues: self (ref)
			self:_onSubscriptionError(p7, p8, p9)
		end
	})
end

function t:_trackToken(p7, p8)
	local var1 = self._topics[p7]
	
	if var1 == nil then
		var1 = { token = p8, observers = {} }
		self._topics[p7] = var1
		
		return var1, nil
	elseif var1.token == p8 then
		return var1, nil
	end
	local token = var1.token
	var1.token = p8
	var1.previousToken = token
	
	return var1, token
end

function t:_removeObserver(p7, p8, p9)
	local index = table.find(p8.observers, p9)
	
	if index == nil then return end
	table.remove(p8.observers, index)
	
	if #p8.observers > 0 or self._topics[p7] ~= p8 then return end
	self._topics[p7] = nil
	self._source:unsubscribe(p8.token)
	
	if next(self._topics) == nil then
		self._source:stopListening()
	end
end

function t:_dispatch(p7, p8)
	-- upvalues: httpService (ref)
	local t
	local var1 = self._topics[p7]
	
	if var1 == nil then return end
	if p8 == "" then
		t = {}
	else
		local ok, status = pcall(httpService.JSONDecode, httpService, p8)
		t = if ok then status else nil
	end
	if t == nil then
		warn(`TopicEventReceiver: dropped a notification for {p7} whose detail is not valid JSON`)
		
		return
	end
	for i, v in table.clone(var1.observers) do
		if table.find(var1.observers, v) then
			local ok, status = pcall(v.callback, t)
			
			if not ok then
				warn(`TopicEventReceiver: a callback for {p7} failed: {status}`)
			end
		end
	end
end

function t:_resubscribeAll()
	for i, v in self._topics do
		v.previousToken = nil
		self._source:subscribe(v.token)
	end
end

function t:_findCurrentTopic(p9)
	local var2, match
	if type(p9) == "string" then
		match = string.match(p9, "^([^%.]+)%.")
		var2 = if match == nil or string.find(match, "!", 1, true) == nil then nil else match
	else
		var2 = nil
	end
	match = if var2 then self._topics[var2] else nil
	
	if match == nil or match.token ~= p9 then
		return nil, nil
	end
	return var2, match
end

function t:_onTokenExpiry(p9, p10, p11)
	local var2, var3 = self:_findCurrentTopic(p9)
	
	if var2 == nil or var3 == nil then return end
	var3.previousToken = nil
	
	if p11 then
		self._source:subscribe(p9)
		
		return
	end
	self:_endTopic(var2, var3, { type = "expired", shouldExchange = p10 })
end

function t:_onSubscriptionError(p9, p10, p11)
	local var2, var3 = self:_findCurrentTopic(p9)
	
	if var2 == nil or var3 == nil then return end
	if var3.previousToken then
		var3.token = var3.previousToken
		var3.previousToken = nil
		
		return
	end
	self:_endTopic(var2, var3, { type = "error", errorCode = p10, shouldRetry = p11 })
end

function t:_endTopic(p9, p10, p11)
	self._topics[p9] = nil
	
	if next(self._topics) == nil then
		self._source:stopListening()
	end
	for i, v in table.clone(p10.observers) do
		if table.find(p10.observers, v) then
			local onError = v.onError
			
			if onError ~= nil then
				local ok, status = pcall(onError, p11)
				
				if not ok then
					warn(`TopicEventReceiver: an error handler for {p9} failed: {status}`)
				end
			end
		end
	end
end

return t