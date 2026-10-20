local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local Parent = CurrencyTransfers.Parent
local UrlBuilderModule = require(Parent.UrlBuilder)
local TModule = require(Parent.t)
local PromiseModule = require(Parent.Promise)
local ProcessTransferModelModule = require(CurrencyTransfers.Models.ProcessTransferModel)
local HttpRequestModule = require(CurrencyTransfers.NetworkRequests.HttpRequest)
local UrlBuilder = UrlBuilderModule.UrlBuilder
local UrlBase = UrlBuilderModule.UrlBase

local function _(p1)
	-- upvalues: UrlBuilder (copy), UrlBase (copy)
	return UrlBuilder.new({
		base = UrlBase.APIS,
		path = `transfer/v1/robux-transfer/process-transfer/{p1}`
	})()
end

local StrictInterfaceResult = TModule.strictInterface({
	transferRequestId = TModule.string,
	robuxAmount = TModule.number
})

return function(p1, p2)
	-- upvalues: StrictInterfaceResult (copy), HttpRequestModule (copy), UrlBuilder (copy), UrlBase (copy), ProcessTransferModelModule (copy), PromiseModule (copy)
	assert(StrictInterfaceResult(p1))
	
	return HttpRequestModule.new(p2):post(UrlBuilder.new({
		base = UrlBase.APIS,
		path = `transfer/v1/robux-transfer/process-transfer/{p1.transferRequestId}`
	})(), { robuxAmount = p1.robuxAmount }):andThen(function(Result)
		-- upvalues: ProcessTransferModelModule (upval)
		return ProcessTransferModelModule.format(Result)
	end):catch(function(Err)
		-- upvalues: PromiseModule (upval)
		return PromiseModule.reject(Err)
	end)
end