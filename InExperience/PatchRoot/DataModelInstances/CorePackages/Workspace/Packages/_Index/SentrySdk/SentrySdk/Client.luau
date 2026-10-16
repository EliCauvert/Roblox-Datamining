local RobloxTransportModule = require(script.Parent.RobloxTransport)
local VersionModule = require(script.Parent.Version)
local IsStudio = game:GetService("RunService"):IsStudio()

local function _(): boolean --[[ Line: 8 | Named "isBundled" ]]
	return type(_G.LUAUFORGE_BUNDLED_FILE_PATH) == "string"
end

local _ = function(p1): boolean --[[ Line: 13 | Named "isTableEmpty" ]]
	return next(p1) == nil
end

local _ = function(p1, p2) --[[ Line: 18 | Named "parseJSON" ]]
	if type(p2) ~= "string" then
		return nil, "Input is not a string"
	end
	local Success, Result = pcall(function() --[[ Line: 23 ]]
		-- upvalues: p1 (copy), p2 (copy)
		return p1:JSONDecode(p2)
	end)
	
	if Success then
		return Result, nil
	else
		return nil, (tostring(Result))
	end
end

local _ = function(HttpService, p1) --[[ Line: 35 | Named "createCallbackWithEventId" ]]
	return if p1 then function(p2, p3) --[[ Line: 46 ]]
		-- upvalues: HttpService (copy), p1 (copy)
		local Id = nil
		local v1 = nil
		
		if p2 and p3 and p3.body then
			if type(p3.body) == "table" and p3.body.Body then
				local Body = p3.body.Body
				local v2 = nil
				
				if type(Body) == "string" then
					local Success, Result = pcall(function() --[[ Line: 23 ]]
						-- upvalues: HttpService (copy), Body (copy)
						return HttpService:JSONDecode(Body)
					end)
					
					if Success then
						v2 = Result
					else
						v2 = nil
						local _ = tostring(Result)
					end
				else
					v2 = nil
				end
				if v2 and v2.id then
					Id = v2.id
				end
			end
			v1 = p3
		elseif p3 then
			v1 = p3
		end
		p1(p2, v1, Id)
	end else nil
end

local ClientModule = {}
ClientModule.__index = ClientModule

function ClientModule:new(Config, HttpService) --[[ Line: 152 ]]
	-- upvalues: RobloxTransportModule (copy), ClientModule (copy)
	if not Config.dsn then
		error("DSN is required")
	end
	return (setmetatable({
		user = nil,
		transport = RobloxTransportModule:new(Config.dsn, HttpService),
		httpService = HttpService,
		tags = {},
		extra = {},
		breadcrumbs = {},
		config = Config
	}, ClientModule))
end

function ClientModule:_buildDebugMeta() --[[ Line: 183 ]]
	local LUAUFORGESENTRYDEBUGIDS = _G.LUAUFORGE_SENTRY_DEBUG_IDS
	
	if type(LUAUFORGESENTRYDEBUGIDS) ~= "table" then
		return nil
	end
	local Images = {}
	
	for Code_file, lUAUFORGESENTRYDEBUGID in LUAUFORGESENTRYDEBUGIDS do
		table.insert(Images, {
			type = "sourcemap",
			code_file = Code_file,
			debug_id = lUAUFORGESENTRYDEBUGID
		})
	end
	return if #Images == 0 then nil else { images = Images }
end

function ClientModule:capture_message(Message, p1, p2, p3) --[[ Line: 209 ]]
	-- upvalues: VersionModule (copy)
	local NoNextEntry = next(self.extra) == nil
	local config = {
		platform = "roblox",
		server_name = "roblox-server",
		message = { message = Message },
		level = p1 or "info",
		timestamp = os.time(),
		environment = self.config.environment or "production",
		release = self.config.release or "unknown",
		sdk = { name = "sentry.lua", version = VersionModule.SDK_VERSION },
		user = self.user,
		tags = self.tags,
		extra = if NoNextEntry then nil else self.extra,
		breadcrumbs = p3 or self.breadcrumbs,
		contexts = {
			roblox = {
				version = VersionModule.SDK_VERSION,
				place_id = tostring(game.PlaceId),
				job_id = game.JobId or "unknown"
			}
		}
	}
	local HttpService = self.httpService
	self.transport:send(config, if p2 then function(p4, p5) --[[ Line: 46 ]]
		-- upvalues: HttpService (copy), p2 (copy)
		local Id = nil
		local v1 = nil
		
		if p4 and p5 and p5.body then
			if type(p5.body) == "table" and p5.body.Body then
				local Body = p5.body.Body
				local v2 = nil
				
				if type(Body) == "string" then
					local Success, Result = pcall(function() --[[ Line: 23 ]]
						-- upvalues: HttpService (copy), Body (copy)
						return HttpService:JSONDecode(Body)
					end)
					
					if Success then
						v2 = Result
					else
						v2 = nil
						local _ = tostring(Result)
					end
				else
					v2 = nil
				end
				if v2 and v2.id then
					Id = v2.id
				end
			end
			v1 = p5
		elseif p5 then
			v1 = p5
		end
		p2(p4, v1, Id)
	end else nil)
end

function ClientModule:capture_exception(p1, p2, List, Threads, p3, p4, p5, List1) --[[ Line: 253 ]]
	-- upvalues: VersionModule (copy), IsStudio (copy)
	local P18 = p2 or "error"
	local Contexts = {
		roblox = {
			version = VersionModule.SDK_VERSION,
			place_id = tostring(game.PlaceId),
			job_id = game.JobId or "unknown"
		}
	}
	
	if List then
		for i, value in pairs(List) do
			Contexts[i] = value
		end
	end
	local config = {
		type = p1.type or "RobloxError",
		value = p1.message or tostring(p1)
	}
	
	if p1.stacktrace and p1.stacktrace.frames and #p1.stacktrace.frames > 0 then
		config.stacktrace = p1.stacktrace
		
		if type(_G.LUAUFORGE_BUNDLED_FILE_PATH) == "string" then
			for _, frame in p1.stacktrace.frames do
				frame.platform = "javascript"
			end
		end
	end
	local Exception = { values = { config } }
	
	if IsStudio then
		print("🔍 Exception structure:", Exception)
	end
	local NoNextEntry = next(self.extra) == nil
	local config1 = {
		platform = "roblox",
		server_name = "roblox-server",
		exception = Exception,
		level = P18,
		timestamp = p5 or os.time(),
		environment = self.config.environment or "production",
		release = self.config.release or "unknown",
		sdk = { name = "sentry.lua", version = VersionModule.SDK_VERSION },
		user = self.user,
		tags = self.tags,
		extra = if NoNextEntry then nil else self.extra,
		breadcrumbs = p4 or self.breadcrumbs,
		contexts = Contexts
	}
	
	if List1 then
		config1.tags = table.clone(self.tags)
		
		for i1, value1 in List1 do
			config1.tags[i1] = value1
		end
	end
	if Threads then
		config1.threads = Threads
	end
	config1.debug_meta = self:_buildDebugMeta()
	local HttpService = self.httpService
	self.transport:send(config1, if p3 then function(p6, p7) --[[ Line: 46 ]]
		-- upvalues: HttpService (copy), p3 (copy)
		local Id = nil
		local v1 = nil
		
		if p6 and p7 and p7.body then
			if type(p7.body) == "table" and p7.body.Body then
				local Body = p7.body.Body
				local v2 = nil
				
				if type(Body) == "string" then
					local Success, Result = pcall(function() --[[ Line: 23 ]]
						-- upvalues: HttpService (copy), Body (copy)
						return HttpService:JSONDecode(Body)
					end)
					
					if Success then
						v2 = Result
					else
						v2 = nil
						local _ = tostring(Result)
					end
				else
					v2 = nil
				end
				if v2 and v2.id then
					Id = v2.id
				end
			end
			v1 = p7
		elseif p7 then
			v1 = p7
		end
		p3(p6, v1, Id)
	end else nil)
end

function ClientModule:send_event_with_attachments(p6, p7, Callback: (any, any, any) -> ()) --[[ Line: 354 ]]
	if p6 and #p7 ~= 0 then
		local HttpService = self.httpService
		self.transport:send_attachments(p6, p7, if Callback then function(p8, p9) --[[ Line: 46 ]]
			-- upvalues: HttpService (copy), Callback (copy)
			local Id = nil
			local v1 = nil
			
			if p8 and p9 and p9.body then
				if type(p9.body) == "table" and p9.body.Body then
					local Body = p9.body.Body
					local v2 = nil
					
					if type(Body) == "string" then
						local Success, Result = pcall(function() --[[ Line: 23 ]]
							-- upvalues: HttpService (copy), Body (copy)
							return HttpService:JSONDecode(Body)
						end)
						
						if Success then
							v2 = Result
						else
							v2 = nil
							local _ = tostring(Result)
						end
					else
						v2 = nil
					end
					if v2 and v2.id then
						Id = v2.id
					end
				end
				v1 = p9
			elseif p9 then
				v1 = p9
			end
			Callback(p8, v1, Id)
		end else nil)
		
		return
	end
	if Callback then
		Callback(false, { error = "eventId and attachments are required" }, nil)
	end
end

function ClientModule:set_user(User) --[[ Line: 376 ]]
	self.user = User
end

function ClientModule:set_tag(p6, p7) --[[ Line: 381 ]]
	self.tags[p6] = tostring(p7)
end

function ClientModule:set_extra(p6, p7) --[[ Line: 386 ]]
	self.extra[p6] = p7
end

function ClientModule:add_breadcrumb(p6) --[[ Line: 391 ]]
	p6.timestamp = os.time()
	table.insert(self.breadcrumbs, p6)
	
	if #self.breadcrumbs > 50 then
		table.remove(self.breadcrumbs, 1)
	end
end

return ClientModule