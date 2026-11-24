local CoreGui = game:GetService("CoreGui")
local InterstitialAdPlayer = script:FindFirstAncestor("InterstitialAdPlayer")
local Parent = InterstitialAdPlayer.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local AdSessionModule = require(InterstitialAdPlayer.AdSession)
local EnvironmentModule = require(InterstitialAdPlayer.Environment)
local InterstitialAdPlayerContainerModule = require(InterstitialAdPlayer.Player.InterstitialAdPlayerContainer)
local ProvidersModule = require(InterstitialAdPlayer.Providers)
local _ = require(InterstitialAdPlayer.types)

local function _(Name, DisplayOrder, ScreenInsets)
	-- upvalues: CoreGui (copy)
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name = Name
	ScreenGui.DisplayOrder = DisplayOrder
	ScreenGui.IgnoreGuiInset = true
	ScreenGui.ResetOnSpawn = false
	ScreenGui.ScreenInsets = ScreenInsets
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ScreenGui.Parent = CoreGui
	
	return ScreenGui
end

local function OverlayStyleLink(p1)
	-- upvalues: FoundationModule (copy), ReactRobloxModule (copy), ReactModule (copy)
	return ReactRobloxModule.createPortal(ReactModule.createElement("StyleLink", { StyleSheet = FoundationModule.Hooks.useStyleSheet() }), p1.overlayGui)
end

local function missingField(p1)
	if type(p1.video) ~= "string" or p1.video == "" then
		return "video"
	elseif type(p1.creativeAssetId) == "string" and p1.creativeAssetId ~= "" then
		local TrackingData = p1.trackingData
		
		return if type(TrackingData) == "table" and type(TrackingData.encryptedAdTrackingData) == "string" and TrackingData.encryptedAdTrackingData ~= "" and type(TrackingData.encryptionMetadata) == "string" and TrackingData.encryptionMetadata ~= "" then nil else "trackingData"
	else
		return "creativeAssetId"
	end
end

return {
	mount = function(Host)
		-- upvalues: missingField (copy), AdSessionModule (copy), CoreGui (copy), ReactRobloxModule (copy), ReactModule (copy), FoundationModule (copy), OverlayStyleLink (copy), ProvidersModule (copy), InterstitialAdPlayerContainerModule (copy), EnvironmentModule (copy)
		local MissingFieldResult = missingField(Host.config)
		
		if MissingFieldResult then
			warn(`InterstitialAdPlayer: the ad has no valid {MissingFieldResult}, so it doesn't play`)
			Host.reportResult(AdSessionModule.Result.Failed, 0)
			Host.reportReadyToEnter()
			
			return function() end
		else
			local InterstitialAdPlayer = Instance.new("ScreenGui")
			InterstitialAdPlayer.Name = "InterstitialAdPlayer"
			InterstitialAdPlayer.DisplayOrder = 1
			InterstitialAdPlayer.IgnoreGuiInset = true
			InterstitialAdPlayer.ResetOnSpawn = false
			InterstitialAdPlayer.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
			InterstitialAdPlayer.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			InterstitialAdPlayer.Parent = CoreGui
			local InterstitialAdOverlay = Instance.new("ScreenGui")
			InterstitialAdOverlay.Name = "InterstitialAdOverlay"
			InterstitialAdOverlay.DisplayOrder = 2
			InterstitialAdOverlay.IgnoreGuiInset = true
			InterstitialAdOverlay.ResetOnSpawn = false
			InterstitialAdOverlay.ScreenInsets = Enum.ScreenInsets.None
			InterstitialAdOverlay.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			InterstitialAdOverlay.Parent = CoreGui
			local Root = ReactRobloxModule.createRoot(InterstitialAdPlayer)
			Root:render(ReactModule.createElement(FoundationModule.FoundationProvider, { overlayGui = InterstitialAdOverlay }, {
				OverlayStyleLink = ReactModule.createElement(OverlayStyleLink, { overlayGui = InterstitialAdOverlay }),
				Providers = ReactModule.createElement(ProvidersModule, nil, {
					Player = ReactModule.createElement(InterstitialAdPlayerContainerModule, { host = Host, environment = EnvironmentModule.default() })
				})
			}))
			
			return function()
				-- upvalues: Root (copy), InterstitialAdPlayer (copy), InterstitialAdOverlay (copy)
				Root:unmount()
				InterstitialAdPlayer:Destroy()
				InterstitialAdOverlay:Destroy()
			end
		end
	end
}