local httpRbxApiService = game:GetService("HttpRbxApiService")
local httpService = game:GetService("HttpService")
local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local promiseModule = require(parent.Promise)
local httpModule = require(parent.Http)
local url = httpModule.Url
local requestInternalWrapper = httpModule.NetworkLayers.requestInternalWrapper
local _ = require(inExperienceShop.Types)
local errorsModule = require(script.Parent.Errors)
local shopDebugLoggerModule = require(inExperienceShop.Internal.ShopDebugLogger)
local fFlagUseShopRequestImplModule = require(inExperienceShop.Flags.FFlagUseShopRequestImpl)
local fIntExperienceShopWidgetRequestPriorityModule = require(inExperienceShop.Flags.FIntExperienceShopWidgetRequestPriority)
local fFlagSkipShopWidgetsCallInUnpublishedStudioModule = require(inExperienceShop.Flags.FFlagSkipShopWidgetsCallInUnpublishedStudio)
local runService = game:GetService("RunService")
local text = url.APIS_URL .. "marketplace-widgets/v1/widgets/shop-widgets"

local function _(p0) --[[ line: 28 | named "buildShopWidgetsUrl" ]]
	-- upvalues: url (ref), text (ref)
	return `{text}?{url:makeQueryString({ requestId = p0, universeId = game.GameId })}`
end

local _ = function(p1) --[[ line: 36 | named "logSuccess" ]]
	-- upvalues: shopDebugLoggerModule (ref)
	shopDebugLoggerModule.logLazy(function() --[[ line: 37 ]]
		-- upvalues: p1 (ref)
		return "fetchShopItemIds: success categories=" .. (if typeof(p1.categories) == "table" then #p1.categories else 0)
	end)
end

local function validateAndResolve(p2, p3, p4) --[[ line: 43 ]]
	-- upvalues: shopDebugLoggerModule (ref), errorsModule (ref)
	if typeof(p2) == "table" and p2.categories ~= nil then
		shopDebugLoggerModule.logLazy(function() --[[ line: 37 ]]
			-- upvalues: p2 (ref)
			return "fetchShopItemIds: success categories=" .. (if typeof(p2.categories) == "table" then #p2.categories else 0)
		end)
		p3(p2)
		
		return true
	end
	shopDebugLoggerModule.log("fetchShopItemIds: schema error, missing categories field")
	p4(errorsModule.schemaError("fetchShopItemIds: malformed response, expected { categories = ... }", p2))
	
	return false
end

local function fetchShopItemIdsViaGetAsyncFullUrl(p5) --[[ line: 70 ]]
	-- upvalues: promiseModule (ref), url (ref), text (ref), shopDebugLoggerModule (ref), httpRbxApiService (ref), errorsModule (ref), httpService (ref), validateAndResolve (ref)
	return promiseModule.new(function(p6, p7) --[[ line: 71 ]]
		-- upvalues: p5 (ref), url (copy), text (copy), shopDebugLoggerModule (copy), httpRbxApiService (copy), errorsModule (copy), httpService (copy), validateAndResolve (copy)
		task.spawn(function() --[[ line: 72 ]]
			-- upvalues: p5 (copy), url (copy), text (copy), shopDebugLoggerModule (copy), httpRbxApiService (copy), p7 (ref), errorsModule (copy), httpService (copy), validateAndResolve (copy), p6 (ref)
			local status = `{text}?{url:makeQueryString({ requestId = p5, universeId = game.GameId })}`
			shopDebugLoggerModule.logLazy(function() --[[ line: 75 ]]
				-- upvalues: status (ref)
				return "fetchShopItemIds: GET " .. status
			end)
			local var16 = shopDebugLoggerModule.startTimer()
			ok, status = pcall(function() --[[ line: 85 ]]
				-- upvalues: httpRbxApiService (copy), status (ref)
				return httpRbxApiService:GetAsyncFullUrl(status)
			end)
			
			if not ok then
				shopDebugLoggerModule.logElapsed("fetchShopItemIds: HTTP error", var16)
				shopDebugLoggerModule.logLazy(function() --[[ line: 90 ]]
					-- upvalues: status (ref)
					return "fetchShopItemIds: HTTP error detail=" .. tostring(status)
				end)
				p7(errorsModule.networkError("fetchShopItemIds: HTTP request failed", status))
				
				return
			end
			shopDebugLoggerModule.logElapsed("fetchShopItemIds: HTTP response received", var16)
			local ok_1, status_1 = pcall(function() --[[ line: 99 ]]
				-- upvalues: httpService (copy), status (ref)
				return httpService:JSONDecode(status)
			end)
			
			if ok_1 then
				validateAndResolve(status_1, p6, p7)
				
				return
			end
			shopDebugLoggerModule.logLazy(function() --[[ line: 103 ]]
				-- upvalues: status_1 (ref)
				return "fetchShopItemIds: JSON parse error=" .. tostring(status_1)
			end)
			p7(errorsModule.parseError("fetchShopItemIds: response body is not valid JSON", status_1))
		end)
	end)
end

local function fetchShopItemIdsViaRequestImpl(p8) --[[ line: 115 ]]
	-- upvalues: url (ref), text (ref), shopDebugLoggerModule (ref), requestInternalWrapper (ref), httpService (ref), fIntExperienceShopWidgetRequestPriorityModule (ref), promiseModule (ref), validateAndResolve (ref), errorsModule (ref)
	local var17 = `{text}?{url:makeQueryString({ requestId = p8, universeId = game.GameId })}`
	shopDebugLoggerModule.logLazy(function() --[[ line: 118 ]]
		-- upvalues: var17 (ref)
		return "fetchShopItemIds: GET " .. var17
	end)
	local var18 = shopDebugLoggerModule.startTimer()
	
	return requestInternalWrapper(httpService)(var17, "GET", if fIntExperienceShopWidgetRequestPriorityModule ~= 0 then nil else { priority = fIntExperienceShopWidgetRequestPriorityModule }):andThen(function(p10) --[[ line: 130 ]]
		-- upvalues: shopDebugLoggerModule (copy), var18 (ref), promiseModule (copy), validateAndResolve (copy)
		shopDebugLoggerModule.logElapsed("fetchShopItemIds: HTTP response received", var18)
		
		return promiseModule.new(function(p11, p12) --[[ line: 132 ]]
			-- upvalues: validateAndResolve (copy), p10 (ref)
			validateAndResolve(p10.responseBody, p11, p12)
		end)
	end):catch(function(p9) --[[ line: 136 ]]
		-- upvalues: promiseModule (copy), shopDebugLoggerModule (copy), errorsModule (copy), var18 (ref)
		if typeof(p9) == "table" and p9.kind ~= nil then
			return promiseModule.reject(p9)
		elseif typeof(p9) == "table" and p9.isJSONValid == false then
			shopDebugLoggerModule.logLazy(function() --[[ line: 142 ]]
				-- upvalues: p9 (ref)
				return "fetchShopItemIds: JSON parse error=" .. tostring(p9)
			end)
			
			return promiseModule.reject(errorsModule.parseError("fetchShopItemIds: response body is not valid JSON", p9))
		end
		shopDebugLoggerModule.logElapsed("fetchShopItemIds: HTTP error", var18)
		shopDebugLoggerModule.logLazy(function() --[[ line: 151 ]]
			-- upvalues: p9 (ref)
			return "fetchShopItemIds: HTTP error detail=" .. tostring(p9)
		end)
		
		return promiseModule.reject(errorsModule.networkError("fetchShopItemIds: HTTP request failed", p9))
	end)
end

return function(p13) --[[ line: 158 | named "fetchShopItemIds" ]]
	-- upvalues: fFlagSkipShopWidgetsCallInUnpublishedStudioModule (ref), runService (ref), shopDebugLoggerModule (ref), promiseModule (ref), fFlagUseShopRequestImplModule (ref), fIntExperienceShopWidgetRequestPriorityModule (ref), fetchShopItemIdsViaRequestImpl (ref), fetchShopItemIdsViaGetAsyncFullUrl (ref)
	if fFlagSkipShopWidgetsCallInUnpublishedStudioModule and runService:IsStudio() and game.GameId == 0 then
		shopDebugLoggerModule.logLazy(function() --[[ line: 160 ]]
			-- upvalues: p13 (ref)
			return "fetchShopItemIds: skipped unpublished Studio experience requestId=" .. p13
		end)
		
		return promiseModule.resolve({ categories = {} })
	elseif fFlagUseShopRequestImplModule then
		shopDebugLoggerModule.logLazy(function() --[[ line: 167 ]]
			-- upvalues: fIntExperienceShopWidgetRequestPriorityModule (copy), p13 (ref)
			return `fetchShopItemIds: transport=requestInternalWrapper requestId={p13}{if fIntExperienceShopWidgetRequestPriorityModule ~= 0 then "" else ` priority={fIntExperienceShopWidgetRequestPriorityModule}`}`
		end)
		
		return fetchShopItemIdsViaRequestImpl(p13)
	end
	shopDebugLoggerModule.logLazy(function() --[[ line: 176 ]]
		-- upvalues: p13 (ref)
		return `fetchShopItemIds: transport=GetAsyncFullUrl requestId={p13}`
	end)
	
	return fetchShopItemIdsViaGetAsyncFullUrl(p13)
end