local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local HttpRequestModule = require(Parent.HttpRequest)
local PromiseModule = require(Parent.Promise)
local _ = require(Parent.LuauPolyfill)
local SendTextMessageModule = require(script.Parent.SendTextMessage)
local NewResult = require(AppChat.Logger):new(script.Name)
local Url = require(Parent.Http).Url
local ConfigResult = HttpRequestModule.config({
	requestFunction = function(p1, p2, p3) --[[ Line: 25 ]]
		-- upvalues: HttpRequestModule (copy)
		return HttpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3)
	end,
	maxRetryCount = if require(Parent.SharedFlags).FFlagLuaAppDefaultHttpRetry then game:DefineFastInt("SendGameLinkMessageHttpRetryCount", 4) else nil
})

local function _(p1) --[[ Line: 33 | Named "fetchRootPlaceId" ]]
	-- upvalues: Url (copy), ConfigResult (copy)
	return ConfigResult(`{Url.GAME_URL}v1/games?universeIds={p1}`, "GET"):andThen(function(Result) --[[ Line: 36 ]]
		local Data = Result and (Result.responseBody and Result.responseBody.data)
		local Entry = Data and Data[1]
		
		return Entry and Entry.rootPlaceId or nil
	end)
end

return function(p1, p2) --[[ Line: 43 ]]
	-- upvalues: Url (copy), ConfigResult (copy), PromiseModule (copy), SendTextMessageModule (copy), NewResult (copy)
	return function(p3) --[[ Line: 44 ]]
		-- upvalues: p2 (copy), Url (upval), ConfigResult (upval), PromiseModule (upval), SendTextMessageModule (upval), p1 (copy), NewResult (upval)
		return ConfigResult(`{Url.GAME_URL}v1/games?universeIds={p2}`, "GET"):andThen(function(Result) --[[ Line: 36 ]]
			local Data = Result and (Result.responseBody and Result.responseBody.data)
			local Entry = Data and Data[1]
			
			return Entry and Entry.rootPlaceId or nil
		end):andThen(function(Result) --[[ Line: 46 ]]
			-- upvalues: PromiseModule (upval), p2 (upval), Url (upval), p3 (copy), SendTextMessageModule (upval), p1 (upval)
			return if Result then p3:dispatch(SendTextMessageModule(p1, `{Url.BASE_URL}games/{Result}`, nil)) else PromiseModule.reject(`no root place id for universe {p2}`)
		end):catch(function(Err) --[[ Line: 55 ]]
			-- upvalues: NewResult (upval), p2 (upval), PromiseModule (upval)
			NewResult:warning(`SendGameLinkMessage failed for universe {p2}: {tostring(Err)}`)
			
			return PromiseModule.reject(Err)
		end)
	end
end