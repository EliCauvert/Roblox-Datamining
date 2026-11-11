local SelectHttpOptionsAndBodyModule = require(script.selectHttpOptionsAndBody)

return {
	parseAndCheckHttpResponse = require(script.parseAndCheckHttpResponse).parseAndCheckHttpResponse,
	serializeFetchParameter = require(script.serializeFetchParameter).serializeFetchParameter,
	fallbackHttpConfig = SelectHttpOptionsAndBodyModule.fallbackHttpConfig,
	selectHttpOptionsAndBody = SelectHttpOptionsAndBodyModule.selectHttpOptionsAndBody,
	checkFetcher = require(script.checkFetcher).checkFetcher,
	createSignalIfSupported = require(script.createSignalIfSupported).createSignalIfSupported,
	selectURI = require(script.selectURI).selectURI,
	createHttpLink = require(script.createHttpLink).createHttpLink,
	HttpLink = require(script.HttpLink).HttpLink,
	rewriteURIForGET = require(script.rewriteURIForGET).rewriteURIForGET
}