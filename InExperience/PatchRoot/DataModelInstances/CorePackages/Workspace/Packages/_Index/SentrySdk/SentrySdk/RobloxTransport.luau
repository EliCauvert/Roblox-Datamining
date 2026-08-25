local dsnUtilsModule = require(script.Parent.DsnUtils)
local t = {}
t.__index = t

function t.new(_, p0, p1)
	-- upvalues: dsnUtilsModule (ref), t (ref)
	local var2, var3 = dsnUtilsModule.parse_dsn(p0 or "")
	
	if not var2 then
		error("Invalid DSN: " .. (var3 or "Unknown error"))
	end
	return setmetatable({
		httpServiceImpl = p1,
		dsn = var2,
		endpoint = dsnUtilsModule.build_ingest_url(var2),
		headers = {
			["X-Sentry-Auth"] = dsnUtilsModule.build_auth_header(var2)
		}
	}, t)
end

function t:send(p2, p3)
	local var4 = self.httpServiceImpl:JSONEncode(p2)
	local ok, status = pcall(function()
		-- upvalues: self (ref), var4 (ref), p3 (ref)
		self.httpServiceImpl:RequestInternal({
			Method = "POST",
			Url = self.endpoint,
			Headers = self.headers,
			Body = var4
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
end

function t:send_attachments(p6, p7, p8)
	-- upvalues: dsnUtilsModule (ref)
	local httpServiceImpl = self.httpServiceImpl
	
	if p6 and #p7 ~= 0 then
		local list = {
			httpServiceImpl:JSONEncode({ event_id = p6, sent_at = os.date("!%Y-%m-%dT%H:%M:%SZ") })
		}
		
		for i, v in ipairs(p7) do
			table.insert(list, httpServiceImpl:JSONEncode({
				type = "attachment",
				length = string.len(v.data),
				filename = v.filename,
				content_type = v.content_type or "application/octet-stream"
			}))
			table.insert(list, v.data)
		end
		local joined = table.concat(list, "\n")
		local var7 = dsnUtilsModule.build_envelope_url(self.dsn)
		local ok, status = pcall(function()
			-- upvalues: httpServiceImpl (ref), var7 (ref), self (ref), joined (ref), p8 (ref)
			httpServiceImpl:RequestInternal({
				Method = "POST",
				Url = var7,
				Headers = self.headers,
				Body = joined
			}):Start(function(p9, p10)
				-- upvalues: p8 (copy)
				if p8 then
					if p9 then
						p8(true, { error = nil, body = p10 })
						
						return
					end
					p8(false, {
						body = nil,
						error = "HTTP request failed: " .. tostring(p10)
					})
				end
			end)
		end)
		
		if not ok and p8 then
			p8(false, {
				body = nil,
				error = "Failed to create HTTP request: " .. tostring(status)
			})
		end
		return
	elseif p8 then
		p8(false, {
			error = "eventId and attachments are required",
			body = nil
		})
	end
end

return t