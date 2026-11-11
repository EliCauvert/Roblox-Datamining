local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local PromiseModule = require(script:FindFirstAncestor("InExperienceShop").Parent.Promise)

return function(GamePassId)
	-- upvalues: PromiseModule (copy), Players (copy), MarketplaceService (copy)
	return PromiseModule.new(function(Callback1, Callback)
		-- upvalues: Players (upval), MarketplaceService (upval), GamePassId (copy)
		task.spawn(function()
			-- upvalues: Players (upval), Callback (copy), MarketplaceService (upval), GamePassId (upval), Callback1 (copy)
			local LocalPlayer = Players.LocalPlayer
			
			if LocalPlayer == nil then
				Callback("userOwnsGamePass: no LocalPlayer")
				
				return
			end
			local Success, Result = pcall(function()
				-- upvalues: MarketplaceService (upval), LocalPlayer (copy), GamePassId (upval)
				return MarketplaceService:UserOwnsGamePassAsync(LocalPlayer.UserId, GamePassId)
			end)
			
			if Success then
				Callback1(Result == true)
				
				return
			else
				Callback((tostring(Result)))
			end
		end)
	end)
end