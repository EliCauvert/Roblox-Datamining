local parent = script:FindFirstAncestor("TrustedContacts").Parent
local reactModule = require(parent.React)
local peekViewModule = require(parent.PeekView)
local peekView = peekViewModule.PeekView
local peekViewState = peekViewModule.PeekViewState
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UIBloxModule = require(parent.UIBlox)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local inputLabel = foundationModule.InputLabel
local inputLabelSize = foundationModule.Enums.InputLabelSize
local responsiveModule = require(parent.Responsive)
local usePreferredInput = responsiveModule.usePreferredInput
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local useNavigation = require(parent.Navigation).useNavigation
local useLocalization = require(parent.Localization).Hooks.useLocalization
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var5 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local analyticsModule = require(script.Parent.Parent.Parent.Analytics)
local useTCAnalytics = analyticsModule.useTCAnalytics
local eventNames = analyticsModule.EventNames
local friendsRenameModalUnboldText = game:DefineFastFlag("FriendsRenameModalUnboldText", false)

return function()
	-- upvalues: usePreferredInput (ref), useDispatch (ref), useScreenSize (ref), useNavigation (ref), useTCAnalytics (ref), reactModule (ref), eventNames (ref), responsiveModule (ref), useLocalization (ref), peekViewState (ref), useAppPolicy (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var5 (ref), navigateDown (ref), text (ref), view (ref), friendsRenameModalUnboldText (ref), inputLabel (ref), inputLabelSize (ref), interactiveAlert (ref), buttonType (ref), peekView (ref)
	local var8 = usePreferredInput()
	local var9 = useDispatch()
	local var10 = useScreenSize()
	local var11 = useNavigation()
	local fireAnalyticsEvent = useTCAnalytics().fireAnalyticsEvent
	reactModule.useEffect(function()
		-- upvalues: fireAnalyticsEvent (ref), eventNames (copy)
		fireAnalyticsEvent(eventNames.FriendsRenameInfoModalSeen)
	end, {})
	local var12 = var8 ~= responsiveModule.Input.Touch
	local var13 = useLocalization({
		gotIt = "Feature.Avatar.Action.GotIt",
		learnMore = "Feature.Chat.Action.LearnMore",
		introducingConnections = "Feature.Friends.Label.IntroducingConnections",
		renameInfoText = "Feature.Friends.Label.RenameInfoText"
	})
	local var14 = reactModule.useCallback(function()
		-- upvalues: var11 (ref)
		var11.pop()
	end, { var11 })
	local var15 = reactModule.useCallback(function(p0, _)
		-- upvalues: peekViewState (copy), var11 (ref)
		if p0 == peekViewState.Closed or p0 == peekViewState.Hidden then
			var11.goBack()
		end
	end, { var11 })
	local var16 = useAppPolicy(function(p1)
		return p1.getWebViewSupport()
	end)
	local var17 = reactModule.useCallback(function()
		-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var5 (copy), var9 (ref), navigateDown (copy)
		fireAnalyticsEvent(eventNames.FriendsRenameLearnMoreClicked)
		local t = {
			detail = "https://en.help.roblox.com/hc/en-us/articles/37725513985812",
			name = appPage.GenericWebPage,
			extraProps = { title = "" }
		}
		
		if fFlagSignalsNavP3Dispatch then
			var5.down(var5.fromLegacyPage(t))
			
			return
		end
		var9(navigateDown(t, nil))
	end, { var9 })
	local introducingConnections = var13.introducingConnections
	local var18 = reactModule.useCallback(function()
		-- upvalues: reactModule (copy), view (copy), var12 (ref), friendsRenameModalUnboldText (copy), text (copy), inputLabel (copy), inputLabelSize (copy), var13 (ref), var16 (ref), var17 (ref)
		return reactModule.createElement(view, {
			tag = "col size-full-0 auto-y gap-small padding-0",
			["align-x-left"] = not var12,
			["align-x-center"] = var12,
			LayoutOrder = 2
		}, {
			BodyText = reactModule.createElement(if friendsRenameModalUnboldText then text else inputLabel, {
				LayoutOrder = 1,
				RichText = true,
				tag = if friendsRenameModalUnboldText then "auto-y size-full-0 text-wrap grow text-align-x-left" else "auto-y size-full-0 text-wrap grow",
				size = if friendsRenameModalUnboldText then nil else inputLabelSize.Large,
				Text = var13.renameInfoText
			}),
			LearnMoreWebLink = var16 and reactModule.createElement(if friendsRenameModalUnboldText then text else inputLabel, {
				LayoutOrder = 2,
				RichText = true,
				tag = if friendsRenameModalUnboldText then "auto-y size-full-0 text-align-x-left" else "auto-y size-full-0",
				Text = `<u>{var13.learnMore}</u>`,
				size = if friendsRenameModalUnboldText then nil else inputLabelSize.Large,
				onActivated = var17
			})
		})
	end, { var17, var13, var12 })
	
	return if var12 then reactModule.createElement(interactiveAlert, {
		richText = true,
		screenSize = var10,
		title = introducingConnections,
		middleContent = var18,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = buttonType.Secondary,
					props = { onActivated = var14, text = var13.gotIt }
				}
			}
		}
	}) else reactModule.createElement(peekView, {
		hasScrim = true,
		mountAsFullView = true,
		returnToFullView = true,
		showDraggerInClosedState = false,
		thumbstickScrollEnabled = true,
		briefViewContentHeight = UDim.new(0, 0),
		viewStateChanged = var15
	}, {
		Contents = reactModule.createElement(view, {
			tag = "col size-full-0 auto-y gap-small padding-xxlarge align-x-left"
		}, {
			Title = reactModule.useMemo(function()
				-- upvalues: reactModule (copy), text (copy), introducingConnections (ref)
				return reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "auto-y size-full-0 text-align-x-left text-wrap text-heading-small",
					Text = introducingConnections
				})
			end, { introducingConnections }),
			TextContent = var18()
		})
	})
end