local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local CanGoBackFunction = require(CorePackages.Workspace.Packages.Navigation).canGoBack
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local NavigateWithLockFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock
local _ = require(script.Parent.ManageOutfitsPage)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local MutedErrorFunction = require(CorePackages.Workspace.Packages.Loggers).mutedError

return function()
	-- upvalues: UseNavigationFunction (copy), UseDispatchFunction (copy), UseLocalizationFunction (copy), ConstantsModule (copy), MutedErrorFunction (copy), ReactModule (copy), CanGoBackFunction (copy), AvatarScreen (copy), NavigateWithLockFunction (copy), NavigationUtilsModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseDispatchResult = UseDispatchFunction()
	local FeatureAvatarHeadingManage = UseLocalizationFunction({
		title = "Feature.Avatar.Heading.Manage",
		selectAction = "Feature.Avatar.Action.Select",
		cancelAction = "Feature.Avatar.Action.Cancel"
	})
	local OutfitTypeParam = UseNavigationResult.getParam("outfitType")
	
	if not OutfitTypeParam then
		OutfitTypeParam = ConstantsModule.OutfitTypes.Avatar
		MutedErrorFunction("outfitType is required")
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2({})
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), UseStateResult (copy), UseStateResult1 (copy), UseStateResult2_1 (copy)
		UseNavigationResult.navigate(AvatarScreen.DeleteOutfitPrompt, {
			outfitIds = UseStateResult,
			onOverlayClosed = function()
				-- upvalues: UseStateResult1 (upval), UseStateResult2_1 (upval)
				if UseStateResult1 then
					UseStateResult2_1(false)
				end
			end
		})
	end, { UseNavigationResult, UseStateResult, UseStateResult1 })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult (copy), UseNavigationResult (copy), AvatarScreen (upval)
		local UseStateResultEntry = UseStateResult[1]
		
		if UseStateResultEntry then
			UseNavigationResult.navigate(AvatarScreen.RenameOutfitPrompt, {
				costumeId = UseStateResultEntry,
				onOverlayClosed = function() end
			})
			
			return
		end
	end, { UseNavigationResult, UseStateResult })
	
	return {
		outfitType = OutfitTypeParam,
		titleText = FeatureAvatarHeadingManage.title,
		selectActionText = if UseStateResult1 then FeatureAvatarHeadingManage.cancelAction else FeatureAvatarHeadingManage.selectAction,
		onBackActivated = ReactModule.useCallback(function()
			-- upvalues: CanGoBackFunction (upval), UseNavigationResult (copy)
			if CanGoBackFunction(UseNavigationResult) then
				UseNavigationResult.goBack()
			end
		end, { UseNavigationResult }),
		onSelectActivated = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2_1 (copy), NavigationUtilsModule (upval), UseNavigationResult (copy)
			UseStateResult2_1(function(p1): boolean
				return not p1
			end)
			NavigationUtilsModule.closeFiltersAndItemDetails(UseNavigationResult)
		end, { UseNavigationResult }),
		selectedOutfits = UseStateResult,
		setSelectedOutfits = UseStateResult2,
		onToggleOutfitCard = ReactModule.useCallback(function(p1, OutfitId)
			-- upvalues: UseResult (copy), UseResult1 (copy), UseResult2 (copy), UseDispatchResult (copy), NavigateWithLockFunction (upval), NavigationUtilsModule (upval), UseNavigationResult (copy), AvatarScreen (upval)
			if p1 and OutfitId then
				local config = {
					ZIndex = 2,
					outfitId = OutfitId,
					onPeekViewClosed = UseResult,
					exitButtonPosition = Vector2.new(0, 0),
					deleteOutfit = UseResult1,
					renameOutfit = UseResult2
				}
				UseDispatchResult(NavigateWithLockFunction(function()
					-- upvalues: NavigationUtilsModule (upval), UseNavigationResult (upval), AvatarScreen (upval), config (copy)
					NavigationUtilsModule.closeFiltersAndItemDetails(UseNavigationResult)
					NavigationUtilsModule.closeTryOnManager(UseNavigationResult)
					UseNavigationResult.navigate(AvatarScreen.OutfitDetails, config)
				end))
				
				return
			else
				NavigationUtilsModule.closeFiltersAndItemDetails(UseNavigationResult)
			end
		end, {
			UseDispatchResult,
			UseNavigationResult,
			UseResult,
			UseResult1,
			UseResult2
		}),
		multiSelect = UseStateResult1,
		gridRef = ReactModule.useRef(nil),
		outfitGridCanScroll = UseStateResult3,
		setCanScroll = UseStateResult2_2,
		deleteOutfit = UseResult1,
		renameOutfit = UseResult2,
		actionBarRef = ReactModule.useRef(nil)
	}
end