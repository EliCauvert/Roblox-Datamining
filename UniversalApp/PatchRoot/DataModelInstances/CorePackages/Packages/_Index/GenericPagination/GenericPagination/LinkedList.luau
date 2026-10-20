local LinkedListModule = {}
LinkedListModule.__index = LinkedListModule

function LinkedListModule.createNode(Value)
	-- upvalues: LinkedListModule (copy)
	local config = { previous = nil, next = nil, value = Value }
	setmetatable(config, LinkedListModule)
	
	return config
end

function LinkedListModule.CreateNext(Previous, p1)
	-- upvalues: LinkedListModule (copy)
	local Previous1 = {
		previous = Previous,
		next = Previous.next,
		value = p1 or {}
	}
	
	if Previous.next then
		Previous.next.previous = Previous1
	end
	setmetatable(Previous1, LinkedListModule)
	Previous.next = Previous1
	
	return Previous1
end

function LinkedListModule.CreatePrevious(p1, p2)
	-- upvalues: LinkedListModule (copy)
	local Previous = { previous = p1.previous, next = p1, value = p2 or {} }
	
	if p1.previous then
		p1.previous.next = Previous
	end
	setmetatable(Previous, LinkedListModule)
	p1.previous = Previous
	
	return Previous
end

return LinkedListModule