local reactModule = require(game:GetService("CorePackages").Packages._Index.Foundation.Foundation.Parent.React)

return function(p1, p2)
	-- upvalues: reactModule (ref)
	reactModule.useEffect(function()
		-- upvalues: p2 (ref), p1 (ref)
		for i, v in p2 do
			local current = v.current
			
			if current ~= nil then
				if p1 then
					current.TextEditable = false
					current.Active = false
					current:ReleaseFocus()
				else
					current.TextEditable = true
					current.Active = true
				end
			end
		end
	end, { p1 })
end