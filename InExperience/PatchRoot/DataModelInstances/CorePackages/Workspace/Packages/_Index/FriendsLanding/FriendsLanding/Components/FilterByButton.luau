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
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
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
	onActivated = function() end,
	filter = filterStatesModule.All,
	onTooltipDismissal = function() end
}

function filterByButton.init(p1)
	-- upvalues: fFlagConnectionManagementChips (ref), filterStatesModule (ref), appPage (ref), fFlagConnectionsToFriendsRename (ref)
	p1.state = {
		hasDismissedFriendPruningTooltip = false,
		showFriendPruningTooltip = p1.props.initialShowFriendPruningTooltip
	}
	
	if fFlagConnectionManagementChips then
		p1.state.canAccessTrustedContacts = p1.props.canAccessTrustedContacts
	end
	function p0.convertFilterToTranslation(p2, p3)
		-- upvalues: filterStatesModule (copy), fFlagConnectionManagementChips (copy)
		return if p2 == filterStatesModule.All then p3.all elseif p2 == filterStatesModule.Online then p3.online elseif p2 == filterStatesModule.InExperience then p3.inExperience elseif p2 == filterStatesModule.Offline then p3.offline elseif p2 == filterStatesModule.Inactive then p3.inactive elseif fFlagConnectionManagementChips and p2 == filterStatesModule.Trusted then p3.trusted else nil
	end
	
	function p0.buildFilterText(p2, p3, p4)
		-- upvalues: p1 (ref)
		local var2 = p1.convertFilterToTranslation(p2, p3)
		
		return if p4 == 0 then var2 else var2 .. " (" .. p5 .. ")"
	end
	
	function p0.isSelected(p2)
		-- upvalues: filterStatesModule (copy)
		return p2 ~= filterStatesModule.All
	end
	
	function p0.dismissFriendPruningTooltip()
		-- upvalues: p1 (ref)
		p1:setState({
			showFriendPruningTooltip = false,
			hasDismissedFriendPruningTooltip = true
		})
		p1.props.onTooltipDismissal()
	end
	
	if fFlagConnectionManagementChips then
		function p0.onLearnMoreClicked()
			-- upvalues: p1 (ref), appPage (copy)
			p1.props.navigateDown({
				detail = "https://en.help.roblox.com/hc/articles/46158344285204",
				name = appPage.GenericWebPage,
				extraProps = { title = "" }
			})
		end
	end
	if fFlagConnectionManagementChips then
		function p0.getTrustedFilterText(p2)
			-- upvalues: fFlagConnectionsToFriendsRename (copy), p1 (ref)
			return if fFlagConnectionsToFriendsRename then if p1.props.canAccessTrustedContacts then p2.doMoreWithTrustedFriends else p2.trustedFriendsUnavailable elseif p1.props.canAccessTrustedContacts then p2.doMoreWithTrustedConnections else p2.trustedConnectionsUnavailable
		end
	end
end

function filterByButton.didMount(p1)
	-- upvalues: impressionEventsModule (ref)
	if p1.props.initialShowFriendPruningTooltip and p1.props.analytics then
		p1.props.analytics:impressionEvent(impressionEventsModule.FriendPruningTooltipSeen, {
			friendCount = tostring(p1.props.friendCount),
			inactiveFriendCount = tostring(p1.props.inactiveFriendCount)
		})
	end
end

function filterByButton.didUpdate(p1)
	p1:setState({
		showFriendPruningTooltip = p1.props.initialShowFriendPruningTooltip and not p1.state.hasDismissedFriendPruningTooltip
	})
end

function filterByButton.render(p1)
	-- upvalues: withStyle (ref), fFlagFixScalingOnFriendsLandingModule (ref), images (ref), fFlagConnectionManagementChips (ref), withLocalization (ref), tooltipOrientation (ref), coreGui (ref), roact (ref), withTooltip (ref), getIconSize (ref), iconSize (ref), textService (ref), pillWithAlertModule (ref), pill (ref), view (ref), fFlagFriendsPageUserListEnabled (ref), chipFilterGroupModule (ref), filterStatesModule (ref), text (ref), chip (ref), enums (ref)
	return withStyle(function(_)
		-- upvalues: fFlagFixScalingOnFriendsLandingModule (copy), images (copy), fFlagConnectionManagementChips (copy), withLocalization (copy), p1 (ref), tooltipOrientation (copy), coreGui (copy), roact (copy), withStyle (copy), withTooltip (copy), getIconSize (copy), iconSize (copy), textService (copy), pillWithAlertModule (copy), pill (copy), view (copy), fFlagFriendsPageUserListEnabled (copy), chipFilterGroupModule (copy), filterStatesModule (copy), text (copy), chip (copy), enums (copy)
		local var2 = if fFlagFixScalingOnFriendsLandingModule then "icons/actions/filter_small" else images["icons/actions/filter"]
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
		return withLocalization(t)(function(p2)
			-- upvalues: p1 (copy), fFlagConnectionManagementChips (copy), tooltipOrientation (copy), coreGui (copy), roact (copy), withStyle (copy), withTooltip (copy), getIconSize (copy), iconSize (copy), textService (copy), pillWithAlertModule (copy), var2 (ref), pill (copy), view (copy), fFlagFriendsPageUserListEnabled (copy), chipFilterGroupModule (copy), filterStatesModule (copy), text (copy), fFlagFixScalingOnFriendsLandingModule (copy), chip (copy), enums (copy)
			local filter = p1.props.filter
			local friendCount = p1.props.friendCount
			local isDisabled = p1.props.isDisabled
			local onActivated = p1.props.onActivated
			local var3 = p1.buildFilterText(filter, p2, friendCount)
			local maxWidth = nil
			local webViewSupported = nil
			
			if fFlagConnectionManagementChips then
				maxWidth = p1.props.maxWidth
				webViewSupported = p1.props.webViewSupported
			end
			local var4
			local t = {
				headerText = p2.tooltipHeader,
				bodyText = p2.tooltipBody
			}
			local t_1 = {
				active = true,
				DisplayOrder = 2,
				preferredOrientation = tooltipOrientation.Bottom,
				guiTarget = coreGui
			}
			local createElement = roact.createElement
			local var5 = "Frame"
			local t_2 = {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 36),
				LayoutOrder = p1.props.layoutOrder
			}
			local t_3 = {}
			
			if p1.state.showFriendPruningTooltip then
				var4 = withStyle(function(p3)
					-- upvalues: withTooltip (copy), t (ref), t_1 (ref), getIconSize (copy), iconSize (copy), textService (copy), var3 (ref), roact (copy), p1 (copy), coreGui (copy), pillWithAlertModule (copy), var2 (copy), isDisabled (ref), filter (ref), onActivated (ref), pill (copy)
					return withTooltip(t, t_1, function(p4)
						-- upvalues: p3 (ref), getIconSize (copy), iconSize (copy), textService (copy), var3 (copy), roact (copy), p1 (copy), coreGui (copy), pillWithAlertModule (copy), var2 (copy), isDisabled (copy), filter (copy), onActivated (copy), pill (copy)
						local font = p3.Font
						
						return roact.createElement("Frame", {
							Size = UDim2.fromOffset(textService:GetTextSize(var3, font.CaptionHeader.RelativeSize * font.BaseSize, font.CaptionHeader.Font, Vector2.new(10000, 10000)).X + 24 + 4 + getIconSize(iconSize.Small), 28),
							LayoutOrder = p1.props.layoutOrder,
							BackgroundTransparency = 1,
							[roact.Change.AbsoluteSize] = p4,
							[roact.Change.AbsolutePosition] = p4
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
										[roact.Event.Activated] = p1.dismissFriendPruningTooltip,
										[roact.Event.TouchSwipe] = p1.dismissFriendPruningTooltip,
										[roact.Event.MouseWheelForward] = p1.dismissFriendPruningTooltip,
										[roact.Event.MouseWheelBackward] = p1.dismissFriendPruningTooltip
									})
								})
							}),
							FilterByButtonPillPossiblyWithAlert = if p1.props.showFriendPruningAlert then roact.createElement(pillWithAlertModule, {
								icon = var2,
								text = var3,
								isDisabled = isDisabled,
								isSelected = p1.isSelected(filter),
								onActivated = onActivated
							}) else roact.createElement(pill, {
								icon = var2,
								text = var3,
								isDisabled = isDisabled,
								isSelected = p1.isSelected(filter),
								onActivated = onActivated
							})
						})
					end)
				end)
			elseif p1.props.showFriendPruningAlert then
				var4 = roact.createElement(pillWithAlertModule, {
					icon = var2,
					text = var3,
					isDisabled = isDisabled,
					isSelected = p1.isSelected(filter),
					onActivated = onActivated
				})
			elseif fFlagConnectionManagementChips then
				local createElement_1
				var4 = roact.createElement
				local var6 = view
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
							Text = p1.getTrustedFilterText(p2)
						}),
						LearnMore = if webViewSupported and p1.props.canAccessTrustedContacts then roact.createElement(view, {
							LayoutOrder = 2,
							tag = "auto-y size-full-0 padding-top-xsmall"
						}, {
							Text = roact.createElement(text, {
								tag = "auto-xy text-caption-medium text-align-x-left text-align-y-top",
								RichText = true,
								Text = `<u>{p2.learnMore}</u>`,
								onActivated = p1.onLearnMoreClicked
							})
						}) else nil
					})
				else
					createElement_1 = nil
				end
				t_5.EducationText = createElement_1
				var4 = var4(var6, t_4, t_5)
			else
				var4 = if fFlagFixScalingOnFriendsLandingModule then roact.createElement(chip, {
					leading = {
						name = var2,
						iconName = enums.IconName.ThreeBarsHorizontalNarrowing,
						position = enums.IconPosition.Left
					},
					text = var3,
					isChecked = p1.isSelected(filter),
					onActivated = onActivated,
					isDisabled = isDisabled
				}) else roact.createElement(pill, {
					icon = var2,
					text = var3,
					isDisabled = isDisabled,
					isSelected = p1.isSelected(filter),
					onActivated = onActivated
				})
			end
			t_3.Button = var4
			
			return createElement(var5, t_2, t_3)
		end)
	end)
end

if fFlagConnectionManagementChips then
	filterByButton = roactRoduxModule.connect(function(_, _)
		return {}
	end, function(p1)
		-- upvalues: fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref)
		return {
			navigateDown = function(p2)
				-- upvalues: fFlagSignalsNavP3Dispatch (copy), var1 (copy), p1 (ref), navigateDown (copy)
				return if fFlagSignalsNavP3Dispatch then var1.down(var1.fromLegacyPage(p2)) else p1(navigateDown(p2))
			end
		}
	end)(filterByButton)
	
	return roactAppPolicy.connect(function(p1)
		return { webViewSupported = p1.getWebViewSupport() }
	end)(filterByButton)
end
return filterByButton