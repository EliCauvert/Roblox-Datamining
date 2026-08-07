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