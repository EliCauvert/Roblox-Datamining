local messageBusService = game:GetService("MessageBusService")
local http = script:FindFirstAncestor("Http")
local parent = http.Parent
local promiseModule = require(parent.Promise)
local cryoModule = require(parent.Cryo)
local logging = require(parent.AppCommonLib).Logging
local _ = require(http.RequestTypes)

return function(p0, p1, p2, p3) --[[ line: 16 ]]
	-- upvalues: promiseModule (ref), messageBusService (ref), logging (ref), cryoModule (ref)
	return promiseModule.new(function(p4, p5) --[[ line: 17 ]]
		-- upvalues: p1 (ref), p2 (ref), messageBusService (copy), logging (copy), p3 (ref), cryoModule (copy), p0 (ref)
		messageBusService:MakeRequest("CredentialsProtocol", "getHeaders", { url = p1, method = p2 }, function(p6) --[[ line: 22 ]]
			-- upvalues: logging (copy), p5 (ref), p3 (copy), cryoModule (copy), p0 (copy), p1 (copy), p2 (copy), p4 (ref)
			if not p6 or not p6.success then
				logging.warn("credential headers error")
				p5({})
			end
			p3.headers = cryoModule.Dictionary.join(p3.headers or {}, p6.headers or {})
			
			return p0(p1, p2, p3):andThen(p4):catch(p5)
		end, {})
	end)
end