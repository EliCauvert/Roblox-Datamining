local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local Parent = CurrencyTransfers.Parent
local UrlBuilderModule = require(Parent.UrlBuilder)
local TModule = require(Parent.t)
local PromiseModule = require(Parent.Promise)
local InitiateTransferModelModule = require(CurrencyTransfers.Models.InitiateTransferModel)
local HttpRequestModule = require(CurrencyTransfers.NetworkRequests.HttpRequest)
local TransferOriginationModule = require(CurrencyTransfers.Enums.TransferOrigination)
local v1 = UrlBuilderModule.UrlBuilder.new({
	path = "transfer/v1/robux-transfer/initiate-transfer",
	base = UrlBuilderModule.UrlBase.APIS
})()
local StrictInterfaceResult = TModule.strictInterface({
	recipientId = TModule.number,
	transferOrigination = TModule.optional(TModule.string)
})

return function(p1, p2)
	-- upvalues: StrictInterfaceResult (copy), HttpRequestModule (copy), TransferOriginationModule (copy), v1 (copy), InitiateTransferModelModule (copy), PromiseModule (copy)
	assert(StrictInterfaceResult(p1))
	
	return HttpRequestModule.new(p2):post(v1, {
		recipientId = p1.recipientId,
		transferOrigin = TransferOriginationModule.toEnumInteger[p1.transferOrigination or TransferOriginationModule.Unknown] or TransferOriginationModule.toEnumInteger[TransferOriginationModule.Unknown]
	}):andThen(function(Result)
		-- upvalues: InitiateTransferModelModule (upval)
		print("[initiateTransferRequest] Backend response (success):", Result)
		
		return (InitiateTransferModelModule.format(Result))
	end):catch(function(Err)
		-- upvalues: PromiseModule (upval)
		print("[initiateTransferRequest] Backend response (error):", Err)
		
		return PromiseModule.reject(Err)
	end)
end