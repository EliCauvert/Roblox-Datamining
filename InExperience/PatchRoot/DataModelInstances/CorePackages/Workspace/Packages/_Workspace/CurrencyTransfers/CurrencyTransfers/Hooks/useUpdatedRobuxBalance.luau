local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local Parent = CurrencyTransfers.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local PromiseModule = require(Parent.Promise)
local GetBalanceRequestModule = require(CurrencyTransfers.NetworkRequests.getBalanceRequest)
local _ = require(CurrencyTransfers.Hooks.useTransferStore)

return function(p1) --[[ Line: 19 | Named "useUpdatedRobuxBalance" ]]
	-- upvalues: ReactModule (copy), GetBalanceRequestModule (copy), PromiseModule (copy), SignalsReactModule (copy)
	local SetRobuxBalanceAmountFunction = p1.setRobuxBalanceAmount
	local SetBalanceReceivedFromApiFunction = p1.setBalanceReceivedFromApi
	ReactModule.useEffect(function() --[[ Line: 27 ]]
		-- upvalues: GetBalanceRequestModule (upval), p1 (copy), SetRobuxBalanceAmountFunction (copy), SetBalanceReceivedFromApiFunction (copy), PromiseModule (upval)
		local Flag = false
		GetBalanceRequestModule(nil, p1.getNetworkImpl()):andThen(function(Result) --[[ Line: 31 ]]
			-- upvalues: Flag (ref), SetRobuxBalanceAmountFunction (upval), SetBalanceReceivedFromApiFunction (upval), PromiseModule (upval), GetBalanceRequestModule (upval), p1 (upval)
			if not Flag then
				SetRobuxBalanceAmountFunction(Result)
				SetBalanceReceivedFromApiFunction(true)
				PromiseModule.delay(0.5):andThen(function() --[[ Line: 39 ]]
					-- upvalues: Flag (upval), GetBalanceRequestModule (upval), p1 (upval), SetRobuxBalanceAmountFunction (upval)
					if Flag then return end
					return GetBalanceRequestModule(nil, p1.getNetworkImpl()):andThen(function(Result) --[[ Line: 44 ]]
						-- upvalues: Flag (upval), SetRobuxBalanceAmountFunction (upval)
						if not Flag then
							SetRobuxBalanceAmountFunction(Result)
							
							return
						end
					end):catch(function() --[[ Line: 50 ]] end)
				end):catch(function() --[[ Line: 52 ]] end)
				
				return
			end
		end):catch(function() --[[ Line: 54 ]] end)
		
		return function() --[[ Line: 56 ]]
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, {
		SetRobuxBalanceAmountFunction,
		SetBalanceReceivedFromApiFunction
	})
	
	return SignalsReactModule.useSignalState(p1.getRobuxBalanceAmount) or 0
end