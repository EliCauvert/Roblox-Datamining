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

function t:capture_message(p1, p2, p3)
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
		breadcrumbs = self.breadcrumbs,
		contexts = {
			roblox = {
				version = versionModule.SDK_VERSION,
				place_id = tostring(game.PlaceId),
				job_id = game.JobId or "unknown"
			}
		}
	}, if not p3 then nil else function(p4, p5)
		-- upvalues: httpService (ref), p3 (ref)
		local id = nil
		local var2 = nil
		
		if p4 and p5 and p5.body then
			if type(p5.body) == "table" and p5.body.Body then
				local var3, var4
				local var5 = httpService
				local body = p5.body.Body
				
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
			var2 = p5
		elseif p5 then
			var2 = p5
		end
		p3(p4, var2, id)
	end)
end

function t:capture_exception(p1, p2, p3, p4, p5)
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
		breadcrumbs = self.breadcrumbs,
		contexts = t
	}
	
	if p4 then
		t_3.threads = p4
	end
	t_3.debug_meta = self:_buildDebugMeta()
	local httpService = self.httpService
	self.transport:send(t_3, if not p5 then nil else function(p6, p7)
		-- upvalues: httpService (ref), p5 (ref)
		local id = nil
		local var2 = nil
		
		if p6 and p7 and p7.body then
			if type(p7.body) == "table" and p7.body.Body then
				local var3, var4
				local var5 = httpService
				local body = p7.body.Body
				
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
			var2 = p7
		elseif p7 then
			var2 = p7
		end
		p5(p6, var2, id)
	end)
end

function t:send_event_with_attachments(p6, p7, p8)
	if p6 and #p7 ~= 0 then
		local httpService = self.httpService
		self.transport:send_attachments(p6, p7, if not p8 then nil else function(p9, p10)
			-- upvalues: httpService (ref), p8 (ref)
			local id = nil
			local var2 = nil
			
			if p9 and p10 and p10.body then
				if type(p10.body) == "table" and p10.body.Body then
					local var3, var4
					local var5 = httpService
					local body = p10.body.Body
					
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
				var2 = p10
			elseif p10 then
				var2 = p10
			end
			p8(p9, var2, id)
		end)
		
		return
	elseif p8 then
		p8(false, { error = "eventId and attachments are required" }, nil)
	end
end

function t:set_user(p6)
	self.user = p6
end

function t:set_tag(p6, p7)
	self.tags[p6] = tostring(p7)
end

function t:set_extra(p6, p7)
	self.extra[p6] = p7
end

function t:add_breadcrumb(p6)
	p6.timestamp = os.time()
	table.insert(self.breadcrumbs, p6)
	
	if #self.breadcrumbs > 50 then
		table.remove(self.breadcrumbs, 1)
	end
end

return t