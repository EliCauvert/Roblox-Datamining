local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local parent = friendsLanding.Parent
local dependenciesModule = require(friendsLanding.dependencies)
local roactRoduxModule = require(parent.RoactRodux)
local roactAppPolicy = require(parent.UniversalAppPolicy).RoactAppPolicy
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local appPage = require(parent.RobloxAppEnums).AppPage
local coreGui = dependenciesModule.CoreGui
local roact = dependenciesModule.Roact
local textService = dependenciesModule.TextService
local UIBlox = dependenciesModule.UIBlox
local withLocalization = dependenciesModule.withLocalization
local foundationModule = require(parent.Foundation)
local chip = foundationModule.Chip
local enums = foundationModule.Enums
local view = foundationModule.View
local text = foundationModule.Text
local images = UIBlox.App.ImageSet.Images
local impressionEventsModule = require(friendsLanding.FriendsLandingAnalytics.ImpressionEvents)
local pill = UIBlox.App.Control.Pill
local withStyle = UIBlox.Style.withStyle
local withTooltip = UIBlox.App.Dialog.TooltipV2.withTooltip
local tooltipOrientation = UIBlox.App.Dialog.Enum.TooltipOrientation
local filterStatesModule = require(friendsLanding.Friends.filterStates)
local pillWithAlertModule = require(friendsLanding.Components.PillWithAlert)
local chipFilterGroupModule = require(friendsLanding.Components.ChipFilterGroup)
local iconSize = UIBlox.App.ImageSet.Enum.IconSize
local getIconSize = UIBlox.App.ImageSet.getIconSize
local fFlagFixScalingOnFriendsLandingModule = require(friendsLanding.Flags.FFlagFixScalingOnFriendsLanding)
local fFlagConnectionManagementChips = require(parent.SharedFlags).FFlagConnectionManagementChips
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var9 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename
local fFlagFriendsPageUserListEnabled = require(parent.SharedFlags).FFlagFriendsPageUserListEnabled
local filterByButton = roact.PureComponent:extend("FilterByButton")
filterByButton.defaultProps = {
	analytics = nil,
	layoutOrder = 1,
	friendCount = 0,
	inactiveFriendCount = 0,
	isDisabled = false,
	showFriendPruningAlert = false,
	initialShowFriendPruningTooltip = false,
	onActivated = function() --[[ line: 55 ]] end,
	filter = filterStatesModule.All,
	onTooltipDismissal = function() --[[ line: 62 ]] end
}

function filterByButton.init(p0) --[[ line: 65 ]]
	-- upvalues: fFlagConnectionManagementChips (ref), filterStatesModule (ref), appPage (ref), fFlagConnectionsToFriendsRename (ref)
	p0.state = {
		hasDismissedFriendPruningTooltip = false,
		showFriendPruningTooltip = p0.props.initialShowFriendPruningTooltip
	}
	
	if fFlagConnectionManagementChips then
		p0.state.canAccessTrustedContacts = p0.props.canAccessTrustedContacts
	end
	function p0.convertFilterToTranslation(p1, p2) --[[ line: 75 ]]
		-- upvalues: filterStatesModule (copy), fFlagConnectionManagementChips (copy)
		return if p1 == filterStatesModule.All then p2.all elseif p1 == filterStatesModule.Online then p2.online elseif p1 == filterStatesModule.InExperience then p2.inExperience elseif p1 == filterStatesModule.Offline then p2.offline elseif p1 == filterStatesModule.Inactive then p2.inactive elseif fFlagConnectionManagementChips and p1 == filterStatesModule.Trusted then p2.trusted else nil
	end
	
	function p0.buildFilterText(p3, p4, p5) --[[ line: 93 ]]
		-- upvalues: p0 (ref)
		local var11 = p0.convertFilterToTranslation(p3, p4)
		
		return if p5 == 0 then var11 else var11 .. " (" .. p5 .. ")"
	end
	
	function p0.isSelected(p6) --[[ line: 102 ]]
		-- upvalues: filterStatesModule (copy)
		return p6 ~= filterStatesModule.All
	end
	
	function p0.dismissFriendPruningTooltip() --[[ line: 110 ]]
		-- upvalues: p0 (ref)
		p0:setState({
			showFriendPruningTooltip = false,
			hasDismissedFriendPruningTooltip = true
		})
		p0.props.onTooltipDismissal()
	end
	
	if fFlagConnectionManagementChips then
		function p0.onLearnMoreClicked() --[[ line: 119 ]]
			-- upvalues: p0 (ref), appPage (copy)
			p0.props.navigateDown({
				detail = "https://en.help.roblox.com/hc/articles/46158344285204",
				name = appPage.GenericWebPage,
				extraProps = { title = "" }
			})
		end
	end
	if fFlagConnectionManagementChips then
		function p0.getTrustedFilterText(p7) --[[ line: 129 ]]
			-- upvalues: fFlagConnectionsToFriendsRename (copy), p0 (ref)
			return if fFlagConnectionsToFriendsRename then if p0.props.canAccessTrustedContacts then p7.doMoreWithTrustedFriends else p7.trustedFriendsUnavailable elseif p0.props.canAccessTrustedContacts then p7.doMoreWithTrustedConnections else p7.trustedConnectionsUnavailable
		end
	end
end

function filterByButton.didMount(p8) --[[ line: 142 ]]
	-- upvalues: impressionEventsModule (ref)
	if p8.props.initialShowFriendPruningTooltip and p8.props.analytics then
		p8.props.analytics:impressionEvent(impressionEventsModule.FriendPruningTooltipSeen, {
			friendCount = tostring(p8.props.friendCount),
			inactiveFriendCount = tostring(p8.props.inactiveFriendCount)
		})
	end
end

function filterByButton.didUpdate(p9) --[[ line: 153 ]]
	p9:setState({
		showFriendPruningTooltip = p9.props.initialShowFriendPruningTooltip and not p9.state.hasDismissedFriendPruningTooltip
	})
end

function filterByButton.render(p10) --[[ line: 161 ]]
	-- upvalues: withStyle (ref), fFlagFixScalingOnFriendsLandingModule (ref), images (ref), fFlagConnectionManagementChips (ref), withLocalization (ref), tooltipOrientation (ref), coreGui (ref), roact (ref), withTooltip (ref), getIconSize (ref), iconSize (ref), textService (ref), pillWithAlertModule (ref), pill (ref), view (ref), fFlagFriendsPageUserListEnabled (ref), chipFilterGroupModule (ref), filterStatesModule (ref), text (ref), chip (ref), enums (ref)
	return withStyle(function(_) --[[ line: 162 ]]
		-- upvalues: fFlagFixScalingOnFriendsLandingModule (copy), images (copy), fFlagConnectionManagementChips (copy), withLocalization (copy), p10 (ref), tooltipOrientation (copy), coreGui (copy), roact (copy), withStyle (copy), withTooltip (copy), getIconSize (copy), iconSize (copy), textService (copy), pillWithAlertModule (copy), pill (copy), view (copy), fFlagFriendsPageUserListEnabled (copy), chipFilterGroupModule (copy), filterStatesModule (copy), text (copy), chip (copy), enums (copy)
		local var12 = if fFlagFixScalingOnFriendsLandingModule then "icons/actions/filter_small" else images["icons/actions/filter"]
		local t = {
			all = "Feature.Friends.Label.All",
			inactive = "Feature.Friends.Label.FewestInteractions",
			inExperience = "Feature.Friends.Label.InGame",
			tooltipHeader = "Feature.Friends.Label.ManageFriendsList",
			tooltipBody = "Feature.Friends.Label.ManageFriendsListCaption",
			online = "Common.Presence.Label.Online",
			offline = "Common.Presence.Label.Offline"
		}
		
		if fFlagConnectionManagementChips then
			t.trusted = "Feature.Friends.TrustedConnection.Label.Trusted"
			t.learnMore = "Feature.Chat.Action.LearnMore"
			t.doMoreWithTrustedConnections = "Feature.Friends.Description.DoMoreWithTrustedConnections"
			t.doMoreWithTrustedFriends = "Feature.Friends.Description.DoMoreWithTrustedFriends"
			t.trustedConnectionsUnavailable = "Feature.Friends.Description.TrustedConnectionsUnavailable"
			t.trustedFriendsUnavailable = "Feature.Friends.Description.TrustedFriendsUnavailable"
		end
		return withLocalization(t)(function(p11) --[[ line: 183 ]]
			-- upvalues: p10 (copy), fFlagConnectionManagementChips (copy), tooltipOrientation (copy), coreGui (copy), roact (copy), withStyle (copy), withTooltip (copy), getIconSize (copy), iconSize (copy), textService (copy), pillWithAlertModule (copy), var12 (ref), pill (copy), view (copy), fFlagFriendsPageUserListEnabled (copy), chipFilterGroupModule (copy), filterStatesModule (copy), text (copy), fFlagFixScalingOnFriendsLandingModule (copy), chip (copy), enums (copy)
			local filter = p10.props.filter
			local friendCount = p10.props.friendCount
			local isDisabled = p10.props.isDisabled
			local onActivated = p10.props.onActivated
			local var14 = p10.buildFilterText(filter, p11, friendCount)
			local maxWidth = nil
			local webViewSupported = nil
			
			if fFlagConnectionManagementChips then
				maxWidth = p10.props.maxWidth
				webViewSupported = p10.props.webViewSupported
			end
			local var20
			local t = {
				headerText = p11.tooltipHeader,
				bodyText = p11.tooltipBody
			}
			local t_1 = {
				active = true,
				DisplayOrder = 2,
				preferredOrientation = tooltipOrientation.Bottom,
				guiTarget = coreGui
			}
			local createElement = roact.createElement
			local var17 = "Frame"
			local t_2 = {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 36),
				LayoutOrder = p10.props.layoutOrder
			}
			local t_3 = {}
			
			if p10.state.showFriendPruningTooltip then
				var20 = withStyle(function(p12) --[[ line: 213 ]]
					-- upvalues: withTooltip (copy), t (ref), t_1 (ref), getIconSize (copy), iconSize (copy), textService (copy), var14 (ref), roact (copy), p10 (copy), coreGui (copy), pillWithAlertModule (copy), var12 (copy), isDisabled (ref), filter (ref), onActivated (ref), pill (copy)
					return withTooltip(t, t_1, function(p13) --[[ line: 214 ]]
						-- upvalues: p12 (ref), getIconSize (copy), iconSize (copy), textService (copy), var14 (copy), roact (copy), p10 (copy), coreGui (copy), pillWithAlertModule (copy), var12 (copy), isDisabled (copy), filter (copy), onActivated (copy), pill (copy)
						local font = p12.Font
						
						return roact.createElement("Frame", {
							Size = UDim2.fromOffset(textService:GetTextSize(var14, font.CaptionHeader.RelativeSize * font.BaseSize, font.CaptionHeader.Font, Vector2.new(10000, 10000)).X + 24 + 4 + getIconSize(iconSize.Small), 28),
							LayoutOrder = p10.props.layoutOrder,
							BackgroundTransparency = 1,
							[roact.Change.AbsoluteSize] = p13,
							[roact.Change.AbsolutePosition] = p13
						}, {
							PortalToCoreGui = roact.createElement(roact.Portal, { target = coreGui }, {
								ScreenGui = roact.createElement("ScreenGui", {
									DisplayOrder = 1,
									ZIndexBehavior = Enum.ZIndexBehavior.Sibling
								}, {
									DismissFriendPruningTooltipButton = roact.createElement("TextButton", {
										ZIndex = 0,
										BackgroundTransparency = 1,
										Size = UDim2.fromScale(1, 1),
										Text = "",
										[roact.Event.Activated] = p10.dismissFriendPruningTooltip,
										[roact.Event.TouchSwipe] = p10.dismissFriendPruningTooltip,
										[roact.Event.MouseWheelForward] = p10.dismissFriendPruningTooltip,
										[roact.Event.MouseWheelBackward] = p10.dismissFriendPruningTooltip
									})
								})
							}),
							FilterByButtonPillPossiblyWithAlert = if p10.props.showFriendPruningAlert then roact.createElement(pillWithAlertModule, {
								icon = var12,
								text = var14,
								isDisabled = isDisabled,
								isSelected = p10.isSelected(filter),
								onActivated = onActivated
							}) else roact.createElement(pill, {
								icon = var12,
								text = var14,
								isDisabled = isDisabled,
								isSelected = p10.isSelected(filter),
								onActivated = onActivated
							})
						})
					end)
				end)
			elseif p10.props.showFriendPruningAlert then
				var20 = roact.createElement(pillWithAlertModule, {
					icon = var12,
					text = var14,
					isDisabled = isDisabled,
					isSelected = p10.isSelected(filter),
					onActivated = onActivated
				})
			elseif fFlagConnectionManagementChips then
				local createElement_1
				var20 = roact.createElement
				local var21 = view
				local t_4 = {
					tag = if fFlagFriendsPageUserListEnabled then "auto-y size-full-0 flex-between gap-large padding-top-large" else "auto-y size-full-0 flex-between gap-large padding-top-large padding-bottom-large"
				}
				local t_5 = {
					UISizeConstraint = if maxWidth then roact.createElement("UISizeConstraint", { MaxSize = Vector2.new(maxWidth, 1e999) }) else nil,
					Layout = roact.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					FilterGroup = roact.createElement(chipFilterGroupModule, {
						LayoutOrder = 1,
						onActivated = onActivated,
						isDisabled = isDisabled
					})
				}
				
				if filterStatesModule.Trusted == filter then
					createElement_1 = roact.createElement
					createElement_1 = createElement_1(view, { tag = "auto-y size-full-0", LayoutOrder = 2 }, {
						Layout = roact.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Vertical,
							SortOrder = Enum.SortOrder.LayoutOrder,
							VerticalAlignment = Enum.VerticalAlignment.Top
						}),
						Content = roact.createElement(text, {
							LayoutOrder = 1,
							tag = "auto-y size-full-0 text-caption-medium text-align-x-left text-align-y-top text-wrap",
							Text = p10.getTrustedFilterText(p11)
						}),
						LearnMore = if webViewSupported and p10.props.canAccessTrustedContacts then roact.createElement(view, {
							LayoutOrder = 2,
							tag = "auto-y size-full-0 padding-top-xsmall"
						}, {
							Text = roact.createElement(text, {
								tag = "auto-xy text-caption-medium text-align-x-left text-align-y-top",
								RichText = true,
								Text = `<u>{p11.learnMore}</u>`,
								onActivated = p10.onLearnMoreClicked
							})
						}) else nil
					})
				else
					createElement_1 = nil
				end
				t_5.EducationText = createElement_1
				var20 = var20(var21, t_4, t_5)
			else
				var20 = if fFlagFixScalingOnFriendsLandingModule then roact.createElement(chip, {
					leading = {
						name = var12,
						iconName = enums.IconName.ThreeBarsHorizontalNarrowing,
						position = enums.IconPosition.Left
					},
					text = var14,
					isChecked = p10.isSelected(filter),
					onActivated = onActivated,
					isDisabled = isDisabled
				}) else roact.createElement(pill, {
					icon = var12,
					text = var14,
					isDisabled = isDisabled,
					isSelected = p10.isSelected(filter),
					onActivated = onActivated
				})
			end
			t_3.Button = var20
			
			return createElement(var17, t_2, t_3)
		end)
	end)
end

if fFlagConnectionManagementChips then
	filterByButton = roactRoduxModule.connect(function(_, _) --[[ line: 358 ]]
		return {}
	end, function(p14) --[[ line: 360 ]]
		-- upvalues: fFlagSignalsNavP3Dispatch (ref), var9 (ref), navigateDown (ref)
		return {
			navigateDown = function(p15) --[[ line: 362 ]]
				-- upvalues: fFlagSignalsNavP3Dispatch (copy), var9 (copy), p14 (ref), navigateDown (copy)
				return if fFlagSignalsNavP3Dispatch then var9.down(var9.fromLegacyPage(p15)) else p14(navigateDown(p15))
			end
		}
	end)(filterByButton)
	
	return roactAppPolicy.connect(function(p16) --[[ line: 372 ]]
		return { webViewSupported = p16.getWebViewSupport() }
	end)(filterByButton)
end
return filterByButton