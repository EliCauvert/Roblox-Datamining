local HttpRbxApiService = game:GetService("HttpRbxApiService")
local HttpService = game:GetService("HttpService")
local InExperienceOffers = script:FindFirstAncestor("InExperienceOffers")
local Parent = InExperienceOffers.Parent
local PromiseModule = require(Parent.Promise)
local Url = require(Parent.Http).Url
local ErrorsModule = require(script.Parent.Errors)
local OffersDebugLoggerModule = require(InExperienceOffers.Internal.OffersDebugLogger)
local LogCounterModule = require(InExperienceOffers.Internal.logCounter)
local GetAllUserOffersFailedCounterModule = require(InExperienceOffers.Events.GetAllUserOffersFailedCounter)
local _ = require(InExperienceOffers.Types)
local Text = Url.APIS_URL .. "checkout/v1/offers"

local function _(List): string --[[ Line: 38 | Named "buildUserOffersUrl" ]]
	-- upvalues: Url (copy), Text (copy)
	return `{Text}?{Url:makeQueryString({ featureKeys = table.concat(List, ",") })}`
end

return function(List) --[[ Line: 45 | Named "getAllUserOffers" ]]
	-- upvalues: PromiseModule (copy), LogCounterModule (copy), GetAllUserOffersFailedCounterModule (copy), Url (copy), Text (copy), OffersDebugLoggerModule (copy), HttpRbxApiService (copy), ErrorsModule (copy), HttpService (copy)
	return PromiseModule.new(function(Callback1, Callback) --[[ Line: 48 ]]
		-- upvalues: LogCounterModule (upval), GetAllUserOffersFailedCounterModule (upval), List (copy), Url (upval), Text (upval), OffersDebugLoggerModule (upval), HttpRbxApiService (upval), ErrorsModule (upval), HttpService (upval)
		local function _(p1) --[[ Line: 51 | Named "rejectFetch" ]]
			-- upvalues: LogCounterModule (upval), GetAllUserOffersFailedCounterModule (upval), Callback (copy)
			LogCounterModule(GetAllUserOffersFailedCounterModule, 1, { errorKind = p1.kind })
			Callback(p1)
		end
		
		task.spawn(function() --[[ Line: 61 ]]
			-- upvalues: List (upval), Url (upval), Text (upval), OffersDebugLoggerModule (upval), HttpRbxApiService (upval), ErrorsModule (upval), LogCounterModule (upval), GetAllUserOffersFailedCounterModule (upval), Callback (copy), HttpService (upval), Callback1 (copy)
			local Text1: string = `{Text}?{Url:makeQueryString({ featureKeys = table.concat(List, ",") })}`
			OffersDebugLoggerModule.logLazy(function(): string --[[ Line: 64 ]]
				-- upvalues: Text1 (copy)
				return "getAllUserOffers: GET " .. Text1
			end)
			local StartTimerResult = OffersDebugLoggerModule.startTimer()
			local Success, Result = pcall(function() --[[ Line: 71 ]]
				-- upvalues: HttpRbxApiService (upval), Text1 (copy)
				return HttpRbxApiService:GetAsyncFullUrl(Text1)
			end)
			
			if not Success then
				OffersDebugLoggerModule.logElapsed("getAllUserOffers: HTTP error", StartTimerResult)
				OffersDebugLoggerModule.logLazy(function(): string --[[ Line: 76 ]]
					-- upvalues: Result (copy)
					return "getAllUserOffers: HTTP error detail=" .. tostring(Result)
				end)
				local GetAllUserOffersHTTPRequestFailed = ErrorsModule.networkError("getAllUserOffers: HTTP request failed", Result)
				LogCounterModule(GetAllUserOffersFailedCounterModule, 1, { errorKind = GetAllUserOffersHTTPRequestFailed.kind })
				Callback(GetAllUserOffersHTTPRequestFailed)
				
				return
			end
			OffersDebugLoggerModule.logElapsed("getAllUserOffers: HTTP response received", StartTimerResult)
			local Success1, Result1 = pcall(function() --[[ Line: 85 ]]
				-- upvalues: HttpService (upval), Result (copy)
				return HttpService:JSONDecode(Result)
			end)
			
			if not Success1 then
				OffersDebugLoggerModule.logLazy(function(): string --[[ Line: 89 ]]
					-- upvalues: Result1 (copy)
					return "getAllUserOffers: JSON parse error=" .. tostring(Result1)
				end)
				local GetAllUserOffersResponseBodyIsNotValidJSON = ErrorsModule.parseError("getAllUserOffers: response body is not valid JSON", Result1)
				LogCounterModule(GetAllUserOffersFailedCounterModule, 1, {
					errorKind = GetAllUserOffersResponseBodyIsNotValidJSON.kind
				})
				Callback(GetAllUserOffersResponseBodyIsNotValidJSON)
				
				return
			end
			if typeof(Result1) == "table" and typeof(Result1.offers) == "table" then
				Callback1(Result1)
				
				return
			else
				OffersDebugLoggerModule.log("getAllUserOffers: schema error, missing offers")
				local GetAllUserOffersMalformedResponseExpectedOffers = ErrorsModule.schemaError("getAllUserOffers: malformed response, expected { offers = ... }", Result1)
				LogCounterModule(GetAllUserOffersFailedCounterModule, 1, {
					errorKind = GetAllUserOffersMalformedResponseExpectedOffers.kind
				})
				Callback(GetAllUserOffersMalformedResponseExpectedOffers)
			end
		end)
	end)
end