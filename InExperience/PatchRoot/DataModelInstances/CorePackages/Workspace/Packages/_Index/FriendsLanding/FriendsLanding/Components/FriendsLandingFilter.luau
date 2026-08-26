local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local dependenciesModule = require(friendsLanding.dependencies)
local UIBlox = dependenciesModule.UIBlox
local roact = dependenciesModule.Roact
local memoize = dependenciesModule.memoize
local textService = dependenciesModule.TextService
local withLocalization = dependenciesModule.withLocalization
local partialPageModal = UIBlox.App.Dialog.Modal.PartialPageModal
local smallRadioButtonGroup = UIBlox.App.Cell.Small.SelectionGroup.SmallRadioButtonGroup
local buttonType = UIBlox.App.Button.Enum.ButtonType
local withStyle = UIBlox.Style.withStyle
local compose = dependenciesModule.SocialLibraries.RoduxTools.compose
local friendsLandingAnalyticsModule = require(friendsLanding.FriendsLandingAnalytics)
local buttonClickEventsModule = require(friendsLanding.FriendsLandingAnalytics.ButtonClickEvents)
local friendsLandingContextModule = require(friendsLanding.FriendsLandingContext)
local makeFilterButtonsModule = require(friendsLanding.Friends.makeFilterButtons)
local filterStatesModule = require(friendsLanding.Friends.filterStates)
local navigationParamKeysModule = require(script.navigationParamKeys)
local inputHandlers = dependenciesModule.InputHandlers
local focusNavigationUtils = dependenciesModule.FocusNavigationUtils
local focusNavigableSurfaceWrapper = focusNavigationUtils.FocusNavigableSurfaceWrapper
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtils.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtils.FocusNavigationEventNameEnum
local friendsLandingFilter = roact.PureComponent:extend("FriendsLandingFilter")
friendsLandingFilter.defaultProps = { analytics = nil, navigation = nil }

function friendsLandingFilter.init(p1)
	-- upvalues: focusNavigationEventNameEnum (ref), inputHandlers (ref), memoize (ref), buttonClickEventsModule (ref), filterStatesModule (ref), textService (ref), navigationParamKeysModule (ref)
	p1.state = { selectedValue = p1.props.filter }
	
	function p0.onClose()
		-- upvalues: p1 (ref)
		p1.props.navigation.goBack()
	end
	
	p1.focusEventHandlers = {
		[focusNavigationEventNameEnum.NavigateBack] = {
			handler = inputHandlers.onRelease(function(p2)
				-- upvalues: p1 (ref)
				p1.onClose()
				p2:cancel()
			end)
		}
	}
	p1.onApply = memoize(function(p2)
		-- upvalues: p1 (ref), buttonClickEventsModule (copy), filterStatesModule (copy)
		return function()
			-- upvalues: p1 (copy), buttonClickEventsModule (copy), p2 (ref), filterStatesModule (copy)
			p1.props.analytics:buttonClick(buttonClickEventsModule.FriendFilterApply, { filter = p1.state.selectedValue })
			p2(p1.state.selectedValue)
			p1.onClose()
			
			if p1.state.selectedValue == filterStatesModule.Inactive then
				p1.onFewestInteractionsSelection()()
			end
		end
	end)
	
	function p0.setSelectedValue(p2)
		-- upvalues: p1 (ref)
		p1:setState({ selectedValue = p2 })
	end
	
	function p0.onCurrentSelected(p2)
		-- upvalues: p1 (ref)
		return p2 == p1.state.selectedValue
	end
	
	function p0.getAlertPlacement(p2, p3, p4, p5)
		-- upvalues: textService (copy)
		local var1 = 0
		local var2 = ""
		
		for i, v in ipairs(p3) do
			if v.id == p2 then
				var1 = i
				var2 = v.text
				break
			end
		end
		assert(var1 ~= 0, "getAlertPlacement expects alertFilterId to have an entry in filterButtons")
		
		return UDim2.fromOffset(24 + textService:GetTextSize(var2, p5.Header2.RelativeSize * p5.BaseSize, p5.Header2.Font, Vector2.new(10000, 10000)).X + 12, (var1 - 1) * 57 + math.floor(28 - p4 / 2))
	end
	
	function p0.showInactiveFilterOption()
		-- upvalues: p1 (ref), navigationParamKeysModule (copy)
		return if p1.props.navigation.getParam then p1.props.navigation.getParam(navigationParamKeysModule.ShowInactiveFilterOption) else nil
	end
	
	function p0.onFewestInteractionsSelection()
		-- upvalues: p1 (ref), navigationParamKeysModule (copy)
		return if p1.props.navigation.getParam then p1.props.navigation.getParam(navigationParamKeysModule.OnFewestInteractionsSelection) else nil
	end
end

function friendsLandingFilter.render(p2)
	-- upvalues: withStyle (ref), withLocalization (ref), makeFilterButtonsModule (ref), roact (ref), partialPageModal (ref), buttonType (ref), smallRadioButtonGroup (ref), focusNavigableSurfaceWrapper (ref), focusNavigableSurfaceIdentifierEnum (ref)
	return withStyle(function(_)
		-- upvalues: withLocalization (copy), makeFilterButtonsModule (copy), p2 (ref), roact (copy), partialPageModal (copy), buttonType (copy), smallRadioButtonGroup (copy), focusNavigableSurfaceWrapper (copy), focusNavigableSurfaceIdentifierEnum (copy)
		return withLocalization({
			apply = "CommonUI.Messages.Action.Apply",
			all = "Feature.Friends.Label.All",
			inactive = "Feature.Friends.Label.FewestInteractions",
			inExperience = "Feature.Friends.Label.InGame",
			online = "Common.Presence.Label.Online",
			offline = "Common.Presence.Label.Offline",
			filterBy = "Feature.Friends.Heading.FilterBy",
			upsellNew = "Feature.Catalog.Label.New"
		})(function(p3)
			-- upvalues: makeFilterButtonsModule (copy), p2 (copy), roact (copy), partialPageModal (copy), buttonType (copy), smallRadioButtonGroup (copy), focusNavigableSurfaceWrapper (copy), focusNavigableSurfaceIdentifierEnum (copy)
			local var1 = makeFilterButtonsModule(p3, p2.showInactiveFilterOption())
			
			return roact.createElement(focusNavigableSurfaceWrapper, {
				isIsolated = true,
				surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
				customEventHandlers = p2.focusEventHandlers
			}, {
				Modal = roact.createElement(partialPageModal, {
					marginSize = 0,
					title = p3.filterBy,
					screenSize = p2.props.screenSize,
					onCloseClicked = p2.onClose,
					buttonStackProps = {
						buttons = {
							{
								buttonType = buttonType.PrimarySystem,
								props = {
									isDisabled = p2.onCurrentSelected(p2.props.filter),
									onActivated = p2.onApply(p2.props.setFilterKeys),
									text = p3.apply
								}
							}
						}
					}
				}, {
					ButtonContainer = roact.createElement("Frame", {
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, #var1 * 58 + 20)
					}, {
						RadioButtons = roact.createElement(smallRadioButtonGroup, {
							onActivated = p2.setSelectedValue,
							selectedValue = p2.state.selectedValue,
							items = var1
						})
					})
				})
			})
		end)
	end)
end

return compose(friendsLandingAnalyticsModule.connect(function(p2)
	return { analytics = p2 }
end), friendsLandingContextModule.connect(function(p2, _)
	return {
		filter = p2.filter,
		screenSize = p2.screenSize,
		setFilterKeys = p2.setFilterKeys
	}
end))(friendsLandingFilter)