local httpRbxApiService = game:GetService("HttpRbxApiService")
local httpService = game:GetService("HttpService")
local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local promiseModule = require(parent.Promise)
local url = require(parent.Http).Url
local errorsModule = require(script.Parent.Errors)
local shopDebugLoggerModule = require(inExperienceShop.Internal.ShopDebugLogger)
local fIntRedeemBonusTokenTimeoutMsModule = require(inExperienceShop.Flags.FIntRedeemBonusTokenTimeoutMs)
local text = url.APIS_URL .. "payments-bonus-service/v1/redeem-bonus-token"

local function _(p1)
	return tonumber(string.match(tostring(p1), "HTTP (%d%d%d)"))
end

return function(p1, p2)
	-- upvalues: promiseModule (ref), fIntRedeemBonusTokenTimeoutMsModule (ref), shopDebugLoggerModule (ref), errorsModule (ref), httpRbxApiService (ref), text (ref), httpService (ref)
	return promiseModule.new(function(p3, p4)
		-- upvalues: fIntRedeemBonusTokenTimeoutMsModule (copy), shopDebugLoggerModule (copy), errorsModule (copy), p1 (ref), p2 (ref), httpRbxApiService (copy), text (copy), httpService (copy)
		task.spawn(function()
			-- upvalues: p3 (ref), p4 (ref), fIntRedeemBonusTokenTimeoutMsModule (copy), shopDebugLoggerModule (copy), errorsModule (copy), p1 (copy), p2 (copy), httpRbxApiService (copy), text (copy), httpService (copy)
			local var1 = false
			
			local function _(value)
				-- upvalues: var1 (write), p3 (copy)
				if var1 then
					return
				end
				var1 = true
				p3(value)
			end
			
			local _ = function(value)
				-- upvalues: var1 (write), p4 (copy)
				if var1 then
					return
				end
				var1 = true
				p4(value)
			end
			
			if fIntRedeemBonusTokenTimeoutMsModule > 0 then
				task.delay(fIntRedeemBonusTokenTimeoutMsModule / 1000, function()
					-- upvalues: var1 (write), shopDebugLoggerModule (copy), fIntRedeemBonusTokenTimeoutMsModule (copy), errorsModule (copy), p4 (copy)
					if var1 then return end
					shopDebugLoggerModule.logLazy(function()
						-- upvalues: fIntRedeemBonusTokenTimeoutMsModule (copy)
						return "redeemBonusToken: timed out after " .. fIntRedeemBonusTokenTimeoutMsModule .. "ms"
					end)
					local var2 = errorsModule.networkError("redeemBonusToken: timed out", fIntRedeemBonusTokenTimeoutMsModule)
					
					if var1 then
						return
					end
					var1 = true
					p4(var2)
				end)
			end
			local t = { bonusJwt = p1, universeId = p2 }
			shopDebugLoggerModule.logLazy(function()
				-- upvalues: p2 (copy)
				return "redeemBonusToken: POST universeId=" .. p2
			end)
			local var2 = shopDebugLoggerModule.startTimer()
			local ok, status = pcall(function()
				-- upvalues: httpRbxApiService (copy), text (copy), httpService (copy), t (ref)
				return httpRbxApiService:PostAsyncFullUrl(text, httpService:JSONEncode(t))
			end)
			
			if ok then
				shopDebugLoggerModule.logElapsed("redeemBonusToken: HTTP response received", var2)
				local ok_1, status_1 = pcall(function()
					-- upvalues: httpService (copy), status (ref)
					return httpService:JSONDecode(status)
				end)
				
				if ok_1 then
					local var3 = if typeof(status_1) == "table" then status_1.paymentSessionId else nil
					
					if typeof(var3) == "string" and var3 ~= "" then
						shopDebugLoggerModule.log("redeemBonusToken: success")
						
						if not var1 then
							var1 = true
							p3(var3)
						end
						return
					else
						shopDebugLoggerModule.log("redeemBonusToken: schema error, missing paymentSessionId")
						local var4 = errorsModule.schemaError("redeemBonusToken: malformed response, expected { paymentSessionId = string }", status_1)
						
						if not var1 then
							var1 = true
							p4(var4)
						end
						return
					end
				else
					shopDebugLoggerModule.logLazy(function()
						-- upvalues: status_1 (ref)
						return "redeemBonusToken: JSON parse error=" .. tostring(status_1)
					end)
					local var5 = errorsModule.parseError("redeemBonusToken: response body is not valid JSON", status_1)
					
					if not var1 then
						var1 = true
						p4(var5)
					end
					return
				end
			else
				shopDebugLoggerModule.logElapsed("redeemBonusToken: HTTP error", var2)
				shopDebugLoggerModule.logLazy(function()
					-- upvalues: status (ref)
					return "redeemBonusToken: HTTP error detail=" .. tostring(status)
				end)
				
				if tonumber(string.match(tostring(status), "HTTP (%d%d%d)")) == 400 then
					var1 = true
					p4(errorsModule.badRequestError("redeemBonusToken: HTTP 400", status))
					
					return
				end
				local var6 = errorsModule.networkError("redeemBonusToken: HTTP request failed", status)
				
				if not var1 then
					var1 = true
					p4(var6)
				end
			end
		end)
	end)
end