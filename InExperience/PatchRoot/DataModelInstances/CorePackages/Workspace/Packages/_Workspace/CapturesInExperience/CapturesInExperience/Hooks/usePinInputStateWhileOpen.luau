local UserInputService = game:GetService("UserInputService")
local ReactModule = require(script.Parent.Parent.Parent.React)
local Default = Enum.MouseBehavior.Default

return function(p1, p2)
	-- upvalues: ReactModule (copy), UserInputService (copy), Default (copy)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), p2 (copy), UserInputService (upval), Default (upval)
		if not p1 then return end
		local UserInputService1 = if p2 == nil then UserInputService else p2
		local config = {
			MouseBehavior = UserInputService1.MouseBehavior,
			MouseIconEnabled = UserInputService1.MouseIconEnabled,
			MouseIcon = UserInputService1.MouseIcon
		}
		
		local function _(Key, p3)
			-- upvalues: UserInputService1 (copy)
			UserInputService1[Key] = p3
		end
		
		UserInputService1.MouseBehavior = Default
		UserInputService1.MouseIconEnabled = true
		UserInputService1.MouseIcon = ""
		local PropertyName = "MouseBehavior"
		local Connection = UserInputService1:GetPropertyChangedSignal("MouseBehavior"):Connect(function()
			-- upvalues: UserInputService1 (copy), PropertyName (copy), Default (copy), config (copy)
			local UserInputServiceEntry = UserInputService1[PropertyName]
			
			if UserInputServiceEntry ~= Default then
				config[PropertyName] = UserInputServiceEntry
				UserInputService1[PropertyName] = Default
			end
		end)
		local PropertyName1 = "MouseIconEnabled"
		local v1 = true
		local Connections = {
			Connection,
			UserInputService1:GetPropertyChangedSignal("MouseIconEnabled"):Connect(function()
				-- upvalues: UserInputService1 (copy), PropertyName1 (copy), v1 (copy), config (copy)
				local UserInputServiceEntry = UserInputService1[PropertyName1]
				
				if UserInputServiceEntry ~= v1 then
					config[PropertyName1] = UserInputServiceEntry
					UserInputService1[PropertyName1] = v1
				end
			end),
			(function(PropertyName, p3)
				-- upvalues: UserInputService1 (copy), config (copy)
				return UserInputService1:GetPropertyChangedSignal(PropertyName):Connect(function()
					-- upvalues: UserInputService1 (upval), PropertyName (copy), p3 (copy), config (upval)
					local UserInputServiceEntry = UserInputService1[PropertyName]
					
					if UserInputServiceEntry ~= p3 then
						config[PropertyName] = UserInputServiceEntry
						UserInputService1[PropertyName] = p3
					end
				end)
			end)("MouseIcon", "")
		}
		
		return function()
			-- upvalues: Connections (copy), UserInputService1 (copy), config (copy)
			for _, connection in Connections do
				connection:Disconnect()
			end
			UserInputService1.MouseBehavior = config.MouseBehavior
			UserInputService1.MouseIconEnabled = config.MouseIconEnabled
			UserInputService1.MouseIcon = config.MouseIcon
		end
	end, { p1, p2 })
end