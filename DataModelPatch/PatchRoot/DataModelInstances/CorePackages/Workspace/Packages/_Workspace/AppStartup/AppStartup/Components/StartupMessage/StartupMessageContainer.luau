local CoreGui = game:GetService("CoreGui")
local Parent = script:FindFirstAncestor("AppStartup").Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local UseStartupMessagePropsModule = require(script.Parent.useStartupMessageProps)
local StartupMessageModule = require(script.Parent.StartupMessage)

return ReactModule.memo(function()
	-- upvalues: UseStartupMessagePropsModule (copy), ReactRobloxModule (copy), ReactModule (copy), StartupMessageModule (copy), CoreGui (copy)
	local UseStartupMessagePropsModuleResult = UseStartupMessagePropsModule()
	
	return ReactRobloxModule.createPortal({
		ReactModule.createElement("ScreenGui", {
			Enabled = true,
			IgnoreGuiInset = true,
			AutoLocalize = false,
			DisplayOrder = 100,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			StartupMessage = UseStartupMessagePropsModuleResult.displayStartupMessage and ReactModule.createElement(StartupMessageModule, UseStartupMessagePropsModuleResult)
		})
	}, CoreGui)
end)