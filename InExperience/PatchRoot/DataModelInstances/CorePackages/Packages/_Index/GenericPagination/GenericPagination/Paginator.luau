local DependenciesModule = require(script.Parent.dependencies)
local T = DependenciesModule.t
local LinkedList = DependenciesModule.LinkedList
local Promise = DependenciesModule.Promise
local PaginatorModule = { llRoot = nil, llIndex = nil, _isFetching = false }
PaginatorModule.__index = PaginatorModule
local StrictInterfaceResult = T.strictInterface({
	pageSize = T.number,
	fetchWithCursor = T.callback,
	fetchInit = T.callback
})

function PaginatorModule.new(List)
	-- upvalues: StrictInterfaceResult (copy), PaginatorModule (copy)
	assert(StrictInterfaceResult(List))
	local t = {}
	
	for i, value in pairs(List) do
		t[i] = value
	end
	setmetatable(t, PaginatorModule)
	t:_init()
	
	return t
end

function PaginatorModule:_init()
	-- upvalues: LinkedList (copy)
	self._isFetching = true
	
	return self.fetchInit():andThen(function(Result, p1)
		-- upvalues: self (copy), LinkedList (upval)
		self.llRoot = LinkedList.createNode()
		self.llIndex = self.llRoot
		self.llIndex:CreatePrevious(Result)
		self.llIndex:CreateNext(p1)
		self._isFetching = false
	end)
end

function PaginatorModule:getCurrent()
	return self.llIndex.value or {}
end

function PaginatorModule:getNext()
	-- upvalues: Promise (copy)
	if self._isFetching then
		return Promise.reject("Paginator is currently busy. Please wait.")
	end
	local Value = self.llIndex.next.value or ""
	
	if Value == "" then
		return Promise.reject("Next cursor is invalid")
	else
		self.llIndex = self.llIndex.next
		self._isFetching = true
		
		return self.fetchWithCursor(Value):andThen(function(Result, Value)
			-- upvalues: self (copy)
			self.llIndex.previous.value = Result
			
			if self.llIndex.next then
				self.llIndex.next.value = Value
			else
				self.llIndex:CreateNext(Value)
			end
			self._isFetching = false
		end)
	end
end

function PaginatorModule:getPrevious()
	-- upvalues: Promise (copy)
	if self._isFetching then
		return Promise.reject("Paginator is currently busy. Please wait.")
	end
	local Value = self.llIndex.previous.value or ""
	
	if Value == "" then
		return Promise.reject("Previous cursor is invalid")
	else
		self.llIndex = self.llIndex.previous
		self._isFetching = true
		
		return self.fetchWithCursor(Value, true):andThen(function(Result, Value)
			-- upvalues: self (copy)
			self.llIndex.next.value = Value
			
			if self.llIndex.previous then
				self.llIndex.previous.value = Result
			else
				self.llIndex:CreatePrevious(Result)
			end
			self._isFetching = false
		end)
	end
end

function PaginatorModule:isFetching()
	return self._isFetching
end

return PaginatorModule