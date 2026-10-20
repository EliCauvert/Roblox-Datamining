local Squads = script:FindFirstAncestor("Squads")
local Parent = Squads.Parent
local FFlagSquadsEnableFoundationTestIdsModule = require(Squads.Flags.FFlagSquadsEnableFoundationTestIds)
local ResponsiveModule = require(Parent.Responsive)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local DependenciesModule = require(Squads.dependencies)
local Foundation = DependenciesModule.Foundation
local React = DependenciesModule.React
local NetworkingSquads = DependenciesModule.NetworkingSquads
local NetworkStatus = DependenciesModule.RoduxNetworking.Enum.NetworkStatus
local UseEffectOnceFunction = DependenciesModule.Hooks.useEffectOnce
local UseDispatchFunction = DependenciesModule.Hooks.useDispatch
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local UseTokensFunction = Foundation.Hooks.useTokens
local UseCurrentSquadSelectorFunction = DependenciesModule.Hooks.useCurrentSquadSelector
local UseLocalizationFunction = DependenciesModule.Hooks.useLocalization
local ReinviteToSquadFunction = require(Parent.SquadsCore.Thunks).reinviteToSquad
local EventNamesModule = require(Parent.SquadsCore.EventNames)
local SquadExternalContractContext = require(Parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local UseCurrentSquadIdFunction = require(Parent.SquadsCore.Hooks).useCurrentSquadId
local AvatarGroup = Foundation.AvatarGroup
local AvatarGroupType = Foundation.Enums.AvatarGroupType
local InputSize = Foundation.Enums.InputSize
local NoResponseInviteAgainOrAddOthersEnumModule = require(Squads.Enums.NoResponseInviteAgainOrAddOthersEnum)
local SquadInvitePageNavSourceEnumModule = require(Squads.Enums.SquadInvitePageNavSourceEnum)

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseTokensFunction (copy), ResponsiveModule (copy), UseLocalUserIdFunction (copy), UseLocalizationFunction (copy), UseCurrentSquadSelectorFunction (copy), UseCurrentSquadIdFunction (copy), React (copy), NetworkingSquads (copy), UseSelectorFunction (copy), SquadExternalContractContext (copy), Foundation (copy), FFlagSquadsEnableFoundationTestIdsModule (copy), AvatarGroup (copy), InputSize (copy), AvatarGroupType (copy), UseEffectOnceFunction (copy), EventNamesModule (copy), NoResponseInviteAgainOrAddOthersEnumModule (copy), ReinviteToSquadFunction (copy), SquadInvitePageNavSourceEnumModule (copy), NetworkStatus (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseTokensResult = UseTokensFunction()
	local UseBreakpointXOrSmallerResult = ResponsiveModule.useBreakpointXOrSmaller(ResponsiveModule.Keys.XSmall)
	local UseBreakpointYOrSmallerResult = ResponsiveModule.useBreakpointYOrSmaller(ResponsiveModule.Keys.XSmall)
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		addOthers = "Feature.Squads.Action.AddOthers",
		upsellText = "Feature.Squads.Description.upsellInviteText",
		inviteText = "Feature.Squads.Action.Invite",
		inviteAgain = "Feature.Squads.Action.InviteAgain"
	})
	local UseCurrentSquadSelectorResult = UseCurrentSquadSelectorFunction()
	local ParentChannelId = if UseCurrentSquadSelectorResult and UseCurrentSquadSelectorResult.parentChannelId then UseCurrentSquadSelectorResult.parentChannelId else nil
	local UseCurrentSquadIdResult = UseCurrentSquadIdFunction()
	local UseSelectorResult = UseSelectorFunction((React.useCallback(function(p2)
		-- upvalues: NetworkingSquads (upval), UseCurrentSquadIdResult (copy)
		return NetworkingSquads.ReinviteToSquad.getStatus(p2, { squadId = UseCurrentSquadIdResult })
	end, { UseCurrentSquadIdResult })))
	local UseContextResult = React.useContext(SquadExternalContractContext)
	local UseGetConversationFromIdResult = UseContextResult.useGetConversationFromId(ParentChannelId or "")
	local UseMemoResult = React.useMemo(function()
		-- upvalues: React (upval), Foundation (upval), UseTokensResult (copy), UseLocalizationResult (copy), FFlagSquadsEnableFoundationTestIdsModule (upval)
		return React.createElement(Foundation.Text, {
			LayoutOrder = 1,
			TextWrapped = true,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0),
			fontStyle = UseTokensResult.Typography.BodyLarge,
			Text = UseLocalizationResult.upsellText,
			textStyle = UseTokensResult.Color.Content.Default,
			TextXAlignment = Enum.TextXAlignment.Center,
			testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-lobby-upsell-card--label" else nil
		})
	end, { UseTokensResult, UseLocalizationResult.upsellText })
	local UseMemoResult1 = React.useMemo(function()
		-- upvalues: UseGetConversationFromIdResult (copy), UseLocalUserIdResult (copy), UseBreakpointYOrSmallerResult (copy), UseBreakpointXOrSmallerResult (copy), React (upval), AvatarGroup (upval), InputSize (upval), AvatarGroupType (upval), UseTokensResult (copy), FFlagSquadsEnableFoundationTestIdsModule (upval)
		local Avatars = {}
		
		if UseGetConversationFromIdResult and UseGetConversationFromIdResult.participants then
			for _, participant in ipairs(UseGetConversationFromIdResult.participants) do
				if participant ~= UseLocalUserIdResult then
					table.insert(Avatars, participant)
				end
			end
		end
		return if UseBreakpointYOrSmallerResult or UseBreakpointXOrSmallerResult then nil else React.createElement(AvatarGroup, {
			max = 4,
			layoutOrder = 0,
			avatars = Avatars,
			size = InputSize.Medium,
			type = AvatarGroupType.Stacked,
			imageBackgroundStyle = {
				Color3 = UseTokensResult.Color.OverMedia.OverMedia_300.Color3,
				Transparency = UseTokensResult.Color.OverMedia.OverMedia_300.Transparency
			},
			imageBorderStyle = {
				Color = UseTokensResult.Color.Surface.Surface_0.Color3,
				Transparency = UseTokensResult.Color.Surface.Surface_0.Transparency
			},
			testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-lobby-upsell-card--facepile" else nil
		})
	end, {
		UseGetConversationFromIdResult and UseGetConversationFromIdResult.participants,
		UseLocalUserIdResult,
		UseBreakpointYOrSmallerResult,
		UseBreakpointXOrSmallerResult
	})
	UseEffectOnceFunction(function()
		-- upvalues: UseContextResult (copy), EventNamesModule (upval), NoResponseInviteAgainOrAddOthersEnumModule (upval), ParentChannelId (copy)
		UseContextResult.fireSquadAnalytics(EventNamesModule.NoResponseInviteAgainOrAddOthers, {
			actionType = NoResponseInviteAgainOrAddOthersEnumModule.Impression,
			button = NoResponseInviteAgainOrAddOthersEnumModule.InviteAgain,
			conversationId = ParentChannelId
		})
		UseContextResult.fireSquadAnalytics(EventNamesModule.NoResponseInviteAgainOrAddOthers, {
			actionType = NoResponseInviteAgainOrAddOthersEnumModule.Impression,
			button = NoResponseInviteAgainOrAddOthersEnumModule.AddOthers,
			conversationId = ParentChannelId
		})
	end, ParentChannelId)
	local UseResult = React.useCallback(function()
		-- upvalues: UseDispatchResult (copy), ReinviteToSquadFunction (upval), UseCurrentSquadIdResult (copy), UseContextResult (copy), EventNamesModule (upval), NoResponseInviteAgainOrAddOthersEnumModule (upval), ParentChannelId (copy)
		UseDispatchResult(ReinviteToSquadFunction(UseCurrentSquadIdResult, UseContextResult.setSquadPrompt))
		UseContextResult.fireSquadAnalytics(EventNamesModule.NoResponseInviteAgainOrAddOthers, {
			actionType = NoResponseInviteAgainOrAddOthersEnumModule.Click,
			button = NoResponseInviteAgainOrAddOthersEnumModule.InviteAgain,
			conversationId = ParentChannelId
		})
	end, { UseContextResult.fireSquadAnalytics, ParentChannelId })
	local UseResult1 = React.useCallback(function()
		-- upvalues: UseContextResult (copy), EventNamesModule (upval), NoResponseInviteAgainOrAddOthersEnumModule (upval), ParentChannelId (copy), SquadInvitePageNavSourceEnumModule (upval), p1 (copy)
		UseContextResult.fireSquadAnalytics(EventNamesModule.NoResponseInviteAgainOrAddOthers, {
			actionType = NoResponseInviteAgainOrAddOthersEnumModule.Click,
			button = NoResponseInviteAgainOrAddOthersEnumModule.AddOthers,
			conversationId = ParentChannelId
		})
		UseContextResult.fireSquadAnalytics(EventNamesModule.SquadInvitePageNavSource, {
			inviteNavSource = SquadInvitePageNavSourceEnumModule.SquadLobbyUpsellCardClicked,
			parentChannelId = ParentChannelId
		})
		p1.navigateToSquadInviteFriends()
	end, {
		ParentChannelId,
		UseContextResult.fireSquadAnalytics,
		p1.navigateToSquadInviteFriends
	})
	
	return React.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p1.size,
		LayoutOrder = p1.layoutOrder
	}, {
		React.createElement(Foundation.View, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.new(1, -2 * UseTokensResult.Stroke.Standard, 1, -2 * UseTokensResult.Stroke.Standard),
			cornerRadius = UDim.new(0, UseTokensResult.Radius.Medium),
			padding = UseTokensResult.Padding.XXLarge,
			layout = {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, if UseBreakpointYOrSmallerResult or UseBreakpointXOrSmallerResult then UseTokensResult.Padding.Medium else UseTokensResult.Padding.XXLarge),
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			},
			stroke = {
				Color = UseTokensResult.Color.Stroke.Default.Color3,
				Transparency = UseTokensResult.Color.Stroke.Default.Transparency,
				Thickness = UseTokensResult.Stroke.Standard
			},
			testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-lobby-upsell-card" else nil
		}, {
			UpsellInformation = React.createElement(Foundation.View, {
				LayoutOrder = 1,
				tag = "size-full-0 gap-medium align-x-center auto-y col"
			}, {
				UpsellFacepile = UseMemoResult1,
				UpsellLabel = UseMemoResult
			}),
			Buttons = React.createElement(Foundation.View, {
				LayoutOrder = 2,
				tag = {
					["size-full-0 gap-small align-x-center flex-fill align-y-center auto-y"] = true,
					col = UseBreakpointXOrSmallerResult,
					row = not UseBreakpointXOrSmallerResult
				}
			}, {
				InviteAgainButton = React.useMemo(function()
					-- upvalues: React (upval), Foundation (upval), UseSelectorResult (copy), NetworkStatus (upval), UseResult (copy), UseLocalizationResult (copy), FFlagSquadsEnableFoundationTestIdsModule (upval)
					return React.createElement(Foundation.Button, {
						LayoutOrder = 1,
						fillBehavior = Foundation.Enums.FillBehavior.Fill,
						isDisabled = UseSelectorResult == NetworkStatus.Fetching,
						onActivated = UseResult,
						text = UseLocalizationResult.inviteAgain,
						size = Foundation.Enums.InputSize.Medium,
						variant = Foundation.Enums.ButtonVariant.Standard,
						testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-lobby-upsell-card--invite-again-button" else nil
					})
				end, {
					UseResult,
					UseLocalizationResult.inviteAgain,
					UseSelectorResult
				}),
				AddOthersButton = React.useMemo(function()
					-- upvalues: React (upval), Foundation (upval), UseResult1 (copy), UseLocalizationResult (copy), FFlagSquadsEnableFoundationTestIdsModule (upval)
					return React.createElement(Foundation.Button, {
						LayoutOrder = 2,
						fillBehavior = Foundation.Enums.FillBehavior.Fill,
						onActivated = UseResult1,
						text = UseLocalizationResult.addOthers,
						size = Foundation.Enums.ButtonSize.Medium,
						variant = Foundation.Enums.ButtonVariant.Standard,
						testId = if FFlagSquadsEnableFoundationTestIdsModule then "--social-squad-lobby-upsell-card--add-others-button" else nil
					})
				end, { UseResult1, UseLocalizationResult.addOthers })
			})
		})
	})
end