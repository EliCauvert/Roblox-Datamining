local MessageBusService = game:GetService("MessageBusService")
local Http = script:FindFirstAncestor("Http")
local Parent = Http.Parent
local PromiseModule = require(Parent.Promise)
local CryoModule = require(Parent.Cryo)
local Logging = require(Parent.AppCommonLib).Logging
local _ = require(Http.RequestTypes)

return function(Callback, Url, Method, p1)
	-- upvalues: PromiseModule (copy), MessageBusService (copy), Logging (copy), CryoModule (copy)
	return PromiseModule.new(function(p2, Callback1)
		-- upvalues: Url (copy), Method (copy), MessageBusService (upval), Logging (upval), p1 (copy), CryoModule (upval), Callback (copy)
		MessageBusService:MakeRequest("CredentialsProtocol", "getHeaders", { url = Url, method = Method }, function(p3)
			-- upvalues: Logging (upval), Callback1 (copy), p1 (upval), CryoModule (upval), Callback (upval), Url (upval), Method (upval), p2 (copy)
			if not p3 or not p3.success then
				Logging.warn("credential headers error")
				Callback1({})
			end
			p1.headers = CryoModule.Dictionary.join(p1.headers or {}, p3.headers or {})
			
			return Callback(Url, Method, p1):andThen(p2):catch(Callback1)
		end, {})
	end)
end