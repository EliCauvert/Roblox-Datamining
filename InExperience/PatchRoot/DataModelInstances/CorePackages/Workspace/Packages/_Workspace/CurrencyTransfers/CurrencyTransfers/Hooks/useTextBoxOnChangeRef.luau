local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local reactModule = require(currencyTransfers.Parent.React)
local getFFlagCurrencyTransferFixTextBoxInputModule = require(currencyTransfers.Flags.GetFFlagCurrencyTransferFixTextBoxInput)

return function(p1, p2)
	-- upvalues: reactModule (ref), getFFlagCurrencyTransferFixTextBoxInputModule (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(false)
	
	return reactModule.useCallback(function(p3)
		-- upvalues: var1 (ref), getFFlagCurrencyTransferFixTextBoxInputModule (copy), var2 (ref), p1 (ref), p2 (ref)
		if var1.current then
			for i, v in ipairs(var1.current) do
				v:Disconnect()
			end
			var1.current = nil
		end
		if p3 then
			local t = {}
			table.insert(t, p3:GetPropertyChangedSignal("Text"):Connect(function()
				-- upvalues: p3 (ref), getFFlagCurrencyTransferFixTextBoxInputModule (copy), var2 (copy), p1 (copy)
				local text = p3.Text
				local var3 = text:gsub("%D", "")
				
				if var3 ~= text then
					p3.Text = var3
				end
				if getFFlagCurrencyTransferFixTextBoxInputModule() and var2.current and var3 == "" then
					return
				end
				p1(tonumber(var3))
			end))
			
			if p2 then
				table.insert(t, p3.Focused:Connect(function()
					-- upvalues: getFFlagCurrencyTransferFixTextBoxInputModule (copy), p3 (ref), var2 (copy), p2 (copy)
					if getFFlagCurrencyTransferFixTextBoxInputModule() then
						p3.CursorPosition = #p3.Text + 1
						var2.current = true
						task.delay(0.1, function()
							-- upvalues: var2 (copy)
							var2.current = false
						end)
					end
					p2(true, false)
				end))
				table.insert(t, p3.FocusLost:Connect(function(p4)
					-- upvalues: p2 (copy)
					p2(false, p4)
				end))
			end
			var1.current = t
		end
	end, { p1, p2 })
end