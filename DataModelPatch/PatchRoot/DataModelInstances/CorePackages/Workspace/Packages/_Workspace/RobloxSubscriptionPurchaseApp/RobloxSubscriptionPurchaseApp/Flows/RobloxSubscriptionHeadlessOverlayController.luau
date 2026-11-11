local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local Parent = RobloxSubscriptionPurchaseApp.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local RobloxSubscriptionHeadlessListenerHostModule = require(RobloxSubscriptionPurchaseApp.Components.RobloxSubscriptionHeadlessListenerHost)
local RobloxSubscriptionStoreModule = require(RobloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local Callback = nil

return {
	render = function()
		-- upvalues: RobloxSubscriptionStoreModule (copy), ReactRobloxModule (copy), ReactModule (copy), RobloxSubscriptionHeadlessListenerHostModule (copy), Callback (ref)
		local GetResult = RobloxSubscriptionStoreModule.get()
		GetResult.triggerUnmountUI()
		local RobloxSubscriptionPurchaseHeadlessOverlay = Instance.new("Folder")
		RobloxSubscriptionPurchaseHeadlessOverlay.Name = "RobloxSubscriptionPurchaseHeadlessOverlay"
		RobloxSubscriptionPurchaseHeadlessOverlay.Parent = game:GetService("CoreGui")
		local Root = ReactRobloxModule.createRoot(RobloxSubscriptionPurchaseHeadlessOverlay)
		Root:render(ReactModule.createElement(RobloxSubscriptionHeadlessListenerHostModule))
		
		local function cleanup()
			-- upvalues: Root (copy), RobloxSubscriptionPurchaseHeadlessOverlay (copy)
			Root:unmount()
			RobloxSubscriptionPurchaseHeadlessOverlay:Destroy()
		end
		
		Callback = cleanup
		GetResult.setOnUnmountUI(cleanup)
		
		return cleanup
	end,
	close = function()
		-- upvalues: Callback (ref)
		if Callback then
			Callback()
			Callback = nil
		end
	end
}