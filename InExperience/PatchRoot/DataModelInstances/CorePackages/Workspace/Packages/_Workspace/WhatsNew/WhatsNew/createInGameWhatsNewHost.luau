local Parent = script:FindFirstAncestor("WhatsNew").Parent
local FoundationModule = require(Parent.Foundation)
local Localization = require(Parent.InExperienceLocales).Localization
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local EnsureWhatsNewStoreInitializedModule = require(script.Parent.store.ensureWhatsNewStoreInitialized)
local _ = require(script.Parent.registry.ScopeActions)
local WhatsNewScreenHostModule = require(script.Parent.components.WhatsNewScreenHost)
local LocalizationService = game:GetService("LocalizationService")
local InGameWhatsNew = Instance.new("ScreenGui")
InGameWhatsNew.Name = "InGameWhatsNew"
InGameWhatsNew.DisplayOrder = 16
InGameWhatsNew.IgnoreGuiInset = true
InGameWhatsNew.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
InGameWhatsNew.ResetOnSpawn = false
InGameWhatsNew.Parent = game:GetService("CoreGui")
local v1 = nil

return {
	createInGameWhatsNewHost = function(p1)
		-- upvalues: v1 (ref), EnsureWhatsNewStoreInitializedModule (copy), ReactModule (copy), FoundationModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), InGameWhatsNew (copy), WhatsNewScreenHostModule (copy), ReactRobloxModule (copy)
		if v1 ~= nil then
			return v1
		end
		EnsureWhatsNewStoreInitializedModule.ensureWhatsNewStoreInitialized({ scopeActions = p1.scopeActions })
		local Element = ReactModule.createElement(FoundationModule.FoundationProvider, { colorMode = FoundationModule.Enums.ColorMode.Dark }, {
			LocalizationProvider = ReactModule.createElement(LocalizationProvider, {
				localization = Localization.new(LocalizationService.RobloxLocaleId)
			}, {
				Overlay = ReactModule.createElement(FoundationModule.OverlayProvider, { gui = InGameWhatsNew }, {
					Host = ReactModule.createElement(WhatsNewScreenHostModule, {
						screenScopeId = "InGame",
						isEnabled = true,
						scopeActions = p1.scopeActions
					})
				})
			})
		})
		local Root = ReactRobloxModule.createRoot(InGameWhatsNew)
		local Success, Result = pcall(function()
			-- upvalues: Root (copy), Element (copy)
			Root:render(Element)
		end)
		
		if not Success then
			warn(`WhatsNew createInGameWhatsNewHost render failed: {Result}`)
		end
		v1 = Root
		
		return Root
	end,
	resetForTests = function()
		-- upvalues: v1 (ref)
		v1 = nil
	end
}