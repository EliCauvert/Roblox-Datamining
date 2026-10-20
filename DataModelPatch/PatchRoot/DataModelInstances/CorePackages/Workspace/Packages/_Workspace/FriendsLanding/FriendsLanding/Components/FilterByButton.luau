local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local Parent = FriendsLanding.Parent
local DependenciesModule = require(FriendsLanding.dependencies)
local RoactRoduxModule = require(Parent.RoactRodux)
local RoactAppPolicy = require(Parent.UniversalAppPolicy).RoactAppPolicy
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local AppPage = require(Parent.RobloxAppEnums).AppPage
local CoreGui = DependenciesModule.CoreGui
local Roact = DependenciesModule.Roact
local TextService = DependenciesModule.TextService
local UIBlox = DependenciesModule.UIBlox
local WithLocalizationFunction = DependenciesModule.withLocalization
local FoundationModule = require(Parent.Foundation)
local Chip = FoundationModule.Chip
local Enums = FoundationModule.Enums
local View = FoundationModule.View
local Text = FoundationModule.Text
local Images = UIBlox.App.ImageSet.Images
local ImpressionEventsModule = require(FriendsLanding.FriendsLandingAnalytics.ImpressionEvents)
local Pill = UIBlox.App.Control.Pill
local WithStyleFunction = UIBlox.Style.withStyle
local WithTooltipFunction = UIBlox.App.Dialog.TooltipV2.withTooltip
local TooltipOrientation = UIBlox.App.Dialog.Enum.TooltipOrientation
local FilterStatesModule = require(FriendsLanding.Friends.filterStates)
local PillWithAlertModule = require(FriendsLanding.Components.PillWithAlert)
local ChipFilterGroupModule = require(FriendsLanding.Components.ChipFilterGroup)
local IconSize = UIBlox.App.ImageSet.Enum.IconSize
local GetIconSizeFunction = UIBlox.App.ImageSet.getIconSize
local FFlagFixScalingOnFriendsLandingModule = require(FriendsLanding.Flags.FFlagFixScalingOnFriendsLanding)
local FFlagConnectionManagementChips = require(Parent.SharedFlags).FFlagConnectionManagementChips
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local FFlagConnectionsToFriendsRename = require(Parent.SharedFlags).FFlagConnectionsToFriendsRename
local FFlagFriendsPageUserListEnabled = require(Parent.SharedFlags).FFlagFriendsPageUserListEnabled
local FilterByButton = Roact.PureComponent:extend("FilterByButton")
FilterByButton.defaultProps = {
	analytics = nil,
	layoutOrder = 1,
	friendCount = 0,
	inactiveFriendCount = 0,
	isDisabled = false,
	showFriendPruningAlert = false,
	initialShowFriendPruningTooltip = false,
	onActivated = function() end,
	filter = FilterStatesModule.All,
	onTooltipDismissal = function() end
}

function FilterByButton.init(p1)
	-- upvalues: FFlagConnectionManagementChips (copy), FilterStatesModule (copy), AppPage (copy), FFlagConnectionsToFriendsRename (copy)
	p1.state = {
		hasDismissedFriendPruningTooltip = false,
		showFriendPruningTooltip = p1.props.initialShowFriendPruningTooltip
	}
	
	if FFlagConnectionManagementChips then
		p1.state.canAccessTrustedContacts = p1.props.canAccessTrustedContacts
	end
	function p1.convertFilterToTranslation(All, p2)
		-- upvalues: FilterStatesModule (upval), FFlagConnectionManagementChips (upval)
		return if All == FilterStatesModule.All then p2.all elseif All == FilterStatesModule.Online then p2.online elseif All == FilterStatesModule.InExperience then p2.inExperience elseif All == FilterStatesModule.Offline then p2.offline elseif All == FilterStatesModule.Inactive then p2.inactive elseif FFlagConnectionManagementChips and All == FilterStatesModule.Trusted then p2.trusted else nil
	end
	
	function p1.buildFilterText(Filter, p2, FriendCount)
		-- upvalues: p1 (copy)
		local ConvertFilterToTranslationResult = p1.convertFilterToTranslation(Filter, p2)
		
		return if FriendCount == 0 then ConvertFilterToTranslationResult else ConvertFilterToTranslationResult .. " (" .. FriendCount .. ")"
	end
	
	function p1.isSelected(Filter): boolean
		-- upvalues: FilterStatesModule (upval)
		return Filter ~= FilterStatesModule.All
	end
	
	function p1.dismissFriendPruningTooltip()
		-- upvalues: p1 (copy)
		p1:setState({
			showFriendPruningTooltip = false,
			hasDismissedFriendPruningTooltip = true
		})
		p1.props.onTooltipDismissal()
	end
	
	if FFlagConnectionManagementChips then
		function p1.onLearnMoreClicked()
			-- upvalues: p1 (copy), AppPage (upval)
			p1.props.navigateDown({
				detail = "https://en.help.roblox.com/hc/articles/46158344285204",
				name = AppPage.GenericWebPage,
				extraProps = { title = "" }
			})
		end
	end
	if FFlagConnectionManagementChips then
		function p1.getTrustedFilterText(p2)
			-- upvalues: FFlagConnectionsToFriendsRename (upval), p1 (copy)
			return if FFlagConnectionsToFriendsRename then if p1.props.canAccessTrustedContacts then p2.doMoreWithTrustedFriends else p2.trustedFriendsUnavailable elseif p1.props.canAccessTrustedContacts then p2.doMoreWithTrustedConnections else p2.trustedConnectionsUnavailable
		end
	end
end

function FilterByButton.didMount(p1)
	-- upvalues: ImpressionEventsModule (copy)
	if p1.props.initialShowFriendPruningTooltip and p1.props.analytics then
		p1.props.analytics:impressionEvent(ImpressionEventsModule.FriendPruningTooltipSeen, {
			friendCount = tostring(p1.props.friendCount),
			inactiveFriendCount = tostring(p1.props.inactiveFriendCount)
		})
	end
end

function FilterByButton.didUpdate(p1)
	p1:setState({
		showFriendPruningTooltip = p1.props.initialShowFriendPruningTooltip and not p1.state.hasDismissedFriendPruningTooltip
	})
end

function FilterByButton.render(p1)
	-- upvalues: WithStyleFunction (copy), FFlagFixScalingOnFriendsLandingModule (copy), Images (copy), FFlagConnectionManagementChips (copy), WithLocalizationFunction (copy), TooltipOrientation (copy), CoreGui (copy), Roact (copy), WithTooltipFunction (copy), GetIconSizeFunction (copy), IconSize (copy), TextService (copy), PillWithAlertModule (copy), Pill (copy), View (copy), FFlagFriendsPageUserListEnabled (copy), ChipFilterGroupModule (copy), FilterStatesModule (copy), Text (copy), Chip (copy), Enums (copy)
	return WithStyleFunction(function(_)
		-- upvalues: FFlagFixScalingOnFriendsLandingModule (upval), Images (upval), FFlagConnectionManagementChips (upval), WithLocalizationFunction (upval), p1 (copy), TooltipOrientation (upval), CoreGui (upval), Roact (upval), WithStyleFunction (upval), WithTooltipFunction (upval), GetIconSizeFunction (upval), IconSize (upval), TextService (upval), PillWithAlertModule (upval), Pill (upval), View (upval), FFlagFriendsPageUserListEnabled (upval), ChipFilterGroupModule (upval), FilterStatesModule (upval), Text (upval), Chip (upval), Enums (upval)
		local FilterSmall = if FFlagFixScalingOnFriendsLandingModule then "icons/actions/filter_small" else Images["icons/actions/filter"]
		local config = {
			all = "Feature.Friends.Label.All",
			inactive = "Feature.Friends.Label.FewestInteractions",
			inExperience = "Feature.Friends.Label.InGame",
			tooltipHeader = "Feature.Friends.Label.ManageFriendsList",
			tooltipBody = "Feature.Friends.Label.ManageFriendsListCaption",
			online = "Common.Presence.Label.Online",
			offline = "Common.Presence.Label.Offline"
		}
		
		if FFlagConnectionManagementChips then
			config.trusted = "Feature.Friends.TrustedConnection.Label.Trusted"
			config.learnMore = "Feature.Chat.Action.LearnMore"
			config.doMoreWithTrustedConnections = "Feature.Friends.Description.DoMoreWithTrustedConnections"
			config.doMoreWithTrustedFriends = "Feature.Friends.Description.DoMoreWithTrustedFriends"
			config.trustedConnectionsUnavailable = "Feature.Friends.Description.TrustedConnectionsUnavailable"
			config.trustedFriendsUnavailable = "Feature.Friends.Description.TrustedFriendsUnavailable"
		end
		return WithLocalizationFunction(config)(function(p2)
			-- upvalues: p1 (upval), FFlagConnectionManagementChips (upval), TooltipOrientation (upval), CoreGui (upval), Roact (upval), WithStyleFunction (upval), WithTooltipFunction (upval), GetIconSizeFunction (upval), IconSize (upval), TextService (upval), PillWithAlertModule (upval), FilterSmall (copy), Pill (upval), View (upval), FFlagFriendsPageUserListEnabled (upval), ChipFilterGroupModule (upval), FilterStatesModule (upval), Text (upval), FFlagFixScalingOnFriendsLandingModule (upval), Chip (upval), Enums (upval)
			local Filter = p1.props.filter
			local IsDisabled = p1.props.isDisabled
			local OnActivated = p1.props.onActivated
			local FilterText = p1.buildFilterText(Filter, p2, p1.props.friendCount)
			local X = nil
			local WebViewSupported = nil
			
			if FFlagConnectionManagementChips then
				X = p1.props.maxWidth
				WebViewSupported = p1.props.webViewSupported
			end
			local config = {
				headerText = p2.tooltipHeader,
				bodyText = p2.tooltipBody
			}
			local config1 = {
				active = true,
				DisplayOrder = 2,
				preferredOrientation = TooltipOrientation.Bottom,
				guiTarget = CoreGui
			}
			
			return Roact.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 36),
				LayoutOrder = p1.props.layoutOrder
			}, {
				Button = if p1.state.showFriendPruningTooltip then WithStyleFunction(function(p3)
					-- upvalues: WithTooltipFunction (upval), config (copy), config1 (copy), GetIconSizeFunction (upval), IconSize (upval), TextService (upval), FilterText (copy), Roact (upval), p1 (upval), CoreGui (upval), PillWithAlertModule (upval), FilterSmall (upval), IsDisabled (copy), Filter (copy), OnActivated (copy), Pill (upval)
					return WithTooltipFunction(config, config1, function(p4)
						-- upvalues: p3 (copy), GetIconSizeFunction (upval), IconSize (upval), TextService (upval), FilterText (upval), Roact (upval), p1 (upval), CoreGui (upval), PillWithAlertModule (upval), FilterSmall (upval), IsDisabled (upval), Filter (upval), OnActivated (upval), Pill (upval)
						local _Font = p3.Font
						
						return Roact.createElement("Frame", {
							Size = UDim2.fromOffset(TextService:GetTextSize(FilterText, _Font.CaptionHeader.RelativeSize * _Font.BaseSize, _Font.CaptionHeader.Font, Vector2.new(10000, 10000)).X + 24 + 4 + GetIconSizeFunction(IconSize.Small), 28),
							LayoutOrder = p1.props.layoutOrder,
							BackgroundTransparency = 1,
							[Roact.Change.AbsoluteSize] = p4,
							[Roact.Change.AbsolutePosition] = p4
						}, {
							PortalToCoreGui = Roact.createElement(Roact.Portal, { target = CoreGui }, {
								ScreenGui = Roact.createElement("ScreenGui", {
									DisplayOrder = 1,
									ZIndexBehavior = Enum.ZIndexBehavior.Sibling
								}, {
									DismissFriendPruningTooltipButton = Roact.createElement("TextButton", {
										ZIndex = 0,
										BackgroundTransparency = 1,
										Size = UDim2.fromScale(1, 1),
										Text = "",
										[Roact.Event.Activated] = p1.dismissFriendPruningTooltip,
										[Roact.Event.TouchSwipe] = p1.dismissFriendPruningTooltip,
										[Roact.Event.MouseWheelForward] = p1.dismissFriendPruningTooltip,
										[Roact.Event.MouseWheelBackward] = p1.dismissFriendPruningTooltip
									})
								})
							}),
							FilterByButtonPillPossiblyWithAlert = if p1.props.showFriendPruningAlert then Roact.createElement(PillWithAlertModule, {
								icon = FilterSmall,
								text = FilterText,
								isDisabled = IsDisabled,
								isSelected = p1.isSelected(Filter),
								onActivated = OnActivated
							}) else Roact.createElement(Pill, {
								icon = FilterSmall,
								text = FilterText,
								isDisabled = IsDisabled,
								isSelected = p1.isSelected(Filter),
								onActivated = OnActivated
							})
						})
					end)
				end) elseif p1.props.showFriendPruningAlert then Roact.createElement(PillWithAlertModule, {
					icon = FilterSmall,
					text = FilterText,
					isDisabled = IsDisabled,
					isSelected = p1.isSelected(Filter),
					onActivated = OnActivated
				}) elseif FFlagConnectionManagementChips then Roact.createElement(View, {
					tag = if FFlagFriendsPageUserListEnabled then "auto-y size-full-0 flex-between gap-large padding-top-large" else "auto-y size-full-0 flex-between gap-large padding-top-large padding-bottom-large"
				}, {
					UISizeConstraint = if X then Roact.createElement("UISizeConstraint", { MaxSize = Vector2.new(X, 1e999) }) else nil,
					Layout = Roact.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					FilterGroup = Roact.createElement(ChipFilterGroupModule, {
						LayoutOrder = 1,
						onActivated = OnActivated,
						isDisabled = IsDisabled
					}),
					EducationText = if FilterStatesModule.Trusted == Filter then Roact.createElement(View, { tag = "auto-y size-full-0", LayoutOrder = 2 }, {
						Layout = Roact.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Vertical,
							SortOrder = Enum.SortOrder.LayoutOrder,
							VerticalAlignment = Enum.VerticalAlignment.Top
						}),
						Content = Roact.createElement(Text, {
							LayoutOrder = 1,
							tag = "auto-y size-full-0 text-caption-medium text-align-x-left text-align-y-top text-wrap",
							Text = p1.getTrustedFilterText(p2)
						}),
						LearnMore = if WebViewSupported and p1.props.canAccessTrustedContacts then Roact.createElement(View, {
							LayoutOrder = 2,
							tag = "auto-y size-full-0 padding-top-xsmall"
						}, {
							Text = Roact.createElement(Text, {
								tag = "auto-xy text-caption-medium text-align-x-left text-align-y-top",
								RichText = true,
								Text = `<u>{p2.learnMore}</u>`,
								onActivated = p1.onLearnMoreClicked
							})
						}) else nil
					}) else nil
				}) elseif FFlagFixScalingOnFriendsLandingModule then Roact.createElement(Chip, {
					leading = {
						name = FilterSmall,
						iconName = Enums.IconName.ThreeBarsHorizontalNarrowing,
						position = Enums.IconPosition.Left
					},
					text = FilterText,
					isChecked = p1.isSelected(Filter),
					onActivated = OnActivated,
					isDisabled = IsDisabled
				}) else Roact.createElement(Pill, {
					icon = FilterSmall,
					text = FilterText,
					isDisabled = IsDisabled,
					isSelected = p1.isSelected(Filter),
					onActivated = OnActivated
				})
			})
		end)
	end)
end

if FFlagConnectionManagementChips then
	FilterByButton = RoactRoduxModule.connect(function(_, _)
		return {}
	end, function(Callback)
		-- upvalues: FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
		return {
			navigateDown = function(p1)
				-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownFunction (upval)
				return if FFlagSignalsNavP3Dispatch then NavigationCommands.down(NavigationCommands.fromLegacyPage(p1)) else Callback(NavigateDownFunction(p1))
			end
		}
	end)(FilterByButton)
	
	return RoactAppPolicy.connect(function(p1)
		return { webViewSupported = p1.getWebViewSupport() }
	end)(FilterByButton)
else
	return FilterByButton
end