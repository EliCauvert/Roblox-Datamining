local Parent = script:FindFirstAncestor("ShareSheet").Parent
local FoundationModule = require(Parent.Foundation)
local LocalizationModule = require(Parent.Localization)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local SignalsReactModule = require(Parent.SignalsReact)
local UniversalShareSheetHostModule = require(script.Parent.Components.UniversalShareSheet.UniversalShareSheetHost)
local GetLocalizationServiceStoreFunction = LocalizationModule.GetLocalizationServiceStore
local Localization = require(Parent.InExperienceLocales).Localization
local LocalizationProvider = LocalizationModule.LocalizationProvider

local function UniversalShareSheetScreenGui()
	-- upvalues: ReactModule (copy), GetLocalizationServiceStoreFunction (copy), SignalsReactModule (copy), Localization (copy), FoundationModule (copy), LocalizationProvider (copy), UniversalShareSheetHostModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetLocalizationServiceStoreFunction().getRobloxLocaleId)
	
	return ReactModule.createElement("ScreenGui", {
		DisplayOrder = 15,
		IgnoreGuiInset = true,
		Name = "UniversalShareSheetScreenGui",
		ResetOnSpawn = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		ref = UseStateResult2
	}, {
		FoundationProvider = ReactModule.createElement(FoundationModule.FoundationProvider, { colorMode = FoundationModule.Enums.ColorMode.Dark }, {
			LocalizationProvider = ReactModule.createElement(LocalizationProvider, {
				localization = ReactModule.useMemo(function()
					-- upvalues: Localization (upval), UseSignalStateResult (copy)
					return Localization.new(UseSignalStateResult)
				end, { UseSignalStateResult })
			}, {
				OverlayProvider = if UseStateResult == nil then nil else ReactModule.createElement(FoundationModule.OverlayProvider, { gui = UseStateResult }, {
					Host = ReactModule.createElement(UniversalShareSheetHostModule)
				})
			})
		})
	})
end

return {
	mount = function(Parent)
		-- upvalues: ReactRobloxModule (copy), ReactModule (copy), UniversalShareSheetScreenGui (copy)
		local UniversalShareSheetScreenGuiRoot = Instance.new("Folder")
		UniversalShareSheetScreenGuiRoot.Name = "UniversalShareSheetScreenGuiRoot"
		UniversalShareSheetScreenGuiRoot.Parent = Parent
		local Root = ReactRobloxModule.createRoot(UniversalShareSheetScreenGuiRoot)
		Root:render(ReactModule.createElement(UniversalShareSheetScreenGui))
		
		return Root
	end
}