local Parent = script:FindFirstAncestor("PasskeyUpsell").Parent
local PromiseModule = require(Parent.Promise)
local Url = require(Parent.Http).Url
local Logger = require(Parent.Loggers).Logger

local function _(): string
	-- upvalues: Url (copy)
	return string.format("%sv1/passkey/ListCredentials", Url.AUTH_URL)
end

local _ = function(Callback)
	-- upvalues: Url (copy), PromiseModule (copy)
	return Callback(string.format("%sv1/passkey/ListCredentials", Url.AUTH_URL), "POST"):andThen(function(Entry)
		-- upvalues: PromiseModule (upval)
		return PromiseModule.resolve(Entry[1])
	end)
end

return function(Callback)
	-- upvalues: Url (copy), PromiseModule (copy), Logger (copy)
	return Callback(string.format("%sv1/passkey/ListCredentials", Url.AUTH_URL), "POST"):andThen(function(Entry)
		-- upvalues: PromiseModule (upval)
		return PromiseModule.resolve(Entry[1])
	end):andThen(function(Result): boolean
		-- upvalues: Logger (upval)
		if Result and Result.credentials then
			Logger:info("User has {} existing passkey credentials.", #Result.credentials)
			
			return #Result.credentials > 0
		else
			Logger:info("User does NOT have existing passkey credentials.")
			
			return false
		end
	end):catch(function(Err): boolean
		-- upvalues: Logger (upval)
		Logger:debug("Error checking if user has passkey: {}", Err)
		
		return true
	end)
end