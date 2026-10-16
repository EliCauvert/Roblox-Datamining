local HttpRbxApiService = game:GetService("HttpRbxApiService")
local HttpService = game:GetService("HttpService")
local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local PromiseModule = require(Parent.Promise)
local HttpModule = require(Parent.Http)
local Url = HttpModule.Url
local RequestInternalWrapperFunction = HttpModule.NetworkLayers.requestInternalWrapper
local _ = require(InExperienceShop.Types)
local ErrorsModule = require(script.Parent.Errors)
local ShopDebugLoggerModule = require(InExperienceShop.Internal.ShopDebugLogger)
local FFlagUseShopRequestImplModule = require(InExperienceShop.Flags.FFlagUseShopRequestImpl)
local FIntExperienceShopWidgetRequestPriorityModule = require(InExperienceShop.Flags.FIntExperienceShopWidgetRequestPriority)
local FFlagSkipShopWidgetsCallInUnpublishedStudioModule = require(InExperienceShop.Flags.FFlagSkipShopWidgetsCallInUnpublishedStudio)
local RunService = game:GetService("RunService")
local Text = Url.APIS_URL .. "marketplace-widgets/v1/widgets/shop-widgets"

local function _(RequestId): string --[[ Line: 28 | Named "buildShopWidgetsUrl" ]]
	-- upvalues: Url (copy), Text (copy)
	return `{Text}?{Url:makeQueryString({ requestId = RequestId, universeId = game.GameId })}`
end

local _ = function(p1) --[[ Line: 36 | Named "logSuccess" ]]
	-- upvalues: ShopDebugLoggerModule (copy)
	ShopDebugLoggerModule.logLazy(function(): string --[[ Line: 37 ]]
		-- upvalues: p1 (copy)
		return "fetchShopItemIds: success categories=" .. (typeof(p1.categories) == "table" and #p1.categories or 0)
	end)
end

local function validateAndResolve(ResponseBody, Callback1: (any) -> (), Callback: (any) -> ()): boolean --[[ Line: 43 ]]
	-- upvalues: ShopDebugLoggerModule (copy), ErrorsModule (copy)
	if typeof(ResponseBody) == "table" and ResponseBody.categories ~= nil then
		ShopDebugLoggerModule.logLazy(function(): string --[[ Line: 37 ]]
			-- upvalues: ResponseBody (copy)
			return "fetchShopItemIds: success categories=" .. (typeof(ResponseBody.categories) == "table" and #ResponseBody.categories or 0)
		end)
		Callback1(ResponseBody)
		
		return true
	else
		ShopDebugLoggerModule.log("fetchShopItemIds: schema error, missing categories field")
		Callback((ErrorsModule.schemaError("fetchShopItemIds: malformed response, expected { categories = ... }", ResponseBody)))
		
		return false
	end
end

local function fetchShopItemIdsViaGetAsyncFullUrl(RequestId) --[[ Line: 70 ]]
	-- upvalues: PromiseModule (copy), Url (copy), Text (copy), ShopDebugLoggerModule (copy), HttpRbxApiService (copy), ErrorsModule (copy), HttpService (copy), validateAndResolve (copy)
	return PromiseModule.new(function(p1, Callback) --[[ Line: 71 ]]
		-- upvalues: RequestId (copy), Url (upval), Text (upval), ShopDebugLoggerModule (upval), HttpRbxApiService (upval), ErrorsModule (upval), HttpService (upval), validateAndResolve (upval)
		task.spawn(function() --[[ Line: 72 ]]
			-- upvalues: RequestId (upval), Url (upval), Text (upval), ShopDebugLoggerModule (upval), HttpRbxApiService (upval), Callback (copy), ErrorsModule (upval), HttpService (upval), validateAndResolve (upval), p1 (copy)
			local Text1: string = `{Text}?{Url:makeQueryString({ requestId = RequestId, universeId = game.GameId })}`
			ShopDebugLoggerModule.logLazy(function(): string --[[ Line: 75 ]]
				-- upvalues: Text1 (copy)
				return "fetchShopItemIds: GET " .. Text1
			end)
			local StartTimerResult = ShopDebugLoggerModule.startTimer()
			local Success, Result = pcall(function() --[[ Line: 85 ]]
				-- upvalues: HttpRbxApiService (upval), Text1 (copy)
				return HttpRbxApiService:GetAsyncFullUrl(Text1)
			end)
			
			if not Success then
				ShopDebugLoggerModule.logElapsed("fetchShopItemIds: HTTP error", StartTimerResult)
				ShopDebugLoggerModule.logLazy(function(): string --[[ Line: 90 ]]
					-- upvalues: Result (copy)
					return "fetchShopItemIds: HTTP error detail=" .. tostring(Result)
				end)
				Callback((ErrorsModule.networkError("fetchShopItemIds: HTTP request failed", Result)))
				
				return
			end
			ShopDebugLoggerModule.logElapsed("fetchShopItemIds: HTTP response received", StartTimerResult)
			local Success1, Result1 = pcall(function() --[[ Line: 99 ]]
				-- upvalues: HttpService (upval), Result (copy)
				return HttpService:JSONDecode(Result)
			end)
			
			if Success1 then
				validateAndResolve(Result1, p1, Callback)
				
				return
			else
				ShopDebugLoggerModule.logLazy(function(): string --[[ Line: 103 ]]
					-- upvalues: Result1 (copy)
					return "fetchShopItemIds: JSON parse error=" .. tostring(Result1)
				end)
				Callback((ErrorsModule.parseError("fetchShopItemIds: response body is not valid JSON", Result1)))
			end
		end)
	end)
end

local function fetchShopItemIdsViaRequestImpl(RequestId) --[[ Line: 115 ]]
	-- upvalues: Url (copy), Text (copy), ShopDebugLoggerModule (copy), RequestInternalWrapperFunction (copy), HttpService (copy), FIntExperienceShopWidgetRequestPriorityModule (copy), PromiseModule (copy), validateAndResolve (copy), ErrorsModule (copy)
	local Text1: string = `{Text}?{Url:makeQueryString({ requestId = RequestId, universeId = game.GameId })}`
	ShopDebugLoggerModule.logLazy(function(): string --[[ Line: 118 ]]
		-- upvalues: Text1 (copy)
		return "fetchShopItemIds: GET " .. Text1
	end)
	local StartTimerResult = ShopDebugLoggerModule.startTimer()
	
	return RequestInternalWrapperFunction(HttpService)(Text1, "GET", if FIntExperienceShopWidgetRequestPriorityModule == 0 then nil else { priority = FIntExperienceShopWidgetRequestPriorityModule }):andThen(function(Result) --[[ Line: 130 ]]
		-- upvalues: ShopDebugLoggerModule (upval), StartTimerResult (copy), PromiseModule (upval), validateAndResolve (upval)
		ShopDebugLoggerModule.logElapsed("fetchShopItemIds: HTTP response received", StartTimerResult)
		
		return PromiseModule.new(function(p1, p2) --[[ Line: 132 ]]
			-- upvalues: validateAndResolve (upval), Result (copy)
			validateAndResolve(Result.responseBody, p1, p2)
		end)
	end):catch(function(Err) --[[ Line: 136 ]]
		-- upvalues: PromiseModule (upval), ShopDebugLoggerModule (upval), ErrorsModule (upval), StartTimerResult (copy)
		if typeof(Err) == "table" and Err.kind ~= nil then
			return PromiseModule.reject(Err)
		elseif typeof(Err) == "table" and Err.isJSONValid == false then
			ShopDebugLoggerModule.logLazy(function(): string --[[ Line: 142 ]]
				-- upvalues: Err (copy)
				return "fetchShopItemIds: JSON parse error=" .. tostring(Err)
			end)
			
			return PromiseModule.reject((ErrorsModule.parseError("fetchShopItemIds: response body is not valid JSON", Err)))
		else
			ShopDebugLoggerModule.logElapsed("fetchShopItemIds: HTTP error", StartTimerResult)
			ShopDebugLoggerModule.logLazy(function(): string --[[ Line: 151 ]]
				-- upvalues: Err (copy)
				return "fetchShopItemIds: HTTP error detail=" .. tostring(Err)
			end)
			
			return PromiseModule.reject((ErrorsModule.networkError("fetchShopItemIds: HTTP request failed", Err)))
		end
	end)
end

return function(RequestId) --[[ Line: 158 | Named "fetchShopItemIds" ]]
	-- upvalues: FFlagSkipShopWidgetsCallInUnpublishedStudioModule (copy), RunService (copy), ShopDebugLoggerModule (copy), PromiseModule (copy), FFlagUseShopRequestImplModule (copy), FIntExperienceShopWidgetRequestPriorityModule (copy), fetchShopItemIdsViaRequestImpl (copy), fetchShopItemIdsViaGetAsyncFullUrl (copy)
	if FFlagSkipShopWidgetsCallInUnpublishedStudioModule and RunService:IsStudio() and game.GameId == 0 then
		ShopDebugLoggerModule.logLazy(function(): string --[[ Line: 160 ]]
			-- upvalues: RequestId (copy)
			return "fetchShopItemIds: skipped unpublished Studio experience requestId=" .. RequestId
		end)
		
		return PromiseModule.resolve({ categories = {} })
	elseif FFlagUseShopRequestImplModule then
		ShopDebugLoggerModule.logLazy(function(): string --[[ Line: 167 ]]
			-- upvalues: FIntExperienceShopWidgetRequestPriorityModule (upval), RequestId (copy)
			return `fetchShopItemIds: transport=requestInternalWrapper requestId={RequestId}{if FIntExperienceShopWidgetRequestPriorityModule == 0 then "" else ` priority={FIntExperienceShopWidgetRequestPriorityModule}`}`
		end)
		
		return fetchShopItemIdsViaRequestImpl(RequestId)
	else
		ShopDebugLoggerModule.logLazy(function(): string --[[ Line: 176 ]]
			-- upvalues: RequestId (copy)
			return `fetchShopItemIds: transport=GetAsyncFullUrl requestId={RequestId}`
		end)
		
		return fetchShopItemIdsViaGetAsyncFullUrl(RequestId)
	end
end