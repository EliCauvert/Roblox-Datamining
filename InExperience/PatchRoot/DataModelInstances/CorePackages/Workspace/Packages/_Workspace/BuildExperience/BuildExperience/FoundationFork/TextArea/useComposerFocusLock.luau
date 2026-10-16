local ReactModule = require(game:GetService("CorePackages").Packages._Index.Foundation.Foundation.Parent.React)

return function(p1, p2) --[[ Line: 16 | Named "useComposerFocusLock" ]]
	-- upvalues: ReactModule (copy)
	ReactModule.useEffect(function() --[[ Line: 17 ]]
		-- upvalues: p2 (copy), p1 (copy)
		for _, value in p2 do
			local Current = value.current
			
			if Current ~= nil then
				if p1 then
					Current.TextEditable = false
					Current.Active = false
					Current:ReleaseFocus()
				else
					Current.TextEditable = true
					Current.Active = true
				end
			end
		end
	end, { p1 })
end