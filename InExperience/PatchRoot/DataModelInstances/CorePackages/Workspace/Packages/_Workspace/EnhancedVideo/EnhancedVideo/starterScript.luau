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
local var10 = if luaAppEnableEnhancedVideoExperienceGroupIdCheck then 427968160 else nil
local enhancedVideoStoreModule = require(parent.EnhancedVideoStore)
local var12 = if fFlagLuaAppEnableEnhancedVideoExperienceAssetAndTimelineModule then require(parent.dispatchEnhancedVideoConfig) else nil
local var13 = require(parent_1.Http).NetworkLayers.requestInternalWrapper(nil)

return function() --[[ line: 38 | named "starterScript" ]]
	-- upvalues: luaAppEnableEnhancedVideoExperienceGroupIdCheck (ref), var10 (ref), luaAppIsEnhancedVideoUniverse (ref), localization (ref), localizationService (ref), fFlagLuaAppEnableEnhancedVideoExperienceAssetAndTimelineModule (ref), enhancedVideoStoreModule (ref), var13 (ref), var12 (ref), replicatedStorageService (ref), coreGuiService (ref), reactRobloxModule (ref), reactModule (ref), localizationProvider (ref), foundationProvider (ref), enums (ref), adLabelModule (ref)
	if luaAppEnableEnhancedVideoExperienceGroupIdCheck then
		if game.CreatorType ~= Enum.CreatorType.Group or game.CreatorId ~= var10 then return end
	elseif not luaAppIsEnhancedVideoUniverse then return end
	local var14 = localization.new(localizationService.RobloxLocaleId)
	
	if fFlagLuaAppEnableEnhancedVideoExperienceAssetAndTimelineModule then
		enhancedVideoStoreModule(false).fetchInitialData(var13, game.GameId):andThen(function(p0) --[[ line: 53 ]]
			-- upvalues: var12 (copy)
			if p0 then
				var12(p0)
			end
		end)
	else
		enhancedVideoStoreModule(false).fetchInitialData(var13, game.GameId)
	end
	local adDisclosurePauseEvent = replicatedStorageService:WaitForChild("AdDisclosurePauseEvent")
	local enhancedVideoInteractivityControls = Instance.new("Folder")
	enhancedVideoInteractivityControls.Name = "EnhancedVideoInteractivityControls"
	enhancedVideoInteractivityControls.Parent = coreGuiService
	reactRobloxModule.createRoot(enhancedVideoInteractivityControls):render(reactModule.createElement("ScreenGui", { DisplayOrder = -5 }, {
		LocalizationProvider = reactModule.createElement(localizationProvider, { localization = var14 }, {
			FoundationProvider = reactModule.createElement(foundationProvider, { colorMode = enums.ColorMode.Dark }, {
				AdLabel = reactModule.createElement(adLabelModule, {
					sendPauseEvent = function() --[[ line: 79 ]]
						-- upvalues: adDisclosurePauseEvent (ref)
						adDisclosurePauseEvent:Fire()
					end
				})
			})
		})
	}))
end