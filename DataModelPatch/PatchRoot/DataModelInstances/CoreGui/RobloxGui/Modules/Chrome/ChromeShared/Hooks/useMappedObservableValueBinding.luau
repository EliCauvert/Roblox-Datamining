local ReactModule = require(game:GetService("CorePackages").Packages.React)
local _ = require(script:FindFirstAncestor("ChromeShared").Service.ChromeUtils)

return function(p1, p2)
	-- upvalues: ReactModule (copy)
	if p1 then
		local Callback = nil
		Callback = if p2 then p2 else function(p3)
			return p3
		end
		local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Callback(p1:get()))
		ReactModule.useEffect(function()
			-- upvalues: p1 (copy), UseBindingResult2 (copy), Callback (ref)
			local Connection = p1:connect(function()
				-- upvalues: UseBindingResult2 (upval), Callback (upval), p1 (upval)
				UseBindingResult2(Callback(p1:get()))
			end)
			UseBindingResult2(Callback(p1:get()))
			
			return function()
				-- upvalues: Connection (copy)
				Connection:disconnect()
			end
		end, { p1 })
		
		return UseBindingResult
	else
		warn("observableValue undefined")
		
		return ReactModule.useBinding(nil)
	end
end