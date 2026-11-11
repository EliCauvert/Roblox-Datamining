local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local ExperienceTagsModule = require(Modules.LuaApp.Components.ExperienceDetails.ExperienceTags)
local OpenCentralOverlayForExperienceGuidelinesModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForExperienceGuidelines)
local ExperienceDetailsExperimentationModule = require(script.Parent.ExperienceDetailsExperimentation)
local LuaAppExperienceTagsStrongLanguageContent = game:DefineFastFlag("LuaAppExperienceTagsStrongLanguageContent", false)
local FFlagLuaAppEdpBackendV2HydrateLegacyDefault = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp
local FFlagLuaAppEdpBackendV2SduiInterleaveDefault = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveDefault
local FFlagLuaAppEdpBackendV2SduiInterleaveIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveIxp
local Callback = if LuaAppExperienceTagsStrongLanguageContent then function(List): boolean
	if List == nil then
		return false
	end
	for _, value in pairs(List) do
		if value.name == "strong-language" and value.contains then
			return true
		end
	end
	return false
end else nil

return function(Frame)
	-- upvalues: UseLocalizationFunction (copy), UseDispatchFunction (copy), ReactModule (copy), OpenCentralOverlayForExperienceGuidelinesModule (copy), UseSelectorFunction (copy), LuaAppExperienceTagsStrongLanguageContent (copy), Callback (ref), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), ExperienceDetailsExperimentationModule (copy), FFlagLuaAppEdpBackendV2HydrateLegacyDefault (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), ExperienceTagsModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		strongLanguageWarning = "Feature.GameDetails.Label.ContainsStrongLanguagePillWarning"
	})
	local List = {}
	
	local function _(Text, p1)
		-- upvalues: List (copy), Frame (copy)
		table.insert(List, {
			text = Text,
			onActivated = if Frame.areTagsInteractable then p1 else nil
		})
	end
	
	local UseDispatchResult = UseDispatchFunction()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), OpenCentralOverlayForExperienceGuidelinesModule (upval), Frame (copy)
		UseDispatchResult(OpenCentralOverlayForExperienceGuidelinesModule(Frame.universeId, Frame.hideCloseButton))
	end, { Frame.universeId })
	local UseSelectorResult = UseSelectorFunction(function(p1)
		-- upvalues: Frame (copy)
		return p1.AgeRecommendations[Frame.universeId]
	end)
	
	if Frame.includeAgeRecommendations and UseSelectorResult then
		local Summary = UseSelectorResult.summary
		local DisplayNameWithHeaderShort = if Summary and Summary.ageRecommendation then if Summary.ageRecommendation.displayNameWithHeaderShort then Summary.ageRecommendation.displayNameWithHeaderShort else Summary.ageRecommendation.displayName else nil
		
		if DisplayNameWithHeaderShort then
			table.insert(List, {
				text = DisplayNameWithHeaderShort,
				onActivated = if Frame.areTagsInteractable then UseResult else nil
			})
		end
	end
	local CallbackResult = if LuaAppExperienceTagsStrongLanguageContent then Callback(UseSelectorResult and UseSelectorResult.descriptorUsages) else nil
	
	if (UseSelectorFunction(function(p1)
		-- upvalues: Frame (copy)
		return p1.AssetTextFilterSettings[Frame.universeId]
	end) or LuaAppExperienceTagsStrongLanguageContent and CallbackResult) and (not FFlagLuaAppEdpBackendV2SduiInterleaveDefault and (not FFlagLuaAppEdpBackendV2SduiInterleaveIxp or not ExperienceDetailsExperimentationModule.getShouldInterleaveSdui()) or Frame.hideContentDescriptors ~= true) then
		table.insert(List, {
			text = UseLocalizationResult.strongLanguageWarning,
			onActivated = if Frame.areTagsInteractable then UseResult else nil
		})
	end
	local UseSelectorResult1 = UseSelectorFunction(function(p1)
		-- upvalues: FFlagLuaAppEdpBackendV2HydrateLegacyDefault (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval), Frame (copy)
		return if FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and Frame.shouldHydrateLegacyIxp then p1.GameDetailsV2[Frame.universeId] else p1.GameDetails[Frame.universeId]
	end)
	local LicenseDescription = UseSelectorResult1 and UseSelectorResult1.licenseDescription or nil
	
	if LicenseDescription then
		table.insert(List, {
			text = LicenseDescription,
			onActivated = if Frame.areTagsInteractable then nil else nil
		})
	end
	return if #List > 0 then ReactModule.createElement(ExperienceTagsModule, { LayoutOrder = Frame.LayoutOrder, contents = List }) else nil
end