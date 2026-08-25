local reactModule = require(game:GetService("CorePackages").Packages._Index.Foundation.Foundation.Parent.React)

return function(p0, p1)
	-- upvalues: reactModule (ref)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), p0 (ref)
		for i, v in p1 do
			local current = v.current
			
			if current ~= nil then
				if p0 then
					current.TextEditable = false
					current.Active = false
					current:ReleaseFocus()
				else
					current.TextEditable = true
					current.Active = true
				end
			end
		end
	end, { p0 })
end