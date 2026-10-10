local marketplaceService = game:GetService("MarketplaceService")
local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local promiseModule = require(inExperienceShop.Parent.Promise)
local _ = require(inExperienceShop.Types)

return {
	getPassOwnership = function(p1, p2)
		-- upvalues: promiseModule (ref), marketplaceService (ref)
		return promiseModule.new(function(p3, p4)
			-- upvalues: marketplaceService (copy), p1 (ref), p2 (ref)
			task.spawn(function()
				-- upvalues: marketplaceService (copy), p1 (copy), p2 (copy), p4 (ref), p3 (ref)
				local ok, status = pcall(function()
					-- upvalues: marketplaceService (copy), p1 (copy), p2 (copy)
					return marketplaceService:GetPassOwnershipAsync(p1, p2)
				end)
				
				if ok then
					p3(if typeof(status) == "table" then {
						Owned = status.Owned == true,
						Active = status.Active == true,
						StartTime = status.StartTime,
						EndTime = status.EndTime
					} else nil)
					
					return
				end
				p4(tostring(status))
			end)
		end)
	end
}