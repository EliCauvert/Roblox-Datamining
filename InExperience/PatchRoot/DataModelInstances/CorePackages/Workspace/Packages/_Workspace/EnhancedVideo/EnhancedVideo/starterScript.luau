local coreGuiService = game:GetService("CoreGui")
local localizationService = game:GetService("LocalizationService")
local replicatedStorageService = game:GetService("ReplicatedStorage")
local parent = script.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local reactRobloxModule = require(parent_1.ReactRoblox)
local foundationModule = require(parent_1.Foundation)
local foundationProvider = foundationModule.FoundationProvider
local enums = foundationModule.Enums
local adLabelModule = require(parent.interactivity.AdLabel)
local localization = require(parent_1.InExperienceLocales).Localization
local localizationProvider = require(parent_1.Localization).LocalizationProvider
local luaAppIsEnhancedVideoUniverse = game:DefineFastFlag("LuaAppIsEnhancedVideoUniverse", false)
local fFlagLuaAppEnableEnhancedVideoExperienceAssetAndTimelineModule = require(parent.FFlagLuaAppEnableEnhancedVideoExperienceAssetAndTimeline)
local luaAppEnableEnhancedVideoExperienceGroupIdCheck = game:DefineFastFlag("LuaAppEnableEnhancedVideoExperienceGroupIdCheck", false)
local var1 = if luaAppEnableEnhancedVideoExperienceGroupIdCheck then 427968160 else nil
local enhancedVideoStoreModule = require(parent.EnhancedVideoStore)
local var2 = if fFlagLuaAppEnableEnhancedVideoExperienceAssetAndTimelineModule then require(parent.dispatchEnhancedVideoConfig) else nil
local var3 = require(parent_1.Http).NetworkLayers.requestInternalWrapper(nil)

return function()
	-- upvalues: luaAppEnableEnhancedVideoExperienceGroupIdCheck (ref), var1 (ref), luaAppIsEnhancedVideoUniverse (ref), localization (ref), localizationService (ref), fFlagLuaAppEnableEnhancedVideoExperienceAssetAndTimelineModule (ref), enhancedVideoStoreModule (ref), var3 (ref), var2 (ref), replicatedStorageService (ref), coreGuiService (ref), reactRobloxModule (ref), reactModule (ref), localizationProvider (ref), foundationProvider (ref), enums (ref), adLabelModule (ref)
	if luaAppEnableEnhancedVideoExperienceGroupIdCheck then
		if game.CreatorType ~= Enum.CreatorType.Group or game.CreatorId ~= var1 then return end
	elseif not luaAppIsEnhancedVideoUniverse then return end
	local var4 = localization.new(localizationService.RobloxLocaleId)
	
	if fFlagLuaAppEnableEnhancedVideoExperienceAssetAndTimelineModule then
		enhancedVideoStoreModule(false).fetchInitialData(var3, game.GameId):andThen(function(p1)
			-- upvalues: var2 (copy)
			if p1 then
				var2(p1)
			end
		end)
	else
		enhancedVideoStoreModule(false).fetchInitialData(var3, game.GameId)
	end
	local adDisclosurePauseEvent = replicatedStorageService:WaitForChild("AdDisclosurePauseEvent")
	local enhancedVideoInteractivityControls = Instance.new("Folder")
	enhancedVideoInteractivityControls.Name = "EnhancedVideoInteractivityControls"
	enhancedVideoInteractivityControls.Parent = coreGuiService
	reactRobloxModule.createRoot(enhancedVideoInteractivityControls):render(reactModule.createElement("ScreenGui", { DisplayOrder = -5 }, {
		LocalizationProvider = reactModule.createElement(localizationProvider, { localization = var4 }, {
			FoundationProvider = reactModule.createElement(foundationProvider, { colorMode = enums.ColorMode.Dark }, {
				AdLabel = reactModule.createElement(adLabelModule, {
					sendPauseEvent = function()
						-- upvalues: adDisclosurePauseEvent (ref)
						adDisclosurePauseEvent:Fire()
					end
				})
			})
		})
	}))
end