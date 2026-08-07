-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:15 2026 Pacific Standard Time.

local t = {
	parseAndCheckHttpResponse = require(script.parseAndCheckHttpResponse).parseAndCheckHttpResponse,
	serializeFetchParameter = require(script.serializeFetchParameter).serializeFetchParameter
}
local selectHttpOptionsAndBodyModule = require(script.selectHttpOptionsAndBody)
t.fallbackHttpConfig = selectHttpOptionsAndBodyModule.fallbackHttpConfig
t.selectHttpOptionsAndBody = selectHttpOptionsAndBodyModule.selectHttpOptionsAndBody
t.checkFetcher = require(script.checkFetcher).checkFetcher
t.createSignalIfSupported = require(script.createSignalIfSupported).createSignalIfSupported
t.selectURI = require(script.selectURI).selectURI
t.createHttpLink = require(script.createHttpLink).createHttpLink
t.HttpLink = require(script.HttpLink).HttpLink
t.rewriteURIForGET = require(script.rewriteURIForGET).rewriteURIForGET

return t