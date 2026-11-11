local ReactModule = require(script:FindFirstAncestor("CurrencyTransfers").Parent.React)

return function(Callback, p1)
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(false)
	
	return ReactModule.useCallback(function(TextBox)
		-- upvalues: Callback (copy), UseRefResult (copy), p1 (copy)
		if Callback then
			Callback(TextBox)
		end
		if TextBox and not UseRefResult.current then
			UseRefResult.current = true
			task.spawn(function()
				-- upvalues: p1 (upval), TextBox (copy)
				task.wait(p1 or 0.05)
				
				if TextBox and TextBox.Parent then
					TextBox:CaptureFocus()
				end
			end)
		end
	end, { Callback, p1 })
end