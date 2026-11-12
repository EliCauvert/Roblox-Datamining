local CoreGui = game:GetService("CoreGui")
local LocalizationService = game:GetService("LocalizationService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Parent = script.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local ReactRobloxModule = require(Parent1.ReactRoblox)
local FoundationModule = require(Parent1.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local Enums = FoundationModule.Enums
local AdLabelModule = require(Parent.interactivity.AdLabel)
local Localization = require(Parent1.InExperienceLocales).Localization
local LocalizationProvider = require(Parent1.Localization).LocalizationProvider
local EnhancedVideoStoreModule = require(Parent.EnhancedVideoStore)
local DispatchEnhancedVideoConfigModule = require(Parent.dispatchEnhancedVideoConfig)
local RequestInternalWrapperResult = require(Parent1.Http).NetworkLayers.requestInternalWrapper(nil)

return function()
	-- upvalues: Localization (copy), LocalizationService (copy), EnhancedVideoStoreModule (copy), RequestInternalWrapperResult (copy), DispatchEnhancedVideoConfigModule (copy), ReplicatedStorage (copy), CoreGui (copy), ReactRobloxModule (copy), ReactModule (copy), LocalizationProvider (copy), FoundationProvider (copy), Enums (copy), AdLabelModule (copy)
	if game.CreatorType == Enum.CreatorType.Group and game.CreatorId == 427968160 then
		local NewLocalization = Localization.new(LocalizationService.RobloxLocaleId)
		EnhancedVideoStoreModule(false).fetchInitialData(RequestInternalWrapperResult, game.GameId):andThen(function(Result)
			-- upvalues: DispatchEnhancedVideoConfigModule (upval)
			if Result then
				DispatchEnhancedVideoConfigModule(Result)
			end
		end)
		local AdDisclosurePauseEvent = ReplicatedStorage:WaitForChild("AdDisclosurePauseEvent")
		local EnhancedVideoInteractivityControls = Instance.new("Folder")
		EnhancedVideoInteractivityControls.Name = "EnhancedVideoInteractivityControls"
		EnhancedVideoInteractivityControls.Parent = CoreGui
		ReactRobloxModule.createRoot(EnhancedVideoInteractivityControls):render(ReactModule.createElement("ScreenGui", { DisplayOrder = -5 }, {
			LocalizationProvider = ReactModule.createElement(LocalizationProvider, { localization = NewLocalization }, {
				FoundationProvider = ReactModule.createElement(FoundationProvider, { colorMode = Enums.ColorMode.Dark }, {
					AdLabel = ReactModule.createElement(AdLabelModule, {
						sendPauseEvent = function()
							-- upvalues: AdDisclosurePauseEvent (copy)
							AdDisclosurePauseEvent:Fire()
						end
					})
				})
			})
		}))
		
		return
	end
end