local marketplaceService = game:GetService("MarketplaceService")
local playersService = game:GetService("Players")
local promiseModule = require(script:FindFirstAncestor("InExperienceShop").Parent.Promise)

return function(p1)
	-- upvalues: promiseModule (ref), playersService (ref), marketplaceService (ref)
	return promiseModule.new(function(p2, p3)
		-- upvalues: playersService (copy), marketplaceService (copy), p1 (ref)
		task.spawn(function()
			-- upvalues: playersService (copy), p3 (ref), marketplaceService (copy), p1 (copy), p2 (ref)
			local localPlayer = playersService.LocalPlayer
			
			if localPlayer == nil then
				p3("userOwnsGamePass: no LocalPlayer")
				
				return
			end
			local ok, status = pcall(function()
				-- upvalues: marketplaceService (copy), localPlayer (ref), p1 (copy)
				return marketplaceService:UserOwnsGamePassAsync(localPlayer.UserId, p1)
			end)
			
			if ok then
				p2(status == true)
				
				return
			end
			p3(tostring(status))
		end)
	end)
end