local LuauModule = require("@std/luau")
local FsModule = require("@std/fs")
local JsonModule = require("@std/json")
local NetModule = require("@std/net")
local ProcessModule = require("@std/process")

local function _(p1)
	return p1:match("^(.*)/[^/]+$") or "."
end

local _ = function(Text)
	-- upvalues: FsModule (copy)
	return FsModule.exists(Text .. "/init.lua") or FsModule.exists(Text .. "/init.luau")
end

local v1 = ProcessModule.args[1]:match("^(.*)/[^/]+$") or "."
local v2 = (v1:match("^(.*)/[^/]+$") or "."):match("^(.*)/[^/]+$") or "."
local Text = v2 .. "/sentry-sdk/src"
local Arg = ProcessModule.args[2] or ProcessModule.env.SENTRY_DSN

if not Arg or Arg == "" then
	print("ERROR: no DSN provided.")
	print("  lute TestErrorReporter.lua \"<your-sentry-dsn>\"")
	print("  or set SENTRY_DSN in the environment")
	ProcessModule.exit(1)
end
for _, value in {
	v1 .. "/Sentry/SentryReporter.lua",
	Text .. "/Client.lua"
} do
	if not FsModule.exists(value) then
		print(`ERROR: cannot find {value}`)
		ProcessModule.exit(1)
	end
end
local HttpService = {
	JSONEncode = function(_, p1)
		-- upvalues: JsonModule (copy)
		return JsonModule.serialize(p1)
	end,
	JSONDecode = function(_, p1)
		-- upvalues: JsonModule (copy)
		return JsonModule.deserialize(p1)
	end,
	RequestInternal = function(_, p1)
		-- upvalues: NetModule (copy)
		return {
			Start = function(_, Callback: (any, any) -> ())
				-- upvalues: NetModule (upval), p1 (copy)
				local Success, Result = pcall(function()
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
		renderStepped = {
			Connect = function()
				return { Disconnect = function() end }
			end
		},
		IsStudio = function(_): boolean
			return false
		end,
		GetRobloxVersion = function(_): string
			return "version-9.999.0.9999999"
		end
	}
}
local self = setmetatable({ PlaceId = 0, JobId = "lute-test-job" }, {})

function self:GetService(p1)
	-- upvalues: config (copy)
	return config[p1]
end

function self:DefineFastFlag(p1, p2)
	return p1 == "SentryReportBreadcrumbs" or p2
end

function self:DefineFastInt(_, p1)
	return p1
end

local config1 = {
	Dictionary = {
		join = function(...)
			local t = {}
			
			for i = 1, select("#", ...) do
				local Selected = select(i, ...)
				
				if type(Selected) == "table" then
					for i1, value in pairs(Selected) do
						t[i1] = value
					end
				end
			end
			return t
		end
	}
}
local self1 = setmetatable({}, {
	__index = function()
		return function()
			return function(): boolean
				return true
			end
		end
	end
})
local config2 = {
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
	game = self
}
local t = {}
local t1 = {}
local v3 = nil
local _ = nil

local _ = function(p1, p2, p3)
	-- upvalues: v3 (ref)
	return (setmetatable({ __path = p1, __name = p2, __parent = p3 }, v3))
end

v3 = {
	__index = function(p1, Text: string)
		-- upvalues: v3 (ref)
		if type(Text) == "string" and Text:sub(1, 2) == "__" then
			return (rawget(p1, Text))
		elseif Text == "Parent" then
			return p1.__parent
		elseif Text == "Name" then
			return p1.__name
		elseif Text == "FindFirstAncestor" then
			return function(_, Name)
				-- upvalues: p1 (copy)
				local Parent = p1.__parent
				while Parent ~= nil do
					if Parent.__name == Name then
						return Parent
					end
					Parent = Parent.__parent
				end
				return nil
			end
		else
			local Override = p1.__overrides and p1.__overrides[Text]
			
			return if Override == nil then setmetatable({
				__path = p1.__path .. "/" .. Text,
				__name = Text,
				__parent = p1
			}, v3) else Override
		end
	end
}

local function v22(ErrorReport)
	-- upvalues: FsModule (copy), t1 (copy), LuauModule (copy), v22 (ref), t (copy), config2 (copy)
	assert(type(ErrorReport) == "table" and ErrorReport.__path, "custom require expects a module node")
	
	if ErrorReport.__value ~= nil then
		return ErrorReport.__value
	end
	local Path = ErrorReport.__path
	
	if FsModule.exists(Path .. "/init.lua") or FsModule.exists(Path .. "/init.luau") then
		Path ..= "/init"
	end
	if t1[Path] ~= nil then
		return t1[Path]
	end
	local Text = Path .. ".lua"
	
	if not FsModule.exists(Text) then
		Text = Path .. ".luau"
	end
	local v4 = LuauModule.load(LuauModule.compile((FsModule.readFileToString(Text))), Text, (setmetatable({ script = ErrorReport, require = v22, _G = t }, { __index = config2 })))()
	t1[Path] = v4
	
	return v4
end

local self2 = setmetatable({ __name = "Packages", __parent = nil, __path = v2 }, v3)
local self21 = setmetatable({ __name = "ErrorReporters", __path = v1, __parent = self2 }, v3)
self2.__overrides = {
	ErrorReporters = self21,
	SentrySdk = setmetatable({ __name = "SentrySdk", __path = Text, __parent = self2 }, v3),
	Cryo = setmetatable({
		__name = "Cryo",
		__path = v2 .. "/Cryo",
		__parent = self2
	}, v3),
	t = setmetatable({ __name = "t", __path = v2 .. "/t", __parent = self2 }, v3)
}
self2.__overrides.Cryo.__value = config1
self2.__overrides.t.__value = self1
local v4 = v22(self21.Sentry.SentryReporter)
local v5 = v22(self21.Sentry.ErrorReport)
local v6 = Arg:match("@([^/]+)") or "?"
local TestingTestErrorReporter = nil

local function summarizeBreadcrumbs(): string
	-- upvalues: TestingTestErrorReporter (ref)
	local List = {}
	
	for i, breadcrumb in TestingTestErrorReporter.breadcrumbs do
		table.insert(List, string.format("      #%d [%s/%s] %s", i, tostring(breadcrumb.type), tostring(breadcrumb.category), (tostring(breadcrumb.message))))
	end
	return table.concat(List, "\n")
end

local NewResult = v4.new({
	environment = "development",
	release = "error-reporter-test",
	httpService = HttpService,
	dsn = Arg,
	sentryClientSuccessCallback = function()
		-- upvalues: v6 (copy), TestingTestErrorReporter (ref), HttpService (copy), summarizeBreadcrumbs (copy)
		print("---- Sentry report accepted ----")
		print("  environment:", "development")
		print("  release:", "error-reporter-test")
		print("  dsn host:", v6)
		print("  level:", (tostring(TestingTestErrorReporter.level)))
		print("  message:", (tostring(TestingTestErrorReporter.message)))
		print("  attributes:", HttpService:JSONEncode(TestingTestErrorReporter.attributes))
		print("  customMetadata:", HttpService:JSONEncode(TestingTestErrorReporter.customMetadata))
		print("  breadcrumbs:", #TestingTestErrorReporter.breadcrumbs)
		
		if #TestingTestErrorReporter.breadcrumbs > 0 then
			print(summarizeBreadcrumbs())
		end
		print("--------------------------------")
	end,
	sentryClientFailureCallback = function(p2)
		print("[callback] sentryClientFailureCallback fired:", (tostring(p2)))
	end
})
TestingTestErrorReporter = v5.fromMessageAndStack("Testing TestErrorReporter", "Script 'CartService', Line 142 - submitOrder\nScript 'PurchaseFlow', Line 88 - startCheckout", "error")
TestingTestErrorReporter:addAttributes({
	appVersion = "1.2.3",
	baseOs = "iOS",
	systemVersion = "17.5",
	deviceName = "iPhone 15",
	networkType = "wifi"
})
TestingTestErrorReporter:addCustomMetadata({ checkout = { cart_id = "cart_abc123", item_count = 3 } })
TestingTestErrorReporter:addBreadcrumb({
	type = "navigation",
	category = "navigation",
	message = "Opened Avatar editor",
	data = { from = "/home", to = "/avatar" },
	timestamp = os.time() - 10
})
TestingTestErrorReporter:addBreadcrumb({
	type = "ui",
	category = "ui.click",
	message = "Tapped Buy",
	level = "info"
})
print("Report breadcrumbs:", #TestingTestErrorReporter.breadcrumbs)
print("Sending error report to Sentry (context + threads + breadcrumbs)...")
NewResult:sendErrorReport(TestingTestErrorReporter)
NewResult:stop()
print("Done. Check the Sentry issue for the breadcrumb trail.")