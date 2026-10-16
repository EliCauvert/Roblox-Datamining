local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UIBloxModule = require(Parent.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local RobloxAppNavigationModule = require(Parent.RobloxAppNavigation)
local UseNavigationPropsFunction = RobloxAppNavigationModule.useNavigationProps
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then RobloxAppNavigationModule.NavigationCommands else nil
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local GetProfilePlatformModule = require(ProfilePlatform.Networking.getProfilePlatform)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local GetAvailableCommunityComponentsModule = require(ProfilePlatform.Hooks.getAvailableCommunityComponents)

return function() --[[ Line: 31 ]]
	-- upvalues: UseStyleFunction (copy), UseDispatchFunction (copy), UseNavigationFunction (copy), UseProfileWrapperContextModule (copy), UseScreenSizeFunction (copy), UseLocalizationFunction (copy), TextKeysModule (copy), UseNavigationPropsFunction (copy), ReactModule (copy), AppPage (copy), UrlBuilder (copy), GetProfilePlatformModule (copy), GetAvailableCommunityComponentsModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), EnumsModule (copy), InteractiveAlert (copy), StyledTextLabel (copy), ButtonType (copy)
	local UseStyleResult = UseStyleFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	local UseScreenSizeResult = UseScreenSizeFunction()
	local ProfileType = UseProfileWrapperContextModuleResult.profileType
	local ProfileId = UseProfileWrapperContextModuleResult.profileId
	local UseLocalizationResult = UseLocalizationFunction({
		["continue"] = TextKeysModule.Continue,
		cancel = TextKeysModule.Cancel,
		verificationRequired = TextKeysModule.VerificationRequired,
		contentTextHigh = TextKeysModule.ContentTextHigh,
		contentTextMedium = TextKeysModule.ContentTextMedium,
		contentTextLow = TextKeysModule.ContentTextLow
	})
	local UseNavigationPropsResult = UseNavigationPropsFunction(function(_, p1) --[[ Line: 50 ]]
		return { disabledReason = p1.disabledReason }
	end)
	local config = {
		[EnumsModule.DisabledReasons.InsufficientVerificationLevelHigh] = UseLocalizationResult.contentTextHigh,
		[EnumsModule.DisabledReasons.InsufficientVerificationLevelMedium] = UseLocalizationResult.contentTextMedium,
		[EnumsModule.DisabledReasons.InsufficientVerificationLevelLow] = UseLocalizationResult.contentTextLow
	}
	
	return ReactModule.createElement(InteractiveAlert, {
		title = UseLocalizationResult.verificationRequired,
		screenSize = UseScreenSizeResult,
		middleContent = function() --[[ Line: 94 ]]
			-- upvalues: ReactModule (upval), StyledTextLabel (upval), config (copy), UseNavigationPropsResult (copy), UseStyleResult (copy)
			return ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				Content = ReactModule.createElement(StyledTextLabel, {
					layoutOrder = 1,
					fluidSizing = false,
					text = config[UseNavigationPropsResult.disabledReason],
					fontStyle = UseStyleResult.Font.Body,
					colorStyle = UseStyleResult.Theme.TextDefault,
					size = UDim2.fromScale(1, 0),
					automaticSize = Enum.AutomaticSize.Y
				})
			})
		end,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = ButtonType.Secondary,
					props = {
						onActivated = ReactModule.useCallback(function() --[[ Line: 80 ]]
							-- upvalues: UseNavigationResult (copy)
							UseNavigationResult.goBack()
						end, { UseNavigationResult }),
						text = UseLocalizationResult.cancel
					}
				},
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = ReactModule.useCallback(function() --[[ Line: 56 ]]
							-- upvalues: AppPage (upval), UrlBuilder (upval), UseLocalizationResult (copy), UseNavigationResult (copy), UseDispatchResult (copy), GetProfilePlatformModule (upval), ProfileType (copy), ProfileId (copy), GetAvailableCommunityComponentsModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval)
							local config = {
								name = AppPage.GenericWebPage,
								detail = UrlBuilder.static.settings.account(),
								extraProps = {
									title = UseLocalizationResult.verificationRequired,
									onClose = function() --[[ Line: 62 ]]
										-- upvalues: UseNavigationResult (upval), UseDispatchResult (upval), GetProfilePlatformModule (upval), ProfileType (upval), ProfileId (upval), GetAvailableCommunityComponentsModule (upval)
										UseNavigationResult.goBack()
										UseDispatchResult(GetProfilePlatformModule.API({
											includeComponentOrdering = true,
											profileType = ProfileType,
											profileId = ProfileId,
											components = GetAvailableCommunityComponentsModule()
										}))
									end
								}
							}
							
							if FFlagSignalsNavP3Dispatch then
								NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
								
								return
							else
								UseDispatchResult(NavigateDownFunction(config))
							end
						end, {
							UseDispatchResult,
							UseLocalizationResult,
							UseNavigationResult
						}),
						text = UseLocalizationResult["continue"]
					}
				}
			},
			forcedFillDirection = Enum.FillDirection.Horizontal
		}
	})
end