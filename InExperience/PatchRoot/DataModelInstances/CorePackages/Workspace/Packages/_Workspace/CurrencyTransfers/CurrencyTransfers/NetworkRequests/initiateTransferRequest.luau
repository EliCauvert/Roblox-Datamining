local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local urlBuilderModule = require(parent.UrlBuilder)
local tModule = require(parent.t)
local promiseModule = require(parent.Promise)
local initiateTransferModelModule = require(currencyTransfers.Models.InitiateTransferModel)
local httpRequestModule = require(currencyTransfers.NetworkRequests.HttpRequest)
local transferOriginationModule = require(currencyTransfers.Enums.TransferOrigination)
local var1 = urlBuilderModule.UrlBuilder.new({
	path = "transfer/v1/robux-transfer/initiate-transfer",
	base = urlBuilderModule.UrlBase.APIS
})()
local var2 = tModule.strictInterface({
	recipientId = tModule.number,
	transferOrigination = tModule.optional(tModule.string)
})

return function(p1, p2, p3)
	-- upvalues: var2 (ref), httpRequestModule (ref), transferOriginationModule (ref), var1 (ref), initiateTransferModelModule (ref), promiseModule (ref)
	assert(var2(p1))
	
	return (if p3 ~= nil then httpRequestModule.new(p2) else httpRequestModule.fromNetworkImpl(p3)):post(var1, {
		recipientId = p1.recipientId,
		transferOrigin = transferOriginationModule.toEnumInteger[p1.transferOrigination or transferOriginationModule.Unknown] or transferOriginationModule.toEnumInteger[transferOriginationModule.Unknown]
	}):andThen(function(p4)
		-- upvalues: initiateTransferModelModule (copy)
		return initiateTransferModelModule.format(p4)
	end):catch(function(p4)
		-- upvalues: promiseModule (copy)
		return promiseModule.reject(p4)
	end)
end