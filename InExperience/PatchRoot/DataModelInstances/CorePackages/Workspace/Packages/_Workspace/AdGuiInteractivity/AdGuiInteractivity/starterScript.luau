local adService = game:GetService("AdService")
local coreGuiService = game:GetService("CoreGui")
local localizationService = game:GetService("LocalizationService")
local parent = script.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local reactRobloxModule = require(parent_1.ReactRoblox)
local inExperienceLocalesModule = require(parent_1.InExperienceLocales)
local localizationModule = require(parent_1.Localization)
local foundationModule = require(parent_1.Foundation)
local roactModule = require(parent_1.Roact)
local disclosureButtonListenerComponentModule = require(parent.DisclosureButtonListenerComponent)
local adsInteractivityControlsModule = require(parent.AdsInteractivityControls)
local localizationProvider = localizationModule.LocalizationProvider
local foundationProvider = foundationModule.FoundationProvider
local adsInteractivityControlsFixStyleLink = game:DefineFastFlag("AdsInteractivityControlsFixStyleLink", false)

local function initializeImmersiveAds()
	-- upvalues: coreGuiService (ref), adService (ref), roactModule (ref), adsInteractivityControlsModule (ref), adsInteractivityControlsFixStyleLink (ref)
	local adGuiInteractivityControls = Instance.new("Folder")
	adGuiInteractivityControls.Name = "AdGuiInteractivityControls"
	adGuiInteractivityControls.Parent = coreGuiService
	local t = {}
	adService.adGuiRegisterUI:Connect(function(p1)
		-- upvalues: t (ref), roactModule (copy), adsInteractivityControlsModule (copy), adsInteractivityControlsFixStyleLink (copy), adGuiInteractivityControls (ref)
		if not p1:IsA("AdGui") then return end
		if t[p1] then return end
		local var1 = roactModule.createElement(adsInteractivityControlsModule, { adGui = p1 })
		
		if adsInteractivityControlsFixStyleLink then
			var1 = roactModule.createElement("Folder", nil, var1)
		end
		t[p1] = roactModule.mount(var1, adGuiInteractivityControls, "AdsInteractivityControls")
		p1.Destroying:Connect(function()
			-- upvalues: roactModule (copy), t (copy), p1 (ref)
			roactModule.unmount(t[p1])
			t[p1] = nil
		end)
	end)
	adService:SetAdGuiInteractivityHandlerInitialized()
end

local function initializeImmersiveBrandedAds()
	-- upvalues: coreGuiService (ref), reactRobloxModule (ref), reactModule (ref), localizationProvider (ref), inExperienceLocalesModule (ref), localizationService (ref), foundationProvider (ref), foundationModule (ref), disclosureButtonListenerComponentModule (ref)
	local immersiveBrandedAds = Instance.new("ScreenGui")
	immersiveBrandedAds.Name = "ImmersiveBrandedAds"
	immersiveBrandedAds.ResetOnSpawn = false
	immersiveBrandedAds.IgnoreGuiInset = true
	immersiveBrandedAds.Parent = coreGuiService
	reactRobloxModule.createRoot(immersiveBrandedAds):render({
		localizationProvider = reactModule.createElement(localizationProvider, {
			localization = inExperienceLocalesModule.Localization.new(localizationService.RobloxLocaleId)
		}, {
			foundationProvider = reactModule.createElement(foundationProvider, { colorMode = foundationModule.Enums.ColorMode.Dark }, {
				disclosureButtonListener = reactModule.createElement(disclosureButtonListenerComponentModule)
			})
		})
	})
end

return function()
	-- upvalues: initializeImmersiveAds (ref), initializeImmersiveBrandedAds (ref)
	initializeImmersiveAds()
	initializeImmersiveBrandedAds()
end