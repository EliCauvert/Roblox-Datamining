local MarketplaceService = game:GetService("MarketplaceService")
local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local PromiseModule = require(InExperienceShop.Parent.Promise)
local _ = require(InExperienceShop.Types)

return {
	getPassOwnership = function(p1, p2) --[[ Line: 12 ]]
		-- upvalues: PromiseModule (copy), MarketplaceService (copy)
		return PromiseModule.new(function(Callback1, Callback) --[[ Line: 13 ]]
			-- upvalues: MarketplaceService (upval), p1 (copy), p2 (copy)
			task.spawn(function() --[[ Line: 14 ]]
				-- upvalues: MarketplaceService (upval), p1 (upval), p2 (upval), Callback (copy), Callback1 (copy)
				local Success, Result = pcall(function() --[[ Line: 15 ]]
					-- upvalues: MarketplaceService (upval), p1 (upval), p2 (upval)
					return MarketplaceService:GetPassOwnershipAsync(p1, p2)
				end)
				
				if Success then
					Callback1(if typeof(Result) == "table" then {
						Owned = Result.Owned == true,
						Active = Result.Active == true,
						StartTime = Result.StartTime,
						EndTime = Result.EndTime
					} else nil)
					
					return
				else
					Callback((tostring(Result)))
				end
			end)
		end)
	end
}