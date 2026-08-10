local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local urlBuilderModule = require(parent.UrlBuilder)
local tModule = require(parent.t)
local promiseModule = require(parent.Promise)
local initiateTransferModelModule = require(currencyTransfers.Models.InitiateTransferModel)
local httpRequestModule = require(currencyTransfers.NetworkRequests.HttpRequest)
local transferOriginationModule = require(currencyTransfers.Enums.TransferOrigination)
local var7 = urlBuilderModule.UrlBuilder.new({
	path = "transfer/v1/robux-transfer/initiate-transfer",
	base = urlBuilderModule.UrlBase.APIS
})()
local var8 = tModule.strictInterface({
	recipientId = tModule.number,
	transferOrigination = tModule.optional(tModule.string)
})

return function(p0, p1, p2) --[[ line: 32 | named "initiateTransferRequest" ]]
	-- upvalues: var8 (ref), httpRequestModule (ref), transferOriginationModule (ref), var7 (ref), initiateTransferModelModule (ref), promiseModule (ref)
	assert(var8(p0))
	
	return (if p2 ~= nil then httpRequestModule.new(p1) else httpRequestModule.fromNetworkImpl(p2)):post(var7, {
		recipientId = p0.recipientId,
		transferOrigin = transferOriginationModule.toEnumInteger[p0.transferOrigination or transferOriginationModule.Unknown] or transferOriginationModule.toEnumInteger[transferOriginationModule.Unknown]
	}):andThen(function(p4) --[[ line: 49 ]]
		-- upvalues: initiateTransferModelModule (copy)
		return initiateTransferModelModule.format(p4)
	end):catch(function(p3) --[[ line: 52 ]]
		-- upvalues: promiseModule (copy)
		return promiseModule.reject(p3)
	end)
end