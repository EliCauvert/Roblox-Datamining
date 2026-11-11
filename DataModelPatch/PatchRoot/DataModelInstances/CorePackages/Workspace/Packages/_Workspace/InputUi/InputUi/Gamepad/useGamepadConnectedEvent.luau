local ReactModule = require(script:FindFirstAncestor("InputUi").Parent.React)
local MemStorageService = game:GetService("MemStorageService")

return function(Callback1, Callback)
	-- upvalues: ReactModule (copy), MemStorageService (copy)
	ReactModule.useEffect(function()
		-- upvalues: MemStorageService (upval), Callback (copy), Callback1 (copy)
		local ActiveGamepadConnected = MemStorageService:BindAndFire("ActiveGamepadConnected", function(p1)
			-- upvalues: Callback (upval), Callback1 (upval)
			if p1 == "false" then
				Callback()
				
				return
			else
				Callback1()
			end
		end)
		
		return function()
			-- upvalues: ActiveGamepadConnected (copy)
			ActiveGamepadConnected:Disconnect()
		end
	end, { Callback1, Callback })
end