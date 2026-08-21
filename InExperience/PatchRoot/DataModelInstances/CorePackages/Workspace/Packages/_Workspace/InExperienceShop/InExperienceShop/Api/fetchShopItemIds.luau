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
local text = url.APIS_URL .. "marketplace-widgets/v1/widgets/shop-widgets"

local function _(p0) --[[ line: 26 | named "buildShopWidgetsUrl" ]]
	-- upvalues: url (ref), text (ref)
	return `{text}?{url:makeQueryString({ requestId = p0, universeId = game.GameId })}`
end

local _ = function(p1) --[[ line: 34 | named "logSuccess" ]]
	-- upvalues: shopDebugLoggerModule (ref)
	shopDebugLoggerModule.logLazy(function() --[[ line: 35 ]]
		-- upvalues: p1 (ref)
		return "fetchShopItemIds: success categories=" .. (if typeof(p1.categories) == "table" then #p1.categories else 0)
	end)
end

local function validateAndResolve(p2, p3, p4) --[[ line: 41 ]]
	-- upvalues: shopDebugLoggerModule (ref), errorsModule (ref)
	if typeof(p2) == "table" and p2.categories ~= nil then
		shopDebugLoggerModule.logLazy(function() --[[ line: 35 ]]
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

local function fetchShopItemIdsViaGetAsyncFullUrl(p5) --[[ line: 68 ]]
	-- upvalues: promiseModule (ref), url (ref), text (ref), shopDebugLoggerModule (ref), httpRbxApiService (ref), errorsModule (ref), httpService (ref), validateAndResolve (ref)
	return promiseModule.new(function(p6, p7) --[[ line: 69 ]]
		-- upvalues: p5 (ref), url (copy), text (copy), shopDebugLoggerModule (copy), httpRbxApiService (copy), errorsModule (copy), httpService (copy), validateAndResolve (copy)
		task.spawn(function() --[[ line: 70 ]]
			-- upvalues: p5 (copy), url (copy), text (copy), shopDebugLoggerModule (copy), httpRbxApiService (copy), p7 (ref), errorsModule (copy), httpService (copy), validateAndResolve (copy), p6 (ref)
			local status = `{text}?{url:makeQueryString({ requestId = p5, universeId = game.GameId })}`
			shopDebugLoggerModule.logLazy(function() --[[ line: 73 ]]
				-- upvalues: status (ref)
				return "fetchShopItemIds: GET " .. status
			end)
			local var14 = shopDebugLoggerModule.startTimer()
			ok, status = pcall(function() --[[ line: 83 ]]
				-- upvalues: httpRbxApiService (copy), status (ref)
				return httpRbxApiService:GetAsyncFullUrl(status)
			end)
			
			if not ok then
				shopDebugLoggerModule.logElapsed("fetchShopItemIds: HTTP error", var14)
				shopDebugLoggerModule.logLazy(function() --[[ line: 88 ]]
					-- upvalues: status (ref)
					return "fetchShopItemIds: HTTP error detail=" .. tostring(status)
				end)
				p7(errorsModule.networkError("fetchShopItemIds: HTTP request failed", status))
				
				return
			end
			shopDebugLoggerModule.logElapsed("fetchShopItemIds: HTTP response received", var14)
			local ok_1, status_1 = pcall(function() --[[ line: 97 ]]
				-- upvalues: httpService (copy), status (ref)
				return httpService:JSONDecode(status)
			end)
			
			if ok_1 then
				validateAndResolve(status_1, p6, p7)
				
				return
			end
			shopDebugLoggerModule.logLazy(function() --[[ line: 101 ]]
				-- upvalues: status_1 (ref)
				return "fetchShopItemIds: JSON parse error=" .. tostring(status_1)
			end)
			p7(errorsModule.parseError("fetchShopItemIds: response body is not valid JSON", status_1))
		end)
	end)
end

local function fetchShopItemIdsViaRequestImpl(p8) --[[ line: 113 ]]
	-- upvalues: url (ref), text (ref), shopDebugLoggerModule (ref), requestInternalWrapper (ref), httpService (ref), fIntExperienceShopWidgetRequestPriorityModule (ref), promiseModule (ref), validateAndResolve (ref), errorsModule (ref)
	local var15 = `{text}?{url:makeQueryString({ requestId = p8, universeId = game.GameId })}`
	shopDebugLoggerModule.logLazy(function() --[[ line: 116 ]]
		-- upvalues: var15 (ref)
		return "fetchShopItemIds: GET " .. var15
	end)
	local var16 = shopDebugLoggerModule.startTimer()
	
	return requestInternalWrapper(httpService)(var15, "GET", if fIntExperienceShopWidgetRequestPriorityModule ~= 0 then nil else { priority = fIntExperienceShopWidgetRequestPriorityModule }):andThen(function(p10) --[[ line: 128 ]]
		-- upvalues: shopDebugLoggerModule (copy), var16 (ref), promiseModule (copy), validateAndResolve (copy)
		shopDebugLoggerModule.logElapsed("fetchShopItemIds: HTTP response received", var16)
		
		return promiseModule.new(function(p11, p12) --[[ line: 130 ]]
			-- upvalues: validateAndResolve (copy), p10 (ref)
			validateAndResolve(p10.responseBody, p11, p12)
		end)
	end):catch(function(p9) --[[ line: 134 ]]
		-- upvalues: promiseModule (copy), shopDebugLoggerModule (copy), errorsModule (copy), var16 (ref)
		if typeof(p9) == "table" and p9.kind ~= nil then
			return promiseModule.reject(p9)
		elseif typeof(p9) == "table" and p9.isJSONValid == false then
			shopDebugLoggerModule.logLazy(function() --[[ line: 140 ]]
				-- upvalues: p9 (ref)
				return "fetchShopItemIds: JSON parse error=" .. tostring(p9)
			end)
			
			return promiseModule.reject(errorsModule.parseError("fetchShopItemIds: response body is not valid JSON", p9))
		end
		shopDebugLoggerModule.logElapsed("fetchShopItemIds: HTTP error", var16)
		shopDebugLoggerModule.logLazy(function() --[[ line: 149 ]]
			-- upvalues: p9 (ref)
			return "fetchShopItemIds: HTTP error detail=" .. tostring(p9)
		end)
		
		return promiseModule.reject(errorsModule.networkError("fetchShopItemIds: HTTP request failed", p9))
	end)
end

return function(p13) --[[ line: 156 | named "fetchShopItemIds" ]]
	-- upvalues: fFlagUseShopRequestImplModule (ref), shopDebugLoggerModule (ref), fIntExperienceShopWidgetRequestPriorityModule (ref), fetchShopItemIdsViaRequestImpl (ref), fetchShopItemIdsViaGetAsyncFullUrl (ref)
	if fFlagUseShopRequestImplModule then
		shopDebugLoggerModule.logLazy(function() --[[ line: 158 ]]
			-- upvalues: fIntExperienceShopWidgetRequestPriorityModule (copy), p13 (ref)
			return `fetchShopItemIds: transport=requestInternalWrapper requestId={p13}{if fIntExperienceShopWidgetRequestPriorityModule ~= 0 then "" else ` priority={fIntExperienceShopWidgetRequestPriorityModule}`}`
		end)
		
		return fetchShopItemIdsViaRequestImpl(p13)
	end
	shopDebugLoggerModule.logLazy(function() --[[ line: 167 ]]
		-- upvalues: p13 (ref)
		return `fetchShopItemIds: transport=GetAsyncFullUrl requestId={p13}`
	end)
	
	return fetchShopItemIdsViaGetAsyncFullUrl(p13)
end