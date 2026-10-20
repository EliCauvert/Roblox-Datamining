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
local LuaAppIsEnhancedVideoUniverse = game:DefineFastFlag("LuaAppIsEnhancedVideoUniverse", false)
local FFlagLuaAppEnableEnhancedVideoExperienceAssetAndTimelineModule = require(Parent.FFlagLuaAppEnableEnhancedVideoExperienceAssetAndTimeline)
local LuaAppEnableEnhancedVideoExperienceGroupIdCheck = game:DefineFastFlag("LuaAppEnableEnhancedVideoExperienceGroupIdCheck", false)
local CreatorId = if LuaAppEnableEnhancedVideoExperienceGroupIdCheck then 427968160 else nil
local EnhancedVideoStoreModule = require(Parent.EnhancedVideoStore)
local DispatchEnhancedVideoConfigModule = if FFlagLuaAppEnableEnhancedVideoExperienceAssetAndTimelineModule then require(Parent.dispatchEnhancedVideoConfig) else nil
local RequestInternalWrapperResult = require(Parent1.Http).NetworkLayers.requestInternalWrapper(nil)

return function()
	-- upvalues: LuaAppEnableEnhancedVideoExperienceGroupIdCheck (copy), CreatorId (copy), LuaAppIsEnhancedVideoUniverse (copy), Localization (copy), LocalizationService (copy), FFlagLuaAppEnableEnhancedVideoExperienceAssetAndTimelineModule (copy), EnhancedVideoStoreModule (copy), RequestInternalWrapperResult (copy), DispatchEnhancedVideoConfigModule (copy), ReplicatedStorage (copy), CoreGui (copy), ReactRobloxModule (copy), ReactModule (copy), LocalizationProvider (copy), FoundationProvider (copy), Enums (copy), AdLabelModule (copy)
	if LuaAppEnableEnhancedVideoExperienceGroupIdCheck then
		if game.CreatorType ~= Enum.CreatorType.Group or game.CreatorId ~= CreatorId then return end
	elseif not LuaAppIsEnhancedVideoUniverse then return end
	local NewLocalization = Localization.new(LocalizationService.RobloxLocaleId)
	
	if FFlagLuaAppEnableEnhancedVideoExperienceAssetAndTimelineModule then
		EnhancedVideoStoreModule(false).fetchInitialData(RequestInternalWrapperResult, game.GameId):andThen(function(Result)
			-- upvalues: DispatchEnhancedVideoConfigModule (upval)
			if Result then
				DispatchEnhancedVideoConfigModule(Result)
			end
		end)
	else
		EnhancedVideoStoreModule(false).fetchInitialData(RequestInternalWrapperResult, game.GameId)
	end
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
end