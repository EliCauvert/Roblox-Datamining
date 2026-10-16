local Parent = script:FindFirstAncestor("TrustedContacts").Parent
local ReactModule = require(Parent.React)
local PeekViewModule = require(Parent.PeekView)
local PeekView = PeekViewModule.PeekView
local PeekViewState = PeekViewModule.PeekViewState
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UIBloxModule = require(Parent.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local InputLabel = FoundationModule.InputLabel
local InputLabelSize = FoundationModule.Enums.InputLabelSize
local ResponsiveModule = require(Parent.Responsive)
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local AnalyticsModule = require(script.Parent.Parent.Parent.Analytics)
local UseTCAnalyticsFunction = AnalyticsModule.useTCAnalytics
local EventNames = AnalyticsModule.EventNames
local FriendsRenameModalUnboldText = game:DefineFastFlag("FriendsRenameModalUnboldText", false)

return function() --[[ Line: 48 | Named "FriendsRenameInfoModal" ]]
	-- upvalues: UsePreferredInputFunction (copy), UseDispatchFunction (copy), UseScreenSizeFunction (copy), UseNavigationFunction (copy), UseTCAnalyticsFunction (copy), ReactModule (copy), EventNames (copy), ResponsiveModule (copy), UseLocalizationFunction (copy), PeekViewState (copy), UseAppPolicyFunction (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), Text (copy), View (copy), FriendsRenameModalUnboldText (copy), InputLabel (copy), InputLabelSize (copy), InteractiveAlert (copy), ButtonType (copy), PeekView (copy)
	local UsePreferredInputResult = UsePreferredInputFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseNavigationResult = UseNavigationFunction()
	local FireAnalyticsEventFunction = UseTCAnalyticsFunction().fireAnalyticsEvent
	ReactModule.useEffect(function() --[[ Line: 56 ]]
		-- upvalues: FireAnalyticsEventFunction (copy), EventNames (upval)
		FireAnalyticsEventFunction(EventNames.FriendsRenameInfoModalSeen)
	end, {})
	local IsNotUsePreferredInputResultMatch = UsePreferredInputResult ~= ResponsiveModule.Input.Touch
	local UseLocalizationResult = UseLocalizationFunction({
		gotIt = "Feature.Avatar.Action.GotIt",
		learnMore = "Feature.Chat.Action.LearnMore",
		introducingConnections = "Feature.Friends.Label.IntroducingConnections",
		renameInfoText = "Feature.Friends.Label.RenameInfoText"
	})
	local UseResult = ReactModule.useCallback(function() --[[ Line: 70 ]]
		-- upvalues: UseNavigationResult (copy)
		UseNavigationResult.pop()
	end, { UseNavigationResult })
	local UseResult1 = ReactModule.useCallback(function(Closed, _) --[[ Line: 74 ]]
		-- upvalues: PeekViewState (upval), UseNavigationResult (copy)
		if Closed == PeekViewState.Closed or Closed == PeekViewState.Hidden then
			UseNavigationResult.goBack()
		end
	end, { UseNavigationResult })
	local UseAppPolicyResult = UseAppPolicyFunction(function(p1) --[[ Line: 80 ]]
		return p1.getWebViewSupport()
	end)
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 84 ]]
		-- upvalues: FireAnalyticsEventFunction (copy), EventNames (upval), AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
		FireAnalyticsEventFunction(EventNames.FriendsRenameLearnMoreClicked)
		local config = {
			detail = "https://en.help.roblox.com/hc/en-us/articles/37725513985812",
			name = AppPage.GenericWebPage,
			extraProps = { title = "" }
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			UseDispatchResult(NavigateDownFunction(config, nil))
		end
	end, { UseDispatchResult })
	local IntroducingConnections = UseLocalizationResult.introducingConnections
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 101 ]]
		-- upvalues: ReactModule (upval), Text (upval), IntroducingConnections (copy)
		return ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "auto-y size-full-0 text-align-x-left text-wrap text-heading-small",
			Text = IntroducingConnections
		})
	end, { IntroducingConnections })
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 109 ]]
		-- upvalues: ReactModule (upval), View (upval), IsNotUsePreferredInputResultMatch (copy), FriendsRenameModalUnboldText (upval), Text (upval), InputLabel (upval), InputLabelSize (upval), UseLocalizationResult (copy), UseAppPolicyResult (copy), UseResult2 (copy)
		return ReactModule.createElement(View, {
			tag = "col size-full-0 auto-y gap-small padding-0",
			["align-x-left"] = not IsNotUsePreferredInputResultMatch,
			["align-x-center"] = IsNotUsePreferredInputResultMatch,
			LayoutOrder = 2
		}, {
			BodyText = ReactModule.createElement(if FriendsRenameModalUnboldText then Text else InputLabel, {
				LayoutOrder = 1,
				RichText = true,
				tag = if FriendsRenameModalUnboldText then "auto-y size-full-0 text-wrap grow text-align-x-left" else "auto-y size-full-0 text-wrap grow",
				size = if FriendsRenameModalUnboldText then nil else InputLabelSize.Large,
				Text = UseLocalizationResult.renameInfoText
			}),
			LearnMoreWebLink = UseAppPolicyResult and ReactModule.createElement(if FriendsRenameModalUnboldText then Text else InputLabel, {
				LayoutOrder = 2,
				RichText = true,
				tag = if FriendsRenameModalUnboldText then "auto-y size-full-0 text-align-x-left" else "auto-y size-full-0",
				Text = `<u>{UseLocalizationResult.learnMore}</u>`,
				size = if FriendsRenameModalUnboldText then nil else InputLabelSize.Large,
				onActivated = UseResult2
			})
		})
	end, {
		UseResult2,
		UseLocalizationResult,
		IsNotUsePreferredInputResultMatch
	})
	
	return if IsNotUsePreferredInputResultMatch then ReactModule.createElement(InteractiveAlert, {
		richText = true,
		screenSize = UseScreenSizeResult,
		title = IntroducingConnections,
		middleContent = UseResult3,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = ButtonType.Secondary,
					props = {
						onActivated = UseResult,
						text = UseLocalizationResult.gotIt
					}
				}
			}
		}
	}) else ReactModule.createElement(PeekView, {
		hasScrim = true,
		mountAsFullView = true,
		returnToFullView = true,
		showDraggerInClosedState = false,
		thumbstickScrollEnabled = true,
		briefViewContentHeight = UDim.new(0, 0),
		viewStateChanged = UseResult1
	}, {
		Contents = ReactModule.createElement(View, {
			tag = "col size-full-0 auto-y gap-small padding-xxlarge align-x-left"
		}, { Title = UseMemoResult, TextContent = UseResult3() })
	})
end