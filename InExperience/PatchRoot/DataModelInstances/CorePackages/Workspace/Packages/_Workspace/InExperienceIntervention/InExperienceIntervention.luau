local CoreGui = game:GetService("CoreGui")
local Parent = script.Parent
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local LocalizationService = game:GetService("LocalizationService")
local Localization = require(Parent.InExperienceLocales).Localization
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local Images = require(Parent.UIBlox).App.ImageSet.Images
local NotificationModalsManagerModule = require(Parent.NotificationModalsManager)
local RoactModule = require(Parent.Roact)
local AppStyleProvider = require(Parent.UIBlox).App.Style.AppStyleProvider
local LayerCollectorProvider = require(Parent.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider
local InExperienceInterventionContainerModule = require(script.InExperienceInterventionContainer)
local FoundationProvider = require(Parent.Foundation).FoundationProvider
local InterventionPlacement = require(Parent.InterventionShared).Contexts.InterventionPlacement
local Constants = require(Parent.InterventionShared).Utils.Constants
local t = {}
local InExperienceInterventionDisplayOrder = game:DefineFastInt("InExperienceInterventionDisplayOrder", 6)

if game:DefineFastFlag("FFlagTimeoutRemoteEvent", false) then
	RobloxReplicatedStorage:WaitForChild("TimeoutChatAttempt", 1e999).OnClientEvent:Connect(function(p1, p2)
		-- upvalues: NotificationModalsManagerModule (copy), Images (copy)
		NotificationModalsManagerModule.SetUIBloxToast({
			toastTitle = "Test Chat Timeout RemoteEvent",
			iconImage = Images["icons/status/error_large"],
			toastSubtitle = `startTime: {p1}, duration: {p2}`,
			sequenceNumber = DateTime.now().UnixTimestamp,
			iconSize = Vector2.new(36, 36)
		})
	end)
end
function t.new()
	-- upvalues: t (copy), RoactModule (copy), InExperienceInterventionDisplayOrder (copy), LayerCollectorProvider (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), InterventionPlacement (copy), Constants (copy), FoundationProvider (copy), AppStyleProvider (copy), InExperienceInterventionContainerModule (copy), CoreGui (copy)
	local self = setmetatable({}, t)
	self.root = RoactModule.createElement("ScreenGui", { DisplayOrder = InExperienceInterventionDisplayOrder }, {
		LayerCollectorProvider = RoactModule.createElement(LayerCollectorProvider, {}, {
			LocalizationProvider = RoactModule.createElement(LocalizationProvider, {
				localization = Localization.new(LocalizationService.RobloxLocaleId)
			}, {
				InterventionPlacementProvider = RoactModule.createElement(InterventionPlacement.Provider, { value = Constants.InterventionPlacementType.InExperience }, {
					FoundationProvider = RoactModule.createElement(FoundationProvider, { colorMode = "Dark" }, {
						StyleProvider = RoactModule.createElement(AppStyleProvider, { style = { themeName = "dark", fontName = "gotham" } }, {
							Container = RoactModule.createElement(InExperienceInterventionContainerModule, {})
						})
					})
				})
			})
		})
	})
	self.element = RoactModule.mount(self.root, CoreGui, "InExperienceInterventionApp")
	
	return self
end

return t.new()