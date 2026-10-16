local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local DependenciesModule = require(FriendsLanding.dependencies)
local UIBlox = DependenciesModule.UIBlox
local Roact = DependenciesModule.Roact
local MemoizeFunction = DependenciesModule.memoize
local TextService = DependenciesModule.TextService
local WithLocalizationFunction = DependenciesModule.withLocalization
local PartialPageModal = UIBlox.App.Dialog.Modal.PartialPageModal
local SmallRadioButtonGroup = UIBlox.App.Cell.Small.SelectionGroup.SmallRadioButtonGroup
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local WithStyleFunction = UIBlox.Style.withStyle
local ComposeFunction = DependenciesModule.SocialLibraries.RoduxTools.compose
local FriendsLandingAnalyticsModule = require(FriendsLanding.FriendsLandingAnalytics)
local ButtonClickEventsModule = require(FriendsLanding.FriendsLandingAnalytics.ButtonClickEvents)
local FriendsLandingContextModule = require(FriendsLanding.FriendsLandingContext)
local MakeFilterButtonsModule = require(FriendsLanding.Friends.makeFilterButtons)
local FilterStatesModule = require(FriendsLanding.Friends.filterStates)
local NavigationParamKeysModule = require(script.navigationParamKeys)
local InputHandlers = DependenciesModule.InputHandlers
local FocusNavigationUtils = DependenciesModule.FocusNavigationUtils
local FocusNavigableSurfaceWrapper = FocusNavigationUtils.FocusNavigableSurfaceWrapper
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtils.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtils.FocusNavigationEventNameEnum
local FriendsLandingFilter = Roact.PureComponent:extend("FriendsLandingFilter")
FriendsLandingFilter.defaultProps = { analytics = nil, navigation = nil }

function FriendsLandingFilter.init(p1) --[[ Line: 46 ]]
	-- upvalues: FocusNavigationEventNameEnum (copy), InputHandlers (copy), MemoizeFunction (copy), ButtonClickEventsModule (copy), FilterStatesModule (copy), TextService (copy), NavigationParamKeysModule (copy)
	p1.state = { selectedValue = p1.props.filter }
	
	function p1.onClose() --[[ Line: 52 ]]
		-- upvalues: p1 (copy)
		p1.props.navigation.goBack()
	end
	
	p1.focusEventHandlers = {
		[FocusNavigationEventNameEnum.NavigateBack] = {
			handler = InputHandlers.onRelease(function(p2) --[[ Line: 58 ]]
				-- upvalues: p1 (copy)
				p1.onClose()
				p2:cancel()
			end)
		}
	}
	p1.onApply = MemoizeFunction(function(Callback) --[[ Line: 65 ]]
		-- upvalues: p1 (copy), ButtonClickEventsModule (upval), FilterStatesModule (upval)
		return function() --[[ Line: 66 ]]
			-- upvalues: p1 (upval), ButtonClickEventsModule (upval), Callback (copy), FilterStatesModule (upval)
			p1.props.analytics:buttonClick(ButtonClickEventsModule.FriendFilterApply, { filter = p1.state.selectedValue })
			Callback(p1.state.selectedValue)
			p1.onClose()
			
			if p1.state.selectedValue == FilterStatesModule.Inactive then
				p1.onFewestInteractionsSelection()()
			end
		end
	end)
	
	function p1.setSelectedValue(SelectedValue) --[[ Line: 78 ]]
		-- upvalues: p1 (copy)
		p1:setState({ selectedValue = SelectedValue })
	end
	
	function p1.onCurrentSelected(Filter): boolean --[[ Line: 84 ]]
		-- upvalues: p1 (copy)
		return Filter == p1.state.selectedValue
	end
	
	function p1.getAlertPlacement(Id, List, p2: number, p3): UDim2 --[[ Line: 88 ]]
		-- upvalues: TextService (upval)
		local v1 = 0
		local String = ""
		
		for i, value in ipairs(List) do
			if value.id == Id then
				v1 = i
				String = value.text
				break
			end
		end
		assert(v1 ~= 0, "getAlertPlacement expects alertFilterId to have an entry in filterButtons")
		
		return UDim2.fromOffset(24 + TextService:GetTextSize(String, p3.Header2.RelativeSize * p3.BaseSize, p3.Header2.Font, Vector2.new(10000, 10000)).X + 12, (v1 - 1) * 57 + math.floor(28 - p2 / 2))
	end
	
	function p1.showInactiveFilterOption() --[[ Line: 119 ]]
		-- upvalues: p1 (copy), NavigationParamKeysModule (upval)
		return if p1.props.navigation.getParam then p1.props.navigation.getParam(NavigationParamKeysModule.ShowInactiveFilterOption) else nil
	end
	
	function p1.onFewestInteractionsSelection() --[[ Line: 125 ]]
		-- upvalues: p1 (copy), NavigationParamKeysModule (upval)
		return if p1.props.navigation.getParam then p1.props.navigation.getParam(NavigationParamKeysModule.OnFewestInteractionsSelection) else nil
	end
end

function FriendsLandingFilter.render(p2) --[[ Line: 132 ]]
	-- upvalues: WithStyleFunction (copy), WithLocalizationFunction (copy), MakeFilterButtonsModule (copy), Roact (copy), PartialPageModal (copy), ButtonType (copy), SmallRadioButtonGroup (copy), FocusNavigableSurfaceWrapper (copy), FocusNavigableSurfaceIdentifierEnum (copy)
	return WithStyleFunction(function(_) --[[ Line: 133 ]]
		-- upvalues: WithLocalizationFunction (upval), MakeFilterButtonsModule (upval), p2 (copy), Roact (upval), PartialPageModal (upval), ButtonType (upval), SmallRadioButtonGroup (upval), FocusNavigableSurfaceWrapper (upval), FocusNavigableSurfaceIdentifierEnum (upval)
		return WithLocalizationFunction({
			apply = "CommonUI.Messages.Action.Apply",
			all = "Feature.Friends.Label.All",
			inactive = "Feature.Friends.Label.FewestInteractions",
			inExperience = "Feature.Friends.Label.InGame",
			online = "Common.Presence.Label.Online",
			offline = "Common.Presence.Label.Offline",
			filterBy = "Feature.Friends.Heading.FilterBy",
			upsellNew = "Feature.Catalog.Label.New"
		})(function(p3) --[[ Line: 143 ]]
			-- upvalues: MakeFilterButtonsModule (upval), p2 (upval), Roact (upval), PartialPageModal (upval), ButtonType (upval), SmallRadioButtonGroup (upval), FocusNavigableSurfaceWrapper (upval), FocusNavigableSurfaceIdentifierEnum (upval)
			local FilterButtonsModule = MakeFilterButtonsModule(p3, p2.showInactiveFilterOption())
			
			return (Roact.createElement(FocusNavigableSurfaceWrapper, {
				isIsolated = true,
				surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
				customEventHandlers = p2.focusEventHandlers
			}, {
				Modal = Roact.createElement(PartialPageModal, {
					marginSize = 0,
					title = p3.filterBy,
					screenSize = p2.props.screenSize,
					onCloseClicked = p2.onClose,
					buttonStackProps = {
						buttons = {
							{
								buttonType = ButtonType.PrimarySystem,
								props = {
									isDisabled = p2.onCurrentSelected(p2.props.filter),
									onActivated = p2.onApply(p2.props.setFilterKeys),
									text = p3.apply
								}
							}
						}
					}
				}, {
					ButtonContainer = Roact.createElement("Frame", {
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, #FilterButtonsModule * 58 + 20)
					}, {
						RadioButtons = Roact.createElement(SmallRadioButtonGroup, {
							onActivated = p2.setSelectedValue,
							selectedValue = p2.state.selectedValue,
							items = FilterButtonsModule
						})
					})
				})
			}))
		end)
	end)
end

return ComposeFunction(FriendsLandingAnalyticsModule.connect(function(Analytics) --[[ Line: 187 ]]
	return { analytics = Analytics }
end), FriendsLandingContextModule.connect(function(p2, _) --[[ Line: 192 ]]
	return {
		filter = p2.filter,
		screenSize = p2.screenSize,
		setFilterKeys = p2.setFilterKeys
	}
end))(FriendsLandingFilter)