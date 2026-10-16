local HttpRbxApiService = game:GetService("HttpRbxApiService")
local HttpService = game:GetService("HttpService")
local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local PromiseModule = require(Parent.Promise)
local ErrorsModule = require(script.Parent.Errors)
local ShopDebugLoggerModule = require(InExperienceShop.Internal.ShopDebugLogger)
local FIntRedeemBonusTokenTimeoutMsModule = require(InExperienceShop.Flags.FIntRedeemBonusTokenTimeoutMs)
local Text = require(Parent.Http).Url.APIS_URL .. "payments-bonus-service/v1/redeem-bonus-token"

local function _(p1): number --[[ Line: 18 | Named "httpStatusCodeFromError" ]]
	return (tonumber(string.match(tostring(p1), "HTTP (%d%d%d)")))
end

return function(BonusJwt, UniverseId) --[[ Line: 22 | Named "redeemBonusToken" ]]
	-- upvalues: PromiseModule (copy), FIntRedeemBonusTokenTimeoutMsModule (copy), ShopDebugLoggerModule (copy), ErrorsModule (copy), HttpRbxApiService (copy), Text (copy), HttpService (copy)
	return PromiseModule.new(function(Callback1, Callback) --[[ Line: 23 ]]
		-- upvalues: FIntRedeemBonusTokenTimeoutMsModule (upval), ShopDebugLoggerModule (upval), ErrorsModule (upval), BonusJwt (copy), UniverseId (copy), HttpRbxApiService (upval), Text (upval), HttpService (upval)
		task.spawn(function() --[[ Line: 24 ]]
			-- upvalues: Callback1 (copy), Callback (copy), FIntRedeemBonusTokenTimeoutMsModule (upval), ShopDebugLoggerModule (upval), ErrorsModule (upval), BonusJwt (upval), UniverseId (upval), HttpRbxApiService (upval), Text (upval), HttpService (upval)
			local Flag = false
			
			local function _(p1) --[[ Line: 26 | Named "settleResolve" ]]
				-- upvalues: Flag (ref), Callback1 (upval)
				if not Flag then
					Flag = true
					Callback1(p1)
					
					return
				end
			end
			
			local _ = function(p1) --[[ Line: 33 | Named "settleReject" ]]
				-- upvalues: Flag (ref), Callback (upval)
				if not Flag then
					Flag = true
					Callback(p1)
					
					return
				end
			end
			
			if FIntRedeemBonusTokenTimeoutMsModule > 0 then
				task.delay(FIntRedeemBonusTokenTimeoutMsModule / 1000, function() --[[ Line: 42 ]]
					-- upvalues: Flag (ref), ShopDebugLoggerModule (upval), FIntRedeemBonusTokenTimeoutMsModule (upval), ErrorsModule (upval), Callback (upval)
					if Flag then return end
					ShopDebugLoggerModule.logLazy(function(): string --[[ Line: 46 ]]
						-- upvalues: FIntRedeemBonusTokenTimeoutMsModule (upval)
						return "redeemBonusToken: timed out after " .. FIntRedeemBonusTokenTimeoutMsModule .. "ms"
					end)
					local RedeemBonusTokenTimedOut = ErrorsModule.networkError("redeemBonusToken: timed out", FIntRedeemBonusTokenTimeoutMsModule)
					
					if not Flag then
						Flag = true
						Callback(RedeemBonusTokenTimedOut)
						
						return
					end
				end)
			end
			local config = { bonusJwt = BonusJwt, universeId = UniverseId }
			ShopDebugLoggerModule.logLazy(function(): string --[[ Line: 60 ]]
				-- upvalues: UniverseId (upval)
				return "redeemBonusToken: POST universeId=" .. UniverseId
			end)
			local StartTimerResult = ShopDebugLoggerModule.startTimer()
			local Success, Result = pcall(function() --[[ Line: 65 ]]
				-- upvalues: HttpRbxApiService (upval), Text (upval), HttpService (upval), config (copy)
				return HttpRbxApiService:PostAsyncFullUrl(Text, HttpService:JSONEncode(config))
			end)
			
			if Success then
				ShopDebugLoggerModule.logElapsed("redeemBonusToken: HTTP response received", StartTimerResult)
				local Success1, Result1 = pcall(function() --[[ Line: 83 ]]
					-- upvalues: HttpService (upval), Result (copy)
					return HttpService:JSONDecode(Result)
				end)
				
				if Success1 then
					local PaymentSessionId = if typeof(Result1) == "table" then Result1.paymentSessionId else nil
					
					if typeof(PaymentSessionId) == "string" and PaymentSessionId ~= "" then
						ShopDebugLoggerModule.log("redeemBonusToken: success")
						
						if not Flag then
							Flag = true
							Callback1(PaymentSessionId)
						end
						return
					else
						ShopDebugLoggerModule.log("redeemBonusToken: schema error, missing paymentSessionId")
						local RedeemBonusTokenMalformedResponseExpectedPaymentSessionIdString = ErrorsModule.schemaError("redeemBonusToken: malformed response, expected { paymentSessionId = string }", Result1)
						
						if not Flag then
							Flag = true
							Callback(RedeemBonusTokenMalformedResponseExpectedPaymentSessionIdString)
						end
						return
					end
				else
					ShopDebugLoggerModule.logLazy(function(): string --[[ Line: 87 ]]
						-- upvalues: Result1 (copy)
						return "redeemBonusToken: JSON parse error=" .. tostring(Result1)
					end)
					local RedeemBonusTokenResponseBodyIsNotValidJSON = ErrorsModule.parseError("redeemBonusToken: response body is not valid JSON", Result1)
					
					if not Flag then
						Flag = true
						Callback(RedeemBonusTokenResponseBodyIsNotValidJSON)
					end
					return
				end
			else
				ShopDebugLoggerModule.logElapsed("redeemBonusToken: HTTP error", StartTimerResult)
				ShopDebugLoggerModule.logLazy(function(): string --[[ Line: 70 ]]
					-- upvalues: Result (copy)
					return "redeemBonusToken: HTTP error detail=" .. tostring(Result)
				end)
				
				if tonumber(string.match(tostring(Result), "HTTP (%d%d%d)")) == 400 then
					local RedeemBonusTokenHTTP400 = ErrorsModule.badRequestError("redeemBonusToken: HTTP 400", Result)
					
					if not Flag then
						Flag = true
						Callback(RedeemBonusTokenHTTP400)
					end
					return
				else
					local RedeemBonusTokenHTTPRequestFailed = ErrorsModule.networkError("redeemBonusToken: HTTP request failed", Result)
					
					if not Flag then
						Flag = true
						Callback(RedeemBonusTokenHTTPRequestFailed)
					end
				end
			end
		end)
	end)
end