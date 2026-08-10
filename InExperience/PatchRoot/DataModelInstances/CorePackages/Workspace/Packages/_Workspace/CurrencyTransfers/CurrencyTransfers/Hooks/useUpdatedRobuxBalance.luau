local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local promiseModule = require(parent.Promise)
local getBalanceRequestModule = require(currencyTransfers.NetworkRequests.getBalanceRequest)
local _ = require(currencyTransfers.Hooks.useTransferStore)

return function(p0) --[[ line: 19 | named "useUpdatedRobuxBalance" ]]
	-- upvalues: reactModule (ref), getBalanceRequestModule (ref), promiseModule (ref), signalsReactModule (ref)
	local setRobuxBalanceAmount = p0.setRobuxBalanceAmount
	local setBalanceReceivedFromApi = p0.setBalanceReceivedFromApi
	reactModule.useEffect(function() --[[ line: 27 ]]
		-- upvalues: getBalanceRequestModule (copy), p0 (ref), setRobuxBalanceAmount (ref), setBalanceReceivedFromApi (ref), promiseModule (copy)
		local var5 = false
		getBalanceRequestModule(nil, p0.getNetworkImpl()):andThen(function(p1) --[[ line: 31 ]]
			-- upvalues: var5 (write), setRobuxBalanceAmount (copy), setBalanceReceivedFromApi (copy), promiseModule (copy), getBalanceRequestModule (copy), p0 (copy)
			if var5 then
				return
			end
			setRobuxBalanceAmount(p1)
			setBalanceReceivedFromApi(true)
			promiseModule.delay(0.5):andThen(function() --[[ line: 39 ]]
				-- upvalues: var5 (copy), getBalanceRequestModule (copy), p0 (copy), setRobuxBalanceAmount (copy)
				if var5 then
					return
				end
				return getBalanceRequestModule(nil, p0.getNetworkImpl()):andThen(function(p2) --[[ line: 44 ]]
					-- upvalues: var5 (copy), setRobuxBalanceAmount (copy)
					if var5 then
						return
					end
					setRobuxBalanceAmount(p2)
				end):catch(function() --[[ line: 50 ]] end)
			end):catch(function() --[[ line: 52 ]] end)
		end):catch(function() --[[ line: 54 ]] end)
		
		return function() --[[ line: 56 ]]
			-- upvalues: var5 (write)
			var5 = true
		end
	end, { setRobuxBalanceAmount, setBalanceReceivedFromApi })
	
	return signalsReactModule.useSignalState(p0.getRobuxBalanceAmount) or 0
end