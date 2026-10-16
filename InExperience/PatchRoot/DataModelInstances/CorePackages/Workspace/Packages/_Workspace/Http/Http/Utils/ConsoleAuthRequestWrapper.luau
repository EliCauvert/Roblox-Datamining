local MessageBusService = game:GetService("MessageBusService")
local Http = script:FindFirstAncestor("Http")
local Parent = Http.Parent
local PromiseModule = require(Parent.Promise)
local CryoModule = require(Parent.Cryo)
local Logging = require(Parent.AppCommonLib).Logging
local _ = require(Http.RequestTypes)
local FFlagEnableStrictConsoleAuthCredentialHeadersModule = require(Http.Flags.FFlagEnableStrictConsoleAuthCredentialHeaders)

return function(Callback, Url, Method, p1, p2) --[[ Line: 17 ]]
	-- upvalues: PromiseModule (copy), MessageBusService (copy), Logging (copy), FFlagEnableStrictConsoleAuthCredentialHeadersModule (copy), CryoModule (copy)
	return PromiseModule.new(function(p3, Callback1) --[[ Line: 24 ]]
		-- upvalues: Url (copy), Method (copy), MessageBusService (upval), Logging (upval), FFlagEnableStrictConsoleAuthCredentialHeadersModule (upval), p2 (copy), p1 (copy), CryoModule (upval), Callback (copy)
		MessageBusService:MakeRequest("CredentialsProtocol", "getHeaders", { url = Url, method = Method }, function(p4) --[[ Line: 29 ]]
			-- upvalues: Logging (upval), Callback1 (copy), FFlagEnableStrictConsoleAuthCredentialHeadersModule (upval), p2 (upval), p1 (upval), CryoModule (upval), Callback (upval), Url (upval), Method (upval), p3 (copy)
			if not p4 or not p4.success then
				Logging.warn("credential headers error")
				Callback1({})
				
				if FFlagEnableStrictConsoleAuthCredentialHeadersModule and p2 then return end
			end
			p1.headers = CryoModule.Dictionary.join(p1.headers or {}, p4.headers or {})
			
			return Callback(Url, Method, p1):andThen(p3):catch(Callback1)
		end, {})
	end)
end