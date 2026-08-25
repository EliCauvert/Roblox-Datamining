local coreGuiService = game:GetService("CoreGui")
local parent = script:FindFirstAncestor("AppStartup").Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local useStartupMessagePropsModule = require(script.Parent.useStartupMessageProps)
local startupMessageModule = require(script.Parent.StartupMessage)

return reactModule.memo(function()
	-- upvalues: useStartupMessagePropsModule (ref), reactRobloxModule (ref), reactModule (ref), startupMessageModule (ref), coreGuiService (ref)
	local var5 = useStartupMessagePropsModule()
	
	return reactRobloxModule.createPortal({
		reactModule.createElement("ScreenGui", {
			Enabled = true,
			IgnoreGuiInset = true,
			AutoLocalize = false,
			DisplayOrder = 100,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			StartupMessage = var5.displayStartupMessage and reactModule.createElement(startupMessageModule, var5)
		})
	}, coreGuiService)
end)