local luauModule = require("@std/luau")
local fsModule = require("@std/fs")
local jsonModule = require("@std/json")
local netModule = require("@std/net")
local processModule = require("@std/process")
local var1 = processModule.args[1]:match("^(.*)/[^/]+$") or "."
local var2 = processModule.args[2] or processModule.env.SENTRY_DSN

if not var2 or var2 == "" then
	print("ERROR: no DSN provided.")
	print("  lute test_client.lua \"<your-sentry-dsn>\"")
	print("  or set SENTRY_DSN in the environment")
	processModule.exit(1)
end
if not fsModule.exists(var1 .. "/Client.lua") then
	print(`ERROR: cannot find {var1}/Client.lua`)
	processModule.exit(1)
end
local t = {
	JSONEncode = function(_, p1)
		-- upvalues: jsonModule (ref)
		return jsonModule.serialize(p1)
	end,
	JSONDecode = function(_, p1)
		-- upvalues: jsonModule (ref)
		return jsonModule.deserialize(p1)
	end,
	RequestInternal = function(_, p1)
		-- upvalues: netModule (ref)
		return {
			Start = function(_, p2)
				-- upvalues: netModule (copy), p1 (ref)
				local ok, status = pcall(function()
					-- upvalues: netModule (copy), p1 (copy)
					return netModule.request(p1.Url, { method = p1.Method, headers = p1.Headers, body = p1.Body })
				end)
				
				if ok then
					p2(true, {
						Success = status.ok,
						StatusCode = status.status,
						Body = status.body,
						Headers = status.headers
					})
					
					return
				end
				p2(false, tostring(status))
			end
		}
	end
}
local t_1 = {
	HttpService = t,
	RunService = {
		IsStudio = function(_)
			return false
		end,
		GetRobloxVersion = function(_)
			return "version-9.999.0.9999999"
		end
	}
}
local tbl = setmetatable({ PlaceId = 0, JobId = "lute-test-job" }, {})

function tbl.GetService(_, p1)
	-- upvalues: t_1 (ref)
	return t_1[p1]
end

function tbl.DefineFastFlag(_)
	return false
end

local t_2 = {
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
	game = tbl
}
local t_3 = {}
local t_4 = {}
local var3 = nil
local var4 = nil
local _ = nil

local function _(p1)
	return p1:match("^(.*)/[^/]+$") or "."
end

local _ = function(p1)
	-- upvalues: var4 (write)
	return setmetatable({ __isFolder = true, __dir = p1 }, var4)
end

local _ = function(p1, p2)
	-- upvalues: var3 (write)
	return setmetatable({ __isFile = true, __base = p1, __parent = p2 }, var3)
end

local var5 = function(p1)
	-- upvalues: t_4 (ref), fsModule (ref), luauModule (ref), var5 (write), t_3 (ref), t_2 (ref)
	assert(type(p1) == "table" and p1.__isFile, "custom require expects a module node")
	local base = p1.__base
	
	if t_4[base] ~= nil then
		return t_4[base]
	end
	local text = base .. ".lua"
	
	if not fsModule.exists(text) then
		text = base .. ".luau"
	end
	local var6 = luauModule.load(luauModule.compile(fsModule.readFileToString(text)), text, setmetatable({ script = p1, require = var5, _G = t_3 }, { __index = t_2 }))()
	t_4[base] = var6
	
	return var6
end

local var6 = var5(setmetatable({
	__isFile = true,
	__base = var1 .. "/Client",
	__parent = setmetatable({ __isFolder = true, __dir = var1 }, {
		__index = function(p1, p2)
			-- upvalues: var4 (write), var3 (write)
			return if p2 == "Parent" then setmetatable({
				__isFolder = true,
				__dir = p1.__dir:match("^(.*)/[^/]+$") or "."
			}, var4) else setmetatable({
				__isFile = true,
				__base = p1.__dir .. "/" .. p11,
				__parent = p1
			}, var3)
		end
	})
}, {
	__index = function(p1, p2)
		if p2 == "Parent" then
			return p1.__parent
		end
		error(`unsupported instance access: .{tostring(p2)} on module file`)
	end
})):new({
	environment = "sentry-sdk-test",
	release = "sentry-sdk-test",
	dsn = var2
}, t)
var6:set_tag("test_run", "breadcrumb-lute")
var6:add_breadcrumb({
	type = "ui",
	category = "ui.click",
	message = "client-level crumb"
})
local t_5 = {
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
local t_6 = {
	app = { app_version = "1.2.3", app_build = "4567" },
	device = {
		name = "iPhone 15",
		model = "iPhone16,1",
		manufacturer = "Apple",
		memory_size = 8000000000
	},
	checkout = { cart_id = "cart_abc123", item_count = 3 }
}
local t_7 = {
	values = {
		{
			id = 1,
			name = "main",
			main = true,
			crashed = true,
			stacktrace = t_5
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
var6:capture_exception({
	type = "LuaError",
	message = "Breadcrumb test from lute",
	stacktrace = t_5
}, "error", t_6, t_7, function(p1, p2, p3)
	print("---- Sentry response ----")
	print("callback success:", p1)
	print("eventId:", tostring(p3))
	
	if type(p2) == "table" and type(p2.body) == "table" then
		print("HTTP status:", tostring(p2.body.StatusCode))
		print("HTTP body:", tostring(p2.body.Body))
	elseif type(p2) == "table" then
		print("error:", tostring(p2.error))
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