local httpRbxApiService = game:GetService("HttpRbxApiService")
local httpService = game:GetService("HttpService")
local runService = game:GetService("RunService")
local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local promiseModule = require(parent.Promise)
local httpModule = require(parent.Http)
local url = httpModule.Url
local requestInternalWrapper = httpModule.NetworkLayers.requestInternalWrapper
local constantsModule = require(inExperienceShop.Constants)
local _ = require(inExperienceShop.Types)
local errorsModule = require(script.Parent.Errors)
local multiGetProductInfoModule = require(script.Parent.multiGetProductInfo)
local buildShopDataFromWidgetsModule = require(script.Parent.buildShopDataFromWidgets)
local shopDebugLoggerModule = require(inExperienceShop.Internal.ShopDebugLogger)
local fFlagUseShopRequestImplModule = require(inExperienceShop.Flags.FFlagUseShopRequestImpl)
local fIntExperienceShopWidgetRequestPriorityModule = require(inExperienceShop.Flags.FIntExperienceShopWidgetRequestPriority)
local fFlagSkipShopWidgetsCallInUnpublishedStudioModule = require(inExperienceShop.Flags.FFlagSkipShopWidgetsCallInUnpublishedStudio)
local ROBUX_CATEGORY_NAME = constantsModule.ROBUX_CATEGORY_NAME
local text = url.APIS_URL .. "marketplace-widgets/v1/widgets/robux-widget"
local t = { categories = {}, sections = {}, failedItems = {} }

local function _(p1)
	-- upvalues: url (ref), text (ref)
	return `{text}?{url:makeQueryString({ requestId = p1, universeId = game.GameId })}`
end

local function validateAndResolve(p1, p2, p3)
	-- upvalues: errorsModule (ref)
	if typeof(p1) ~= "table" then
		p3(errorsModule.schemaError("fetchRobuxWidgetsAfterPurchase: malformed response, expected { category = ... }", p1))
		
		return false
	elseif p1.category == nil or typeof(p1.category) == "table" then
		p2(p1)
		
		return true
	end
	p3(errorsModule.schemaError("fetchRobuxWidgetsAfterPurchase: malformed response, category must be a table", p1))
	
	return false
end

local function buildFromWidgetResponse(p1, p2)
	-- upvalues: promiseModule (ref), t (ref), ROBUX_CATEGORY_NAME (ref), buildShopDataFromWidgetsModule (ref)
	local category = p1.category
	
	if category == nil then
		return promiseModule.resolve(t)
	end
	local t_1 = {}
	
	for i, v in ipairs(category.items) do
		if v.type == "Robux" then
			table.insert(t_1, v)
		end
	end
	return buildShopDataFromWidgetsModule({
		categories = {
			{
				id = category.id,
				name = ROBUX_CATEGORY_NAME,
				items = t_1,
				metadata = category.metadata
			}
		}
	}, p2)
end

local function fetchViaGetAsyncFullUrl(p3)
	-- upvalues: promiseModule (ref), url (ref), text (ref), shopDebugLoggerModule (ref), httpRbxApiService (ref), errorsModule (ref), httpService (ref), validateAndResolve (ref)
	return promiseModule.new(function(p4, p5)
		-- upvalues: p3 (ref), url (copy), text (copy), shopDebugLoggerModule (copy), httpRbxApiService (copy), errorsModule (copy), httpService (copy), validateAndResolve (copy)
		task.spawn(function()
			-- upvalues: p3 (copy), url (copy), text (copy), shopDebugLoggerModule (copy), httpRbxApiService (copy), p5 (ref), errorsModule (copy), httpService (copy), validateAndResolve (copy), p4 (ref)
			local status = `{text}?{url:makeQueryString({ requestId = p3, universeId = game.GameId })}`
			shopDebugLoggerModule.logLazy(function()
				-- upvalues: status (ref)
				return "fetchRobuxWidgetsAfterPurchase: GET " .. status
			end)
			local var1 = shopDebugLoggerModule.startTimer()
			ok, status = pcall(function()
				-- upvalues: httpRbxApiService (copy), status (ref)
				return httpRbxApiService:GetAsyncFullUrl(status)
			end)
			
			if not ok then
				shopDebugLoggerModule.logElapsed("fetchRobuxWidgetsAfterPurchase: HTTP error", var1)
				p5(errorsModule.networkError("fetchRobuxWidgetsAfterPurchase: HTTP request failed", status))
				
				return
			end
			shopDebugLoggerModule.logElapsed("fetchRobuxWidgetsAfterPurchase: HTTP response received", var1)
			local ok_1, status_1 = pcall(function()
				-- upvalues: httpService (copy), status (ref)
				return httpService:JSONDecode(status)
			end)
			
			if ok_1 then
				validateAndResolve(status_1, p4, p5)
				
				return
			end
			p5(errorsModule.parseError("fetchRobuxWidgetsAfterPurchase: response body is not valid JSON", status_1))
		end)
	end)
end

local function fetchViaRequestImpl(p3)
	-- upvalues: url (ref), text (ref), shopDebugLoggerModule (ref), requestInternalWrapper (ref), httpService (ref), fIntExperienceShopWidgetRequestPriorityModule (ref), promiseModule (ref), validateAndResolve (ref), errorsModule (ref)
	local var1 = `{text}?{url:makeQueryString({ requestId = p3, universeId = game.GameId })}`
	shopDebugLoggerModule.logLazy(function()
		-- upvalues: var1 (ref)
		return "fetchRobuxWidgetsAfterPurchase: GET " .. var24
	end)
	local var2 = shopDebugLoggerModule.startTimer()
	
	return requestInternalWrapper(httpService)(var1, "GET", if fIntExperienceShopWidgetRequestPriorityModule ~= 0 then nil else { priority = fIntExperienceShopWidgetRequestPriorityModule }):andThen(function(p4)
		-- upvalues: shopDebugLoggerModule (copy), var2 (ref), promiseModule (copy), validateAndResolve (copy)
		shopDebugLoggerModule.logElapsed("fetchRobuxWidgetsAfterPurchase: HTTP response received", var2)
		
		return promiseModule.new(function(p5, p6)
			-- upvalues: validateAndResolve (copy), p4 (ref)
			validateAndResolve(p4.responseBody, p5, p6)
		end)
	end):catch(function(p4)
		-- upvalues: promiseModule (copy), errorsModule (copy), shopDebugLoggerModule (copy), var2 (ref)
		if typeof(p4) == "table" and p4.kind ~= nil then
			return promiseModule.reject(p4)
		elseif typeof(p4) == "table" and p4.isJSONValid == false then
			return promiseModule.reject(errorsModule.parseError("fetchRobuxWidgetsAfterPurchase: response body is not valid JSON", p4))
		end
		shopDebugLoggerModule.logElapsed("fetchRobuxWidgetsAfterPurchase: HTTP error", var2)
		
		return promiseModule.reject(errorsModule.networkError("fetchRobuxWidgetsAfterPurchase: HTTP request failed", p4))
	end)
end

local function fetchRobuxWidget(p3)
	-- upvalues: fFlagSkipShopWidgetsCallInUnpublishedStudioModule (ref), runService (ref), shopDebugLoggerModule (ref), promiseModule (ref), fFlagUseShopRequestImplModule (ref), fetchViaRequestImpl (ref), fetchViaGetAsyncFullUrl (ref)
	if fFlagSkipShopWidgetsCallInUnpublishedStudioModule and runService:IsStudio() and game.GameId == 0 then
		shopDebugLoggerModule.logLazy(function()
			-- upvalues: p3 (ref)
			return "fetchRobuxWidgetsAfterPurchase: skipped unpublished Studio requestId=" .. p14
		end)
		
		return promiseModule.resolve({})
	end
	return if fFlagUseShopRequestImplModule then fetchViaRequestImpl(p3) else fetchViaGetAsyncFullUrl(p3)
end

return {
	fetchRobuxWidgetsAfterPurchase = function()
		-- upvalues: httpService (ref), shopDebugLoggerModule (ref), fetchRobuxWidget (ref), buildFromWidgetResponse (ref), multiGetProductInfoModule (ref)
		local var1 = httpService:GenerateGUID(false)
		shopDebugLoggerModule.logLazy(function()
			-- upvalues: var1 (ref)
			return "fetchRobuxWidgetsAfterPurchase: start requestId=" .. var26
		end)
		
		return fetchRobuxWidget(var1):andThen(function(p3)
			-- upvalues: buildFromWidgetResponse (copy), multiGetProductInfoModule (copy)
			return buildFromWidgetResponse(p3, multiGetProductInfoModule)
		end)
	end,
	buildFromWidgetResponse = buildFromWidgetResponse,
	EMPTY_SHOP_DATA = t
}