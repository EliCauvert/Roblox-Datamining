local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local urlBuilderModule = require(parent.UrlBuilder)
local tModule = require(parent.t)
local promiseModule = require(parent.Promise)
local acceptTransferModelModule = require(currencyTransfers.Models.AcceptTransferModel)
local httpRequestModule = require(currencyTransfers.NetworkRequests.HttpRequest)
local urlBuilder = urlBuilderModule.UrlBuilder
local urlBase = urlBuilderModule.UrlBase

local function _(p0) --[[ line: 20 | named "acceptTransferUrl" ]]
	-- upvalues: urlBuilder (ref), urlBase (ref)
	return urlBuilder.new({
		base = urlBase.APIS,
		path = `transfer/v1/robux-transfer/accept-transfer/{p0}`
	})()
end

local var6 = tModule.strictInterface({ transferRequestId = tModule.string })

return function(p1, p2) --[[ line: 31 | named "acceptTransferRequest" ]]
	-- upvalues: var6 (ref), httpRequestModule (ref), urlBuilder (ref), urlBase (ref), acceptTransferModelModule (ref), promiseModule (ref)
	assert(var6(p1))
	
	return httpRequestModule.new(p2):post(urlBuilder.new({
		base = urlBase.APIS,
		path = `transfer/v1/robux-transfer/accept-transfer/{p1.transferRequestId}`
	})(), { recipientId = 0 }):andThen(function(p4) --[[ line: 37 ]]
		-- upvalues: acceptTransferModelModule (copy)
		local var7 = acceptTransferModelModule.format(p4)
		print("[acceptTransferRequest] Formatted result:", var7)
		
		return var7
	end):catch(function(p3) --[[ line: 42 ]]
		-- upvalues: promiseModule (copy)
		print("[acceptTransferRequest] Error response:", p3)
		
		return promiseModule.reject(p3)
	end)
end