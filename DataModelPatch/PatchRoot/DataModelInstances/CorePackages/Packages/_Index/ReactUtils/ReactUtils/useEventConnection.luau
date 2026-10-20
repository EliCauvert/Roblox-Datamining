local ReactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(Signal, p1, p2)
	-- upvalues: ReactModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy)
		return p1
	end, p2)
	ReactModule.useEffect(function()
		-- upvalues: Signal (copy), UseMemoResult (copy)
		if Signal == nil then
			return nil
		else
			local Connection = Signal:Connect(UseMemoResult)
			
			return function()
				-- upvalues: Connection (copy)
				Connection:Disconnect()
			end
		end
	end, { Signal, UseMemoResult })
end