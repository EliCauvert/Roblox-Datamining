local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local urlBuilderModule = require(parent.UrlBuilder)
local tModule = require(parent.t)
local promiseModule = require(parent.Promise)
local getTransferByIdModelModule = require(currencyTransfers.Models.GetTransferByIdModel)
local httpRequestModule = require(currencyTransfers.NetworkRequests.HttpRequest)
local urlBuilder = urlBuilderModule.UrlBuilder
local urlBase = urlBuilderModule.UrlBase

local function getTransferByIdUrl(p0)
	-- upvalues: urlBuilder (ref), urlBase (ref)
	return urlBuilder.new({
		base = urlBase.APIS,
		path = `transfer/v1/robux-transfer/transfer/{p0}`
	})()
end

local var7 = tModule.strictInterface({ transferRequestId = tModule.string })

return function(p1, p2, p3)
	-- upvalues: var7 (ref), httpRequestModule (ref), getTransferByIdUrl (ref), getTransferByIdModelModule (ref), promiseModule (ref)
	assert(var7(p1))
	
	return (if p3 ~= nil then httpRequestModule.new(p2) else httpRequestModule.fromNetworkImpl(p3)):get(getTransferByIdUrl(p1.transferRequestId)):andThen(function(p5)
		-- upvalues: getTransferByIdModelModule (copy)
		return getTransferByIdModelModule.format(p5)
	end):catch(function(p4)
		-- upvalues: promiseModule (copy)
		return promiseModule.reject(p4)
	end)
end