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
local var7 = nil

return {
	createInGameWhatsNewHost = function(p0) --[[ line: 36 ]]
		-- upvalues: var7 (write), ensureWhatsNewStoreInitializedModule (ref), reactModule (ref), foundationModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), inGameWhatsNew (ref), whatsNewScreenHostModule (ref), reactRobloxModule (ref)
		if var7 ~= nil then
			return var7
		end
		ensureWhatsNewStoreInitializedModule.ensureWhatsNewStoreInitialized({ scopeActions = p0.scopeActions })
		local var8 = reactModule.createElement(foundationModule.FoundationProvider, { colorMode = foundationModule.Enums.ColorMode.Dark }, {
			LocalizationProvider = reactModule.createElement(localizationProvider, {
				localization = localization.new(localizationService.RobloxLocaleId)
			}, {
				Overlay = reactModule.createElement(foundationModule.OverlayProvider, { gui = inGameWhatsNew }, {
					Host = reactModule.createElement(whatsNewScreenHostModule, {
						screenScopeId = "InGame",
						isEnabled = true,
						scopeActions = p0.scopeActions
					})
				})
			})
		})
		local var9 = reactRobloxModule.createRoot(inGameWhatsNew)
		local ok, status = pcall(function() --[[ line: 65 ]]
			-- upvalues: var9 (ref), var8 (ref)
			var9:render(var8)
		end)
		
		if not ok then
			warn(`WhatsNew createInGameWhatsNewHost render failed: {status}`)
		end
		var7 = var9
		
		return var9
	end,
	resetForTests = function() --[[ line: 77 ]]
		-- upvalues: var7 (write)
		var7 = nil
	end
}