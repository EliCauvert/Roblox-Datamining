local FlyoutSidePanel = script:FindFirstAncestor("FlyoutSidePanel")
local Parent = FlyoutSidePanel.Parent
local ReactModule = require(Parent.React)
local UseDrawerVisibleFunction = require(Parent.Drawer).Hooks.useDrawerVisible
local FStringFlyoutProfileEntryIxpLayerModule = require(FlyoutSidePanel.Flags.FStringFlyoutProfileEntryIxpLayer)
local IXPService = game:GetService("IXPService")

return function(p1)
	-- upvalues: UseDrawerVisibleFunction (copy), ReactModule (copy), IXPService (copy), FStringFlyoutProfileEntryIxpLayerModule (copy)
	local UseDrawerVisibleResult = UseDrawerVisibleFunction()
	ReactModule.useEffect(function()
		-- upvalues: UseDrawerVisibleResult (copy), p1 (copy), IXPService (upval), FStringFlyoutProfileEntryIxpLayerModule (upval)
		if UseDrawerVisibleResult then
			(p1 or IXPService):LogFlagLinkedUserLayerExposure(FStringFlyoutProfileEntryIxpLayerModule)
		end
	end, { UseDrawerVisibleResult, p1 })
end