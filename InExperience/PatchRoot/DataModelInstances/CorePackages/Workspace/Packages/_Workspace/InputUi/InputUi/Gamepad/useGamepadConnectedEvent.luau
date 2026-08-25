local reactModule = require(script:FindFirstAncestor("InputUi").Parent.React)
local memStorageService = game:GetService("MemStorageService")

return function(p0, p1)
	-- upvalues: reactModule (ref), memStorageService (ref)
	reactModule.useEffect(function()
		-- upvalues: memStorageService (copy), p1 (ref), p0 (ref)
		local activeGamepadConnected = memStorageService:BindAndFire("ActiveGamepadConnected", function(p2)
			-- upvalues: p1 (copy), p0 (copy)
			if p2 == "false" then
				p1()
				
				return
			end
			p0()
		end)
		
		return function()
			-- upvalues: activeGamepadConnected (ref)
			activeGamepadConnected:Disconnect()
		end
	end, { p0, p1 })
end