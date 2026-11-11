local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local OverlayTypeModule = require(Modules.LuaApp.Enum.OverlayType)
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)
local _ = require(CorePackages.Workspace.Packages.PurchasePrompt)
local TimeToInteractiveTracker = require(CorePackages.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker
local GetTTIEventNameFunction = require(CorePackages.Workspace.Packages.PurchasePromptLite).getTTIEventName

return function(p1, p2)
	-- upvalues: GetTTIEventNameFunction (copy), TimeToInteractiveTracker (copy), SetCentralOverlayModule (copy), OverlayTypeModule (copy)
	if p2 and p1 and p1.purchaseAnalyticsMetadata and p1.purchaseAnalyticsMetadata.surface then
		local TTIEventName = GetTTIEventNameFunction(p1.purchaseAnalyticsMetadata.surface)
		TimeToInteractiveTracker.trackStart(TTIEventName)
		TimeToInteractiveTracker.updateMetadata(TTIEventName, {
			category = "unified_purchase_modal",
			page = p1.purchaseAnalyticsMetadata.surface
		})
	end
	return function(p3)
		-- upvalues: SetCentralOverlayModule (upval), OverlayTypeModule (upval), p1 (copy)
		p3:dispatch(SetCentralOverlayModule(OverlayTypeModule.UnifiedProductPurchaseModal, p1))
	end
end