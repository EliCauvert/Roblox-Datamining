local HttpService = game:GetService("HttpService")
local RealtimeDelivery = script:FindFirstAncestor("RealtimeDelivery")
local HttpClientModule = require(RealtimeDelivery.Parent.HttpClient)
local UrlBase = require(RealtimeDelivery.Parent.UrlBuilder).UrlBase
local _ = require(script.Parent.RealtimeTypes)
local TopicSourceModule = require(script.Parent.TopicSource)
local TopicEventReceiverModule = {}
TopicEventReceiverModule.__index = TopicEventReceiverModule
local config = { disconnect = function() end }

local function _(Text: string)
	if type(Text) == "string" then
		local Match: string? = string.match(Text, "^([^%.]+)%.")
		
		return if Match == nil or string.find(Match, "!", 1, true) == nil then nil else Match
	else
		return nil
	end
end

local _ = function(p1)
	-- upvalues: HttpService (copy)
	if p1 == "" then
		return {}
	else
		local Success, Result = pcall(HttpService.JSONDecode, HttpService, p1)
		
		return if Success then Result else nil
	end
end

local function requestExchange(Token, Network)
	-- upvalues: HttpClientModule (copy), UrlBase (copy)
	return HttpClientModule.asPromise(HttpClientModule.fetch({
		method = "POST",
		analyticsKey = "RealtimeDelivery.TopicTokenExchange",
		url = UrlBase.APIS .. "/topic-token-exchange-service/v1/exchange",
		body = { token = Token },
		network = Network,
		decode = function(p1)
			return p1
		end
	}))
end

local _ = function(p1, p2, p3)
	local Success, Result = pcall(p2.callback, p3)
	
	if not Success then
		warn(`TopicEventReceiver: a callback for {p1} failed: {Result}`)
	end
end

local _ = function(p4, p5, p6)
	local OnError = p5.onError
	
	if OnError == nil then return end
	local Success, Result = pcall(OnError, p6)
	
	if not Success then
		warn(`TopicEventReceiver: an error handler for {p4} failed: {Result}`)
	end
end

function TopicEventReceiverModule.new(p7, p8)
	-- upvalues: TopicSourceModule (copy), TopicEventReceiverModule (copy)
	return (setmetatable({
		_source = TopicSourceModule.new(p7),
		_topics = {},
		_network = if p8 then p8.network else nil
	}, TopicEventReceiverModule))
end

function TopicEventReceiverModule:observeTopic(Text: string, Callback, p7)
	-- upvalues: config (copy)
	assert(type(Callback) == "function", "Expected a topic callback")
	local v1 = nil
	
	if type(Text) == "string" then
		local Match: string? = string.match(Text, "^([^%.]+)%.")
		v1 = if Match == nil or string.find(Match, "!", 1, true) == nil then nil else Match
	else
		v1 = nil
	end
	if v1 == nil then
		warn("TopicEventReceiver: ignoring a malformed topic token")
		
		return config
	end
	if next(self._topics) == nil then
		self:_startListening()
	end
	local TrackTokenResult, TrackTokenResult2 = self:_trackToken(v1, Text)
	local config1 = {
		callback = Callback,
		onError = if p7 then p7.onError else nil
	}
	table.insert(TrackTokenResult.observers, config1)
	self._source:subscribe(TrackTokenResult.token, TrackTokenResult2)
	
	return {
		disconnect = function()
			-- upvalues: self (copy), v1 (copy), TrackTokenResult (copy), config1 (copy)
			self:_removeObserver(v1, TrackTokenResult, config1)
		end
	}
end

function TopicEventReceiverModule:_startListening()
	self._source:startListening({
		onNotification = function(p7, p8)
			-- upvalues: self (copy)
			self:_dispatch(p7, p8)
		end,
		onConnected = function()
			-- upvalues: self (copy)
			self:_resubscribeAll()
		end,
		onTokenExpiry = function(p7, ShouldExchange, p8, p9)
			-- upvalues: self (copy)
			self:_onTokenExpiry(p7, ShouldExchange, p8, p9)
		end,
		onSubscriptionError = function(p7, ErrorCode, ShouldRetry)
			-- upvalues: self (copy)
			self:_onSubscriptionError(p7, ErrorCode, ShouldRetry)
		end
	})
end

function TopicEventReceiverModule:_trackToken(p7, Token)
	local Topic = self._topics[p7]
	
	if Topic == nil then
		Topic = { token = Token, observers = {} }
		self._topics[p7] = Topic
		
		return Topic, nil
	elseif Topic.token == Token then
		return Topic, nil
	else
		local Token1 = Topic.token
		Topic.token = Token
		Topic.previousToken = Token1
		
		return Topic, Token1
	end
end

function TopicEventReceiverModule:_removeObserver(p7, Topic, Value)
	local FoundIndex: number? = table.find(Topic.observers, Value)
	
	if FoundIndex == nil then return end
	table.remove(Topic.observers, FoundIndex)
	
	if #Topic.observers > 0 or self._topics[p7] ~= Topic then return end
	self._topics[p7] = nil
	self._source:unsubscribe(Topic.token)
	
	if next(self._topics) == nil then
		self._source:stopListening()
	end
end

function TopicEventReceiverModule:_dispatch(p7, p8)
	-- upvalues: HttpService (copy)
	local Topic = self._topics[p7]
	
	if Topic == nil then return end
	local t = nil
	if p8 == "" then
		t = {}
	else
		local Success, Result = pcall(HttpService.JSONDecode, HttpService, p8)
		t = if Success then Result else nil
	end
	if t == nil then
		warn(`TopicEventReceiver: dropped a notification for {p7} whose detail is not valid JSON`)
		
		return
	end
	for _, value in table.clone(Topic.observers) do
		if table.find(Topic.observers, value) then
			local Success1, Result1 = pcall(value.callback, t)
			
			if not Success1 then
				warn(`TopicEventReceiver: a callback for {p7} failed: {Result1}`)
			end
		end
	end
end

function TopicEventReceiverModule:_resubscribeAll()
	for _, topic in self._topics do
		topic.previousToken = nil
		self._source:subscribe(topic.token)
	end
end

function TopicEventReceiverModule._findCurrentTopic(p9, Text: string)
	local v1 = nil
	if type(Text) == "string" then
		local Match: string? = string.match(Text, "^([^%.]+)%.")
		v1 = if Match == nil or string.find(Match, "!", 1, true) == nil then nil else Match
	else
		v1 = nil
	end
	local Topic = if v1 then p9._topics[v1] else nil
	
	if Topic == nil or Topic.token ~= Text then
		return nil, nil
	else
		return v1, Topic
	end
end

function TopicEventReceiverModule:_onTokenExpiry(p9, ShouldExchange, p10, p11)
	local CurrentTopic, CurrentTopic2 = self:_findCurrentTopic(p9)
	
	if CurrentTopic == nil or CurrentTopic2 == nil then return end
	CurrentTopic2.previousToken = nil
	
	if p10 then
		self._source:subscribe(p9)
		
		return
	end
	if not p11 then
		self:_endTopic(CurrentTopic, CurrentTopic2, { type = "expired", shouldExchange = ShouldExchange })
		
		return
	end
	if ShouldExchange then
		self:_exchange(CurrentTopic, CurrentTopic2)
	end
end

function TopicEventReceiverModule:_exchange(p9, Topic)
	-- upvalues: requestExchange (copy)
	local Token = Topic.token
	requestExchange(Token, self._network):andThen(function(Result)
		-- upvalues: self (copy), p9 (copy), Topic (copy), Token (copy)
		local Token1 = Result.token
		
		if self._topics[p9] ~= Topic or Topic.token ~= Token then return end
		if type(Token1) == "string" and Token1 ~= Token then
			Topic.token = Token1
			Topic.previousToken = Token
			self._source:subscribe(Token1, Token)
			
			return
		end
	end):catch(function(Err)
		-- upvalues: p9 (copy)
		warn(`TopicEventReceiver: token exchange for {p9} failed: {if type(Err) == "table" then Err.errorMessage else Err}`)
	end)
end

function TopicEventReceiverModule:_onSubscriptionError(p10, ErrorCode, ShouldRetry)
	local CurrentTopic, CurrentTopic2 = self:_findCurrentTopic(p10)
	
	if CurrentTopic == nil or CurrentTopic2 == nil then return end
	if CurrentTopic2.previousToken then
		CurrentTopic2.token = CurrentTopic2.previousToken
		CurrentTopic2.previousToken = nil
		
		return
	else
		self:_endTopic(CurrentTopic, CurrentTopic2, {
			type = "error",
			errorCode = ErrorCode,
			shouldRetry = ShouldRetry
		})
	end
end

function TopicEventReceiverModule:_endTopic(p10, p11, p12)
	self._topics[p10] = nil
	
	if next(self._topics) == nil then
		self._source:stopListening()
	end
	for _, value in table.clone(p11.observers) do
		if table.find(p11.observers, value) then
			local OnError = value.onError
			local NoOnError = OnError == nil
			local Result = nil
			
			if not NoOnError then
				local Success
				Success, Result = pcall(OnError, p12)
				NoOnError = Success
			end
			if not NoOnError then
				warn(`TopicEventReceiver: an error handler for {p10} failed: {Result}`)
			end
		end
	end
end

return TopicEventReceiverModule