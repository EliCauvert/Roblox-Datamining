local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local ReactModule = require(CurrencyTransfers.Parent.React)
local GetFFlagCurrencyTransferFixTextBoxInputModule = require(CurrencyTransfers.Flags.GetFFlagCurrencyTransferFixTextBoxInput)

return function(Callback, Callback1) --[[ Line: 18 ]]
	-- upvalues: ReactModule (copy), GetFFlagCurrencyTransferFixTextBoxInputModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(false)
	
	return ReactModule.useCallback(function(TextBox) --[[ Line: 29 ]]
		-- upvalues: UseRefResult (copy), GetFFlagCurrencyTransferFixTextBoxInputModule (upval), UseRefResult1 (copy), Callback (copy), Callback1 (copy)
		if UseRefResult.current then
			for _, Connection in ipairs(UseRefResult.current) do
				Connection:Disconnect()
			end
			UseRefResult.current = nil
		end
		if TextBox then
			local List = {}
			table.insert(List, TextBox:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 41 ]]
				-- upvalues: TextBox (copy), GetFFlagCurrencyTransferFixTextBoxInputModule (upval), UseRefResult1 (upval), Callback (upval)
				local Text: string = TextBox.Text
				local D = Text:gsub("%D", "")
				
				if D ~= Text then
					TextBox.Text = D
				end
				if not GetFFlagCurrencyTransferFixTextBoxInputModule() or not UseRefResult1.current or D ~= "" then
					Callback((tonumber(D)))
					
					return
				end
			end))
			
			if Callback1 then
				table.insert(List, TextBox.Focused:Connect(function() --[[ Line: 60 ]]
					-- upvalues: GetFFlagCurrencyTransferFixTextBoxInputModule (upval), TextBox (copy), UseRefResult1 (upval), Callback1 (upval)
					if GetFFlagCurrencyTransferFixTextBoxInputModule() then
						TextBox.CursorPosition = #TextBox.Text + 1
						UseRefResult1.current = true
						task.delay(0.1, function() --[[ Line: 67 ]]
							-- upvalues: UseRefResult1 (upval)
							UseRefResult1.current = false
						end)
					end
					Callback1(true, false)
				end))
				table.insert(List, TextBox.FocusLost:Connect(function(EnterPressed) --[[ Line: 77 ]]
					-- upvalues: Callback1 (upval)
					Callback1(false, EnterPressed)
				end))
			end
			UseRefResult.current = List
		end
	end, { Callback, Callback1 })
end