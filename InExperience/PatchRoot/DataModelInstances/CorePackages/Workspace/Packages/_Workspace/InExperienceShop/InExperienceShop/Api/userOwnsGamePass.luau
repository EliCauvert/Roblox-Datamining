local marketplaceService = game:GetService("MarketplaceService")
local playersService = game:GetService("Players")
local promiseModule = require(script:FindFirstAncestor("InExperienceShop").Parent.Promise)

return function(p0)
	-- upvalues: promiseModule (ref), playersService (ref), marketplaceService (ref)
	return promiseModule.new(function(p1, p2)
		-- upvalues: playersService (copy), marketplaceService (copy), p0 (ref)
		task.spawn(function()
			-- upvalues: playersService (copy), p2 (ref), marketplaceService (copy), p0 (copy), p1 (ref)
			local localPlayer = playersService.LocalPlayer
			
			if localPlayer == nil then
				p2("userOwnsGamePass: no LocalPlayer")
				
				return
			end
			local ok, status = pcall(function()
				-- upvalues: marketplaceService (copy), localPlayer (ref), p0 (copy)
				return marketplaceService:UserOwnsGamePassAsync(localPlayer.UserId, p0)
			end)
			
			if ok then
				p1(status == true)
				
				return
			end
			p2(tostring(status))
		end)
	end)
end