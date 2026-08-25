local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local fFlagLuaAppDefaultHttpRetry = require(parent.SharedFlags).FFlagLuaAppDefaultHttpRetry
local httpModule = require(parent.Http)
local httpRequestModule = require(parent.HttpRequest)
local promiseModule = require(parent.Promise)
local _ = require(parent.LuauPolyfill)
local sendTextMessageModule = require(script.Parent.SendTextMessage)
local name = require(appChat.Logger):new(script.Name)
local url = httpModule.Url
local var6 = httpRequestModule.config({
	requestFunction = function(p0, p1, p2)
		-- upvalues: httpRequestModule (ref)
		return httpRequestModule.requestFunctions.HttpRbxApi(p0, p1, p2)
	end,
	maxRetryCount = if fFlagLuaAppDefaultHttpRetry then game:DefineFastInt("SendGameLinkMessageHttpRetryCount", 4) else nil
})

local function _(p3)
	-- upvalues: url (ref), var6 (ref)
	return var6(`{url.GAME_URL}v1/games?universeIds={p3}`, "GET"):andThen(function(p4)
		local data = p4 and (p4.responseBody and p4.responseBody.data)
		local var8 = data and data[1]
		
		return if var8 then var8.rootPlaceId else nil
	end)
end

return function(p5, p6)
	-- upvalues: url (ref), var6 (ref), promiseModule (ref), sendTextMessageModule (ref), name (ref)
	return function(p7)
		-- upvalues: p6 (ref), url (copy), var6 (copy), promiseModule (copy), sendTextMessageModule (copy), p5 (ref), name (copy)
		return var6(`{url.GAME_URL}v1/games?universeIds={p6}`, "GET"):andThen(function(p10)
			local data = p10 and (p10.responseBody and p10.responseBody.data)
			local var8 = data and data[1]
			
			return if var8 then var8.rootPlaceId else nil
		end):andThen(function(p9)
			-- upvalues: promiseModule (copy), p6 (copy), url (copy), p7 (ref), sendTextMessageModule (copy), p5 (copy)
			return if p9 then p7:dispatch(sendTextMessageModule(p5, `{url.BASE_URL}games/{p9}`, nil)) else promiseModule.reject(`no root place id for universe {p6}`)
		end):catch(function(p8)
			-- upvalues: name (copy), p6 (copy), promiseModule (copy)
			name:warning(`SendGameLinkMessage failed for universe {p6}: {tostring(p8)}`)
			
			return promiseModule.reject(p8)
		end)
	end
end