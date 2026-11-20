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
		-- upvalues: missingField (copy), AdSessionModule (copy), CoreGui (copy), ReactRobloxModule (copy), ReactModule (copy), FoundationModule (copy), ProvidersModule (copy), InterstitialAdPlayerContainerModule (copy), EnvironmentModule (copy)
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
			local Root = ReactRobloxModule.createRoot(InterstitialAdPlayer)
			Root:render(ReactModule.createElement(FoundationModule.FoundationProvider, nil, {
				Providers = ReactModule.createElement(ProvidersModule, nil, {
					Player = ReactModule.createElement(InterstitialAdPlayerContainerModule, { host = Host, environment = EnvironmentModule.default() })
				})
			}))
			
			return function()
				-- upvalues: Root (copy), InterstitialAdPlayer (copy)
				Root:unmount()
				InterstitialAdPlayer:Destroy()
			end
		end
	end
}