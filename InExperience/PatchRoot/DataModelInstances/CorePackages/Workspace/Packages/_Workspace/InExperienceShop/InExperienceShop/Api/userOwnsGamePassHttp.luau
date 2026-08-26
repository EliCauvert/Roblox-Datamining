local httpRbxApiService = game:GetService("HttpRbxApiService")
local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local promiseModule = require(parent.Promise)
local url = require(parent.Http).Url
local errorsModule = require(script.Parent.Errors)
local shopDebugLoggerModule = require(inExperienceShop.Internal.ShopDebugLogger)
local text = url.APIS_URL .. "game-passes/v1/game-passes:batchGetOwnership"

return function(p1)
	-- upvalues: promiseModule (ref), playersService (ref), errorsModule (ref), shopDebugLoggerModule (ref), httpRbxApiService (ref), text (ref), httpService (ref)
	return promiseModule.new(function(p2, p3)
		-- upvalues: playersService (copy), errorsModule (copy), p1 (ref), shopDebugLoggerModule (copy), httpRbxApiService (copy), text (copy), httpService (copy)
		task.spawn(function()
			-- upvalues: playersService (copy), p3 (ref), errorsModule (copy), p1 (copy), shopDebugLoggerModule (copy), httpRbxApiService (copy), text (copy), httpService (copy), p2 (ref)
			local localPlayer = playersService.LocalPlayer
			
			if localPlayer == nil then
				p3(errorsModule.engineError("userOwnsGamePassHttp: no LocalPlayer"))
				
				return
			end
			local userId = localPlayer.UserId
			local t = {
				ownershipIdentifiers = { { userId = userId, gamePassId = p1 } }
			}
			shopDebugLoggerModule.logLazy(function()
				-- upvalues: p1 (copy), userId (ref)
				return "userOwnsGamePassHttp: POST gamePassId=" .. p0 .. " userId=" .. userId
			end)
			local var1 = shopDebugLoggerModule.startTimer()
			local ok, status = pcall(function()
				-- upvalues: httpRbxApiService (copy), text (copy), httpService (copy), t (ref)
				return httpRbxApiService:PostAsyncFullUrl(text, httpService:JSONEncode(t))
			end)
			
			if not ok then
				shopDebugLoggerModule.logElapsed("userOwnsGamePassHttp: HTTP error", var1)
				shopDebugLoggerModule.logLazy(function()
					-- upvalues: status (ref)
					return "userOwnsGamePassHttp: HTTP error detail=" .. tostring(status)
				end)
				p3(errorsModule.networkError("userOwnsGamePassHttp: HTTP request failed", status))
				
				return
			end
			shopDebugLoggerModule.logElapsed("userOwnsGamePassHttp: HTTP response received", var1)
			local ok_1, status_1 = pcall(function()
				-- upvalues: httpService (copy), status (ref)
				return httpService:JSONDecode(status)
			end)
			
			if not ok_1 then
				shopDebugLoggerModule.logLazy(function()
					-- upvalues: status_1 (ref)
					return "userOwnsGamePassHttp: JSON parse error=" .. tostring(status_1)
				end)
				p3(errorsModule.parseError("userOwnsGamePassHttp: response body is not valid JSON", status_1))
				
				return
			elseif typeof(status_1) ~= "table" or typeof(status_1.ownershipIdentifiers) ~= "table" then
				shopDebugLoggerModule.log("userOwnsGamePassHttp: schema error, missing ownershipIdentifiers")
				p3(errorsModule.schemaError("userOwnsGamePassHttp: malformed response, expected { ownershipIdentifiers = ... }", status_1))
				
				return
			end
			for i, v in status_1.ownershipIdentifiers do
				if typeof(v) == "table" and v.userId == userId and v.gamePassId == p1 then
					shopDebugLoggerModule.logLazy(function()
						-- upvalues: p1 (copy)
						return "userOwnsGamePassHttp: owns=true gamePassId=" .. p0
					end)
					p2(true)
					
					return
				end
			end
			shopDebugLoggerModule.logLazy(function()
				-- upvalues: p1 (copy)
				return "userOwnsGamePassHttp: owns=false gamePassId=" .. p0
			end)
			p2(false)
		end)
	end)
end