local HttpRbxApiService = game:GetService("HttpRbxApiService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local PromiseModule = require(Parent.Promise)
local HttpModule = require(Parent.Http)
local Url = HttpModule.Url
local RequestInternalWrapperFunction = HttpModule.NetworkLayers.requestInternalWrapper
local _ = require(InExperienceShop.Types)
local ErrorsModule = require(script.Parent.Errors)
local MultiGetProductInfoModule = require(script.Parent.multiGetProductInfo)
local BuildShopDataFromWidgetsModule = require(script.Parent.buildShopDataFromWidgets)
local ShopDebugLoggerModule = require(InExperienceShop.Internal.ShopDebugLogger)
local FFlagUseShopRequestImplModule = require(InExperienceShop.Flags.FFlagUseShopRequestImpl)
local FIntExperienceShopWidgetRequestPriorityModule = require(InExperienceShop.Flags.FIntExperienceShopWidgetRequestPriority)
local FFlagSkipShopWidgetsCallInUnpublishedStudioModule = require(InExperienceShop.Flags.FFlagSkipShopWidgetsCallInUnpublishedStudio)
local ROBUXCATEGORYNAME = require(InExperienceShop.Constants).ROBUX_CATEGORY_NAME
local Text = Url.APIS_URL .. "marketplace-widgets/v1/widgets/robux-widget"
local config = { categories = {}, sections = {}, failedItems = {} }

local function _(RequestId): string --[[ Line: 39 | Named "buildRobuxWidgetUrl" ]]
	-- upvalues: Url (copy), Text (copy)
	return `{Text}?{Url:makeQueryString({ requestId = RequestId, universeId = game.GameId })}`
end

local function validateAndResolve(ResponseBody, Callback1: (any) -> (), Callback: (any) -> ()): boolean --[[ Line: 47 ]]
	-- upvalues: ErrorsModule (copy)
	if typeof(ResponseBody) ~= "table" then
		Callback((ErrorsModule.schemaError("fetchRobuxWidgetsAfterPurchase: malformed response, expected { category = ... }", ResponseBody)))
		
		return false
	elseif ResponseBody.category == nil or typeof(ResponseBody.category) == "table" then
		Callback1(ResponseBody)
		
		return true
	else
		Callback((ErrorsModule.schemaError("fetchRobuxWidgetsAfterPurchase: malformed response, category must be a table", ResponseBody)))
		
		return false
	end
end

local function buildFromWidgetResponse(p1, MultiGetProductInfoModule) --[[ Line: 77 ]]
	-- upvalues: PromiseModule (copy), config (copy), ROBUXCATEGORYNAME (copy), BuildShopDataFromWidgetsModule (copy)
	local Category = p1.category
	
	if Category == nil then
		return PromiseModule.resolve(config)
	end
	local Items = {}
	
	for _, item in ipairs(Category.items) do
		if item.type == "Robux" then
			table.insert(Items, item)
		end
	end
	return BuildShopDataFromWidgetsModule({
		categories = {
			{
				id = Category.id,
				name = ROBUXCATEGORYNAME,
				items = Items,
				metadata = Category.metadata
			}
		}
	}, MultiGetProductInfoModule)
end

local function fetchViaGetAsyncFullUrl(RequestId) --[[ Line: 105 ]]
	-- upvalues: PromiseModule (copy), Url (copy), Text (copy), ShopDebugLoggerModule (copy), HttpRbxApiService (copy), ErrorsModule (copy), HttpService (copy), validateAndResolve (copy)
	return PromiseModule.new(function(p2, Callback) --[[ Line: 106 ]]
		-- upvalues: RequestId (copy), Url (upval), Text (upval), ShopDebugLoggerModule (upval), HttpRbxApiService (upval), ErrorsModule (upval), HttpService (upval), validateAndResolve (upval)
		task.spawn(function() --[[ Line: 107 ]]
			-- upvalues: RequestId (upval), Url (upval), Text (upval), ShopDebugLoggerModule (upval), HttpRbxApiService (upval), Callback (copy), ErrorsModule (upval), HttpService (upval), validateAndResolve (upval), p2 (copy)
			local Text1: string = `{Text}?{Url:makeQueryString({ requestId = RequestId, universeId = game.GameId })}`
			ShopDebugLoggerModule.logLazy(function(): string --[[ Line: 109 ]]
				-- upvalues: Text1 (copy)
				return "fetchRobuxWidgetsAfterPurchase: GET " .. Text1
			end)
			local StartTimerResult = ShopDebugLoggerModule.startTimer()
			local Success, Result = pcall(function() --[[ Line: 113 ]]
				-- upvalues: HttpRbxApiService (upval), Text1 (copy)
				return HttpRbxApiService:GetAsyncFullUrl(Text1)
			end)
			
			if not Success then
				ShopDebugLoggerModule.logElapsed("fetchRobuxWidgetsAfterPurchase: HTTP error", StartTimerResult)
				Callback((ErrorsModule.networkError("fetchRobuxWidgetsAfterPurchase: HTTP request failed", Result)))
				
				return
			end
			ShopDebugLoggerModule.logElapsed("fetchRobuxWidgetsAfterPurchase: HTTP response received", StartTimerResult)
			local Success1, Result1 = pcall(function() --[[ Line: 125 ]]
				-- upvalues: HttpService (upval), Result (copy)
				return HttpService:JSONDecode(Result)
			end)
			
			if Success1 then
				validateAndResolve(Result1, p2, Callback)
				
				return
			else
				Callback((ErrorsModule.parseError("fetchRobuxWidgetsAfterPurchase: response body is not valid JSON", Result1)))
			end
		end)
	end)
end

local function fetchViaRequestImpl(RequestId) --[[ Line: 139 ]]
	-- upvalues: Url (copy), Text (copy), ShopDebugLoggerModule (copy), RequestInternalWrapperFunction (copy), HttpService (copy), FIntExperienceShopWidgetRequestPriorityModule (copy), PromiseModule (copy), validateAndResolve (copy), ErrorsModule (copy)
	local Text1: string = `{Text}?{Url:makeQueryString({ requestId = RequestId, universeId = game.GameId })}`
	ShopDebugLoggerModule.logLazy(function(): string --[[ Line: 141 ]]
		-- upvalues: Text1 (copy)
		return "fetchRobuxWidgetsAfterPurchase: GET " .. Text1
	end)
	local StartTimerResult = ShopDebugLoggerModule.startTimer()
	
	return RequestInternalWrapperFunction(HttpService)(Text1, "GET", if FIntExperienceShopWidgetRequestPriorityModule == 0 then nil else { priority = FIntExperienceShopWidgetRequestPriorityModule }):andThen(function(Result) --[[ Line: 150 ]]
		-- upvalues: ShopDebugLoggerModule (upval), StartTimerResult (copy), PromiseModule (upval), validateAndResolve (upval)
		ShopDebugLoggerModule.logElapsed("fetchRobuxWidgetsAfterPurchase: HTTP response received", StartTimerResult)
		
		return PromiseModule.new(function(p2, p3) --[[ Line: 152 ]]
			-- upvalues: validateAndResolve (upval), Result (copy)
			validateAndResolve(Result.responseBody, p2, p3)
		end)
	end):catch(function(Err) --[[ Line: 156 ]]
		-- upvalues: PromiseModule (upval), ErrorsModule (upval), ShopDebugLoggerModule (upval), StartTimerResult (copy)
		if typeof(Err) == "table" and Err.kind ~= nil then
			return PromiseModule.reject(Err)
		elseif typeof(Err) == "table" and Err.isJSONValid == false then
			return PromiseModule.reject((ErrorsModule.parseError("fetchRobuxWidgetsAfterPurchase: response body is not valid JSON", Err)))
		else
			ShopDebugLoggerModule.logElapsed("fetchRobuxWidgetsAfterPurchase: HTTP error", StartTimerResult)
			
			return PromiseModule.reject((ErrorsModule.networkError("fetchRobuxWidgetsAfterPurchase: HTTP request failed", Err)))
		end
	end)
end

local function fetchRobuxWidget(RequestId) --[[ Line: 172 ]]
	-- upvalues: FFlagSkipShopWidgetsCallInUnpublishedStudioModule (copy), RunService (copy), ShopDebugLoggerModule (copy), PromiseModule (copy), FFlagUseShopRequestImplModule (copy), fetchViaRequestImpl (copy), fetchViaGetAsyncFullUrl (copy)
	if FFlagSkipShopWidgetsCallInUnpublishedStudioModule and RunService:IsStudio() and game.GameId == 0 then
		ShopDebugLoggerModule.logLazy(function(): string --[[ Line: 174 ]]
			-- upvalues: RequestId (copy)
			return "fetchRobuxWidgetsAfterPurchase: skipped unpublished Studio requestId=" .. RequestId
		end)
		
		return PromiseModule.resolve({})
	else
		return if FFlagUseShopRequestImplModule then fetchViaRequestImpl(RequestId) else fetchViaGetAsyncFullUrl(RequestId)
	end
end

return {
	fetchRobuxWidgetsAfterPurchase = function() --[[ Line: 186 ]]
		-- upvalues: HttpService (copy), ShopDebugLoggerModule (copy), fetchRobuxWidget (copy), buildFromWidgetResponse (copy), MultiGetProductInfoModule (copy)
		local Guid = HttpService:GenerateGUID(false)
		ShopDebugLoggerModule.logLazy(function(): string --[[ Line: 188 ]]
			-- upvalues: Guid (copy)
			return "fetchRobuxWidgetsAfterPurchase: start requestId=" .. Guid
		end)
		
		return fetchRobuxWidget(Guid):andThen(function(Result) --[[ Line: 191 ]]
			-- upvalues: buildFromWidgetResponse (upval), MultiGetProductInfoModule (upval)
			return buildFromWidgetResponse(Result, MultiGetProductInfoModule)
		end)
	end,
	buildFromWidgetResponse = buildFromWidgetResponse,
	EMPTY_SHOP_DATA = config
}