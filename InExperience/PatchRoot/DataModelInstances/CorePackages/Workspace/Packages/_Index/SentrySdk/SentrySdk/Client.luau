local robloxTransportModule = require(script.Parent.RobloxTransport)
local versionModule = require(script.Parent.Version)
local var1 = game:GetService("RunService"):IsStudio()

local function _()
	return type(_G.LUAUFORGE_BUNDLED_FILE_PATH) == "string"
end

local _ = function(p1)
	return next(p1) == nil
end

local _ = function(p1, p2)
	if type(p2) ~= "string" then
		return nil, "Input is not a string"
	end
	local ok, status = pcall(function()
		-- upvalues: p1 (ref), p2 (ref)
		return p1:JSONDecode(p2)
	end)
	
	if ok then
		return status, nil
	end
	return nil, tostring(status)
end

local _ = function(p1, p2)
	return if p2 then function(p3, p4)
		-- upvalues: p1 (ref), p2 (ref)
		local id = nil
		local var2 = nil
		
		if p3 and p4 and p4.body then
			if type(p4.body) == "table" and p4.body.Body then
				local var3, var4
				local var5 = p1
				local body = p4.body.Body
				
				if type(body) == "string" then
					local ok, status = pcall(function()
						-- upvalues: var5 (ref), body (ref)
						return var5:JSONDecode(body)
					end)
					
					if ok then
						var3 = status
						var4 = nil
					else
						var3 = nil
						var4 = tostring(status)
					end
				else
					var3 = nil
					var4 = "Input is not a string"
				end
				if var3 and var3.id then
					id = var3.id
				end
			end
			var2 = p4
		elseif p4 then
			var2 = p4
		end
		p2(p3, var2, id)
	end else nil
end

local t = {}
t.__index = t

function t.new(_, p1, p2)
	-- upvalues: robloxTransportModule (ref), t (ref)
	if not p1.dsn then
		error("DSN is required")
	end
	return setmetatable({
		user = nil,
		transport = robloxTransportModule:new(p1.dsn, p2),
		httpService = p2,
		tags = {},
		extra = {},
		breadcrumbs = {},
		config = p1
	}, t)
end

function t._buildDebugMeta(_)
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

function t:capture_message(p1, p2, p3, p4)
	-- upvalues: versionModule (ref)
	local httpService = self.httpService
	self.transport:send({
		platform = "roblox",
		server_name = "roblox-server",
		message = { message = p1 },
		level = p2 or "info",
		timestamp = os.time(),
		environment = self.config.environment or "production",
		release = self.config.release or "unknown",
		sdk = { name = "sentry.lua", version = versionModule.SDK_VERSION },
		user = self.user,
		tags = self.tags,
		extra = if next(self.extra) == nil then nil else self.extra,
		breadcrumbs = p4 or self.breadcrumbs,
		contexts = {
			roblox = {
				version = versionModule.SDK_VERSION,
				place_id = tostring(game.PlaceId),
				job_id = game.JobId or "unknown"
			}
		}
	}, if not p3 then nil else function(p5, p6)
		-- upvalues: httpService (ref), p3 (ref)
		local id = nil
		local var2 = nil
		
		if p5 and p6 and p6.body then
			if type(p6.body) == "table" and p6.body.Body then
				local var3, var4
				local var5 = httpService
				local body = p6.body.Body
				
				if type(body) == "string" then
					local ok, status = pcall(function()
						-- upvalues: var5 (ref), body (ref)
						return var5:JSONDecode(body)
					end)
					
					if ok then
						var3 = status
						var4 = nil
					else
						var3 = nil
						var4 = tostring(status)
					end
				else
					var3 = nil
					var4 = "Input is not a string"
				end
				if var3 and var3.id then
					id = var3.id
				end
			end
			var2 = p6
		elseif p6 then
			var2 = p6
		end
		p3(p5, var2, id)
	end)
end

function t:capture_exception(p1, p2, p3, p4, p5, p6)
	-- upvalues: versionModule (ref), var1 (ref)
	p2 = p2 or "error"
	local t = {
		roblox = {
			version = versionModule.SDK_VERSION,
			place_id = tostring(game.PlaceId),
			job_id = game.JobId or "unknown"
		}
	}
	
	if p3 then
		for i, v in pairs(p3) do
			t[i] = v
		end
	end
	local t_1 = {
		type = p1.type or "RobloxError",
		value = p1.message or tostring(p1)
	}
	
	if p1.stacktrace and p1.stacktrace.frames and #p1.stacktrace.frames > 0 then
		t_1.stacktrace = p1.stacktrace
		
		if type(_G.LUAUFORGE_BUNDLED_FILE_PATH) == "string" then
			for i, v in p1.stacktrace.frames do
				v.platform = "javascript"
			end
		end
	end
	local t_2 = { values = { t_1 } }
	
	if var1 then
		print("\240\159\148\141 Exception structure:", t_2)
	end
	local t_3 = {
		platform = "roblox",
		server_name = "roblox-server",
		exception = t_2,
		level = p2,
		timestamp = os.time(),
		environment = self.config.environment or "production",
		release = self.config.release or "unknown",
		sdk = { name = "sentry.lua", version = versionModule.SDK_VERSION },
		user = self.user,
		tags = self.tags,
		extra = if next(self.extra) == nil then nil else self.extra,
		breadcrumbs = p6 or self.breadcrumbs,
		contexts = t
	}
	
	if p4 then
		t_3.threads = p4
	end
	t_3.debug_meta = self:_buildDebugMeta()
	local httpService = self.httpService
	self.transport:send(t_3, if not p5 then nil else function(p7, p8)
		-- upvalues: httpService (ref), p5 (ref)
		local id = nil
		local var2 = nil
		
		if p7 and p8 and p8.body then
			if type(p8.body) == "table" and p8.body.Body then
				local var3, var4
				local var5 = httpService
				local body = p8.body.Body
				
				if type(body) == "string" then
					local ok, status = pcall(function()
						-- upvalues: var5 (ref), body (ref)
						return var5:JSONDecode(body)
					end)
					
					if ok then
						var3 = status
						var4 = nil
					else
						var3 = nil
						var4 = tostring(status)
					end
				else
					var3 = nil
					var4 = "Input is not a string"
				end
				if var3 and var3.id then
					id = var3.id
				end
			end
			var2 = p8
		elseif p8 then
			var2 = p8
		end
		p5(p7, var2, id)
	end)
end

function t:send_event_with_attachments(p7, p8, p9)
	if p7 and #p8 ~= 0 then
		local httpService = self.httpService
		self.transport:send_attachments(p7, p8, if not p9 then nil else function(p10, p11)
			-- upvalues: httpService (ref), p9 (ref)
			local id = nil
			local var2 = nil
			
			if p10 and p11 and p11.body then
				if type(p11.body) == "table" and p11.body.Body then
					local var3, var4
					local var5 = httpService
					local body = p11.body.Body
					
					if type(body) == "string" then
						local ok, status = pcall(function()
							-- upvalues: var5 (ref), body (ref)
							return var5:JSONDecode(body)
						end)
						
						if ok then
							var3 = status
							var4 = nil
						else
							var3 = nil
							var4 = tostring(status)
						end
					else
						var3 = nil
						var4 = "Input is not a string"
					end
					if var3 and var3.id then
						id = var3.id
					end
				end
				var2 = p11
			elseif p11 then
				var2 = p11
			end
			p9(p10, var2, id)
		end)
		
		return
	elseif p9 then
		p9(false, { error = "eventId and attachments are required" }, nil)
	end
end

function t:set_user(p7)
	self.user = p7
end

function t:set_tag(p7, p8)
	self.tags[p7] = tostring(p8)
end

function t:set_extra(p7, p8)
	self.extra[p7] = p8
end

function t:add_breadcrumb(p7)
	p7.timestamp = os.time()
	table.insert(self.breadcrumbs, p7)
	
	if #self.breadcrumbs > 50 then
		table.remove(self.breadcrumbs, 1)
	end
end

return t