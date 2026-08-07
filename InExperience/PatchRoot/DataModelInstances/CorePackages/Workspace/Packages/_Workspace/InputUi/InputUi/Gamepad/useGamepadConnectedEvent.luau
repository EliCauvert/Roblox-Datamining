local reactModule = require(script:FindFirstAncestor("InputUi").Parent.React)
local memStorageService = game:GetService("MemStorageService")

return function(p0, p1) --[[ line: 12 | named "useGamepadConnectedEvent" ]]
	-- upvalues: reactModule (ref), memStorageService (ref)
	reactModule.useEffect(function() --[[ line: 13 ]]
		-- upvalues: memStorageService (copy), p1 (ref), p0 (ref)
		local activeGamepadConnected = memStorageService:BindAndFire("ActiveGamepadConnected", function(p2) --[[ line: 14 ]]
			-- upvalues: p1 (copy), p0 (copy)
			if p2 == "false" then
				p1()
				
				return
			end
			p0()
		end)
		
		return function() --[[ line: 22 ]]
			-- upvalues: activeGamepadConnected (ref)
			activeGamepadConnected:Disconnect()
		end
	end, { p0, p1 })
end