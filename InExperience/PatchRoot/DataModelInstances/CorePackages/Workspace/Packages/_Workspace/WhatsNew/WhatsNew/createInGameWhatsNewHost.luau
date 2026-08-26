local parent = script:FindFirstAncestor("WhatsNew").Parent
local foundationModule = require(parent.Foundation)
local localization = require(parent.InExperienceLocales).Localization
local localizationProvider = require(parent.Localization).LocalizationProvider
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local ensureWhatsNewStoreInitializedModule = require(script.Parent.store.ensureWhatsNewStoreInitialized)
local _ = require(script.Parent.registry.ScopeActions)
local whatsNewScreenHostModule = require(script.Parent.components.WhatsNewScreenHost)
local localizationService = game:GetService("LocalizationService")
local inGameWhatsNew = Instance.new("ScreenGui")
inGameWhatsNew.Name = "InGameWhatsNew"
inGameWhatsNew.DisplayOrder = 16
inGameWhatsNew.IgnoreGuiInset = true
inGameWhatsNew.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
inGameWhatsNew.ResetOnSpawn = false
inGameWhatsNew.Parent = game:GetService("CoreGui")
local var1 = nil

return {
	createInGameWhatsNewHost = function(p1)
		-- upvalues: var1 (write), ensureWhatsNewStoreInitializedModule (ref), reactModule (ref), foundationModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), inGameWhatsNew (ref), whatsNewScreenHostModule (ref), reactRobloxModule (ref)
		if var1 ~= nil then
			return var1
		end
		ensureWhatsNewStoreInitializedModule.ensureWhatsNewStoreInitialized({ scopeActions = p1.scopeActions })
		local var2 = reactModule.createElement(foundationModule.FoundationProvider, { colorMode = foundationModule.Enums.ColorMode.Dark }, {
			LocalizationProvider = reactModule.createElement(localizationProvider, {
				localization = localization.new(localizationService.RobloxLocaleId)
			}, {
				Overlay = reactModule.createElement(foundationModule.OverlayProvider, { gui = inGameWhatsNew }, {
					Host = reactModule.createElement(whatsNewScreenHostModule, {
						screenScopeId = "InGame",
						isEnabled = true,
						scopeActions = p1.scopeActions
					})
				})
			})
		})
		local var3 = reactRobloxModule.createRoot(inGameWhatsNew)
		local ok, status = pcall(function()
			-- upvalues: var3 (ref), var2 (ref)
			var3:render(var2)
		end)
		
		if not ok then
			warn(`WhatsNew createInGameWhatsNewHost render failed: {status}`)
		end
		var1 = var3
		
		return var3
	end,
	resetForTests = function()
		-- upvalues: var1 (write)
		var1 = nil
	end
}