local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local promiseModule = require(parent.Promise)
local getBalanceRequestModule = require(currencyTransfers.NetworkRequests.getBalanceRequest)
local _ = require(currencyTransfers.Hooks.useTransferStore)

return function(p1)
	-- upvalues: reactModule (ref), getBalanceRequestModule (ref), promiseModule (ref), signalsReactModule (ref)
	local setRobuxBalanceAmount = p1.setRobuxBalanceAmount
	local setBalanceReceivedFromApi = p1.setBalanceReceivedFromApi
	reactModule.useEffect(function()
		-- upvalues: getBalanceRequestModule (copy), p1 (ref), setRobuxBalanceAmount (ref), setBalanceReceivedFromApi (ref), promiseModule (copy)
		local var1 = false
		getBalanceRequestModule(nil, p1.getNetworkImpl()):andThen(function(p2)
			-- upvalues: var1 (write), setRobuxBalanceAmount (copy), setBalanceReceivedFromApi (copy), promiseModule (copy), getBalanceRequestModule (copy), p1 (copy)
			if var1 then
				return
			end
			setRobuxBalanceAmount(p2)
			setBalanceReceivedFromApi(true)
			promiseModule.delay(0.5):andThen(function()
				-- upvalues: var1 (copy), getBalanceRequestModule (copy), p1 (copy), setRobuxBalanceAmount (copy)
				if var1 then
					return
				end
				return getBalanceRequestModule(nil, p1.getNetworkImpl()):andThen(function(p3)
					-- upvalues: var1 (copy), setRobuxBalanceAmount (copy)
					if var1 then
						return
					end
					setRobuxBalanceAmount(p3)
				end):catch(function() end)
			end):catch(function() end)
		end):catch(function() end)
		
		return function()
			-- upvalues: var1 (write)
			var1 = true
		end
	end, { setRobuxBalanceAmount, setBalanceReceivedFromApi })
	
	return signalsReactModule.useSignalState(p1.getRobuxBalanceAmount) or 0
end