local HttpService = game:GetService("HttpService")
local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local Parent = VirtualEvents.Parent
local NotificationsUpsellModule = require(Parent.NotificationsUpsell)
local PromiseModule = require(Parent.Promise)
local UrlBuilderModule = require(Parent.UrlBuilder)
local UrlBuilder = UrlBuilderModule.UrlBuilder
local UrlBase = UrlBuilderModule.UrlBase
local _ = require(VirtualEvents.Common.InGameRsvpPushUpsellTypes)
local LoggerModule = require(VirtualEvents.logger)
local FIntInGameRsvpPushUpsellTimeoutMsModule = require(VirtualEvents.Flags.FIntInGameRsvpPushUpsellTimeoutMs)
local PromptType = {
	OsPrompt = "PushNotificationsUpsellInGameOsPrompt",
	Settings = "PushNotificationsUpsellInGameSettings"
}
local list = { "title", "body", "confirm" }
local FetchInGameRsvpPushUpsellModule = {
	PromptType = PromptType,
	_sendRequest = function(Options, Callback)
		-- upvalues: HttpService (copy)
		HttpService:RequestInternal(Options):Start(function(_, p1)
			-- upvalues: Callback (copy)
			Callback(p1)
		end)
	end,
	_buildClientAttributes = function()
		-- upvalues: NotificationsUpsellModule (copy)
		return NotificationsUpsellModule.PushPermissionClientAttributes.build()
	end
}

local function getPromptsUrl(Input): string
	-- upvalues: UrlBuilder (copy), UrlBase (copy), HttpService (copy)
	return `{UrlBuilder.new({
		path = "modals-api/v1/prompts",
		base = UrlBase.APIS,
		query = {
			entryPoint = "InExperienceEventRsvpGoing",
			promptStyle = "Modal"
		}
	})()}&clientAttributes={HttpService:UrlEncode(HttpService:JSONEncode(Input))}`
end

local function _(p1)
	return if type(p1) == "table" then p1 else nil
end

local function readTranslations(p1)
	local t = {}
	local v1 = if type(p1) == "table" then p1 else nil
	local Translations = if v1 then v1.translations or v1.Translations else nil
	local Translations1 = if type(Translations) == "table" then Translations else nil
	
	if Translations1 then
		for i, value in Translations1 do
			if type(i) == "string" and type(value) == "string" then
				t[i] = value
			end
		end
	end
	return t
end

local function parsePrompt(p2)
	-- upvalues: PromptType (copy), readTranslations (copy), list (copy), LoggerModule (copy)
	local v2 = if type(p2) == "table" then p2 else nil
	local CustomPrompts = if v2 then v2.customPrompts else nil
	local CustomPrompts1 = if type(CustomPrompts) == "table" then CustomPrompts else nil
	
	if CustomPrompts1 == nil then
		return nil
	end
	local PromptTypeEntry = nil
	local CustomPrompt = nil
	for _, Path in { "OsPrompt", "Settings" } do
		PromptTypeEntry = PromptType[Path]
		CustomPrompt = CustomPrompts1[PromptTypeEntry]
		
		if CustomPrompt ~= nil then
			local Translations = readTranslations(CustomPrompt)
			
			for _, value in list do
				if Translations[value] == nil or Translations[value] == "" then
					LoggerModule:warning("In-game RSVP push upsell {} has no {} translation", PromptTypeEntry, value)
					
					return nil
				end
			end
			return {
				promptType = PromptTypeEntry,
				path = Path,
				translations = Translations
			}
		end
	end
	return nil
end

local _ = function(Url, Method, Body)
	-- upvalues: PromiseModule (copy), FetchInGameRsvpPushUpsellModule (copy)
	return PromiseModule.new(function(Callback, Callback1)
		-- upvalues: FetchInGameRsvpPushUpsellModule (upval), Url (copy), Method (copy), Body (copy)
		FetchInGameRsvpPushUpsellModule._sendRequest({
			Url = Url,
			Method = Method,
			Headers = if Method == "POST" then { ["Content-Type"] = "application/json" } else { Accept = "application/json" },
			Body = Body
		}, function(p3)
			-- upvalues: Method (upval), Callback (copy), Callback1 (copy), Url (upval)
			local StatusCode: number = p3.StatusCode
			
			if if Method == "POST" then typeof(StatusCode) == "number" and (StatusCode >= 200 and StatusCode < 300) else StatusCode == 200 then
				Callback(p3)
				
				return
			else
				Callback1(`{Method} {Url} failed: {tostring(p3.StatusCode)}`)
			end
		end)
	end)
end

function FetchInGameRsvpPushUpsellModule.fetch()
	-- upvalues: PromiseModule (copy), FIntInGameRsvpPushUpsellTimeoutMsModule (copy), LoggerModule (copy), FetchInGameRsvpPushUpsellModule (copy), getPromptsUrl (copy), HttpService (copy), parsePrompt (copy)
	return PromiseModule.new(function(Callback)
		-- upvalues: FIntInGameRsvpPushUpsellTimeoutMsModule (upval), LoggerModule (upval), FetchInGameRsvpPushUpsellModule (upval), getPromptsUrl (upval), PromiseModule (upval), HttpService (upval), parsePrompt (upval)
		local Flag = false
		
		local function settle(Result)
			-- upvalues: Flag (ref), Callback (copy)
			if not Flag then
				Flag = true
				Callback(Result)
			end
		end
		
		task.delay(FIntInGameRsvpPushUpsellTimeoutMsModule / 1000, function()
			-- upvalues: Flag (ref), LoggerModule (upval), FIntInGameRsvpPushUpsellTimeoutMsModule (upval), Callback (copy)
			if not Flag then
				LoggerModule:warning("In-game RSVP push upsell request timed out after {} ms", FIntInGameRsvpPushUpsellTimeoutMsModule)
				
				if not Flag then
					Flag = true
					Callback(nil)
				end
			end
		end)
		FetchInGameRsvpPushUpsellModule._buildClientAttributes():andThen(function(Result)
			-- upvalues: getPromptsUrl (upval), PromiseModule (upval), FetchInGameRsvpPushUpsellModule (upval), HttpService (upval), parsePrompt (upval)
			if next(Result) == nil then
				return nil
			else
				local PromptsUrl = getPromptsUrl(Result)
				local Method = "GET"
				local Body = nil
				
				return PromiseModule.new(function(Callback, Callback1)
					-- upvalues: FetchInGameRsvpPushUpsellModule (upval), PromptsUrl (copy), Method (copy), Body (copy)
					FetchInGameRsvpPushUpsellModule._sendRequest({
						Url = PromptsUrl,
						Method = Method,
						Headers = if Method == "POST" then { ["Content-Type"] = "application/json" } else { Accept = "application/json" },
						Body = Body
					}, function(p3)
						-- upvalues: Method (upval), Callback (copy), Callback1 (copy), PromptsUrl (upval)
						local StatusCode: number = p3.StatusCode
						
						if if Method == "POST" then typeof(StatusCode) == "number" and (StatusCode >= 200 and StatusCode < 300) else StatusCode == 200 then
							Callback(p3)
							
							return
						else
							Callback1(`{Method} {PromptsUrl} failed: {tostring(p3.StatusCode)}`)
						end
					end)
				end):andThen(function(Result)
					-- upvalues: HttpService (upval), PromiseModule (upval), parsePrompt (upval)
					local Success, Result1 = pcall(function()
						-- upvalues: HttpService (upval), Result (copy)
						return HttpService:JSONDecode(Result.Body)
					end)
					
					return if Success then parsePrompt(Result1) else PromiseModule.reject("invalid prompts response")
				end)
			end
		end):andThen(settle, function(p3)
			-- upvalues: Flag (ref), LoggerModule (upval), Callback (copy)
			if not Flag then
				LoggerModule:warning("In-game RSVP push upsell request failed: {}", (tostring(p3)))
				
				if not Flag then
					Flag = true
					Callback(nil)
				end
			end
		end)
	end)
end

local function postPromptEvent(Path, PromptId)
	-- upvalues: UrlBuilder (copy), UrlBase (copy), HttpService (copy), PromiseModule (copy), FetchInGameRsvpPushUpsellModule (copy), LoggerModule (copy)
	local Url = UrlBuilder.new({ base = UrlBase.APIS, path = Path })()
	local Json = HttpService:JSONEncode({ promptType = PromptId, promptId = PromptId })
	local Method = "POST"
	PromiseModule.new(function(Callback, Callback1)
		-- upvalues: FetchInGameRsvpPushUpsellModule (upval), Url (copy), Method (copy), Json (copy)
		FetchInGameRsvpPushUpsellModule._sendRequest({
			Url = Url,
			Method = Method,
			Headers = if Method == "POST" then { ["Content-Type"] = "application/json" } else { Accept = "application/json" },
			Body = Json
		}, function(p3)
			-- upvalues: Method (upval), Callback (copy), Callback1 (copy), Url (upval)
			local StatusCode: number = p3.StatusCode
			
			if if Method == "POST" then typeof(StatusCode) == "number" and (StatusCode >= 200 and StatusCode < 300) else StatusCode == 200 then
				Callback(p3)
				
				return
			else
				Callback1(`{Method} {Url} failed: {tostring(p3.StatusCode)}`)
			end
		end)
	end):catch(function(Err)
		-- upvalues: LoggerModule (upval)
		LoggerModule:warning("In-game RSVP push upsell event failed: {}", (tostring(Err)))
	end)
end

function FetchInGameRsvpPushUpsellModule.reportImpression(PromptId)
	-- upvalues: postPromptEvent (copy)
	postPromptEvent("modals-api/v1/prompts/impression", PromptId)
end

function FetchInGameRsvpPushUpsellModule.reportDismiss(PromptId)
	-- upvalues: postPromptEvent (copy)
	postPromptEvent("modals-api/v1/prompts/dismiss", PromptId)
end

return FetchInGameRsvpPushUpsellModule