local Src = script.src
local HtmlModule = require(script.lib.html)
local RequestModule = require(Src.request)
local FormModule = require(Src.form)
local RatelimitModule = require(Src.ratelimit)
local UtilModule = require(Src.util)
local FetchModule = require(Src.fetch)
local RobloxRequestsModule = {
	VERSION = "0.5.4",
	Request = RequestModule.new,
	Session = require(Src.session).new,
	FormData = FormModule.FormData.new,
	File = FormModule.File.new,
	cache = require(Src.cache),
	request = function(p1, p2, p3)
		-- upvalues: RequestModule (copy)
		return RequestModule.new(p1, p2, p3 or {}):send()
	end
}
RobloxRequestsModule.send = UtilModule.deprecate(RobloxRequestsModule.request, "0.5", "http.send")

function RobloxRequestsModule.promise_request(p1, p2, p3)
	-- upvalues: RequestModule (copy)
	return RequestModule.new(p1, p2, p3 or {}):send(true)
end

RobloxRequestsModule.promise_send = UtilModule.deprecate(RobloxRequestsModule.promise_request, "0.5", "http.promise_send")
RobloxRequestsModule.fetch = FetchModule(RobloxRequestsModule.promise_request)

for _, Text in pairs({
	"GET", "POST", "HEAD", "OPTIONS", "PUT", "DELETE", "PATCH"
}) do
	RobloxRequestsModule[Text:lower()] = function(p1, p2)
		-- upvalues: RobloxRequestsModule (copy), Text (copy)
		return RobloxRequestsModule.request(Text, p1, p2)
	end
	
	RobloxRequestsModule["promise_" .. Text:lower()] = function(p1, p2)
		-- upvalues: RobloxRequestsModule (copy), Text (copy)
		return RobloxRequestsModule.promise_request(Text, p1, p2)
	end
end
function RobloxRequestsModule.set_ratelimit(p1, p2)
	-- upvalues: RatelimitModule (copy)
	local Http = RatelimitModule.get("http", p1, p2)
	print("[http] RateLimiter settings changed: ", Http.rate, "reqs /", Http.window_size, "secs")
end

function RobloxRequestsModule.parse_html(p1, p2)
	-- upvalues: HtmlModule (copy)
	return HtmlModule.parse(p1, 100000, p2)
end

RobloxRequestsModule.parse_xml = RobloxRequestsModule.parse_html

return RobloxRequestsModule