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

function friendsLandingFilter.init(p0) --[[ line: 46 ]]
	-- upvalues: focusNavigationEventNameEnum (ref), inputHandlers (ref), memoize (ref), buttonClickEventsModule (ref), filterStatesModule (ref), textService (ref), navigationParamKeysModule (ref)
	p0.state = { selectedValue = p0.props.filter }
	
	function p0.onClose() --[[ line: 52 ]]
		-- upvalues: p0 (ref)
		p0.props.navigation.goBack()
	end
	
	p0.focusEventHandlers = {
		[focusNavigationEventNameEnum.NavigateBack] = {
			handler = inputHandlers.onRelease(function(p1) --[[ line: 58 ]]
				-- upvalues: p0 (ref)
				p0.onClose()
				p1:cancel()
			end)
		}
	}
	p0.onApply = memoize(function(p2) --[[ line: 65 ]]
		-- upvalues: p0 (ref), buttonClickEventsModule (copy), filterStatesModule (copy)
		return function() --[[ line: 66 ]]
			-- upvalues: p0 (copy), buttonClickEventsModule (copy), p2 (ref), filterStatesModule (copy)
			p0.props.analytics:buttonClick(buttonClickEventsModule.FriendFilterApply, { filter = p0.state.selectedValue })
			p2(p0.state.selectedValue)
			p0.onClose()
			
			if p0.state.selectedValue == filterStatesModule.Inactive then
				p0.onFewestInteractionsSelection()()
			end
		end
	end)
	
	function p0.setSelectedValue(p3) --[[ line: 78 ]]
		-- upvalues: p0 (ref)
		p0:setState({ selectedValue = p3 })
	end
	
	function p0.onCurrentSelected(p4) --[[ line: 84 ]]
		-- upvalues: p0 (ref)
		return p4 == p0.state.selectedValue
	end
	
	function p0.getAlertPlacement(p5, p6, p7, p8) --[[ line: 88 ]]
		-- upvalues: textService (copy)
		local var9 = 0
		local var10 = ""
		
		for i, v in ipairs(p6) do
			if v.id == p5 then
				var9 = i
				var10 = v.text
				break
			end
		end
		assert(var9 ~= 0, "getAlertPlacement expects alertFilterId to have an entry in filterButtons")
		
		return UDim2.fromOffset(24 + textService:GetTextSize(var10, p8.Header2.RelativeSize * p8.BaseSize, p8.Header2.Font, Vector2.new(10000, 10000)).X + 12, (var9 - 1) * 57 + math.floor(28 - p7 / 2))
	end
	
	function p0.showInactiveFilterOption() --[[ line: 119 ]]
		-- upvalues: p0 (ref), navigationParamKeysModule (copy)
		return if p0.props.navigation.getParam then p0.props.navigation.getParam(navigationParamKeysModule.ShowInactiveFilterOption) else nil
	end
	
	function p0.onFewestInteractionsSelection() --[[ line: 125 ]]
		-- upvalues: p0 (ref), navigationParamKeysModule (copy)
		return if p0.props.navigation.getParam then p0.props.navigation.getParam(navigationParamKeysModule.OnFewestInteractionsSelection) else nil
	end
end

function friendsLandingFilter.render(p9) --[[ line: 132 ]]
	-- upvalues: withStyle (ref), withLocalization (ref), makeFilterButtonsModule (ref), roact (ref), partialPageModal (ref), buttonType (ref), smallRadioButtonGroup (ref), focusNavigableSurfaceWrapper (ref), focusNavigableSurfaceIdentifierEnum (ref)
	return withStyle(function(_) --[[ line: 133 ]]
		-- upvalues: withLocalization (copy), makeFilterButtonsModule (copy), p9 (ref), roact (copy), partialPageModal (copy), buttonType (copy), smallRadioButtonGroup (copy), focusNavigableSurfaceWrapper (copy), focusNavigableSurfaceIdentifierEnum (copy)
		return withLocalization({
			apply = "CommonUI.Messages.Action.Apply",
			all = "Feature.Friends.Label.All",
			inactive = "Feature.Friends.Label.FewestInteractions",
			inExperience = "Feature.Friends.Label.InGame",
			online = "Common.Presence.Label.Online",
			offline = "Common.Presence.Label.Offline",
			filterBy = "Feature.Friends.Heading.FilterBy",
			upsellNew = "Feature.Catalog.Label.New"
		})(function(p10) --[[ line: 143 ]]
			-- upvalues: makeFilterButtonsModule (copy), p9 (copy), roact (copy), partialPageModal (copy), buttonType (copy), smallRadioButtonGroup (copy), focusNavigableSurfaceWrapper (copy), focusNavigableSurfaceIdentifierEnum (copy)
			local var11 = makeFilterButtonsModule(p10, p9.showInactiveFilterOption())
			
			return roact.createElement(focusNavigableSurfaceWrapper, {
				isIsolated = true,
				surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
				customEventHandlers = p9.focusEventHandlers
			}, {
				Modal = roact.createElement(partialPageModal, {
					marginSize = 0,
					title = p10.filterBy,
					screenSize = p9.props.screenSize,
					onCloseClicked = p9.onClose,
					buttonStackProps = {
						buttons = {
							{
								buttonType = buttonType.PrimarySystem,
								props = {
									isDisabled = p9.onCurrentSelected(p9.props.filter),
									onActivated = p9.onApply(p9.props.setFilterKeys),
									text = p10.apply
								}
							}
						}
					}
				}, {
					ButtonContainer = roact.createElement("Frame", {
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, #var11 * 58 + 20)
					}, {
						RadioButtons = roact.createElement(smallRadioButtonGroup, {
							onActivated = p9.setSelectedValue,
							selectedValue = p9.state.selectedValue,
							items = var11
						})
					})
				})
			})
		end)
	end)
end

return compose(friendsLandingAnalyticsModule.connect(function(p11) --[[ line: 187 ]]
	return { analytics = p11 }
end), friendsLandingContextModule.connect(function(p12, _) --[[ line: 192 ]]
	return {
		filter = p12.filter,
		screenSize = p12.screenSize,
		setFilterKeys = p12.setFilterKeys
	}
end))(friendsLandingFilter)