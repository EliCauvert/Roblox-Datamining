local reactModule = require(script:FindFirstAncestor("InputUi").Parent.React)
local memStorageService = game:GetService("MemStorageService")

return function(p1, p2)
	-- upvalues: reactModule (ref), memStorageService (ref)
	reactModule.useEffect(function()
		-- upvalues: memStorageService (copy), p2 (ref), p1 (ref)
		local activeGamepadConnected = memStorageService:BindAndFire("ActiveGamepadConnected", function(p3)
			-- upvalues: p2 (copy), p1 (copy)
			if p3 == "false" then
				p2()
				
				return
			end
			p1()
		end)
		
		return function()
			-- upvalues: activeGamepadConnected (ref)
			activeGamepadConnected:Disconnect()
		end
	end, { p1, p2 })
end