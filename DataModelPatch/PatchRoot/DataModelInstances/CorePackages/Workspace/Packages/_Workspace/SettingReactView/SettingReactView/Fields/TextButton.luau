local Parent = script:FindFirstAncestor("SettingReactView").Parent
local _ = require(Parent.SettingsService)
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Button = FoundationModule.Button
local Enums = FoundationModule.Enums
local ButtonVariant = Enums.ButtonVariant
local ButtonSize = Enums.ButtonSize

return function(p1)
	-- upvalues: ReactModule (copy), Button (copy), ButtonVariant (copy), ButtonSize (copy)
	local Text = nil
	if p1.text and type(p1.text) == "table" then
		local UseStateResult2
		Text, UseStateResult2 = ReactModule.useState(p1.text:get())
		p1.text:connect(UseStateResult2)
	else
		Text = p1.text
	end
	return ReactModule.createElement(Button, {
		onActivated = ReactModule.useCallback(function()
			-- upvalues: p1 (copy)
			if p1.onActivated then
				p1.onActivated:signal():fire()
			end
		end, { p1.onActivated }),
		text = Text,
		isDisabled = not p1.onActivated,
		variant = ButtonVariant.Standard,
		size = ButtonSize.Medium
	})
end