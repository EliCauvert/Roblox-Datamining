local _ = require(script.Parent.LuauPolyfill)
local FetchModule = require(script.fetch)

return {
	Headers = require(script.Headers).Headers,
	Request = require(script.Request).Request,
	Response = require(script.Response).Response,
	Body = require(script.Body).Body,
	fetch = FetchModule(game:GetService("HttpService")),
	buildFetch = FetchModule,
	AbortSignal = require(script.AbortSignal).AbortSignal
}