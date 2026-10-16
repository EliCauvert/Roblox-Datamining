local ReactModule = require(game:GetService("CorePackages").Packages.React)
local _ = require(script:FindFirstAncestor("ChromeShared").Service.ChromeUtils)

return function(p1, Callback) --[[ Line: 11 ]]
	-- upvalues: ReactModule (copy)
	if p1 then
		local UseStateResult, UseStateResult2 = ReactModule.useState(Callback(p1:get()))
		ReactModule.useEffect(function() --[[ Line: 18 ]]
			-- upvalues: p1 (copy), UseStateResult2 (copy), Callback (copy), UseStateResult (copy)
			local Connection = p1:connect(function() --[[ Line: 19 ]]
				-- upvalues: UseStateResult2 (upval), Callback (upval), p1 (upval)
				UseStateResult2(Callback(p1:get()))
			end)
			local CallbackResult = Callback(p1:get())
			
			if UseStateResult ~= CallbackResult then
				UseStateResult2(CallbackResult)
			end
			return function() --[[ Line: 28 ]]
				-- upvalues: Connection (copy)
				Connection:disconnect()
			end
		end, { p1 })
		
		return UseStateResult
	else
		warn("observableValue undefined")
		
		return nil
	end
end