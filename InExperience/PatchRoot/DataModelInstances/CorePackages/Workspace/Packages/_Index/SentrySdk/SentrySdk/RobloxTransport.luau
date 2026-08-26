local dsnUtilsModule = require(script.Parent.DsnUtils)
local t = {}
t.__index = t

function t.new(_, p1, p2)
	-- upvalues: dsnUtilsModule (ref), t (ref)
	local var1, var2 = dsnUtilsModule.parse_dsn(p1 or "")
	
	if not var1 then
		error("Invalid DSN: " .. (var2 or "Unknown error"))
	end
	return setmetatable({
		httpServiceImpl = p2,
		dsn = var1,
		endpoint = dsnUtilsModule.build_ingest_url(var1),
		headers = {
			["X-Sentry-Auth"] = dsnUtilsModule.build_auth_header(var1)
		}
	}, t)
end

function t:send(p1, p2)
	local var1 = self.httpServiceImpl:JSONEncode(p1)
	local ok, status = pcall(function()
		-- upvalues: self (ref), var1 (ref), p2 (ref)
		self.httpServiceImpl:RequestInternal({
			Method = "POST",
			Url = self.endpoint,
			Headers = self.headers,
			Body = var1
		}):Start(function(p3, p4)
			-- upvalues: p2 (copy)
			if p2 then
				if p3 then
					p2(true, { error = nil, body = p4 })
					
					return
				end
				p2(false, {
					body = nil,
					error = "HTTP request failed: " .. tostring(p4)
				})
			end
		end)
	end)
	
	if not ok and p2 then
		p2(false, {
			body = nil,
			error = "Failed to create HTTP request: " .. tostring(status)
		})
	end
end

function t:send_attachments(p1, p2, p3)
	-- upvalues: dsnUtilsModule (ref)
	local httpServiceImpl = self.httpServiceImpl
	
	if p1 and #p2 ~= 0 then
		local list = {
			httpServiceImpl:JSONEncode({ event_id = p1, sent_at = os.date("!%Y-%m-%dT%H:%M:%SZ") })
		}
		
		for i, v in ipairs(p2) do
			table.insert(list, httpServiceImpl:JSONEncode({
				type = "attachment",
				length = string.len(v.data),
				filename = v.filename,
				content_type = v.content_type or "application/octet-stream"
			}))
			table.insert(list, v.data)
		end
		local joined = table.concat(list, "\n")
		local var1 = dsnUtilsModule.build_envelope_url(self.dsn)
		local ok, status = pcall(function()
			-- upvalues: httpServiceImpl (ref), var1 (ref), self (ref), joined (ref), p3 (ref)
			httpServiceImpl:RequestInternal({
				Method = "POST",
				Url = var1,
				Headers = self.headers,
				Body = joined
			}):Start(function(p4, p5)
				-- upvalues: p3 (copy)
				if p3 then
					if p4 then
						p3(true, { error = nil, body = p5 })
						
						return
					end
					p3(false, {
						body = nil,
						error = "HTTP request failed: " .. tostring(p5)
					})
				end
			end)
		end)
		
		if not ok and p3 then
			p3(false, {
				body = nil,
				error = "Failed to create HTTP request: " .. tostring(status)
			})
		end
		return
	elseif p3 then
		p3(false, {
			error = "eventId and attachments are required",
			body = nil
		})
	end
end

return t