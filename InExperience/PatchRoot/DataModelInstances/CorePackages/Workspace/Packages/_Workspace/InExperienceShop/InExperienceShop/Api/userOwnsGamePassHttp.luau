local HttpRbxApiService = game:GetService("HttpRbxApiService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local PromiseModule = require(Parent.Promise)
local ErrorsModule = require(script.Parent.Errors)
local ShopDebugLoggerModule = require(InExperienceShop.Internal.ShopDebugLogger)
local Text = require(Parent.Http).Url.APIS_URL .. "game-passes/v1/game-passes:batchGetOwnership"

return function(GamePassId) --[[ Line: 24 | Named "userOwnsGamePassHttp" ]]
	-- upvalues: PromiseModule (copy), Players (copy), ErrorsModule (copy), ShopDebugLoggerModule (copy), HttpRbxApiService (copy), Text (copy), HttpService (copy)
	return PromiseModule.new(function(Callback1, Callback) --[[ Line: 25 ]]
		-- upvalues: Players (upval), ErrorsModule (upval), GamePassId (copy), ShopDebugLoggerModule (upval), HttpRbxApiService (upval), Text (upval), HttpService (upval)
		task.spawn(function() --[[ Line: 26 ]]
			-- upvalues: Players (upval), Callback (copy), ErrorsModule (upval), GamePassId (upval), ShopDebugLoggerModule (upval), HttpRbxApiService (upval), Text (upval), HttpService (upval), Callback1 (copy)
			local LocalPlayer = Players.LocalPlayer
			
			if LocalPlayer == nil then
				Callback((ErrorsModule.engineError("userOwnsGamePassHttp: no LocalPlayer")))
				
				return
			end
			local UserId = LocalPlayer.UserId
			local config = {
				ownershipIdentifiers = { { userId = UserId, gamePassId = GamePassId } }
			}
			ShopDebugLoggerModule.logLazy(function(): string --[[ Line: 43 ]]
				-- upvalues: GamePassId (upval), UserId (copy)
				return "userOwnsGamePassHttp: POST gamePassId=" .. GamePassId .. " userId=" .. UserId
			end)
			local StartTimerResult = ShopDebugLoggerModule.startTimer()
			local Success, Result = pcall(function() --[[ Line: 48 ]]
				-- upvalues: HttpRbxApiService (upval), Text (upval), HttpService (upval), config (copy)
				return HttpRbxApiService:PostAsyncFullUrl(Text, HttpService:JSONEncode(config))
			end)
			
			if not Success then
				ShopDebugLoggerModule.logElapsed("userOwnsGamePassHttp: HTTP error", StartTimerResult)
				ShopDebugLoggerModule.logLazy(function(): string --[[ Line: 53 ]]
					-- upvalues: Result (copy)
					return "userOwnsGamePassHttp: HTTP error detail=" .. tostring(Result)
				end)
				Callback((ErrorsModule.networkError("userOwnsGamePassHttp: HTTP request failed", Result)))
				
				return
			end
			ShopDebugLoggerModule.logElapsed("userOwnsGamePassHttp: HTTP response received", StartTimerResult)
			local Success1, Result1 = pcall(function() --[[ Line: 62 ]]
				-- upvalues: HttpService (upval), Result (copy)
				return HttpService:JSONDecode(Result)
			end)
			
			if not Success1 then
				ShopDebugLoggerModule.logLazy(function(): string --[[ Line: 66 ]]
					-- upvalues: Result1 (copy)
					return "userOwnsGamePassHttp: JSON parse error=" .. tostring(Result1)
				end)
				Callback((ErrorsModule.parseError("userOwnsGamePassHttp: response body is not valid JSON", Result1)))
				
				return
			end
			if typeof(Result1) ~= "table" or typeof(Result1.ownershipIdentifiers) ~= "table" then
				ShopDebugLoggerModule.log("userOwnsGamePassHttp: schema error, missing ownershipIdentifiers")
				Callback((ErrorsModule.schemaError("userOwnsGamePassHttp: malformed response, expected { ownershipIdentifiers = ... }", Result1)))
				
				return
			end
			for _, ownershipIdentifier in Result1.ownershipIdentifiers do
				if typeof(ownershipIdentifier) == "table" and ownershipIdentifier.userId == UserId and ownershipIdentifier.gamePassId == GamePassId then
					ShopDebugLoggerModule.logLazy(function(): string --[[ Line: 92 ]]
						-- upvalues: GamePassId (upval)
						return "userOwnsGamePassHttp: owns=true gamePassId=" .. GamePassId
					end)
					Callback1(true)
					
					return
				end
			end
			ShopDebugLoggerModule.logLazy(function(): string --[[ Line: 100 ]]
				-- upvalues: GamePassId (upval)
				return "userOwnsGamePassHttp: owns=false gamePassId=" .. GamePassId
			end)
			Callback1(false)
		end)
	end)
end