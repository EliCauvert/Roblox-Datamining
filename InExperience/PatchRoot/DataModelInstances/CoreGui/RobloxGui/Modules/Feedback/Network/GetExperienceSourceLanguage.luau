local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local Url = require(CorePackages.Workspace.Packages.CoreScriptsCommon).Url
local PromiseModule = require(CorePackages.Packages.Promise)
local ResolveSourceLanguageNameModule = require(script.Parent.Parent.Network.resolveSourceLanguageName)

local function requestJson(Url) --[[ Line: 25 ]]
	-- upvalues: PromiseModule (copy), HttpService (copy)
	return PromiseModule.new(function(Callback1, Callback) --[[ Line: 26 ]]
		-- upvalues: HttpService (upval), Url (copy)
		HttpService:RequestInternal({ Method = "GET", Url = Url }):Start(function(p1, p2) --[[ Line: 30 ]]
			-- upvalues: Callback (copy), HttpService (upval), Callback1 (copy)
			if not p1 then
				Callback("Connection error")
				
				return
			end
			if p2.StatusCode < 200 or p2.StatusCode >= 400 then
				Callback("Status code: " .. tostring(p2.StatusCode))
				
				return
			end
			local Success, Result = pcall(function() --[[ Line: 36 ]]
				-- upvalues: HttpService (upval), p2 (copy)
				return HttpService:JSONDecode(p2.Body)
			end)
			
			if Success then
				Callback1(Result)
				
				return
			else
				Callback("Failed to decode response body")
			end
		end)
	end)
end

return function() --[[ Line: 49 ]]
	-- upvalues: Players (copy), Url (copy), PromiseModule (copy), HttpService (copy), requestJson (copy), ResolveSourceLanguageNameModule (copy)
	local LocaleId: string = Players.LocalPlayer.LocaleId
	local Formatted = string.format("%sv1/locales?displayValueLocale=%s", Url.LOCALE_URL, if LocaleId then LocaleId:gsub("-", "_") else "")
	
	return PromiseModule.all({
		PromiseModule.new(function(Callback1, Callback) --[[ Line: 26 ]]
			-- upvalues: HttpService (upval), Formatted (copy)
			HttpService:RequestInternal({ Method = "GET", Url = Formatted }):Start(function(p1, p2) --[[ Line: 30 ]]
				-- upvalues: Callback (copy), HttpService (upval), Callback1 (copy)
				if not p1 then
					Callback("Connection error")
					
					return
				end
				if p2.StatusCode < 200 or p2.StatusCode >= 400 then
					Callback("Status code: " .. tostring(p2.StatusCode))
					
					return
				end
				local Success, Result = pcall(function() --[[ Line: 36 ]]
					-- upvalues: HttpService (upval), p2 (copy)
					return HttpService:JSONDecode(p2.Body)
				end)
				
				if Success then
					Callback1(Result)
					
					return
				else
					Callback("Failed to decode response body")
				end
			end)
		end),
		requestJson((string.format("%sv1/source-language/games/%d", Url.GAME_INTERNATIONALIZATION_URL, game.GameId)))
	}):andThen(function(Entry) --[[ Line: 61 ]]
		-- upvalues: ResolveSourceLanguageNameModule (upval), PromiseModule (upval)
		local ResolveSourceLanguageNameModuleResult = ResolveSourceLanguageNameModule(Entry[1].data, Entry[2].languageCode)
		
		return if ResolveSourceLanguageNameModuleResult == nil then PromiseModule.reject("Could not resolve source language name") else ResolveSourceLanguageNameModuleResult
	end)
end