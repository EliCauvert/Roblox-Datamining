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
local var1 = if fFlagSignalsNavP3Dispatch then robloxAppNavigationModule.NavigationCommands else nil
local useNavigation = require(parent.Navigation).useNavigation
local getProfilePlatformModule = require(profilePlatform.Networking.getProfilePlatform)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local getAvailableCommunityComponentsModule = require(profilePlatform.Hooks.getAvailableCommunityComponents)

return function()
	-- upvalues: useStyle (ref), useDispatch (ref), useNavigation (ref), useProfileWrapperContextModule (ref), useScreenSize (ref), useLocalization (ref), textKeysModule (ref), useNavigationProps (ref), reactModule (ref), appPage (ref), urlBuilder (ref), getProfilePlatformModule (ref), getAvailableCommunityComponentsModule (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), enumsModule (ref), interactiveAlert (ref), styledTextLabel (ref), buttonType (ref)
	local var2 = useStyle()
	local var3 = useDispatch()
	local var4 = useNavigation()
	local var5 = useProfileWrapperContextModule()
	local var6 = useScreenSize()
	local profileType = var5.profileType
	local profileId = var5.profileId
	local var7 = useLocalization({
		["continue"] = textKeysModule.Continue,
		cancel = textKeysModule.Cancel,
		verificationRequired = textKeysModule.VerificationRequired,
		contentTextHigh = textKeysModule.ContentTextHigh,
		contentTextMedium = textKeysModule.ContentTextMedium,
		contentTextLow = textKeysModule.ContentTextLow
	})
	local var8 = useNavigationProps(function(_, p1)
		return { disabledReason = p1.disabledReason }
	end)
	local t = {
		[enumsModule.DisabledReasons.InsufficientVerificationLevelHigh] = var7.contentTextHigh,
		[enumsModule.DisabledReasons.InsufficientVerificationLevelMedium] = var7.contentTextMedium,
		[enumsModule.DisabledReasons.InsufficientVerificationLevelLow] = var7.contentTextLow
	}
	
	return reactModule.createElement(interactiveAlert, {
		title = var7.verificationRequired,
		screenSize = var6,
		middleContent = function()
			-- upvalues: reactModule (copy), styledTextLabel (copy), t (ref), var8 (ref), var2 (ref)
			return reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				Content = reactModule.createElement(styledTextLabel, {
					layoutOrder = 1,
					fluidSizing = false,
					text = t[var8.disabledReason],
					fontStyle = var2.Font.Body,
					colorStyle = var2.Theme.TextDefault,
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
						onActivated = reactModule.useCallback(function()
							-- upvalues: var4 (ref)
							var4.goBack()
						end, { var4 }),
						text = var7.cancel
					}
				},
				{
					buttonType = buttonType.PrimarySystem,
					props = {
						onActivated = reactModule.useCallback(function()
							-- upvalues: appPage (copy), urlBuilder (copy), var7 (ref), var4 (ref), var3 (ref), getProfilePlatformModule (copy), profileType (ref), profileId (ref), getAvailableCommunityComponentsModule (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), navigateDown (copy)
							local t = {
								name = appPage.GenericWebPage,
								detail = urlBuilder.static.settings.account(),
								extraProps = {
									title = var7.verificationRequired,
									onClose = function()
										-- upvalues: var4 (copy), var3 (copy), getProfilePlatformModule (copy), profileType (copy), profileId (copy), getAvailableCommunityComponentsModule (copy)
										var4.goBack()
										var3(getProfilePlatformModule.API({
											includeComponentOrdering = true,
											profileType = profileType,
											profileId = profileId,
											components = getAvailableCommunityComponentsModule()
										}))
									end
								}
							}
							
							if fFlagSignalsNavP3Dispatch then
								var1.down(var1.fromLegacyPage(t))
								
								return
							end
							var3(navigateDown(t))
						end, { var3, var7, var4 }),
						text = var7["continue"]
					}
				}
			},
			forcedFillDirection = Enum.FillDirection.Horizontal
		}
	})
end