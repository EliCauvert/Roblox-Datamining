local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local AvatarScreen = require(Parent.AvatarExperienceNavigation).Enums.AvatarScreen
local OpenInfoPeekViewFunction = require(Parent.DiscoveryRouting).OpenInfoPeekView
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseIsSpatialFunction = require(Parent.Responsive).useIsSpatial

return function(TitleText, BodyText) --[[ Line: 41 | Named "useOpenInformationPopover" ]]
	-- upvalues: UseDispatchFunction (copy), UseNavigationFunction (copy), UseIsSpatialFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), AvatarScreen (copy), OpenInfoPeekViewFunction (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseIsSpatialResult = UseIsSpatialFunction()
	local UseLocalizationResult = UseLocalizationFunction({ gotIt = "Feature.Avatar.Action.GotIt" })
	local UseResult = ReactModule.useCallback(function() --[[ Line: 52 ]]
		-- upvalues: UseIsSpatialResult (copy), UseNavigationResult (copy), AvatarScreen (upval), TitleText (copy), BodyText (copy), UseLocalizationResult (copy), UseDispatchResult (copy), OpenInfoPeekViewFunction (upval)
		if UseIsSpatialResult then
			UseNavigationResult.navigate(AvatarScreen.GenericPrompt, {
				titleText = TitleText,
				bodyText = BodyText,
				buttonText = UseLocalizationResult.gotIt
			})
			
			return
		else
			UseDispatchResult(OpenInfoPeekViewFunction(TitleText or "", BodyText or ""))
		end
	end, {
		TitleText, BodyText, UseLocalizationResult.gotIt, UseDispatchResult,
		UseNavigationResult, UseIsSpatialResult
	})
	
	return if BodyText == nil or BodyText == "" then nil else UseResult
end