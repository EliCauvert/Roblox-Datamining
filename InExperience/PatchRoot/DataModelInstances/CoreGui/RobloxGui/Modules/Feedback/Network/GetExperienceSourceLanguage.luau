local corePackagesService = game:GetService("CorePackages")
local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local url = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).Url
local promiseModule = require(corePackagesService.Packages.Promise)
local resolveSourceLanguageNameModule = require(script.Parent.Parent.Network.resolveSourceLanguageName)

local function requestJson(p1)
	-- upvalues: promiseModule (ref), httpService (ref)
	return promiseModule.new(function(p2, p3)
		-- upvalues: httpService (copy), p1 (ref)
		httpService:RequestInternal({ Method = "GET", Url = p1 }):Start(function(p4, p5)
			-- upvalues: p3 (ref), httpService (copy), p2 (ref)
			if not p4 then
				p3("Connection error")
				
				return
			elseif p5.StatusCode < 200 or p5.StatusCode >= 400 then
				p3("Status code: " .. tostring(p5.StatusCode))
				
				return
			end
			local ok, status = pcall(function()
				-- upvalues: httpService (copy), p5 (ref)
				return httpService:JSONDecode(p5.Body)
			end)
			
			if ok then
				p2(status)
				
				return
			end
			p3("Failed to decode response body")
		end)
	end)
end

return function()
	-- upvalues: playersService (ref), url (ref), promiseModule (ref), httpService (ref), requestJson (ref), resolveSourceLanguageNameModule (ref)
	local localeId = playersService.LocalPlayer.LocaleId
	local formattedText = string.format("%sv1/locales?displayValueLocale=%s", url.LOCALE_URL, if localeId then localeId:gsub("-", "_") else "")
	
	return promiseModule.all({
		promiseModule.new(function(p1, p2)
			-- upvalues: httpService (copy), formattedText (ref)
			httpService:RequestInternal({ Method = "GET", Url = formattedText }):Start(function(p3, p4)
				-- upvalues: p2 (ref), httpService (copy), p1 (ref)
				if not p3 then
					p2("Connection error")
					
					return
				elseif p4.StatusCode < 200 or p4.StatusCode >= 400 then
					p2("Status code: " .. tostring(p4.StatusCode))
					
					return
				end
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), p4 (ref)
					return httpService:JSONDecode(p4.Body)
				end)
				
				if ok then
					p1(status)
					
					return
				end
				p2("Failed to decode response body")
			end)
		end),
		requestJson(string.format("%sv1/source-language/games/%d", url.GAME_INTERNATIONALIZATION_URL, game.GameId))
	}):andThen(function(p1)
		-- upvalues: resolveSourceLanguageNameModule (copy), promiseModule (copy)
		local var1 = resolveSourceLanguageNameModule(p1[1].data, p1[2].languageCode)
		
		return if var1 == nil then promiseModule.reject("Could not resolve source language name") else var1
	end)
end