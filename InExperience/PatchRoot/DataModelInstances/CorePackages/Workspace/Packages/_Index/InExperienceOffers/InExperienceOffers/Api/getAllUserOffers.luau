local httpRbxApiService = game:GetService("HttpRbxApiService")
local httpService = game:GetService("HttpService")
local inExperienceOffers = script:FindFirstAncestor("InExperienceOffers")
local parent = inExperienceOffers.Parent
local promiseModule = require(parent.Promise)
local url = require(parent.Http).Url
local errorsModule = require(script.Parent.Errors)
local offersDebugLoggerModule = require(inExperienceOffers.Internal.OffersDebugLogger)
local logCounterModule = require(inExperienceOffers.Internal.logCounter)
local getAllUserOffersFailedCounterModule = require(inExperienceOffers.Events.GetAllUserOffersFailedCounter)
local _ = require(inExperienceOffers.Types)
local text = url.APIS_URL .. "checkout/v1/offers"

local function _(p1)
	-- upvalues: url (ref), text (ref)
	return `{text}?{url:makeQueryString({ featureKeys = table.concat(p1, ",") })}`
end

return function(p1)
	-- upvalues: promiseModule (ref), logCounterModule (ref), getAllUserOffersFailedCounterModule (ref), url (ref), text (ref), offersDebugLoggerModule (ref), httpRbxApiService (ref), errorsModule (ref), httpService (ref)
	return promiseModule.new(function(p2, p3)
		-- upvalues: logCounterModule (copy), getAllUserOffersFailedCounterModule (copy), p1 (ref), url (copy), text (copy), offersDebugLoggerModule (copy), httpRbxApiService (copy), errorsModule (copy), httpService (copy)
		local function _(p4)
			-- upvalues: logCounterModule (copy), getAllUserOffersFailedCounterModule (copy), p3 (ref)
			logCounterModule(getAllUserOffersFailedCounterModule, 1, { errorKind = p4.kind })
			p3(p4)
		end
		
		task.spawn(function()
			-- upvalues: p1 (copy), url (copy), text (copy), offersDebugLoggerModule (copy), httpRbxApiService (copy), errorsModule (copy), logCounterModule (copy), getAllUserOffersFailedCounterModule (copy), p3 (ref), httpService (copy), p2 (ref)
			local status = `{text}?{url:makeQueryString({ featureKeys = table.concat(p1, ",") })}`
			offersDebugLoggerModule.logLazy(function()
				-- upvalues: status (ref)
				return "getAllUserOffers: GET " .. status
			end)
			local var1 = offersDebugLoggerModule.startTimer()
			ok, status = pcall(function()
				-- upvalues: httpRbxApiService (copy), status (ref)
				return httpRbxApiService:GetAsyncFullUrl(status)
			end)
			
			if not ok then
				offersDebugLoggerModule.logElapsed("getAllUserOffers: HTTP error", var1)
				offersDebugLoggerModule.logLazy(function()
					-- upvalues: status (ref)
					return "getAllUserOffers: HTTP error detail=" .. tostring(status)
				end)
				local var2 = errorsModule.networkError("getAllUserOffers: HTTP request failed", status)
				logCounterModule(getAllUserOffersFailedCounterModule, 1, { errorKind = var2.kind })
				p3(var2)
				
				return
			end
			offersDebugLoggerModule.logElapsed("getAllUserOffers: HTTP response received", var1)
			local ok_1, status_1 = pcall(function()
				-- upvalues: httpService (copy), status (ref)
				return httpService:JSONDecode(status)
			end)
			
			if not ok_1 then
				offersDebugLoggerModule.logLazy(function()
					-- upvalues: status_1 (ref)
					return "getAllUserOffers: JSON parse error=" .. tostring(status_1)
				end)
				local var3 = errorsModule.parseError("getAllUserOffers: response body is not valid JSON", status_1)
				logCounterModule(getAllUserOffersFailedCounterModule, 1, { errorKind = var3.kind })
				p3(var3)
				
				return
			elseif typeof(status_1) == "table" and typeof(status_1.offers) == "table" then
				p2(status_1)
				
				return
			end
			offersDebugLoggerModule.log("getAllUserOffers: schema error, missing offers")
			local var4 = errorsModule.schemaError("getAllUserOffers: malformed response, expected { offers = ... }", status_1)
			logCounterModule(getAllUserOffersFailedCounterModule, 1, { errorKind = var4.kind })
			p3(var4)
		end)
	end)
end