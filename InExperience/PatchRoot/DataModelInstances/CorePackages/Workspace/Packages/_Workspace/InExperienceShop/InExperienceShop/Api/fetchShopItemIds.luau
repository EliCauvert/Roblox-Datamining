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

local function _(p1)
	-- upvalues: url (ref), text (ref)
	return `{text}?{url:makeQueryString({ requestId = p1, universeId = game.GameId })}`
end

local _ = function(p1)
	-- upvalues: shopDebugLoggerModule (ref)
	shopDebugLoggerModule.logLazy(function()
		-- upvalues: p1 (ref)
		return "fetchShopItemIds: success categories=" .. (if typeof(p1.categories) == "table" then #p1.categories else 0)
	end)
end

local function validateAndResolve(p1, p2, p3)
	-- upvalues: shopDebugLoggerModule (ref), errorsModule (ref)
	if typeof(p1) == "table" and p1.categories ~= nil then
		shopDebugLoggerModule.logLazy(function()
			-- upvalues: p1 (ref)
			return "fetchShopItemIds: success categories=" .. (if typeof(p1.categories) == "table" then #p1.categories else 0)
		end)
		p2(p1)
		
		return true
	end
	shopDebugLoggerModule.log("fetchShopItemIds: schema error, missing categories field")
	p3(errorsModule.schemaError("fetchShopItemIds: malformed response, expected { categories = ... }", p1))
	
	return false
end

local function fetchShopItemIdsViaGetAsyncFullUrl(p1)
	-- upvalues: promiseModule (ref), url (ref), text (ref), shopDebugLoggerModule (ref), httpRbxApiService (ref), errorsModule (ref), httpService (ref), validateAndResolve (ref)
	return promiseModule.new(function(p2, p3)
		-- upvalues: p1 (ref), url (copy), text (copy), shopDebugLoggerModule (copy), httpRbxApiService (copy), errorsModule (copy), httpService (copy), validateAndResolve (copy)
		task.spawn(function()
			-- upvalues: p1 (copy), url (copy), text (copy), shopDebugLoggerModule (copy), httpRbxApiService (copy), p3 (ref), errorsModule (copy), httpService (copy), validateAndResolve (copy), p2 (ref)
			local status = `{text}?{url:makeQueryString({ requestId = p1, universeId = game.GameId })}`
			shopDebugLoggerModule.logLazy(function()
				-- upvalues: status (ref)
				return "fetchShopItemIds: GET " .. status
			end)
			local var1 = shopDebugLoggerModule.startTimer()
			ok, status = pcall(function()
				-- upvalues: httpRbxApiService (copy), status (ref)
				return httpRbxApiService:GetAsyncFullUrl(status)
			end)
			
			if not ok then
				shopDebugLoggerModule.logElapsed("fetchShopItemIds: HTTP error", var1)
				shopDebugLoggerModule.logLazy(function()
					-- upvalues: status (ref)
					return "fetchShopItemIds: HTTP error detail=" .. tostring(status)
				end)
				p3(errorsModule.networkError("fetchShopItemIds: HTTP request failed", status))
				
				return
			end
			shopDebugLoggerModule.logElapsed("fetchShopItemIds: HTTP response received", var1)
			local ok_1, status_1 = pcall(function()
				-- upvalues: httpService (copy), status (ref)
				return httpService:JSONDecode(status)
			end)
			
			if ok_1 then
				validateAndResolve(status_1, p2, p3)
				
				return
			end
			shopDebugLoggerModule.logLazy(function()
				-- upvalues: status_1 (ref)
				return "fetchShopItemIds: JSON parse error=" .. tostring(status_1)
			end)
			p3(errorsModule.parseError("fetchShopItemIds: response body is not valid JSON", status_1))
		end)
	end)
end

local function fetchShopItemIdsViaRequestImpl(p1)
	-- upvalues: url (ref), text (ref), shopDebugLoggerModule (ref), requestInternalWrapper (ref), httpService (ref), fIntExperienceShopWidgetRequestPriorityModule (ref), promiseModule (ref), validateAndResolve (ref), errorsModule (ref)
	local var1 = `{text}?{url:makeQueryString({ requestId = p1, universeId = game.GameId })}`
	shopDebugLoggerModule.logLazy(function()
		-- upvalues: var1 (ref)
		return "fetchShopItemIds: GET " .. var17
	end)
	local var2 = shopDebugLoggerModule.startTimer()
	
	return requestInternalWrapper(httpService)(var1, "GET", if fIntExperienceShopWidgetRequestPriorityModule ~= 0 then nil else { priority = fIntExperienceShopWidgetRequestPriorityModule }):andThen(function(p2)
		-- upvalues: shopDebugLoggerModule (copy), var2 (ref), promiseModule (copy), validateAndResolve (copy)
		shopDebugLoggerModule.logElapsed("fetchShopItemIds: HTTP response received", var2)
		
		return promiseModule.new(function(p3, p4)
			-- upvalues: validateAndResolve (copy), p2 (ref)
			validateAndResolve(p2.responseBody, p3, p4)
		end)
	end):catch(function(p2)
		-- upvalues: promiseModule (copy), shopDebugLoggerModule (copy), errorsModule (copy), var2 (ref)
		if typeof(p2) == "table" and p2.kind ~= nil then
			return promiseModule.reject(p2)
		elseif typeof(p2) == "table" and p2.isJSONValid == false then
			shopDebugLoggerModule.logLazy(function()
				-- upvalues: p2 (ref)
				return "fetchShopItemIds: JSON parse error=" .. tostring(p2)
			end)
			
			return promiseModule.reject(errorsModule.parseError("fetchShopItemIds: response body is not valid JSON", p2))
		end
		shopDebugLoggerModule.logElapsed("fetchShopItemIds: HTTP error", var2)
		shopDebugLoggerModule.logLazy(function()
			-- upvalues: p2 (ref)
			return "fetchShopItemIds: HTTP error detail=" .. tostring(p2)
		end)
		
		return promiseModule.reject(errorsModule.networkError("fetchShopItemIds: HTTP request failed", p2))
	end)
end

return function(p1)
	-- upvalues: fFlagSkipShopWidgetsCallInUnpublishedStudioModule (ref), runService (ref), shopDebugLoggerModule (ref), promiseModule (ref), fFlagUseShopRequestImplModule (ref), fIntExperienceShopWidgetRequestPriorityModule (ref), fetchShopItemIdsViaRequestImpl (ref), fetchShopItemIdsViaGetAsyncFullUrl (ref)
	if fFlagSkipShopWidgetsCallInUnpublishedStudioModule and runService:IsStudio() and game.GameId == 0 then
		shopDebugLoggerModule.logLazy(function()
			-- upvalues: p1 (ref)
			return "fetchShopItemIds: skipped unpublished Studio experience requestId=" .. p13
		end)
		
		return promiseModule.resolve({ categories = {} })
	elseif fFlagUseShopRequestImplModule then
		shopDebugLoggerModule.logLazy(function()
			-- upvalues: fIntExperienceShopWidgetRequestPriorityModule (copy), p1 (ref)
			return `fetchShopItemIds: transport=requestInternalWrapper requestId={p1}{if fIntExperienceShopWidgetRequestPriorityModule ~= 0 then "" else ` priority={fIntExperienceShopWidgetRequestPriorityModule}`}`
		end)
		
		return fetchShopItemIdsViaRequestImpl(p1)
	end
	shopDebugLoggerModule.logLazy(function()
		-- upvalues: p1 (ref)
		return `fetchShopItemIds: transport=GetAsyncFullUrl requestId={p1}`
	end)
	
	return fetchShopItemIdsViaGetAsyncFullUrl(p1)
end