local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseLocalizationModule = require(Modules.LuaApp.Hooks.useLocalization)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ContextualMenu = UIBloxModule.App.Menu.ContextualMenu
local MenuDirection = UIBloxModule.App.Menu.MenuDirection
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local OpenGameDetailsModule = require(Modules.LuaApp.Thunks.OpenGameDetails)
local ApiFetchGameIconsFunction = require(CorePackages.Workspace.Packages.GameIconRodux).GameIcons.ApiFetchGameIcons
local _ = require(Modules.AvatarExperience.Common.Models.CollectibleInstance)
local GameIconReducer = require(CorePackages.Workspace.Packages.GameIconRodux).GameIcons.GameIconReducer
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals
local AXOpenExperienceDetailsInFullView = game:DefineFastFlag("AXOpenExperienceDetailsInFullView", false)

return require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)(function(p1)
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceModule (copy), RoactNetworkingModule (copy), ReactModule (copy), UseSelectorFunction (copy), GetUseSelectorDeepEqualsFunction (copy), GameIconReducer (copy), UseLocalizationModule (copy), ApiFetchGameIconsFunction (copy), NavigationUtilsModule (copy), AvatarScreen (copy), OpenGameDetailsModule (copy), AXOpenExperienceDetailsInFullView (copy), ContextualMenu (copy), MenuDirection (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.ScreenSize
	end, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		-- upvalues: GameIconReducer (upval)
		return p2[GameIconReducer.key]
	end, GetUseSelectorDeepEqualsFunction())
	local UseLocalizationModuleResult = UseLocalizationModule({
		soldOutTitle = "Feature.Catalog.Label.ItemExperienceSoldOutTitle",
		soldOutMessage = "Feature.Catalog.Label.ItemExperienceSoldOut",
		limitReachedTitle = "Feature.Catalog.Label.ItemExperienceLimitReachedTitle",
		limitReachedMessage = "Feature.Catalog.Label.ItemExperienceLimitReached"
	})
	local Params = p1.navigation.state.params
	local CollectibleData = Params.collectibleData
	local IsLimited = Params.isLimited
	local Experiences = CollectibleData and CollectibleData.experiences
	local CountExperiences: number = if Experiences then #Experiences else 0
	local UseSelectorResult2 = UseSelectorFunction(function(p2)
		-- upvalues: CollectibleData (copy)
		return if CollectibleData and CollectibleData.collectibleItemId then p2.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances[CollectibleData.collectibleItemId] or {} else {}
	end, GetUseSelectorDeepEqualsFunction())
	ReactModule.useEffect(function()
		-- upvalues: Experiences (copy), UseDispatchResult (copy), ApiFetchGameIconsFunction (upval), UseRoactServiceModuleResult (copy), CountExperiences (copy), UseStateResult2 (copy)
		if not Experiences then return end
		local Ids = {}
		
		for _, experience in ipairs(Experiences) do
			table.insert(Ids, experience.id)
		end
		UseDispatchResult(ApiFetchGameIconsFunction(UseRoactServiceModuleResult, Ids))
		
		if CountExperiences == 1 then
			UseStateResult2(Experiences[1])
		end
	end, { Experiences, UseRoactServiceModuleResult })
	ReactModule.useEffect(function() end, { UseSelectorResult1 })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseSelectorResult2 (copy), NavigationUtilsModule (upval), p1 (copy), CollectibleData (copy), IsLimited (copy), UseLocalizationModuleResult (copy), AvatarScreen (upval), UseDispatchResult (copy), OpenGameDetailsModule (upval), AXOpenExperienceDetailsInFullView (upval)
		if not UseStateResult then return end
		assert(UseStateResult, "")
		local Text = tostring(UseStateResult.id)
		local Count = 0
		
		for _, _ in UseSelectorResult2 do
			Count += 1
		end
		NavigationUtilsModule.closeOverlay(p1.navigation)
		local LimitReachedTitle = nil
		local Text1 = nil
		
		if CollectibleData.unitsAvailableForConsumption == 0 and IsLimited then
			LimitReachedTitle = UseLocalizationModuleResult.soldOutTitle
			Text1 = UseLocalizationModuleResult.soldOutMessage
		elseif CollectibleData.quantityLimitPerUser > 0 and CollectibleData.quantityLimitPerUser <= Count then
			LimitReachedTitle = UseLocalizationModuleResult.limitReachedTitle
			Text1 = UseLocalizationModuleResult.limitReachedMessage
		end
		if LimitReachedTitle or Text1 then
			p1.navigation.navigate(AvatarScreen.OpenExperienceTraversalPrompt, {
				hideConfirmationButton = true,
				gameName = UseStateResult.name,
				gameUniverseId = Text,
				overrideTitle = LimitReachedTitle,
				overrideBody = if Text1 then Text1:gsub("{EXPERIENCE_NAME}", UseStateResult.name) else nil
			})
			
			return
		else
			UseDispatchResult(OpenGameDetailsModule(Text, if AXOpenExperienceDetailsInFullView then { mountAsFullView = true } else {}))
		end
	end, { UseStateResult, CollectibleData })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy)
		NavigationUtilsModule.closeOverlay(p1.navigation)
	end, { p1.navigation })
	
	if not Experiences or CountExperiences == 1 then return end
	local ButtonProps = {}
	
	for _, experience in ipairs(Experiences) do
		local UseSelectorResultEntry = UseSelectorResult1[tostring(experience.id)]
		table.insert(ButtonProps, {
			icon = if UseSelectorResultEntry then UseSelectorResultEntry.url else nil,
			text = experience.name,
			onActivated = function()
				-- upvalues: UseStateResult2 (copy), experience (copy)
				UseStateResult2(experience)
			end
		})
	end
	return ReactModule.createElement(ContextualMenu, {
		open = true,
		closeBackgroundVisible = false,
		buttonProps = ButtonProps,
		menuDirection = if Params.menuDirection then Params.menuDirection else MenuDirection.Up,
		openPositionY = if Params.openPositionY then Params.openPositionY else UDim.new(1, -76),
		openPositionX = UDim.new(0.35, 0),
		screenSize = UseSelectorResult,
		onDismiss = UseResult
	})
end)