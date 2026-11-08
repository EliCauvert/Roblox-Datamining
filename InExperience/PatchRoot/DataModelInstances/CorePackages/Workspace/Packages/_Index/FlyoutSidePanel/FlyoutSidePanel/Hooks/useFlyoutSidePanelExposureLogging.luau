local IXPService = game:GetService("IXPService")
local Parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local ReactModule = require(Parent.React)
local UseDrawerVisibleFunction = require(Parent.Drawer).Hooks.useDrawerVisible
local FlyoutSidePanelIxpLayer = game:DefineFastString("FlyoutSidePanelIxpLayer", "Universality.MorePage.Exposure")

return function(p1)
	-- upvalues: UseDrawerVisibleFunction (copy), ReactModule (copy), FlyoutSidePanelIxpLayer (copy), IXPService (copy)
	local UseDrawerVisibleResult = UseDrawerVisibleFunction()
	ReactModule.useEffect(function()
		-- upvalues: UseDrawerVisibleResult (copy), FlyoutSidePanelIxpLayer (upval), p1 (copy), IXPService (upval)
		if UseDrawerVisibleResult and FlyoutSidePanelIxpLayer ~= "" then
			(if p1 == nil then IXPService else p1):LogFlagLinkedUserLayerExposure(FlyoutSidePanelIxpLayer)
		end
	end, { UseDrawerVisibleResult, p1 })
end