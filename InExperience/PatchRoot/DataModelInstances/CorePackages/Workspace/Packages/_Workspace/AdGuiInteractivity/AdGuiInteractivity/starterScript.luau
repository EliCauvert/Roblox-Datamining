local AdService = game:GetService("AdService")
local CoreGui = game:GetService("CoreGui")
local LocalizationService = game:GetService("LocalizationService")
local Parent = script.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local ReactRobloxModule = require(Parent1.ReactRoblox)
local InExperienceLocalesModule = require(Parent1.InExperienceLocales)
local FoundationModule = require(Parent1.Foundation)
local RoactModule = require(Parent1.Roact)
local DisclosureButtonListenerComponentModule = require(Parent.DisclosureButtonListenerComponent)
local AdsInteractivityControlsModule = require(Parent.AdsInteractivityControls)
local LocalizationProvider = require(Parent1.Localization).LocalizationProvider
local FoundationProvider = FoundationModule.FoundationProvider

local function initializeImmersiveAds()
	-- upvalues: CoreGui (copy), AdService (copy), RoactModule (copy), AdsInteractivityControlsModule (copy)
	local AdGuiInteractivityControls = Instance.new("Folder")
	AdGuiInteractivityControls.Name = "AdGuiInteractivityControls"
	AdGuiInteractivityControls.Parent = CoreGui
	local t = {}
	AdService.adGuiRegisterUI:Connect(function(AdGui)
		-- upvalues: t (copy), RoactModule (upval), AdsInteractivityControlsModule (upval), AdGuiInteractivityControls (copy)
		if not AdGui:IsA("AdGui") then return end
		if not t[AdGui] then
			t[AdGui] = RoactModule.mount(RoactModule.createElement("Folder", nil, (RoactModule.createElement(AdsInteractivityControlsModule, { adGui = AdGui }))), AdGuiInteractivityControls, "AdsInteractivityControls")
			AdGui.Destroying:Connect(function()
				-- upvalues: RoactModule (upval), t (upval), AdGui (copy)
				RoactModule.unmount(t[AdGui])
				t[AdGui] = nil
			end)
			
			return
		end
	end)
	AdService:SetAdGuiInteractivityHandlerInitialized()
end

local function initializeImmersiveBrandedAds()
	-- upvalues: CoreGui (copy), ReactRobloxModule (copy), ReactModule (copy), LocalizationProvider (copy), InExperienceLocalesModule (copy), LocalizationService (copy), FoundationProvider (copy), FoundationModule (copy), DisclosureButtonListenerComponentModule (copy)
	local ImmersiveBrandedAds = Instance.new("ScreenGui")
	ImmersiveBrandedAds.Name = "ImmersiveBrandedAds"
	ImmersiveBrandedAds.ResetOnSpawn = false
	ImmersiveBrandedAds.IgnoreGuiInset = true
	ImmersiveBrandedAds.Parent = CoreGui
	ReactRobloxModule.createRoot(ImmersiveBrandedAds):render({
		localizationProvider = ReactModule.createElement(LocalizationProvider, {
			localization = InExperienceLocalesModule.Localization.new(LocalizationService.RobloxLocaleId)
		}, {
			foundationProvider = ReactModule.createElement(FoundationProvider, { colorMode = FoundationModule.Enums.ColorMode.Dark }, {
				disclosureButtonListener = ReactModule.createElement(DisclosureButtonListenerComponentModule)
			})
		})
	})
end

return function()
	-- upvalues: initializeImmersiveAds (copy), initializeImmersiveBrandedAds (copy)
	initializeImmersiveAds()
	initializeImmersiveBrandedAds()
end