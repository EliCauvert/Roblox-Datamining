local src = script.src
local htmlModule = require(script.lib.html)
local requestModule = require(src.request)
local sessionModule = require(src.session)
local formModule = require(src.form)
local ratelimitModule = require(src.ratelimit)
local utilModule = require(src.util)
local fetchModule = require(src.fetch)
local t = {
	VERSION = "0.5.4",
	Request = requestModule.new,
	Session = sessionModule.new,
	FormData = formModule.FormData.new,
	File = formModule.File.new,
	cache = require(src.cache),
	request = function(p1, p2, p3)
		-- upvalues: requestModule (ref)
		return requestModule.new(p1, p2, p3 or {}):send()
	end
}
t.send = utilModule.deprecate(t.request, "0.5", "http.send")

function t.promise_request(p1, p2, p3)
	-- upvalues: requestModule (ref)
	return requestModule.new(p1, p2, p3 or {}):send(true)
end

t.promise_send = utilModule.deprecate(t.promise_request, "0.5", "http.promise_send")
t.fetch = fetchModule(t.promise_request)

for i, v in pairs({
	"GET", "POST", "HEAD", "OPTIONS", "PUT", "DELETE", "PATCH"
}) do
	t[v:lower()] = function(p1, p2)
		-- upvalues: t (ref), v (ref)
		return t.request(v, p1, p2)
	end
	
	t["promise_" .. v:lower()] = function(p1, p2)
		-- upvalues: t (ref), v (ref)
		return t.promise_request(v, p1, p2)
	end
end
function t.set_ratelimit(value, p1)
	-- upvalues: ratelimitModule (ref)
	local http = ratelimitModule.get("http", value, p1)
	print("[http] RateLimiter settings changed: ", http.rate, "reqs /", http.window_size, "secs")
end

function t.parse_html(p1, p2)
	-- upvalues: htmlModule (ref)
	return htmlModule.parse(p1, 100000, p2)
end

t.parse_xml = t.parse_html

return t