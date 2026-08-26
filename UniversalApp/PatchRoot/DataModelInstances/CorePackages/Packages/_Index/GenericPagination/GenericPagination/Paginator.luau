local dependenciesModule = require(script.Parent.dependencies)
local t = dependenciesModule.t
local linkedList = dependenciesModule.LinkedList
local promise = dependenciesModule.Promise
local t_1 = { llRoot = nil, llIndex = nil, _isFetching = false }
t_1.__index = t_1
local var1 = t.strictInterface({
	pageSize = t.number,
	fetchWithCursor = t.callback,
	fetchInit = t.callback
})

function t_1.new(p1)
	-- upvalues: var1 (ref), t_1 (ref)
	assert(var1(p1))
	local t = {}
	
	for i, v in pairs(p1) do
		t[i] = v
	end
	setmetatable(t, t_1)
	t:_init()
	
	return t
end

function t_1:_init()
	-- upvalues: linkedList (ref)
	self._isFetching = true
	
	return self.fetchInit():andThen(function(p2, p3)
		-- upvalues: self (ref), linkedList (copy)
		self.llRoot = linkedList.createNode()
		self.llIndex = self.llRoot
		self.llIndex:CreatePrevious(p2)
		self.llIndex:CreateNext(p3)
		self._isFetching = false
	end)
end

function t_1:getCurrent()
	return self.llIndex.value or {}
end

function t_1:getNext()
	-- upvalues: promise (ref)
	if self._isFetching then
		return promise.reject("Paginator is currently busy. Please wait.")
	end
	local value = self.llIndex.next.value or ""
	
	if value == "" then
		return promise.reject("Next cursor is invalid")
	end
	self.llIndex = self.llIndex.next
	self._isFetching = true
	
	return self.fetchWithCursor(value):andThen(function(p2, p3)
		-- upvalues: self (ref)
		self.llIndex.previous.value = p2
		
		if self.llIndex.next then
			self.llIndex.next.value = p3
		else
			self.llIndex:CreateNext(p3)
		end
		self._isFetching = false
	end)
end

function t_1:getPrevious()
	-- upvalues: promise (ref)
	if self._isFetching then
		return promise.reject("Paginator is currently busy. Please wait.")
	end
	local value = self.llIndex.previous.value or ""
	
	if value == "" then
		return promise.reject("Previous cursor is invalid")
	end
	self.llIndex = self.llIndex.previous
	self._isFetching = true
	
	return self.fetchWithCursor(value, true):andThen(function(p2, p3)
		-- upvalues: self (ref)
		self.llIndex.next.value = p3
		
		if self.llIndex.previous then
			self.llIndex.previous.value = p2
		else
			self.llIndex:CreatePrevious(p2)
		end
		self._isFetching = false
	end)
end

function t_1:isFetching()
	return self._isFetching
end

return t_1