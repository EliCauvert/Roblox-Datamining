local parent = script:FindFirstAncestor("SettingReactView").Parent
local _ = require(parent.SettingsService)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local button = foundationModule.Button
local enums = foundationModule.Enums
local buttonVariant = enums.ButtonVariant
local buttonSize = enums.ButtonSize

return function(p1)
	-- upvalues: reactModule (ref), button (ref), buttonVariant (ref), buttonSize (ref)
	local text
	local _ = nil
	local _ = nil
	
	if p1.text and type(p1.text) == "table" then
		local var1, var2 = reactModule.useState(p1.text:get())
		text = var1
		p1.text:connect(var2)
	else
		text = p1.text
	end
	return reactModule.createElement(button, {
		onActivated = reactModule.useCallback(function()
			-- upvalues: p1 (ref)
			if p1.onActivated then
				p1.onActivated:signal():fire()
			end
		end, { p1.onActivated }),
		text = text,
		isDisabled = not p1.onActivated,
		variant = buttonVariant.Standard,
		size = buttonSize.Medium
	})
end