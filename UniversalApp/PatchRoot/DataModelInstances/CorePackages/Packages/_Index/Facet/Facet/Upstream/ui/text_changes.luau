local _ = require("./types")
local self = setmetatable({}, { __mode = "k" })

return function(p1, Key, p2, Callback)
	-- upvalues: self (copy)
	local SelfEntry = self[Key]
	
	if SelfEntry == nil then
		local config = { listeners = {}, order = {} }
		config.connection = Key.Changed:Connect(function(p3)
			-- upvalues: config (copy)
			if p3 == "AbsolutePosition" then return end
			local Listeners = config.listeners
			
			for _, value in config.order do
				if Listeners[value] then
					value(p3)
				end
			end
		end)
		SelfEntry = config
		self[Key] = SelfEntry
	end
	local SelfEntry1 = SelfEntry
	
	if not SelfEntry1.listeners[p2] then
		SelfEntry1.listeners[p2] = true
		local Copy = table.clone(SelfEntry1.order)
		table.insert(Copy, p2)
		SelfEntry1.order = Copy
	end
	return p1.Compose.cleanup(function()
		-- upvalues: SelfEntry1 (copy), p2 (copy), self (upval), Key (copy), Callback (copy)
		if SelfEntry1.listeners[p2] then
			SelfEntry1.listeners[p2] = nil
			local Order = {}
			
			for _, value in SelfEntry1.order do
				if value ~= p2 then
					table.insert(Order, value)
				end
			end
			SelfEntry1.order = Order
		end
		if next(SelfEntry1.listeners) == nil then
			if SelfEntry1.connection then
				SelfEntry1.connection:Disconnect()
			end
			self[Key] = nil
		end
		if Callback then
			Callback()
		end
	end)
end