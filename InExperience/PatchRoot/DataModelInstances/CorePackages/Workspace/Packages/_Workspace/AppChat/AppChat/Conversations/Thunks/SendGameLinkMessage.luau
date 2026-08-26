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
local var1 = httpRequestModule.config({
	requestFunction = function(p1, p2, p3)
		-- upvalues: httpRequestModule (ref)
		return httpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3)
	end,
	maxRetryCount = if fFlagLuaAppDefaultHttpRetry then game:DefineFastInt("SendGameLinkMessageHttpRetryCount", 4) else nil
})

local function _(p1)
	-- upvalues: url (ref), var1 (ref)
	return var1(`{url.GAME_URL}v1/games?universeIds={p1}`, "GET"):andThen(function(p2)
		local data = p2 and (p2.responseBody and p2.responseBody.data)
		local var2 = data and data[1]
		
		return if var2 then var2.rootPlaceId else nil
	end)
end

return function(p1, p2)
	-- upvalues: url (ref), var1 (ref), promiseModule (ref), sendTextMessageModule (ref), name (ref)
	return function(p3)
		-- upvalues: p2 (ref), url (copy), var1 (copy), promiseModule (copy), sendTextMessageModule (copy), p1 (ref), name (copy)
		return var1(`{url.GAME_URL}v1/games?universeIds={p2}`, "GET"):andThen(function(p4)
			local data = p4 and (p4.responseBody and p4.responseBody.data)
			local var2 = data and data[1]
			
			return if var2 then var2.rootPlaceId else nil
		end):andThen(function(p4)
			-- upvalues: promiseModule (copy), p2 (copy), url (copy), p3 (ref), sendTextMessageModule (copy), p1 (copy)
			return if p4 then p3:dispatch(sendTextMessageModule(p1, `{url.BASE_URL}games/{p4}`, nil)) else promiseModule.reject(`no root place id for universe {p2}`)
		end):catch(function(p5)
			-- upvalues: name (copy), p2 (copy), promiseModule (copy)
			name:warning(`SendGameLinkMessage failed for universe {p2}: {tostring(p5)}`)
			
			return promiseModule.reject(p5)
		end)
	end
end