local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local urlBuilderModule = require(parent.UrlBuilder)
local tModule = require(parent.t)
local promiseModule = require(parent.Promise)
local processTransferModelModule = require(currencyTransfers.Models.ProcessTransferModel)
local httpRequestModule = require(currencyTransfers.NetworkRequests.HttpRequest)
local urlBuilder = urlBuilderModule.UrlBuilder
local urlBase = urlBuilderModule.UrlBase

local function _(p1)
	-- upvalues: urlBuilder (ref), urlBase (ref)
	return urlBuilder.new({
		base = urlBase.APIS,
		path = `transfer/v1/robux-transfer/process-transfer/{p1}`
	})()
end

local var1 = tModule.strictInterface({
	transferRequestId = tModule.string,
	robuxAmount = tModule.number
})

return function(p1, p2, p3)
	-- upvalues: var1 (ref), httpRequestModule (ref), urlBuilder (ref), urlBase (ref), processTransferModelModule (ref), promiseModule (ref)
	assert(var1(p1))
	
	return (if p3 ~= nil then httpRequestModule.new(p2) else httpRequestModule.fromNetworkImpl(p3)):post(urlBuilder.new({
		base = urlBase.APIS,
		path = `transfer/v1/robux-transfer/process-transfer/{p1.transferRequestId}`
	})(), { robuxAmount = p1.robuxAmount }):andThen(function(p4)
		-- upvalues: processTransferModelModule (copy)
		return processTransferModelModule.format(p4)
	end):catch(function(p4)
		-- upvalues: promiseModule (copy)
		return promiseModule.reject(p4)
	end)
end