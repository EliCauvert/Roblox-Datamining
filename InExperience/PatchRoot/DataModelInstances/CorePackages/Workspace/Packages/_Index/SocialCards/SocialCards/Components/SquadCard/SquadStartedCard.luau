local parent = script:FindFirstAncestor("SocialCards").Parent
local foundationModule = require(parent.Foundation)
local getStandardSizeAvatarHeadShotRbxthumb = require(parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local imagePile = require(parent.AppBlox).ImagePile
local reactModule = require(parent.React)
local useNavigation = require(parent.Navigation).useNavigation
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useTokens = foundationModule.Hooks.useTokens
local squadJoinButtonModule = require(parent.Squads.SquadJoinButton)
local squadComponentAccessWrapperModule = require(parent.Squads.SquadComponentAccessWrapper)
local squadButtonSourceEnum = require(parent.Squads.Enums).SquadButtonSourceEnum

return function(p1)
	-- upvalues: useNavigation (ref), useTokens (ref), useLocalization (ref), reactModule (ref), getStandardSizeAvatarHeadShotRbxthumb (ref), imagePile (ref), foundationModule (ref), squadComponentAccessWrapperModule (ref), squadJoinButtonModule (ref), squadButtonSourceEnum (ref)
	local var1 = useNavigation()
	local var2 = useTokens()
	local var3 = useLocalization({
		onePersonActive = "Feature.Squads.Description.OnePersonActive",
		partyStarted = "Feature.Squads.Label.PartyStartedText",
		manyPeopleActive = {
			"Feature.Squads.Description.ManyPeopleActive",
			userCount = #p1.participantUserIds
		}
	})
	
	return reactModule.createElement(foundationModule.View, {
		tag = "bg-shift-200 radius-large",
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, var2.Gap.Small),
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		padding = {
			bottom = UDim.new(0, var2.Padding.Medium),
			left = UDim.new(0, var2.Padding.Large),
			right = UDim.new(0, var2.Padding.Large),
			top = UDim.new(0, var2.Padding.Medium)
		},
		selection = { Selectable = true }
	}, {
		InfoContainer = reactModule.createElement(foundationModule.View, {
			LayoutOrder = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0),
			layout = {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, var2.Gap.Large),
				VerticalAlignment = Enum.VerticalAlignment.Center
			}
		}, {
			Thumbnail = if #p1.participantUserIds > 0 then reactModule.createElement(foundationModule.View, {
				LayoutOrder = 1,
				Size = UDim2.fromOffset(var2.Size.Size_1000, var2.Size.Size_1000)
			}, {
				reactModule.useCallback(function(p2)
					-- upvalues: getStandardSizeAvatarHeadShotRbxthumb (copy), var2 (ref), reactModule (copy), imagePile (copy)
					local t = {}
					
					for i, v in ipairs(p2) do
						table.insert(t, {
							Image = getStandardSizeAvatarHeadShotRbxthumb(tostring(v)),
							BackgroundColor3 = var2.Color.Surface.Surface_200.Color3:lerp(var2.Color.ActionStandard.Background.Color3, 1 - var2.Color.ActionStandard.Background.Transparency)
						})
					end
					return reactModule.createElement(imagePile, {
						images = t,
						imageBorderColor = if var2.Config.Theme.IsUIBlox == "true" then var2.Color.Shift.Shift_200.Color3 else var2.Color.Surface.Surface_200.Color3
					})
				end, {})(p1.participantUserIds)
			}) else nil,
			TextContainer = reactModule.createElement(foundationModule.View, {
				LayoutOrder = 2,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = if #p1.participantUserIds > 0 then UDim2.new(1, (-var2.Size.Size_1000) - var2.Padding.Large, 0, 0) else UDim2.fromScale(1, 0),
				layout = {
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, var2.Gap.XSmall),
					SortOrder = Enum.SortOrder.LayoutOrder
				}
			}, {
				Title = reactModule.createElement(foundationModule.Text, {
					LayoutOrder = 1,
					AutomaticSize = Enum.AutomaticSize.XY,
					backgroundStyle = var2.Color.None,
					fontStyle = var2.Typography.TitleMedium,
					Text = var3.partyStarted,
					textStyle = var2.Color.Content.Emphasis,
					TextTruncate = Enum.TextTruncate.AtEnd
				}),
				Status = reactModule.createElement(foundationModule.Text, {
					LayoutOrder = 2,
					AutomaticSize = Enum.AutomaticSize.XY,
					backgroundStyle = var2.Color.None,
					fontStyle = var2.Typography.LabelSmall,
					Text = if #p1.participantUserIds == 1 then var3.onePersonActive else var3.manyPeopleActive,
					textStyle = var2.Color.Content.Muted,
					TextTruncate = Enum.TextTruncate.AtEnd
				})
			})
		}),
		ActionButton = reactModule.createElement(squadComponentAccessWrapperModule, { parentChannelId = p1.conversationId }, {
			reactModule.createElement(squadJoinButtonModule, {
				isFullWidth = true,
				isInCard = true,
				layoutOrder = 3,
				shouldAnimate = false,
				conversationId = p1.conversationId,
				onActivated = function()
					-- upvalues: var1 (ref), p1 (ref)
					var1.navigate("SquadLobby", { conversationId = p1.conversationId })
				end,
				squadButtonSource = squadButtonSourceEnum.PartyStartedCard,
				squadLocation = p1.squadLocation
			})
		})
	})
end