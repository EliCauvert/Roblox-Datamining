local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local reactModule = require(currencyTransfers.Parent.React)
local getFFlagCurrencyTransferFixTextBoxInputModule = require(currencyTransfers.Flags.GetFFlagCurrencyTransferFixTextBoxInput)

return function(p0, p1)
	-- upvalues: reactModule (ref), getFFlagCurrencyTransferFixTextBoxInputModule (ref)
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef(false)
	
	return reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref), getFFlagCurrencyTransferFixTextBoxInputModule (copy), var4 (ref), p0 (ref), p1 (ref)
		if var3.current then
			for i, v in ipairs(var3.current) do
				v:Disconnect()
			end
			var3.current = nil
		end
		if p2 then
			local t = {}
			table.insert(t, p2:GetPropertyChangedSignal("Text"):Connect(function()
				-- upvalues: p2 (ref), getFFlagCurrencyTransferFixTextBoxInputModule (copy), var4 (copy), p0 (copy)
				local text = p2.Text
				local var6 = text:gsub("%D", "")
				
				if var6 ~= text then
					p2.Text = var6
				end
				if getFFlagCurrencyTransferFixTextBoxInputModule() and var4.current and var6 == "" then
					return
				end
				p0(tonumber(var6))
			end))
			
			if p1 then
				table.insert(t, p2.Focused:Connect(function()
					-- upvalues: getFFlagCurrencyTransferFixTextBoxInputModule (copy), p2 (ref), var4 (copy), p1 (copy)
					if getFFlagCurrencyTransferFixTextBoxInputModule() then
						p2.CursorPosition = #p2.Text + 1
						var4.current = true
						task.delay(0.1, function()
							-- upvalues: var4 (copy)
							var4.current = false
						end)
					end
					p1(true, false)
				end))
				table.insert(t, p2.FocusLost:Connect(function(p3)
					-- upvalues: p1 (copy)
					p1(false, p3)
				end))
			end
			var3.current = t
		end
	end, { p0, p1 })
end