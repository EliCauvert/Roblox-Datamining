local _ = require("./types")
local ScrollChainModule = require("./scroll_chain")
local self = setmetatable({}, { __mode = "k" })
local self1 = setmetatable({}, { __mode = "k" })

local function take(Parent)
	-- upvalues: self (copy)
	local SelfEntry = self[Parent]
	
	if SelfEntry then
		SelfEntry.count += 1
		
		return
	end
	local config = {
		count = 1,
		saved = Parent.ScrollingEnabled,
		watch = Parent:GetPropertyChangedSignal("ScrollingEnabled"):Connect(function()
			-- upvalues: self (upval), Parent (copy)
			local SelfEntry = self[Parent]
			
			if SelfEntry and Parent.ScrollingEnabled then
				SelfEntry.saved = true
				Parent.ScrollingEnabled = false
			end
		end)
	}
	self[Parent] = config
	
	if config.saved then
		Parent.ScrollingEnabled = false
	end
end

local function _(Key)
	-- upvalues: self (copy)
	local SelfEntry = self[Key]
	
	if SelfEntry == nil then return end
	SelfEntry.count -= 1
	
	if SelfEntry.count == 0 then
		self[Key] = nil
		SelfEntry.watch:Disconnect()
		
		if Key.ScrollingEnabled ~= SelfEntry.saved then
			Key.ScrollingEnabled = SelfEntry.saved
		end
	end
end

local function holdAncestors(p1, p2)
	-- upvalues: self1 (copy), take (copy), self (copy)
	local List = {}
	local Parent = p1.Parent
	while Parent do
		if Parent:IsA("ScrollingFrame") and (not p2 or self1[Parent]) then
			take(Parent)
			table.insert(List, Parent)
		end
		Parent = Parent.Parent
	end
	return function()
		-- upvalues: List (copy), self (upval)
		for _, value in List do
			local SelfEntry = self[value]
			
			if SelfEntry ~= nil then
				SelfEntry.count -= 1
				
				if SelfEntry.count == 0 then
					self[value] = nil
					SelfEntry.watch:Disconnect()
					
					if value.ScrollingEnabled ~= SelfEntry.saved then
						value.ScrollingEnabled = SelfEntry.saved
					end
				end
			end
		end
		table.clear(List)
	end
end

return {
	own = function(Key, p3)
		-- upvalues: self1 (copy), ScrollChainModule (copy), take (copy), self (copy)
		self1[Key] = true
		
		if p3 then
			ScrollChainModule(p3, Key, function(p4): boolean
				-- upvalues: self1 (upval)
				return self1[p4] == true
			end, function(p4)
				-- upvalues: take (upval), self (upval)
				take(p4)
				
				return function()
					-- upvalues: p4 (copy), self (upval)
					local SelfEntry = self[p4]
					
					if SelfEntry == nil then return end
					SelfEntry.count -= 1
					
					if SelfEntry.count == 0 then
						self[p4] = nil
						SelfEntry.watch:Disconnect()
						
						if p4.ScrollingEnabled ~= SelfEntry.saved then
							p4.ScrollingEnabled = SelfEntry.saved
						end
					end
				end
			end)
		end
	end,
	holdOwnedAncestors = function(p3)
		-- upvalues: holdAncestors (copy)
		return (holdAncestors(p3, true))
	end,
	holdAncestors = function(p3)
		-- upvalues: holdAncestors (copy)
		return (holdAncestors(p3, false))
	end
}