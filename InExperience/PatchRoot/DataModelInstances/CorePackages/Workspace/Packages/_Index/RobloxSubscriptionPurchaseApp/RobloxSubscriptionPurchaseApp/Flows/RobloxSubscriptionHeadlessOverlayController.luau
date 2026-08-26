local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local parent = robloxSubscriptionPurchaseApp.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local robloxSubscriptionHeadlessListenerHostModule = require(robloxSubscriptionPurchaseApp.Components.RobloxSubscriptionHeadlessListenerHost)
local robloxSubscriptionStoreModule = require(robloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local var1 = nil

return {
	render = function()
		-- upvalues: robloxSubscriptionStoreModule (ref), reactRobloxModule (ref), reactModule (ref), robloxSubscriptionHeadlessListenerHostModule (ref), var1 (write)
		local var2 = robloxSubscriptionStoreModule.get()
		var2.triggerUnmountUI()
		local robloxSubscriptionPurchaseHeadlessOverlay = Instance.new("Folder")
		robloxSubscriptionPurchaseHeadlessOverlay.Name = "RobloxSubscriptionPurchaseHeadlessOverlay"
		robloxSubscriptionPurchaseHeadlessOverlay.Parent = game:GetService("CoreGui")
		local var3 = reactRobloxModule.createRoot(robloxSubscriptionPurchaseHeadlessOverlay)
		var3:render(reactModule.createElement(robloxSubscriptionHeadlessListenerHostModule))
		
		local function cleanup()
			-- upvalues: var3 (ref), robloxSubscriptionPurchaseHeadlessOverlay (ref)
			var3:unmount()
			robloxSubscriptionPurchaseHeadlessOverlay:Destroy()
		end
		
		var1 = cleanup
		var2.setOnUnmountUI(cleanup)
		
		return cleanup
	end,
	close = function()
		-- upvalues: var1 (write)
		if var1 then
			var1()
			var1 = nil
		end
	end
}