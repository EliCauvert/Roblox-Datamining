local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local parent = robloxSubscriptionPurchaseApp.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local robloxSubscriptionHeadlessListenerHostModule = require(robloxSubscriptionPurchaseApp.Components.RobloxSubscriptionHeadlessListenerHost)
local robloxSubscriptionStoreModule = require(robloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local var5 = nil

return {
	render = function()
		-- upvalues: robloxSubscriptionStoreModule (ref), reactRobloxModule (ref), reactModule (ref), robloxSubscriptionHeadlessListenerHostModule (ref), var5 (write)
		local var6 = robloxSubscriptionStoreModule.get()
		var6.triggerUnmountUI()
		local robloxSubscriptionPurchaseHeadlessOverlay = Instance.new("Folder")
		robloxSubscriptionPurchaseHeadlessOverlay.Name = "RobloxSubscriptionPurchaseHeadlessOverlay"
		robloxSubscriptionPurchaseHeadlessOverlay.Parent = game:GetService("CoreGui")
		local var8 = reactRobloxModule.createRoot(robloxSubscriptionPurchaseHeadlessOverlay)
		var8:render(reactModule.createElement(robloxSubscriptionHeadlessListenerHostModule))
		
		local function cleanup()
			-- upvalues: var8 (ref), robloxSubscriptionPurchaseHeadlessOverlay (ref)
			var8:unmount()
			robloxSubscriptionPurchaseHeadlessOverlay:Destroy()
		end
		
		var5 = cleanup
		var6.setOnUnmountUI(cleanup)
		
		return cleanup
	end,
	close = function()
		-- upvalues: var5 (write)
		if var5 then
			var5()
			var5 = nil
		end
	end
}