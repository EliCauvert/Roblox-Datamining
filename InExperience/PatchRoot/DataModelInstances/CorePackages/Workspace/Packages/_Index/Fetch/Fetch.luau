local _ = require(script.Parent.LuauPolyfill)
local fetchModule = require(script.fetch)

return {
	Headers = require(script.Headers).Headers,
	Request = require(script.Request).Request,
	Response = require(script.Response).Response,
	Body = require(script.Body).Body,
	fetch = fetchModule(game:GetService("HttpService")),
	buildFetch = fetchModule,
	AbortSignal = require(script.AbortSignal).AbortSignal
}