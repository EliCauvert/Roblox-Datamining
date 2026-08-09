local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local urlBuilderModule = require(parent.UrlBuilder)
local tModule = require(parent.t)
local promiseModule = require(parent.Promise)
local getTransferByIdModelModule = require(currencyTransfers.Models.GetTransferByIdModel)
local httpRequestModule = require(currencyTransfers.NetworkRequests.HttpRequest)
local urlBuilder = urlBuilderModule.UrlBuilder
local urlBase = urlBuilderModule.UrlBase

local function getTransferByIdUrl(p0) --[[ line: 20 ]]
	-- upvalues: urlBuilder (ref), urlBase (ref)
	return urlBuilder.new({
		base = urlBase.APIS,
		path = `transfer/v1/robux-transfer/transfer/{p0}`
	})()
end

local var7 = tModule.strictInterface({ transferRequestId = tModule.string })

return function(p1, p2) --[[ line: 31 | named "getTransferRequestByIdRequest" ]]
	-- upvalues: var7 (ref), httpRequestModule (ref), getTransferByIdUrl (ref), getTransferByIdModelModule (ref), promiseModule (ref)
	assert(var7(p1))
	
	return httpRequestModule.new(p2):get(getTransferByIdUrl(p1.transferRequestId)):andThen(function(p4) --[[ line: 37 ]]
		-- upvalues: getTransferByIdModelModule (copy)
		return getTransferByIdModelModule.format(p4)
	end):catch(function(p3) --[[ line: 40 ]]
		-- upvalues: promiseModule (copy)
		return promiseModule.reject(p3)
	end)
end