local corePackagesService = game:GetService("CorePackages")
local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local url = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).Url
local promiseModule = require(corePackagesService.Packages.Promise)
local resolveSourceLanguageNameModule = require(script.Parent.Parent.Network.resolveSourceLanguageName)

local function requestJson(p0)
	-- upvalues: promiseModule (ref), httpService (ref)
	return promiseModule.new(function(p1, p2)
		-- upvalues: httpService (copy), p0 (ref)
		httpService:RequestInternal({ Method = "GET", Url = p0 }):Start(function(p3, p4)
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
	end)
end

return function()
	-- upvalues: playersService (ref), url (ref), promiseModule (ref), httpService (ref), requestJson (ref), resolveSourceLanguageNameModule (ref)
	local localeId = playersService.LocalPlayer.LocaleId
	local formattedText = string.format("%sv1/locales?displayValueLocale=%s", url.LOCALE_URL, if localeId then localeId:gsub("-", "_") else "")
	
	return promiseModule.all({
		promiseModule.new(function(p6, p7)
			-- upvalues: httpService (copy), formattedText (ref)
			httpService:RequestInternal({ Method = "GET", Url = formattedText }):Start(function(p8, p9)
				-- upvalues: p7 (ref), httpService (copy), p6 (ref)
				if not p8 then
					p7("Connection error")
					
					return
				elseif p9.StatusCode < 200 or p9.StatusCode >= 400 then
					p7("Status code: " .. tostring(p9.StatusCode))
					
					return
				end
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), p9 (ref)
					return httpService:JSONDecode(p9.Body)
				end)
				
				if ok then
					p6(status)
					
					return
				end
				p7("Failed to decode response body")
			end)
		end),
		requestJson(string.format("%sv1/source-language/games/%d", url.GAME_INTERNATIONALIZATION_URL, game.GameId))
	}):andThen(function(p5)
		-- upvalues: resolveSourceLanguageNameModule (copy), promiseModule (copy)
		local var7 = resolveSourceLanguageNameModule(p5[1].data, p5[2].languageCode)
		
		return if var7 == nil then promiseModule.reject("Could not resolve source language name") else var7
	end)
end