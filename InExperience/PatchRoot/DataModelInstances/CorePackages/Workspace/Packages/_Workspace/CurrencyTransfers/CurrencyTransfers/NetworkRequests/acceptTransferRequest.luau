local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local urlBuilderModule = require(parent.UrlBuilder)
local tModule = require(parent.t)
local promiseModule = require(parent.Promise)
local acceptTransferModelModule = require(currencyTransfers.Models.AcceptTransferModel)
local httpRequestModule = require(currencyTransfers.NetworkRequests.HttpRequest)
local urlBuilder = urlBuilderModule.UrlBuilder
local urlBase = urlBuilderModule.UrlBase

local function _(p1)
	-- upvalues: urlBuilder (ref), urlBase (ref)
	return urlBuilder.new({
		base = urlBase.APIS,
		path = `transfer/v1/robux-transfer/accept-transfer/{p1}`
	})()
end

local var1 = tModule.strictInterface({ transferRequestId = tModule.string })

return function(p1, p2, p3)
	-- upvalues: var1 (ref), httpRequestModule (ref), urlBuilder (ref), urlBase (ref), acceptTransferModelModule (ref), promiseModule (ref)
	assert(var1(p1))
	
	return (if p3 ~= nil then httpRequestModule.new(p2) else httpRequestModule.fromNetworkImpl(p3)):post(urlBuilder.new({
		base = urlBase.APIS,
		path = `transfer/v1/robux-transfer/accept-transfer/{p1.transferRequestId}`
	})(), { recipientId = 0 }):andThen(function(p4)
		-- upvalues: acceptTransferModelModule (copy)
		return acceptTransferModelModule.format(p4)
	end):catch(function(p4)
		-- upvalues: promiseModule (copy)
		return promiseModule.reject(p4)
	end)
end