local robloxTransportModule = require(script.Parent.RobloxTransport)
local versionModule = require(script.Parent.Version)
local var2 = game:GetService("RunService"):IsStudio()

local function _() --[[ line: 8 | named "isBundled" ]]
	return type(_G.LUAUFORGE_BUNDLED_FILE_PATH) == "string"
end

local _ = function(p0) --[[ line: 13 | named "isTableEmpty" ]]
	return next(p0) == nil
end

local _ = function(p1, p2) --[[ line: 18 | named "parseJSON" ]]
	if type(p2) ~= "string" then
		return nil, "Input is not a string"
	end
	local ok, status = pcall(function() --[[ line: 23 ]]
		-- upvalues: p1 (ref), p2 (ref)
		return p1:JSONDecode(p2)
	end)
	
	if ok then
		return status, nil
	end
	return nil, tostring(status)
end

local _ = function(p3, p4) --[[ line: 35 | named "createCallbackWithEventId" ]]
	return if p4 then function(p5, p6) --[[ line: 46 ]]
		-- upvalues: p3 (ref), p4 (ref)
		local id = nil
		local var4 = nil
		
		if p5 and p6 and p6.body then
			if type(p6.body) == "table" and p6.body.Body then
				local var6, var7
				local var5 = p3
				local body = p6.body.Body
				
				if type(body) == "string" then
					local ok, status = pcall(function() --[[ line: 23 ]]
						-- upvalues: var5 (ref), body (ref)
						return var5:JSONDecode(body)
					end)
					
					if ok then
						var6 = status
						var7 = nil
					else
						var6 = nil
						var7 = tostring(status)
					end
				else
					var6 = nil
					var7 = "Input is not a string"
				end
				if var6 and var6.id then
					id = var6.id
				end
			end
			var4 = p6
		elseif p6 then
			var4 = p6
		end
		p4(p5, var4, id)
	end else nil
end

local t = {}
t.__index = t

function t.new(_, p7, p8) --[[ line: 148 ]]
	-- upvalues: robloxTransportModule (ref), t (ref)
	if not p7.dsn then
		error("DSN is required")
	end
	return setmetatable({
		user = nil,
		transport = robloxTransportModule:new(p7.dsn, p8),
		httpService = p8,
		tags = {},
		extra = {},
		breadcrumbs = {},
		config = p7
	}, t)
end

function t._buildDebugMeta(_) --[[ line: 179 ]]
	local LUAUFORGE_SENTRY_DEBUG_IDS = _G.LUAUFORGE_SENTRY_DEBUG_IDS
	
	if type(LUAUFORGE_SENTRY_DEBUG_IDS) ~= "table" then
		return nil
	end
	local t = {}
	
	for i, v in LUAUFORGE_SENTRY_DEBUG_IDS do
		table.insert(t, { type = "sourcemap", code_file = i, debug_id = v })
	end
	return if #t == 0 then nil else { images = t }
end

function t:capture_message(p9, p10, p11) --[[ line: 205 ]]
	-- upvalues: versionModule (ref)
	local httpService = self.httpService
	self.transport:send({
		platform = "roblox",
		server_name = "roblox-server",
		message = { message = p9 },
		level = p10 or "info",
		timestamp = os.time(),
		environment = self.config.environment or "production",
		release = self.config.release or "unknown",
		sdk = { name = "sentry.lua", version = versionModule.SDK_VERSION },
		user = self.user,
		tags = self.tags,
		extra = if next(self.extra) == nil then nil else self.extra,
		breadcrumbs = self.breadcrumbs,
		contexts = {
			roblox = {
				version = versionModule.SDK_VERSION,
				place_id = tostring(game.PlaceId),
				job_id = game.JobId or "unknown"
			}
		}
	}, if not p11 then nil else function(p12, p13) --[[ line: 46 ]]
		-- upvalues: httpService (ref), p11 (ref)
		local id = nil
		local var4 = nil
		
		if p12 and p13 and p13.body then
			if type(p13.body) == "table" and p13.body.Body then
				local var6, var7
				local var5 = httpService
				local body = p13.body.Body
				
				if type(body) == "string" then
					local ok, status = pcall(function() --[[ line: 23 ]]
						-- upvalues: var5 (ref), body (ref)
						return var5:JSONDecode(body)
					end)
					
					if ok then
						var6 = status
						var7 = nil
					else
						var6 = nil
						var7 = tostring(status)
					end
				else
					var6 = nil
					var7 = "Input is not a string"
				end
				if var6 and var6.id then
					id = var6.id
				end
			end
			var4 = p13
		elseif p13 then
			var4 = p13
		end
		p11(p12, var4, id)
	end)
end

function t:capture_exception(p14, p15, p16, p17, p18) --[[ line: 248 ]]
	-- upvalues: versionModule (ref), var2 (ref)
	p15 = p15 or "error"
	local t = {
		roblox = {
			version = versionModule.SDK_VERSION,
			place_id = tostring(game.PlaceId),
			job_id = game.JobId or "unknown"
		}
	}
	
	if p16 then
		for i, v in pairs(p16) do
			t[i] = v
		end
	end
	local t_1 = {
		type = p14.type or "RobloxError",
		value = p14.message or tostring(p14)
	}
	
	if p14.stacktrace and p14.stacktrace.frames and #p14.stacktrace.frames > 0 then
		t_1.stacktrace = p14.stacktrace
		
		if type(_G.LUAUFORGE_BUNDLED_FILE_PATH) == "string" then
			for i, v in p14.stacktrace.frames do
				v.platform = "javascript"
			end
		end
	end
	local t_2 = { values = { t_1 } }
	
	if var2 then
		print("\240\159\148\141 Exception structure:", t_2)
	end
	local t_3 = {
		platform = "roblox",
		server_name = "roblox-server",
		exception = t_2,
		level = p15,
		timestamp = os.time(),
		environment = self.config.environment or "production",
		release = self.config.release or "unknown",
		sdk = { name = "sentry.lua", version = versionModule.SDK_VERSION },
		user = self.user,
		tags = self.tags,
		extra = if next(self.extra) == nil then nil else self.extra,
		breadcrumbs = self.breadcrumbs,
		contexts = t
	}
	
	if p17 then
		t_3.threads = p17
	end
	t_3.debug_meta = self:_buildDebugMeta()
	local httpService = self.httpService
	self.transport:send(t_3, if not p18 then nil else function(p19, p20) --[[ line: 46 ]]
		-- upvalues: httpService (ref), p18 (ref)
		local id = nil
		local var4 = nil
		
		if p19 and p20 and p20.body then
			if type(p20.body) == "table" and p20.body.Body then
				local var6, var7
				local var5 = httpService
				local body = p20.body.Body
				
				if type(body) == "string" then
					local ok, status = pcall(function() --[[ line: 23 ]]
						-- upvalues: var5 (ref), body (ref)
						return var5:JSONDecode(body)
					end)
					
					if ok then
						var6 = status
						var7 = nil
					else
						var6 = nil
						var7 = tostring(status)
					end
				else
					var6 = nil
					var7 = "Input is not a string"
				end
				if var6 and var6.id then
					id = var6.id
				end
			end
			var4 = p20
		elseif p20 then
			var4 = p20
		end
		p18(p19, var4, id)
	end)
end

function t:send_event_with_attachments(p21, p22, p23) --[[ line: 339 ]]
	if p21 and #p22 ~= 0 then
		local httpService = self.httpService
		self.transport:send_attachments(p21, p22, if not p23 then nil else function(p24, p25) --[[ line: 46 ]]
			-- upvalues: httpService (ref), p23 (ref)
			local id = nil
			local var4 = nil
			
			if p24 and p25 and p25.body then
				if type(p25.body) == "table" and p25.body.Body then
					local var6, var7
					local var5 = httpService
					local body = p25.body.Body
					
					if type(body) == "string" then
						local ok, status = pcall(function() --[[ line: 23 ]]
							-- upvalues: var5 (ref), body (ref)
							return var5:JSONDecode(body)
						end)
						
						if ok then
							var6 = status
							var7 = nil
						else
							var6 = nil
							var7 = tostring(status)
						end
					else
						var6 = nil
						var7 = "Input is not a string"
					end
					if var6 and var6.id then
						id = var6.id
					end
				end
				var4 = p25
			elseif p25 then
				var4 = p25
			end
			p23(p24, var4, id)
		end)
		
		return
	elseif p23 then
		p23(false, { error = "eventId and attachments are required" }, nil)
	end
end

function t:set_user(p26) --[[ line: 361 ]]
	self.user = p26
end

function t:set_tag(p27, p28) --[[ line: 366 ]]
	self.tags[p27] = tostring(p28)
end

function t:set_extra(p29, p30) --[[ line: 371 ]]
	self.extra[p29] = p30
end

function t:add_breadcrumb(p31) --[[ line: 376 ]]
	p31.timestamp = os.time()
	table.insert(self.breadcrumbs, p31)
	
	if #self.breadcrumbs > 50 then
		table.remove(self.breadcrumbs, 1)
	end
end

return t