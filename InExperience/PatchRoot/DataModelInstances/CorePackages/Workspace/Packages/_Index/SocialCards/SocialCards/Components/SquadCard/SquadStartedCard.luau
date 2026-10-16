local Parent = script:FindFirstAncestor("SocialCards").Parent
local FoundationModule = require(Parent.Foundation)
local GetStandardSizeAvatarHeadShotRbxthumbFunction = require(Parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local ImagePile = require(Parent.AppBlox).ImagePile
local ReactModule = require(Parent.React)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseTokensFunction = FoundationModule.Hooks.useTokens
local SquadJoinButtonModule = require(Parent.Squads.SquadJoinButton)
local SquadComponentAccessWrapperModule = require(Parent.Squads.SquadComponentAccessWrapper)
local SquadButtonSourceEnum = require(Parent.Squads.Enums).SquadButtonSourceEnum

return function(p1) --[[ Line: 23 | Named "SquadStartedCard" ]]
	-- upvalues: UseNavigationFunction (copy), UseTokensFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (copy), ImagePile (copy), FoundationModule (copy), SquadComponentAccessWrapperModule (copy), SquadJoinButtonModule (copy), SquadButtonSourceEnum (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		onePersonActive = "Feature.Squads.Description.OnePersonActive",
		partyStarted = "Feature.Squads.Label.PartyStartedText",
		manyPeopleActive = {
			"Feature.Squads.Description.ManyPeopleActive",
			userCount = #p1.participantUserIds
		}
	})
	local UseResult = ReactModule.useCallback(function(List) --[[ Line: 32 ]]
		-- upvalues: GetStandardSizeAvatarHeadShotRbxthumbFunction (upval), UseTokensResult (copy), ReactModule (upval), ImagePile (upval)
		local Images = {}
		
		for _, value in ipairs(List) do
			table.insert(Images, {
				Image = GetStandardSizeAvatarHeadShotRbxthumbFunction((tostring(value))),
				BackgroundColor3 = UseTokensResult.Color.Surface.Surface_200.Color3:lerp(UseTokensResult.Color.ActionStandard.Background.Color3, 1 - UseTokensResult.Color.ActionStandard.Background.Transparency)
			})
		end
		return ReactModule.createElement(ImagePile, {
			images = Images,
			imageBorderColor = if UseTokensResult.Config.Theme.IsUIBlox == "true" then UseTokensResult.Color.Shift.Shift_200.Color3 else UseTokensResult.Color.Surface.Surface_200.Color3
		})
	end, {})
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "bg-shift-200 radius-large",
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, UseTokensResult.Gap.Small),
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		padding = {
			bottom = UDim.new(0, UseTokensResult.Padding.Medium),
			left = UDim.new(0, UseTokensResult.Padding.Large),
			right = UDim.new(0, UseTokensResult.Padding.Large),
			top = UDim.new(0, UseTokensResult.Padding.Medium)
		},
		selection = { Selectable = true }
	}, {
		InfoContainer = ReactModule.createElement(FoundationModule.View, {
			LayoutOrder = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0),
			layout = {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, UseTokensResult.Gap.Large),
				VerticalAlignment = Enum.VerticalAlignment.Center
			}
		}, {
			Thumbnail = if #p1.participantUserIds > 0 then ReactModule.createElement(FoundationModule.View, {
				LayoutOrder = 1,
				Size = UDim2.fromOffset(UseTokensResult.Size.Size_1000, UseTokensResult.Size.Size_1000)
			}, { UseResult(p1.participantUserIds) }) else nil,
			TextContainer = ReactModule.createElement(FoundationModule.View, {
				LayoutOrder = 2,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = if #p1.participantUserIds > 0 then UDim2.new(1, -UseTokensResult.Size.Size_1000 - UseTokensResult.Padding.Large, 0, 0) else UDim2.fromScale(1, 0),
				layout = {
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, UseTokensResult.Gap.XSmall),
					SortOrder = Enum.SortOrder.LayoutOrder
				}
			}, {
				Title = ReactModule.createElement(FoundationModule.Text, {
					LayoutOrder = 1,
					AutomaticSize = Enum.AutomaticSize.XY,
					backgroundStyle = UseTokensResult.Color.None,
					fontStyle = UseTokensResult.Typography.TitleMedium,
					Text = UseLocalizationResult.partyStarted,
					textStyle = UseTokensResult.Color.Content.Emphasis,
					TextTruncate = Enum.TextTruncate.AtEnd
				}),
				Status = ReactModule.createElement(FoundationModule.Text, {
					LayoutOrder = 2,
					AutomaticSize = Enum.AutomaticSize.XY,
					backgroundStyle = UseTokensResult.Color.None,
					fontStyle = UseTokensResult.Typography.LabelSmall,
					Text = if #p1.participantUserIds == 1 then UseLocalizationResult.onePersonActive else UseLocalizationResult.manyPeopleActive,
					textStyle = UseTokensResult.Color.Content.Muted,
					TextTruncate = Enum.TextTruncate.AtEnd
				})
			})
		}),
		ActionButton = ReactModule.createElement(SquadComponentAccessWrapperModule, { parentChannelId = p1.conversationId }, {
			ReactModule.createElement(SquadJoinButtonModule, {
				isFullWidth = true,
				isInCard = true,
				layoutOrder = 3,
				shouldAnimate = false,
				conversationId = p1.conversationId,
				onActivated = function() --[[ Line: 133 ]]
					-- upvalues: UseNavigationResult (copy), p1 (copy)
					UseNavigationResult.navigate("SquadLobby", { conversationId = p1.conversationId })
				end,
				squadButtonSource = SquadButtonSourceEnum.PartyStartedCard,
				squadLocation = p1.squadLocation
			})
		})
	})
end