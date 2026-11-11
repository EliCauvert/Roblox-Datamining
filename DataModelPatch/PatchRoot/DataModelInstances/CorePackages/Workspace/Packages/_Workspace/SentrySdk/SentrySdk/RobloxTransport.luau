local DsnUtilsModule = require(script.Parent.DsnUtils)
local RobloxTransportModule = {}
RobloxTransportModule.__index = RobloxTransportModule

function RobloxTransportModule:new(p1, HttpServiceImpl)
	-- upvalues: DsnUtilsModule (copy), RobloxTransportModule (copy)
	local Parse_dsnResult, Parse_dsnResult2 = DsnUtilsModule.parse_dsn(p1 or "")
	
	if not Parse_dsnResult then
		error("Invalid DSN: " .. (Parse_dsnResult2 or "Unknown error"))
	end
	return (setmetatable({
		httpServiceImpl = HttpServiceImpl,
		dsn = Parse_dsnResult,
		endpoint = DsnUtilsModule.build_ingest_url(Parse_dsnResult),
		headers = {
			["X-Sentry-Auth"] = DsnUtilsModule.build_auth_header(Parse_dsnResult)
		}
	}, RobloxTransportModule))
end

function RobloxTransportModule:send(Input, Callback: (any, any) -> ())
	local Json = self.httpServiceImpl:JSONEncode(Input)
	local Success, Result = pcall(function()
		-- upvalues: self (copy), Json (copy), Callback (copy)
		self.httpServiceImpl:RequestInternal({
			Method = "POST",
			Url = self.endpoint,
			Headers = self.headers,
			Body = Json
		}):Start(function(p1, Body)
			-- upvalues: Callback (upval)
			if Callback then
				if p1 then
					Callback(true, { error = nil, body = Body })
					
					return
				end
				Callback(false, {
					body = nil,
					error = "HTTP request failed: " .. tostring(Body)
				})
			end
		end)
	end)
	
	if not Success and Callback then
		Callback(false, {
			body = nil,
			error = "Failed to create HTTP request: " .. tostring(Result)
		})
	end
end

function RobloxTransportModule:send_attachments(Event_id, List, Callback: (any, any) -> ())
	-- upvalues: DsnUtilsModule (copy)
	local HttpServiceImpl = self.httpServiceImpl
	
	if Event_id and #List ~= 0 then
		local List1 = {
			(HttpServiceImpl:JSONEncode({
				event_id = Event_id,
				sent_at = os.date("!%Y-%m-%dT%H:%M:%SZ")
			}))
		}
		
		for _, value in ipairs(List) do
			table.insert(List1, (HttpServiceImpl:JSONEncode({
				type = "attachment",
				length = string.len(value.data),
				filename = value.filename,
				content_type = value.content_type or "application/octet-stream"
			})))
			table.insert(List1, value.data)
		end
		local Joined = table.concat(List1, "\n")
		local Envelope_url = DsnUtilsModule.build_envelope_url(self.dsn)
		local Success, Result = pcall(function()
			-- upvalues: HttpServiceImpl (copy), Envelope_url (copy), self (copy), Joined (copy), Callback (copy)
			HttpServiceImpl:RequestInternal({
				Method = "POST",
				Url = Envelope_url,
				Headers = self.headers,
				Body = Joined
			}):Start(function(p1, Body)
				-- upvalues: Callback (upval)
				if Callback then
					if p1 then
						Callback(true, { error = nil, body = Body })
						
						return
					end
					Callback(false, {
						body = nil,
						error = "HTTP request failed: " .. tostring(Body)
					})
				end
			end)
		end)
		
		if not Success and Callback then
			Callback(false, {
				body = nil,
				error = "Failed to create HTTP request: " .. tostring(Result)
			})
		end
		return
	elseif Callback then
		Callback(false, {
			error = "eventId and attachments are required",
			body = nil
		})
	end
end

return RobloxTransportModule