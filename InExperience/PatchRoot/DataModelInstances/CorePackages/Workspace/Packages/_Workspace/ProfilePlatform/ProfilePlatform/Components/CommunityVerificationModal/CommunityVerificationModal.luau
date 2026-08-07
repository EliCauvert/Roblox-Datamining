local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local enumsModule = require(profilePlatform.Common.Enums)
local appPage = require(parent.RobloxAppEnums).AppPage
local UIBloxModule = require(parent.UIBlox)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local useStyle = UIBloxModule.Core.Style.useStyle
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local useLocalization = require(parent.Localization).Hooks.useLocalization
local robloxAppNavigationModule = require(parent.RobloxAppNavigation)
local useNavigationProps = robloxAppNavigationModule.useNavigationProps
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local textKeysModule = require(profilePlatform.Common.TextKeys)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var6 = if fFlagSignalsNavP3Dispatch then robloxAppNavigationModule.NavigationCommands else nil
local useNavigation = require(parent.Navigation).useNavigation
local getProfilePlatformModule = require(profilePlatform.Networking.getProfilePlatform)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local getAvailableCommunityComponentsModule = require(profilePlatform.Hooks.getAvailableCommunityComponents)

return function() --[[ line: 31 ]]
	-- upvalues: useStyle (ref), useDispatch (ref), useNavigation (ref), useProfileWrapperContextModule (ref), useScreenSize (ref), useLocalization (ref), textKeysModule (ref), useNavigationProps (ref), reactModule (ref), appPage (ref), urlBuilder (ref), getProfilePlatformModule (ref), getAvailableCommunityComponentsModule (ref), fFlagSignalsNavP3Dispatch (ref), var6 (ref), navigateDown (ref), enumsModule (ref), interactiveAlert (ref), styledTextLabel (ref), buttonType (ref)
	local var10 = useStyle()
	local var11 = useDispatch()
	local var12 = useNavigation()
	local var13 = useProfileWrapperContextModule()
	local var14 = useScreenSize()
	local profileType = var13.profileType
	local profileId = var13.profileId
	local var15 = useLocalization({
		["continue"] = textKeysModule.Continue,
		cancel = textKeysModule.Cancel,
		verificationRequired = textKeysModule.VerificationRequired,
		contentTextHigh = textKeysModule.ContentTextHigh,
		contentTextMedium = textKeysModule.ContentTextMedium,
		contentTextLow = textKeysModule.ContentTextLow
	})
	local var16 = useNavigationProps(function(_, p0) --[[ line: 50 ]]
		return { disabledReason = p0.disabledReason }
	end)
	local t = {
		[enumsModule.DisabledReasons.InsufficientVerificationLevelHigh] = var15.contentTextHigh,
		[enumsModule.DisabledReasons.InsufficientVerificationLevelMedium] = var15.contentTextMedium,
		[enumsModule.DisabledReasons.InsufficientVerificationLevelLow] = var15.contentTextLow
	}
	
	return reactModule.createElement(interactiveAlert, {
		title = var15.verificationRequired,
		screenSize = var14,
		middleContent = function() --[[ line: 94 ]]
			-- upvalues: reactModule (copy), styledTextLabel (copy), t (ref), var16 (ref), var10 (ref)
			return reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				Content = reactModule.createElement(styledTextLabel, {
					layoutOrder = 1,
					fluidSizing = false,
					text = t[var16.disabledReason],
					fontStyle = var10.Font.Body,
					colorStyle = var10.Theme.TextDefault,
					size = UDim2.fromScale(1, 0),
					automaticSize = Enum.AutomaticSize.Y
				})
			})
		end,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = buttonType.Secondary,
					props = {
						onActivated = reactModule.useCallback(function() --[[ line: 80 ]]
							-- upvalues: var12 (ref)
							var12.goBack()
						end, { var12 }),
						text = var15.cancel
					}
				},
				{
					buttonType = buttonType.PrimarySystem,
					props = {
						onActivated = reactModule.useCallback(function() --[[ line: 56 ]]
							-- upvalues: appPage (copy), urlBuilder (copy), var15 (ref), var12 (ref), var11 (ref), getProfilePlatformModule (copy), profileType (ref), profileId (ref), getAvailableCommunityComponentsModule (copy), fFlagSignalsNavP3Dispatch (copy), var6 (copy), navigateDown (copy)
							local t = {
								name = appPage.GenericWebPage,
								detail = urlBuilder.static.settings.account(),
								extraProps = {
									title = var15.verificationRequired,
									onClose = function() --[[ line: 62 ]]
										-- upvalues: var12 (copy), var11 (copy), getProfilePlatformModule (copy), profileType (copy), profileId (copy), getAvailableCommunityComponentsModule (copy)
										var12.goBack()
										var11(getProfilePlatformModule.API({
											includeComponentOrdering = true,
											profileType = profileType,
											profileId = profileId,
											components = getAvailableCommunityComponentsModule()
										}))
									end
								}
							}
							
							if fFlagSignalsNavP3Dispatch then
								var6.down(var6.fromLegacyPage(t))
								
								return
							end
							var11(navigateDown(t))
						end, { var11, var15, var12 }),
						text = var15["continue"]
					}
				}
			},
			forcedFillDirection = Enum.FillDirection.Horizontal
		}
	})
end