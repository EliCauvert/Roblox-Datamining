local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local urlBuilderModule = require(parent.UrlBuilder)
local tModule = require(parent.t)
local promiseModule = require(parent.Promise)
local processTransferModelModule = require(currencyTransfers.Models.ProcessTransferModel)
local httpRequestModule = require(currencyTransfers.NetworkRequests.HttpRequest)
local urlBuilder = urlBuilderModule.UrlBuilder
local urlBase = urlBuilderModule.UrlBase

local function _(p0) --[[ line: 21 | named "processTransferUrl" ]]
	-- upvalues: urlBuilder (ref), urlBase (ref)
	return urlBuilder.new({
		base = urlBase.APIS,
		path = `transfer/v1/robux-transfer/process-transfer/{p0}`
	})()
end

local var6 = tModule.strictInterface({
	transferRequestId = tModule.string,
	robuxAmount = tModule.number
})

return function(p1, p2) --[[ line: 33 | named "processTransferRequest" ]]
	-- upvalues: var6 (ref), httpRequestModule (ref), urlBuilder (ref), urlBase (ref), processTransferModelModule (ref), promiseModule (ref)
	assert(var6(p1))
	
	return httpRequestModule.new(p2):post(urlBuilder.new({
		base = urlBase.APIS,
		path = `transfer/v1/robux-transfer/process-transfer/{p1.transferRequestId}`
	})(), { robuxAmount = p1.robuxAmount }):andThen(function(p4) --[[ line: 41 ]]
		-- upvalues: processTransferModelModule (copy)
		return processTransferModelModule.format(p4)
	end):catch(function(p3) --[[ line: 44 ]]
		-- upvalues: promiseModule (copy)
		return promiseModule.reject(p3)
	end)
end