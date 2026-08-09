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

return function(p0, p1) --[[ line: 32 | named "initiateTransferRequest" ]]
	-- upvalues: var8 (ref), httpRequestModule (ref), transferOriginationModule (ref), var7 (ref), initiateTransferModelModule (ref), promiseModule (ref)
	assert(var8(p0))
	
	return httpRequestModule.new(p1):post(var7, {
		recipientId = p0.recipientId,
		transferOrigin = transferOriginationModule.toEnumInteger[p0.transferOrigination or transferOriginationModule.Unknown] or transferOriginationModule.toEnumInteger[transferOriginationModule.Unknown]
	}):andThen(function(p3) --[[ line: 47 ]]
		-- upvalues: initiateTransferModelModule (copy)
		print("[initiateTransferRequest] Backend response (success):", p3)
		
		return initiateTransferModelModule.format(p3)
	end):catch(function(p2) --[[ line: 52 ]]
		-- upvalues: promiseModule (copy)
		print("[initiateTransferRequest] Backend response (error):", p2)
		
		return promiseModule.reject(p2)
	end)
end