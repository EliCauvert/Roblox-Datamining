local Parent = script:FindFirstAncestor("ReactUtils").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.GoodSignal)

return function(Signal, p1, p2) --[[ Line: 8 | Named "useEventConnection" ]]
	-- upvalues: ReactModule (copy)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 13 ]]
		-- upvalues: p1 (copy)
		return p1
	end, p2)
	ReactModule.useEffect(function() --[[ Line: 17 ]]
		-- upvalues: Signal (copy), UseMemoResult (copy)
		if Signal == nil then
			return nil
		elseif typeof(Signal) == "RBXScriptSignal" then
			local Connection = Signal:Connect(UseMemoResult)
			
			return function() --[[ Line: 26 ]]
				-- upvalues: Connection (copy)
				Connection:Disconnect()
			end
		else
			local Connection1 = Signal:Connect(UseMemoResult)
			
			return function() --[[ Line: 33 ]]
				-- upvalues: Connection1 (copy)
				Connection1:Disconnect()
			end
		end
	end, { Signal, UseMemoResult })
end