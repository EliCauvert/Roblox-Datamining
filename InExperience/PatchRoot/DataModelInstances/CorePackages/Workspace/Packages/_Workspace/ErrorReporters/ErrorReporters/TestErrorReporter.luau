local luauModule = require("@std/luau")
local fsModule = require("@std/fs")
local jsonModule = require("@std/json")
local netModule = require("@std/net")
local processModule = require("@std/process")

local function _(p1)
	return p1:match("^(.*)/[^/]+$") or "."
end

local _ = function(p1)
	-- upvalues: fsModule (ref)
	return fsModule.exists(p1 .. "/init.lua") or fsModule.exists(p1 .. "/init.luau")
end

local var1 = processModule.args[1]:match("^(.*)/[^/]+$") or "."
local var2 = (var1:match("^(.*)/[^/]+$") or "."):match("^(.*)/[^/]+$") or "."
local text = var2 .. "/sentry-sdk/src"
local var3 = processModule.args[2] or processModule.env.SENTRY_DSN

if not var3 or var3 == "" then
	print("ERROR: no DSN provided.")
	print("  lute TestErrorReporter.lua \"<your-sentry-dsn>\"")
	print("  or set SENTRY_DSN in the environment")
	processModule.exit(1)
end
for i, v in {
	var1 .. "/Sentry/SentryReporter.lua",
	text .. "/Client.lua"
} do
	if not fsModule.exists(v) then
		print(`ERROR: cannot find {v}`)
		processModule.exit(1)
	end
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
		renderStepped = {
			Connect = function()
				return { Disconnect = function() end }
			end
		},
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

function tbl.DefineFastFlag(_, p1, p2)
	return p1 == "SentryReportBreadcrumbs" or p2
end

function tbl.DefineFastInt(_, _, p1)
	return p1
end

local t_2 = {
	Dictionary = {
		join = function(...)
			local t = {}
			
			for i = 1, select("#", ...) do
				local var4 = select(i, ...)
				
				if type(var4) ~= "table" then
					continue
				end
				for i, v in pairs(var4) do
					t[i] = v
				end
			end
			return t
		end
	}
}
local tbl_1 = setmetatable({}, {
	__index = function()
		return function()
			return function()
				return true
			end
		end
	end
})
local t_3 = {
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
	tick = os.clock,
	game = tbl
}
local t_4 = {}
local t_5 = {}
local t_6 = nil
local _ = nil

local _ = function(p1, p2, p3)
	-- upvalues: t_6 (write)
	return setmetatable({ __path = p1, __name = p2, __parent = p3 }, t_6)
end

t_6 = {
	__index = function(p1, p2)
		-- upvalues: t_6 (write)
		if type(p2) == "string" and p2:sub(1, 2) == "__" then
			return rawget(p1, p2)
		elseif p2 == "Parent" then
			return p1.__parent
		elseif p2 == "Name" then
			return p1.__name
		elseif p2 == "FindFirstAncestor" then
			return function(_, p3)
				-- upvalues: p1 (ref)
				local parent = p1.__parent
				while parent ~= nil do
					if parent.__name ~= p3 then
						parent = parent.__parent
						continue
					end
					return parent
				end
				return nil
			end
		end
		local var5 = p1.__overrides and p1.__overrides[p2]
		
		return if var5 == nil then setmetatable({
			__path = p1.__path .. "/" .. p14,
			__name = p2,
			__parent = p1
		}, t_6) else var5
	end
}

local var6 = function(p3)
	-- upvalues: fsModule (ref), t_5 (ref), luauModule (ref), var6 (write), t_4 (ref), t_3 (ref)
	assert(type(p3) == "table" and p3.__path, "custom require expects a module node")
	
	if p3.__value ~= nil then
		return p3.__value
	end
	local path = p3.__path
	local var7 = path
	
	if fsModule.exists(var7 .. "/init.lua") or fsModule.exists(var7 .. "/init.luau") then
		path ..= "/init"
	end
	if t_5[path] ~= nil then
		return t_5[path]
	end
	local text = path .. ".lua"
	
	if not fsModule.exists(text) then
		text = path .. ".luau"
	end
	local var8 = luauModule.load(luauModule.compile(fsModule.readFileToString(text)), text, setmetatable({ script = p3, require = var6, _G = t_4 }, { __index = t_3 }))()
	t_5[path] = var8
	
	return var8
end

local tbl_2 = setmetatable({ __name = "Packages", __parent = nil, __path = var2 }, t_6)
local tbl_3 = setmetatable({
	__name = "ErrorReporters",
	__path = var1,
	__parent = tbl_2
}, t_6)
tbl_2.__overrides = {
	ErrorReporters = tbl_3,
	SentrySdk = setmetatable({ __name = "SentrySdk", __path = text, __parent = tbl_2 }, t_6),
	Cryo = setmetatable({
		__name = "Cryo",
		__path = var2 .. "/Cryo",
		__parent = tbl_2
	}, t_6),
	t = setmetatable({ __name = "t", __path = var2 .. "/t", __parent = tbl_2 }, t_6)
}
tbl_2.__overrides.Cryo.__value = t_2
tbl_2.__overrides.t.__value = tbl_1
local var7 = var6(tbl_3.Sentry.SentryReporter)
local var8 = var6(tbl_3.Sentry.ErrorReport)
local var9 = var3:match("@([^/]+)") or "?"
local var10 = nil

local function summarizeBreadcrumbs()
	-- upvalues: var10 (write)
	local t = {}
	
	for i, v in var10.breadcrumbs do
		table.insert(t, string.format("      #%d [%s/%s] %s", i, tostring(v.type), tostring(v.category), tostring(v.message)))
	end
	return table.concat(t, "\n")
end

local var11 = var7.new({
	environment = "development",
	release = "error-reporter-test",
	httpService = t,
	dsn = var3,
	sentryClientSuccessCallback = function()
		-- upvalues: var9 (ref), var10 (write), t (ref), summarizeBreadcrumbs (ref)
		print("---- Sentry report accepted ----")
		print("  environment:", "development")
		print("  release:", "error-reporter-test")
		print("  dsn host:", var9)
		print("  level:", tostring(var10.level))
		print("  message:", tostring(var10.message))
		print("  attributes:", t:JSONEncode(var10.attributes))
		print("  customMetadata:", t:JSONEncode(var10.customMetadata))
		print("  breadcrumbs:", #var10.breadcrumbs)
		
		if #var10.breadcrumbs > 0 then
			print(summarizeBreadcrumbs())
		end
		print("--------------------------------")
	end,
	sentryClientFailureCallback = function(p3)
		print("[callback] sentryClientFailureCallback fired:", tostring(p3))
	end
})
var10 = var8.fromMessageAndStack("Testing TestErrorReporter", "Script 'CartService', Line 142 - submitOrder\nScript 'PurchaseFlow', Line 88 - startCheckout", "error")
var10:addAttributes({
	appVersion = "1.2.3",
	baseOs = "iOS",
	systemVersion = "17.5",
	deviceName = "iPhone 15",
	networkType = "wifi"
})
var10:addCustomMetadata({ checkout = { cart_id = "cart_abc123", item_count = 3 } })
var10:addBreadcrumb({
	type = "navigation",
	category = "navigation",
	message = "Opened Avatar editor",
	data = { from = "/home", to = "/avatar" },
	timestamp = os.time() - 10
})
var10:addBreadcrumb({
	type = "ui",
	category = "ui.click",
	message = "Tapped Buy",
	level = "info"
})
print("Report breadcrumbs:", #var10.breadcrumbs)
print("Sending error report to Sentry (context + threads + breadcrumbs)...")
var11:sendErrorReport(var10)
var11:stop()
print("Done. Check the Sentry issue for the breadcrumb trail.")