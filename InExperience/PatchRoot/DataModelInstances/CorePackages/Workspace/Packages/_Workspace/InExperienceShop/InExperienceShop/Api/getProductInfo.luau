local marketplaceService = game:GetService("MarketplaceService")
local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local promiseModule = require(inExperienceShop.Parent.Promise)
local errorsModule = require(script.Parent.Errors)
local shopDebugLoggerModule = require(inExperienceShop.Internal.ShopDebugLogger)

return function(p0, p1) --[[ line: 20 | named "getProductInfo" ]]
	-- upvalues: promiseModule (ref), shopDebugLoggerModule (ref), marketplaceService (ref), errorsModule (ref)
	return promiseModule.new(function(p2, p3) --[[ line: 21 ]]
		-- upvalues: shopDebugLoggerModule (copy), p0 (ref), p1 (ref), marketplaceService (copy), errorsModule (copy)
		task.spawn(function() --[[ line: 22 ]]
			-- upvalues: shopDebugLoggerModule (copy), p0 (copy), p1 (copy), marketplaceService (copy), p2 (ref), p3 (ref), errorsModule (copy)
			shopDebugLoggerModule.logLazy(function() --[[ line: 23 ]]
				-- upvalues: p0 (copy), p1 (copy)
				return "getProductInfo: call id=" .. p0 .. " infoType=" .. tostring(p1)
			end)
			local var5 = shopDebugLoggerModule.startTimer()
			local ok, status = pcall(function() --[[ line: 27 ]]
				-- upvalues: marketplaceService (copy), p0 (copy), p1 (copy)
				return marketplaceService:GetProductInfoAsync(p0, p1)
			end)
			
			if ok then
				shopDebugLoggerModule.logElapsedLazy(function() --[[ line: 31 ]]
					-- upvalues: p0 (copy)
					return "getProductInfo: success id=" .. p0
				end, var5)
				p2(status)
				
				return
			end
			shopDebugLoggerModule.logElapsedLazy(function() --[[ line: 36 ]]
				-- upvalues: p0 (copy)
				return "getProductInfo: error id=" .. p0
			end, var5)
			shopDebugLoggerModule.logLazy(function() --[[ line: 39 ]]
				-- upvalues: status (ref)
				return "getProductInfo: error detail=" .. tostring(status)
			end)
			p3(errorsModule.engineError("getProductInfo: GetProductInfoAsync raised", status))
		end)
	end)
end