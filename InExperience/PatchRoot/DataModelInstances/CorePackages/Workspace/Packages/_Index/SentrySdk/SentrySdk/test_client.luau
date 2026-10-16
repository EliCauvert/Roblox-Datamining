local LuauModule = require("@std/luau")
local FsModule = require("@std/fs")
local JsonModule = require("@std/json")
local NetModule = require("@std/net")
local ProcessModule = require("@std/process")
local v1 = ProcessModule.args[1]:match("^(.*)/[^/]+$") or "."
local Arg = ProcessModule.args[2] or ProcessModule.env.SENTRY_DSN

if not Arg or Arg == "" then
	print("ERROR: no DSN provided.")
	print("  lute test_client.lua \"<your-sentry-dsn>\"")
	print("  or set SENTRY_DSN in the environment")
	ProcessModule.exit(1)
end
if not FsModule.exists(v1 .. "/Client.lua") then
	print(`ERROR: cannot find {v1}/Client.lua`)
	ProcessModule.exit(1)
end
local HttpService = {
	JSONEncode = function(_, p1) --[[ Line: 47 ]]
		-- upvalues: JsonModule (copy)
		return JsonModule.serialize(p1)
	end,
	JSONDecode = function(_, p1) --[[ Line: 50 ]]
		-- upvalues: JsonModule (copy)
		return JsonModule.deserialize(p1)
	end,
	RequestInternal = function(_, p1) --[[ Line: 53 ]]
		-- upvalues: NetModule (copy)
		return {
			Start = function(_, Callback: (any, any) -> ()) --[[ Line: 55 ]]
				-- upvalues: NetModule (upval), p1 (copy)
				local Success, Result = pcall(function() --[[ Line: 56 ]]
					-- upvalues: NetModule (upval), p1 (upval)
					return NetModule.request(p1.Url, { method = p1.Method, headers = p1.Headers, body = p1.Body })
				end)
				
				if Success then
					Callback(true, {
						Success = Result.ok,
						StatusCode = Result.status,
						Body = Result.body,
						Headers = Result.headers
					})
					
					return
				else
					Callback(false, (tostring(Result)))
				end
			end
		}
	end
}
local config = {
	HttpService = HttpService,
	RunService = {
		IsStudio = function(_): boolean --[[ Line: 79 ]]
			return false
		end,
		GetRobloxVersion = function(_): string --[[ Line: 82 ]]
			return "version-9.999.0.9999999"
		end
	}
}
local self = setmetatable({ PlaceId = 0, JobId = "lute-test-job" }, {})

function self:GetService(p1) --[[ Line: 88 ]]
	-- upvalues: config (copy)
	return config[p1]
end

function self:DefineFastFlag(): boolean --[[ Line: 91 ]]
	return false
end

local config1 = {
	print = print,
	warn = print,
	error = error,
	assert = assert,
	pcall = pcall,
	xpcall = xpcall,
	type = type,
	typeof = typeof,
	tostring = tostring,
	tonumber = tonumber,
	next = next,
	pairs = pairs,
	ipairs = ipairs,
	select = select,
	unpack = unpack,
	setmetatable = setmetatable,
	getmetatable = getmetatable,
	rawget = rawget,
	rawset = rawset,
	rawequal = rawequal,
	rawlen = rawlen,
	string = string,
	table = table,
	math = math,
	os = os,
	coroutine = coroutine,
	bit32 = bit32,
	utf8 = utf8,
	buffer = buffer,
	game = self
}
local t = {}
local t1 = {}
local v2 = nil
local v3 = nil
local _ = nil

local function _(p1) --[[ Line: 138 | Named "parentDir" ]]
	return p1:match("^(.*)/[^/]+$") or "."
end

local _ = function(p1) --[[ Line: 142 | Named "folderNode" ]]
	-- upvalues: v3 (ref)
	return (setmetatable({ __isFolder = true, __dir = p1 }, v3))
end

local _ = function(p1, p2) --[[ Line: 148 | Named "fileNode" ]]
	-- upvalues: v2 (ref)
	return (setmetatable({ __isFile = true, __base = p1, __parent = p2 }, v2))
end

v3 = {
	__index = function(p1, Text) --[[ Line: 153 ]]
		-- upvalues: v3 (ref), v2 (ref)
		return if Text == "Parent" then setmetatable({
			__isFolder = true,
			__dir = p1.__dir:match("^(.*)/[^/]+$") or "."
		}, v3) else setmetatable({
			__isFile = true,
			__base = p1.__dir .. "/" .. Text,
			__parent = p1
		}, v2)
	end
}
v2 = {
	__index = function(p1, p2) --[[ Line: 162 ]]
		if p2 == "Parent" then
			return p1.__parent
		else
			error(`unsupported instance access: .{tostring(p2)} on module file`)
		end
	end
}

local function v19(p1) --[[ Line: 170 ]]
	-- upvalues: t1 (copy), FsModule (copy), LuauModule (copy), v19 (ref), t (copy), config1 (copy)
	assert(type(p1) == "table" and p1.__isFile, "custom require expects a module node")
	local Base = p1.__base
	
	if t1[Base] ~= nil then
		return t1[Base]
	end
	local Text = Base .. ".lua"
	
	if not FsModule.exists(Text) then
		Text = Base .. ".luau"
	end
	local v4 = LuauModule.load(LuauModule.compile((FsModule.readFileToString(Text))), Text, (setmetatable({ script = p1, require = v19, _G = t }, { __index = config1 })))()
	t1[Base] = v4
	
	return v4
end

local NewResult = v19((setmetatable({
	__isFile = true,
	__base = v1 .. "/Client",
	__parent = setmetatable({ __isFolder = true, __dir = v1 }, v3)
}, v2))):new({
	environment = "sentry-sdk-test",
	release = "sentry-sdk-test",
	dsn = Arg
}, HttpService)
NewResult:set_tag("test_run", "breadcrumb-lute")
NewResult:add_breadcrumb({
	type = "ui",
	category = "ui.click",
	message = "client-level crumb"
})
local Stacktrace = {
	frames = {
		{
			filename = "CartService.lua",
			abs_path = "CartService.lua",
			["function"] = "submitOrder",
			lineno = 142,
			colno = 9,
			in_app = true
		},
		{
			filename = "PurchaseFlow.lua",
			abs_path = "PurchaseFlow.lua",
			["function"] = "startCheckout",
			lineno = 88,
			in_app = true
		}
	}
}
local config2 = {
	app = { app_version = "1.2.3", app_build = "4567" },
	device = {
		name = "iPhone 15",
		model = "iPhone16,1",
		manufacturer = "Apple",
		memory_size = 8000000000
	},
	checkout = { cart_id = "cart_abc123", item_count = 3 }
}
local config3 = {
	values = {
		{
			id = 1,
			name = "main",
			main = true,
			crashed = true,
			stacktrace = Stacktrace
		},
		{
			id = 2,
			name = "PrefetchWorker",
			main = false,
			crashed = false,
			stacktrace = {
				frames = {
					{
						filename = "PrefetchWorker.lua",
						["function"] = "run",
						lineno = 27,
						in_app = true
					}
				}
			}
		}
	}
}
print("Sending exception to Sentry with context, threads, stacktrace, and breadcrumbs...")
NewResult:capture_exception({
	type = "LuaError",
	message = "Breadcrumb test from lute",
	stacktrace = Stacktrace
}, "error", config2, config3, function(p1, p2, p3) --[[ Line: 287 ]]
	print("---- Sentry response ----")
	print("callback success:", p1)
	print("eventId:", (tostring(p3)))
	
	if type(p2) == "table" and type(p2.body) == "table" then
		print("HTTP status:", (tostring(p2.body.StatusCode)))
		print("HTTP body:", (tostring(p2.body.Body)))
	elseif type(p2) == "table" then
		print("error:", (tostring(p2.error)))
	end
	print("-------------------------")
end, {
	{
		type = "navigation",
		category = "navigation",
		message = "Opened Avatar editor",
		timestamp = os.time() - 10,
		data = { from = "/home", to = "/avatar" }
	},
	{
		type = "ui",
		category = "ui.click",
		message = "Tapped Buy",
		level = "info",
		timestamp = os.time()
	}
})