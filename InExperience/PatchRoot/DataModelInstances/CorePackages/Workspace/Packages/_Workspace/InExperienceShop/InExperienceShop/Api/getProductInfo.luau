local marketplaceService = game:GetService("MarketplaceService")
local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local promiseModule = require(inExperienceShop.Parent.Promise)
local errorsModule = require(script.Parent.Errors)
local shopDebugLoggerModule = require(inExperienceShop.Internal.ShopDebugLogger)

return function(p1, p2)
	-- upvalues: promiseModule (ref), shopDebugLoggerModule (ref), marketplaceService (ref), errorsModule (ref)
	return promiseModule.new(function(p3, p4)
		-- upvalues: shopDebugLoggerModule (copy), p1 (ref), p2 (ref), marketplaceService (copy), errorsModule (copy)
		task.spawn(function()
			-- upvalues: shopDebugLoggerModule (copy), p1 (copy), p2 (copy), marketplaceService (copy), p3 (ref), p4 (ref), errorsModule (copy)
			shopDebugLoggerModule.logLazy(function()
				-- upvalues: p1 (copy), p2 (copy)
				return "getProductInfo: call id=" .. p0 .. " infoType=" .. tostring(p2)
			end)
			local var1 = shopDebugLoggerModule.startTimer()
			local ok, status = pcall(function()
				-- upvalues: marketplaceService (copy), p1 (copy), p2 (copy)
				return marketplaceService:GetProductInfoAsync(p1, p2)
			end)
			
			if ok then
				shopDebugLoggerModule.logElapsedLazy(function()
					-- upvalues: p1 (copy)
					return "getProductInfo: success id=" .. p0
				end, var1)
				p3(status)
				
				return
			end
			shopDebugLoggerModule.logElapsedLazy(function()
				-- upvalues: p1 (copy)
				return "getProductInfo: error id=" .. p0
			end, var1)
			shopDebugLoggerModule.logLazy(function()
				-- upvalues: status (ref)
				return "getProductInfo: error detail=" .. tostring(status)
			end)
			p4(errorsModule.engineError("getProductInfo: GetProductInfoAsync raised", status))
		end)
	end)
end