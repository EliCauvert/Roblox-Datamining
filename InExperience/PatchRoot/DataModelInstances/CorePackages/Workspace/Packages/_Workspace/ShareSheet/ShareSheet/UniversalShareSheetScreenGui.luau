local parent = script:FindFirstAncestor("ShareSheet").Parent
local foundationModule = require(parent.Foundation)
local inExperienceLocalesModule = require(parent.InExperienceLocales)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local signalsReactModule = require(parent.SignalsReact)
local universalShareSheetHostModule = require(script.Parent.Components.UniversalShareSheet.UniversalShareSheetHost)
local getLocalizationServiceStore = localizationModule.GetLocalizationServiceStore
local localization = inExperienceLocalesModule.Localization
local localizationProvider = localizationModule.LocalizationProvider

local function UniversalShareSheetScreenGui()
	-- upvalues: reactModule (ref), getLocalizationServiceStore (ref), signalsReactModule (ref), localization (ref), foundationModule (ref), localizationProvider (ref), universalShareSheetHostModule (ref)
	local var1, var2 = reactModule.useState(nil)
	local var3 = signalsReactModule.useSignalState(getLocalizationServiceStore().getRobloxLocaleId)
	
	return reactModule.createElement("ScreenGui", {
		DisplayOrder = 15,
		IgnoreGuiInset = true,
		Name = "UniversalShareSheetScreenGui",
		ResetOnSpawn = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		ref = var2
	}, {
		FoundationProvider = reactModule.createElement(foundationModule.FoundationProvider, { colorMode = foundationModule.Enums.ColorMode.Dark }, {
			LocalizationProvider = reactModule.createElement(localizationProvider, {
				localization = reactModule.useMemo(function()
					-- upvalues: localization (copy), var3 (ref)
					return localization.new(var3)
				end, { var3 })
			}, {
				OverlayProvider = if var1 ~= nil then nil else reactModule.createElement(foundationModule.OverlayProvider, { gui = var1 }, {
					Host = reactModule.createElement(universalShareSheetHostModule)
				})
			})
		})
	})
end

return {
	mount = function(p1)
		-- upvalues: reactRobloxModule (ref), reactModule (ref), UniversalShareSheetScreenGui (ref)
		local universalShareSheetScreenGuiRoot = Instance.new("Folder")
		universalShareSheetScreenGuiRoot.Name = "UniversalShareSheetScreenGuiRoot"
		universalShareSheetScreenGuiRoot.Parent = p1
		local var1 = reactRobloxModule.createRoot(universalShareSheetScreenGuiRoot)
		var1:render(reactModule.createElement(UniversalShareSheetScreenGui))
		
		return var1
	end
}