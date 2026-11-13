local _ = require("./types")
local _ = require("./input_types")
local self = setmetatable({}, { __mode = "k" })
local self1 = setmetatable({}, { __mode = "k" })
local self2 = setmetatable({}, { __mode = "k" })
local self3 = setmetatable({}, { __mode = "k" })
local ActivationModule = {
	provideEdit = function(Key, p1)
		-- upvalues: self (copy)
		self[Key] = p1
		
		return function()
			-- upvalues: self (upval), Key (copy)
			self[Key] = nil
		end
	end,
	edits = function(Object)
		-- upvalues: self (copy)
		local List = {}
		
		if self[Object] then
			table.insert(List, self[Object])
		end
		for _, descendant in Object:GetDescendants() do
			if self[descendant] then
				table.insert(List, self[descendant])
			end
		end
		return List
	end,
	mark = function(Key)
		-- upvalues: self1 (copy)
		if self1[Key] == nil then
			self1[Key] = {}
		end
	end,
	marked = function(p1): boolean
		-- upvalues: self1 (copy)
		return self1[p1] ~= nil
	end,
	listen = function(Key, Value)
		-- upvalues: self1 (copy)
		local SelfEntry = self1[Key]
		
		if SelfEntry == nil then
			SelfEntry = {}
			self1[Key] = SelfEntry
		end
		table.insert(SelfEntry, Value)
		
		return function()
			-- upvalues: self1 (upval), Key (copy), Value (copy)
			local SelfEntry = self1[Key]
			
			if SelfEntry then
				local FoundIndex: number? = table.find(SelfEntry, Value)
				
				if FoundIndex then
					table.remove(SelfEntry, FoundIndex)
				end
			end
		end
	end,
	intercept = function(Key, Value)
		-- upvalues: self2 (copy)
		local SelfEntry = self2[Key] or {}
		self2[Key] = SelfEntry
		table.insert(SelfEntry, Value)
		
		return function()
			-- upvalues: SelfEntry (copy), Value (copy)
			local FoundIndex: number? = table.find(SelfEntry, Value)
			
			if FoundIndex then
				table.remove(SelfEntry, FoundIndex)
			end
		end
	end,
	intercepted = function(p1, p2): boolean
		-- upvalues: self2 (copy)
		local SelfEntry = self2[p1]
		
		if SelfEntry then
			for i = #SelfEntry, 1, -1 do
				if SelfEntry[i](p2) then
					return true
				end
			end
		end
		return false
	end,
	offer = function(Key, p3)
		-- upvalues: self3 (copy)
		self3[Key] = p3
	end,
	withdraw = function(Key, p3)
		-- upvalues: self3 (copy)
		if self3[Key] == p3 then
			self3[Key] = nil
		end
	end
}

function ActivationModule.provide(Key, p3)
	-- upvalues: self3 (copy), ActivationModule (copy)
	self3[Key] = p3
	
	return function()
		-- upvalues: ActivationModule (upval), Key (copy), p3 (copy)
		ActivationModule.withdraw(Key, p3)
	end
end

function ActivationModule.trigger(p3, p4, p5): boolean
	-- upvalues: self3 (copy)
	local SelfEntry: (any, any) -> () = self3[p3]
	
	if SelfEntry == nil then
		return false
	else
		SelfEntry(p4, p5)
		
		return true
	end
end

function ActivationModule.notify(p3, p4, p5)
	-- upvalues: self1 (copy)
	local SelfEntry = self1[p3]
	
	if SelfEntry == nil then return end
	for _, value in table.clone(SelfEntry) do
		value(p4, p5)
	end
end

local self4 = setmetatable({}, { __mode = "k" })

function ActivationModule.consume(Key)
	-- upvalues: self4 (copy)
	if Key ~= nil then
		self4[Key] = true
	end
end

function ActivationModule.release(Key)
	-- upvalues: self4 (copy)
	if Key ~= nil then
		self4[Key] = nil
	end
end

function ActivationModule.consumed(p6): boolean
	-- upvalues: self4 (copy)
	return p6 ~= nil and self4[p6] == true
end

local self5 = setmetatable({}, { __mode = "k" })

function ActivationModule.providePress(Key, p6)
	-- upvalues: self5 (copy)
	self5[Key] = p6
	
	return function()
		-- upvalues: self5 (upval), Key (copy), p6 (copy)
		if self5[Key] == p6 then
			self5[Key] = nil
		end
	end
end

function ActivationModule.pressable(p6): boolean
	-- upvalues: self5 (copy)
	return self5[p6] ~= nil
end

function ActivationModule.press(p6, p7)
	-- upvalues: self5 (copy)
	local SelfEntry: (any) -> () = self5[p6]
	
	if SelfEntry then
		SelfEntry(p7)
	end
end

local self6 = setmetatable({}, { __mode = "k" })

function ActivationModule.provideDrag(Key, p6)
	-- upvalues: self6 (copy)
	self6[Key] = p6
	
	return function()
		-- upvalues: self6 (upval), Key (copy)
		self6[Key] = nil
	end
end

function ActivationModule.drag(p6, p7, p8)
	-- upvalues: self6 (copy)
	local SelfEntry = nil
	while p6 do
		SelfEntry = self6[p6]
		
		if SelfEntry then
			return SelfEntry(p7, p8)
		end
		p6 = p6.Parent
	end
	return false
end

return ActivationModule