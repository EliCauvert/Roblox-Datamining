local coreGuiService = game:GetService("CoreGui")
local parent = script.Parent
local UIBloxModule = require(parent.UIBlox)
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local localizationService = game:GetService("LocalizationService")
local localization = require(parent.InExperienceLocales).Localization
local localizationProvider = require(parent.Localization).LocalizationProvider
local images = UIBloxModule.App.ImageSet.Images
local notificationModalsManagerModule = require(parent.NotificationModalsManager)
local roactModule = require(parent.Roact)
local foundationModule = require(parent.Foundation)
local appStyleProvider = require(parent.UIBlox).App.Style.AppStyleProvider
local layerCollectorProvider = require(parent.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider
local inExperienceInterventionContainerModule = require(script.InExperienceInterventionContainer)
local foundationProvider = foundationModule.FoundationProvider
local interventionPlacement = require(parent.InterventionShared).Contexts.InterventionPlacement
local constants = require(parent.InterventionShared).Utils.Constants
local t = {}
local inExperienceInterventionDisplayOrder = game:DefineFastInt("InExperienceInterventionDisplayOrder", 6)

if game:DefineFastFlag("FFlagTimeoutRemoteEvent", false) then
	robloxReplicatedStorageService:WaitForChild("TimeoutChatAttempt", 1e999).OnClientEvent:Connect(function(p1, p2)
		-- upvalues: notificationModalsManagerModule (ref), images (ref)
		notificationModalsManagerModule.SetUIBloxToast({
			toastTitle = "Test Chat Timeout RemoteEvent",
			iconImage = images["icons/status/error_large"],
			toastSubtitle = `startTime: {p1}, duration: {p2}`,
			sequenceNumber = DateTime.now().UnixTimestamp,
			iconSize = Vector2.new(36, 36)
		})
	end)
end
function t.new()
	-- upvalues: t (ref), roactModule (ref), inExperienceInterventionDisplayOrder (ref), layerCollectorProvider (ref), localizationProvider (ref), localization (ref), localizationService (ref), interventionPlacement (ref), constants (ref), foundationProvider (ref), appStyleProvider (ref), inExperienceInterventionContainerModule (ref), coreGuiService (ref)
	local tbl = setmetatable({}, t)
	tbl.root = roactModule.createElement("ScreenGui", { DisplayOrder = inExperienceInterventionDisplayOrder }, {
		LayerCollectorProvider = roactModule.createElement(layerCollectorProvider, {}, {
			LocalizationProvider = roactModule.createElement(localizationProvider, {
				localization = localization.new(localizationService.RobloxLocaleId)
			}, {
				InterventionPlacementProvider = roactModule.createElement(interventionPlacement.Provider, { value = constants.InterventionPlacementType.InExperience }, {
					FoundationProvider = roactModule.createElement(foundationProvider, { colorMode = "Dark" }, {
						StyleProvider = roactModule.createElement(appStyleProvider, { style = { themeName = "dark", fontName = "gotham" } }, {
							Container = roactModule.createElement(inExperienceInterventionContainerModule, {})
						})
					})
				})
			})
		})
	})
	tbl.element = roactModule.mount(tbl.root, coreGuiService, "InExperienceInterventionApp")
	
	return tbl
end

return t.new()