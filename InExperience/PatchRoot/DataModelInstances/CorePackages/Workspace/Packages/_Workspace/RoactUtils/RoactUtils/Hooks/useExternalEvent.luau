local Parent = script:FindFirstAncestor("RoactUtils").Parent
local ReactUtilsModule = require(Parent.ReactUtils)

if require(Parent.SharedFlags).GetFFlagMigrateRoactUtilsToReactUtils() then
	return ReactUtilsModule.useEventConnection
else
	local ReactModule = require(Parent.React)
	
	return function(Signal, Callback) --[[ Line: 17 | Named "useExternalEvent" ]]
		-- upvalues: ReactModule (copy)
		ReactModule.useEffect(function() --[[ Line: 18 ]]
			-- upvalues: Signal (copy), Callback (copy)
			if Signal == nil then
				return nil
			else
				local Connection = Signal:Connect(Callback)
				
				return function() --[[ Line: 24 ]]
					-- upvalues: Connection (copy)
					Connection:Disconnect()
				end
			end
		end, { Signal, Callback })
	end
end