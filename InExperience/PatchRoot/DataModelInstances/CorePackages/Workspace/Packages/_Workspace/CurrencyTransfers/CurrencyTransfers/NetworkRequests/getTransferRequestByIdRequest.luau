local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local Parent = CurrencyTransfers.Parent
local UrlBuilderModule = require(Parent.UrlBuilder)
local TModule = require(Parent.t)
local PromiseModule = require(Parent.Promise)
local GetTransferByIdModelModule = require(CurrencyTransfers.Models.GetTransferByIdModel)
local HttpRequestModule = require(CurrencyTransfers.NetworkRequests.HttpRequest)
local UrlBuilder = UrlBuilderModule.UrlBuilder
local UrlBase = UrlBuilderModule.UrlBase

local function getTransferByIdUrl(TransferRequestId)
	-- upvalues: UrlBuilder (copy), UrlBase (copy)
	return UrlBuilder.new({
		base = UrlBase.APIS,
		path = `transfer/v1/robux-transfer/transfer/{TransferRequestId}`
	})()
end

local StrictInterfaceResult = TModule.strictInterface({ transferRequestId = TModule.string })

return function(p1, p2, p3)
	-- upvalues: StrictInterfaceResult (copy), HttpRequestModule (copy), getTransferByIdUrl (copy), GetTransferByIdModelModule (copy), PromiseModule (copy)
	assert(StrictInterfaceResult(p1))
	
	return (if p3 == nil then HttpRequestModule.new(p2) else HttpRequestModule.fromNetworkImpl(p3)):get(getTransferByIdUrl(p1.transferRequestId)):andThen(function(Result)
		-- upvalues: GetTransferByIdModelModule (upval)
		return GetTransferByIdModelModule.format(Result)
	end):catch(function(Err)
		-- upvalues: PromiseModule (upval)
		return PromiseModule.reject(Err)
	end)
end