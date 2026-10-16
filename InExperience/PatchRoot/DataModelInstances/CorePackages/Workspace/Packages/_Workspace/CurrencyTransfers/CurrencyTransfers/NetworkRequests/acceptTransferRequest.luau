local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local Parent = CurrencyTransfers.Parent
local UrlBuilderModule = require(Parent.UrlBuilder)
local TModule = require(Parent.t)
local PromiseModule = require(Parent.Promise)
local AcceptTransferModelModule = require(CurrencyTransfers.Models.AcceptTransferModel)
local HttpRequestModule = require(CurrencyTransfers.NetworkRequests.HttpRequest)
local UrlBuilder = UrlBuilderModule.UrlBuilder
local UrlBase = UrlBuilderModule.UrlBase

local function _(p1) --[[ Line: 20 | Named "acceptTransferUrl" ]]
	-- upvalues: UrlBuilder (copy), UrlBase (copy)
	return UrlBuilder.new({
		base = UrlBase.APIS,
		path = `transfer/v1/robux-transfer/accept-transfer/{p1}`
	})()
end

local StrictInterfaceResult = TModule.strictInterface({ transferRequestId = TModule.string })

return function(p1, p2, p3) --[[ Line: 31 | Named "acceptTransferRequest" ]]
	-- upvalues: StrictInterfaceResult (copy), HttpRequestModule (copy), UrlBuilder (copy), UrlBase (copy), AcceptTransferModelModule (copy), PromiseModule (copy)
	assert(StrictInterfaceResult(p1))
	
	return (if p3 == nil then HttpRequestModule.new(p2) else HttpRequestModule.fromNetworkImpl(p3)):post(UrlBuilder.new({
		base = UrlBase.APIS,
		path = `transfer/v1/robux-transfer/accept-transfer/{p1.transferRequestId}`
	})(), { recipientId = 0 }):andThen(function(Result) --[[ Line: 39 ]]
		-- upvalues: AcceptTransferModelModule (upval)
		return AcceptTransferModelModule.format(Result)
	end):catch(function(Err) --[[ Line: 42 ]]
		-- upvalues: PromiseModule (upval)
		return PromiseModule.reject(Err)
	end)
end