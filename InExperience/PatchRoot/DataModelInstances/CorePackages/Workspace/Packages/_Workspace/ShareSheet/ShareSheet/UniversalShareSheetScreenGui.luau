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

local function UniversalShareSheetScreenGui() --[[ line: 22 ]]
	-- upvalues: reactModule (ref), getLocalizationServiceStore (ref), signalsReactModule (ref), localization (ref), foundationModule (ref), localizationProvider (ref), universalShareSheetHostModule (ref)
	local var8, var9 = reactModule.useState(nil)
	local var10 = signalsReactModule.useSignalState(getLocalizationServiceStore().getRobloxLocaleId)
	
	return reactModule.createElement("ScreenGui", {
		DisplayOrder = 15,
		IgnoreGuiInset = true,
		Name = "UniversalShareSheetScreenGui",
		ResetOnSpawn = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		ref = var9
	}, {
		FoundationProvider = reactModule.createElement(foundationModule.FoundationProvider, { colorMode = foundationModule.Enums.ColorMode.Dark }, {
			LocalizationProvider = reactModule.createElement(localizationProvider, {
				localization = reactModule.useMemo(function() --[[ line: 26 ]]
					-- upvalues: localization (copy), var10 (ref)
					return localization.new(var10)
				end, { var10 })
			}, {
				OverlayProvider = if var8 ~= nil then nil else reactModule.createElement(foundationModule.OverlayProvider, { gui = var8 }, {
					Host = reactModule.createElement(universalShareSheetHostModule)
				})
			})
		})
	})
end

return {
	mount = function(p0) --[[ line: 56 ]]
		-- upvalues: reactRobloxModule (ref), reactModule (ref), UniversalShareSheetScreenGui (ref)
		local universalShareSheetScreenGuiRoot = Instance.new("Folder")
		universalShareSheetScreenGuiRoot.Name = "UniversalShareSheetScreenGuiRoot"
		universalShareSheetScreenGuiRoot.Parent = p0
		local var12 = reactRobloxModule.createRoot(universalShareSheetScreenGuiRoot)
		var12:render(reactModule.createElement(UniversalShareSheetScreenGui))
		
		return var12
	end
}