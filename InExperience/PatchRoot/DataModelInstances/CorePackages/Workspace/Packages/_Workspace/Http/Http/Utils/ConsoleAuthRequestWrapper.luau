local messageBusService = game:GetService("MessageBusService")
local http = script:FindFirstAncestor("Http")
local parent = http.Parent
local promiseModule = require(parent.Promise)
local cryoModule = require(parent.Cryo)
local logging = require(parent.AppCommonLib).Logging
local _ = require(http.RequestTypes)
local fFlagEnableStrictConsoleAuthCredentialHeadersModule = require(http.Flags.FFlagEnableStrictConsoleAuthCredentialHeaders)

return function(p1, p2, p3, p4, p5)
	-- upvalues: promiseModule (ref), messageBusService (ref), logging (ref), fFlagEnableStrictConsoleAuthCredentialHeadersModule (ref), cryoModule (ref)
	return promiseModule.new(function(p6, p7)
		-- upvalues: p2 (ref), p3 (ref), messageBusService (copy), logging (copy), fFlagEnableStrictConsoleAuthCredentialHeadersModule (copy), p5 (ref), p4 (ref), cryoModule (copy), p1 (ref)
		messageBusService:MakeRequest("CredentialsProtocol", "getHeaders", { url = p2, method = p3 }, function(p8)
			-- upvalues: logging (copy), p7 (ref), fFlagEnableStrictConsoleAuthCredentialHeadersModule (copy), p5 (copy), p4 (copy), cryoModule (copy), p1 (copy), p2 (copy), p3 (copy), p6 (ref)
			if not p8 or not p8.success then
				logging.warn("credential headers error")
				p7({})
				
				if fFlagEnableStrictConsoleAuthCredentialHeadersModule and p5 then
					return
				end
			end
			p4.headers = cryoModule.Dictionary.join(p4.headers or {}, p8.headers or {})
			
			return p1(p2, p3, p4):andThen(p6):catch(p7)
		end, {})
	end)
end