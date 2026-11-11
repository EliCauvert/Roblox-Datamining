return function(List)
	local Buttons = {}
	
	for _, value in pairs(List) do
		table.insert(Buttons, {
			buttonType = value.type,
			props = {
				isDisabled = value.isDisabled,
				isLoading = value.isLoading,
				onActivated = value.onActivated or function() end,
				text = value.text
			}
		})
	end
	return { buttonHeight = 48, buttons = Buttons }
end