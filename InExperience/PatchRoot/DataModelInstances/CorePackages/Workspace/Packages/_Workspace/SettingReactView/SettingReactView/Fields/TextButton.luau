local parent = script:FindFirstAncestor("SettingReactView").Parent
local _ = require(parent.SettingsService)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local button = foundationModule.Button
local enums = foundationModule.Enums
local buttonVariant = enums.ButtonVariant
local buttonSize = enums.ButtonSize

return function(p0)
	-- upvalues: reactModule (ref), button (ref), buttonVariant (ref), buttonSize (ref)
	local text
	local _ = nil
	local _ = nil
	
	if p0.text and type(p0.text) == "table" then
		local var2, var3 = reactModule.useState(p0.text:get())
		text = var2
		p0.text:connect(var3)
	else
		text = p0.text
	end
	return reactModule.createElement(button, {
		onActivated = reactModule.useCallback(function()
			-- upvalues: p0 (ref)
			if p0.onActivated then
				p0.onActivated:signal():fire()
			end
		end, { p0.onActivated }),
		text = text,
		isDisabled = not p0.onActivated,
		variant = buttonVariant.Standard,
		size = buttonSize.Medium
	})
end