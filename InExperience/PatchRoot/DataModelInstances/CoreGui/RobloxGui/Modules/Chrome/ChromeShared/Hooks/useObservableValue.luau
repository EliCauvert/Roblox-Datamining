local ReactModule = require(game:GetService("CorePackages").Packages.React)
local _ = require(script:FindFirstAncestor("ChromeShared").Service.ChromeUtils)

return function(p1) --[[ Line: 7 ]]
	-- upvalues: ReactModule (copy)
	if p1 then
		local UseStateResult, UseStateResult2 = ReactModule.useState(p1:get())
		ReactModule.useEffect(function() --[[ Line: 14 ]]
			-- upvalues: p1 (copy), UseStateResult2 (copy), UseStateResult (copy)
			local Connection = p1:connect(function() --[[ Line: 15 ]]
				-- upvalues: UseStateResult2 (upval), p1 (upval)
				UseStateResult2(p1:get())
			end)
			
			if UseStateResult ~= p1:get() then
				UseStateResult2(p1:get())
			end
			return function() --[[ Line: 23 ]]
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