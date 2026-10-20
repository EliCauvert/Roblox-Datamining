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

return function(p1, p2, p3)
	-- upvalues: StrictInterfaceResult (copy), HttpRequestModule (copy), TransferOriginationModule (copy), v1 (copy), InitiateTransferModelModule (copy), PromiseModule (copy)
	assert(StrictInterfaceResult(p1))
	
	return (if p3 == nil then HttpRequestModule.new(p2) else HttpRequestModule.fromNetworkImpl(p3)):post(v1, {
		recipientId = p1.recipientId,
		transferOrigin = TransferOriginationModule.toEnumInteger[p1.transferOrigination or TransferOriginationModule.Unknown] or TransferOriginationModule.toEnumInteger[TransferOriginationModule.Unknown]
	}):andThen(function(Result)
		-- upvalues: InitiateTransferModelModule (upval)
		return InitiateTransferModelModule.format(Result)
	end):catch(function(Err)
		-- upvalues: PromiseModule (upval)
		return PromiseModule.reject(Err)
	end)
end