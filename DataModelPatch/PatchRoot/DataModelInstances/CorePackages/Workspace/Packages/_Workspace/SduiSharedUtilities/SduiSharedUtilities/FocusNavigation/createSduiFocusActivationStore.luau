local AppCommonLibModule = require(script:FindFirstAncestor("SduiSharedUtilities").Parent.AppCommonLib)

return function()
	-- upvalues: AppCommonLibModule (copy)
	local self = setmetatable({}, { __mode = "v" })
	
	return {
		register = function(Key, p1)
			-- upvalues: self (copy), AppCommonLibModule (upval)
			local SelfEntry = self[Key]
			
			if SelfEntry == nil then
				SelfEntry = AppCommonLibModule.Signal.new()
				self[Key] = SelfEntry
			end
			local Connection = SelfEntry:connect(p1)
			
			return function()
				-- upvalues: Connection (copy)
				Connection.disconnect()
			end
		end,
		activate = function(p1)
			-- upvalues: self (copy)
			local SelfEntry = self[p1]
			
			if SelfEntry then
				SelfEntry:fire()
			end
		end
	}
end