local UserInputService = game:GetService("UserInputService")
local Parent = script:FindFirstAncestor("TenFootUiShell").Parent
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)

return function()
	-- upvalues: ResponsiveModule (copy), ReactModule (copy), UserInputService (copy)
	local IsUseLastInputResultMatch = ResponsiveModule.useLastInput() == ResponsiveModule.Input.Pointer
	ReactModule.useEffect(function()
		-- upvalues: UserInputService (upval), IsUseLastInputResultMatch (copy)
		UserInputService.MouseIconEnabled = IsUseLastInputResultMatch
	end, { IsUseLastInputResultMatch })
end