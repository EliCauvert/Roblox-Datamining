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

return function(p0) --[[ line: 24 | named "userOwnsGamePassHttp" ]]
	-- upvalues: promiseModule (ref), playersService (ref), errorsModule (ref), shopDebugLoggerModule (ref), httpRbxApiService (ref), text (ref), httpService (ref)
	return promiseModule.new(function(p1, p2) --[[ line: 25 ]]
		-- upvalues: playersService (copy), errorsModule (copy), p0 (ref), shopDebugLoggerModule (copy), httpRbxApiService (copy), text (copy), httpService (copy)
		task.spawn(function() --[[ line: 26 ]]
			-- upvalues: playersService (copy), p2 (ref), errorsModule (copy), p0 (copy), shopDebugLoggerModule (copy), httpRbxApiService (copy), text (copy), httpService (copy), p1 (ref)
			local localPlayer = playersService.LocalPlayer
			
			if localPlayer == nil then
				p2(errorsModule.engineError("userOwnsGamePassHttp: no LocalPlayer"))
				
				return
			end
			local userId = localPlayer.UserId
			local t = {
				ownershipIdentifiers = { { userId = userId, gamePassId = p0 } }
			}
			shopDebugLoggerModule.logLazy(function() --[[ line: 43 ]]
				-- upvalues: p0 (copy), userId (ref)
				return "userOwnsGamePassHttp: POST gamePassId=" .. p0 .. " userId=" .. userId
			end)
			local var9 = shopDebugLoggerModule.startTimer()
			local ok, status = pcall(function() --[[ line: 48 ]]
				-- upvalues: httpRbxApiService (copy), text (copy), httpService (copy), t (ref)
				return httpRbxApiService:PostAsyncFullUrl(text, httpService:JSONEncode(t))
			end)
			
			if not ok then
				shopDebugLoggerModule.logElapsed("userOwnsGamePassHttp: HTTP error", var9)
				shopDebugLoggerModule.logLazy(function() --[[ line: 53 ]]
					-- upvalues: status (ref)
					return "userOwnsGamePassHttp: HTTP error detail=" .. tostring(status)
				end)
				p2(errorsModule.networkError("userOwnsGamePassHttp: HTTP request failed", status))
				
				return
			end
			shopDebugLoggerModule.logElapsed("userOwnsGamePassHttp: HTTP response received", var9)
			local ok_1, status_1 = pcall(function() --[[ line: 62 ]]
				-- upvalues: httpService (copy), status (ref)
				return httpService:JSONDecode(status)
			end)
			
			if not ok_1 then
				shopDebugLoggerModule.logLazy(function() --[[ line: 66 ]]
					-- upvalues: status_1 (ref)
					return "userOwnsGamePassHttp: JSON parse error=" .. tostring(status_1)
				end)
				p2(errorsModule.parseError("userOwnsGamePassHttp: response body is not valid JSON", status_1))
				
				return
			elseif typeof(status_1) ~= "table" or typeof(status_1.ownershipIdentifiers) ~= "table" then
				shopDebugLoggerModule.log("userOwnsGamePassHttp: schema error, missing ownershipIdentifiers")
				p2(errorsModule.schemaError("userOwnsGamePassHttp: malformed response, expected { ownershipIdentifiers = ... }", status_1))
				
				return
			end
			for i, v in status_1.ownershipIdentifiers do
				if typeof(v) == "table" and v.userId == userId and v.gamePassId == p0 then
					shopDebugLoggerModule.logLazy(function() --[[ line: 92 ]]
						-- upvalues: p0 (copy)
						return "userOwnsGamePassHttp: owns=true gamePassId=" .. p0
					end)
					p1(true)
					
					return
				end
			end
			shopDebugLoggerModule.logLazy(function() --[[ line: 100 ]]
				-- upvalues: p0 (copy)
				return "userOwnsGamePassHttp: owns=false gamePassId=" .. p0
			end)
			p1(false)
		end)
	end)
end