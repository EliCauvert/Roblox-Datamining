local messageBusService = game:GetService("MessageBusService")
local http = script:FindFirstAncestor("Http")
local parent = http.Parent
local promiseModule = require(parent.Promise)
local cryoModule = require(parent.Cryo)
local logging = require(parent.AppCommonLib).Logging
local _ = require(http.RequestTypes)

return function(p1, p2, p3, p4)
	-- upvalues: promiseModule (ref), messageBusService (ref), logging (ref), cryoModule (ref)
	return promiseModule.new(function(p5, p6)
		-- upvalues: p2 (ref), p3 (ref), messageBusService (copy), logging (copy), p4 (ref), cryoModule (copy), p1 (ref)
		messageBusService:MakeRequest("CredentialsProtocol", "getHeaders", { url = p2, method = p3 }, function(p7)
			-- upvalues: logging (copy), p6 (ref), p4 (copy), cryoModule (copy), p1 (copy), p2 (copy), p3 (copy), p5 (ref)
			if not p7 or not p7.success then
				logging.warn("credential headers error")
				p6({})
			end
			p4.headers = cryoModule.Dictionary.join(p4.headers or {}, p7.headers or {})
			
			return p1(p2, p3, p4):andThen(p5):catch(p6)
		end, {})
	end)
end