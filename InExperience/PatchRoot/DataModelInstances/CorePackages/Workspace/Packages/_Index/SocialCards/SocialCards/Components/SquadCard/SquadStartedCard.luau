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

return function(p0)
	-- upvalues: useNavigation (ref), useTokens (ref), useLocalization (ref), reactModule (ref), getStandardSizeAvatarHeadShotRbxthumb (ref), imagePile (ref), foundationModule (ref), squadComponentAccessWrapperModule (ref), squadJoinButtonModule (ref), squadButtonSourceEnum (ref)
	local var4 = useNavigation()
	local var5 = useTokens()
	local var6 = useLocalization({
		onePersonActive = "Feature.Squads.Description.OnePersonActive",
		partyStarted = "Feature.Squads.Label.PartyStartedText",
		manyPeopleActive = {
			"Feature.Squads.Description.ManyPeopleActive",
			userCount = #p0.participantUserIds
		}
	})
	
	return reactModule.createElement(foundationModule.View, {
		tag = "bg-shift-200 radius-large",
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, var5.Gap.Small),
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		padding = {
			bottom = UDim.new(0, var5.Padding.Medium),
			left = UDim.new(0, var5.Padding.Large),
			right = UDim.new(0, var5.Padding.Large),
			top = UDim.new(0, var5.Padding.Medium)
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
				Padding = UDim.new(0, var5.Gap.Large),
				VerticalAlignment = Enum.VerticalAlignment.Center
			}
		}, {
			Thumbnail = if #p0.participantUserIds > 0 then reactModule.createElement(foundationModule.View, {
				LayoutOrder = 1,
				Size = UDim2.fromOffset(var5.Size.Size_1000, var5.Size.Size_1000)
			}, {
				reactModule.useCallback(function(p1)
					-- upvalues: getStandardSizeAvatarHeadShotRbxthumb (copy), var5 (ref), reactModule (copy), imagePile (copy)
					local t = {}
					
					for i, v in ipairs(p1) do
						table.insert(t, {
							Image = getStandardSizeAvatarHeadShotRbxthumb(tostring(v)),
							BackgroundColor3 = var5.Color.Surface.Surface_200.Color3:lerp(var5.Color.ActionStandard.Background.Color3, 1 - var5.Color.ActionStandard.Background.Transparency)
						})
					end
					return reactModule.createElement(imagePile, {
						images = t,
						imageBorderColor = if var5.Config.Theme.IsUIBlox == "true" then var5.Color.Shift.Shift_200.Color3 else var5.Color.Surface.Surface_200.Color3
					})
				end, {})(p0.participantUserIds)
			}) else nil,
			TextContainer = reactModule.createElement(foundationModule.View, {
				LayoutOrder = 2,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = if #p0.participantUserIds > 0 then UDim2.new(1, (-var5.Size.Size_1000) - var5.Padding.Large, 0, 0) else UDim2.fromScale(1, 0),
				layout = {
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, var5.Gap.XSmall),
					SortOrder = Enum.SortOrder.LayoutOrder
				}
			}, {
				Title = reactModule.createElement(foundationModule.Text, {
					LayoutOrder = 1,
					AutomaticSize = Enum.AutomaticSize.XY,
					backgroundStyle = var5.Color.None,
					fontStyle = var5.Typography.TitleMedium,
					Text = var6.partyStarted,
					textStyle = var5.Color.Content.Emphasis,
					TextTruncate = Enum.TextTruncate.AtEnd
				}),
				Status = reactModule.createElement(foundationModule.Text, {
					LayoutOrder = 2,
					AutomaticSize = Enum.AutomaticSize.XY,
					backgroundStyle = var5.Color.None,
					fontStyle = var5.Typography.LabelSmall,
					Text = if #p0.participantUserIds == 1 then var6.onePersonActive else var6.manyPeopleActive,
					textStyle = var5.Color.Content.Muted,
					TextTruncate = Enum.TextTruncate.AtEnd
				})
			})
		}),
		ActionButton = reactModule.createElement(squadComponentAccessWrapperModule, { parentChannelId = p0.conversationId }, {
			reactModule.createElement(squadJoinButtonModule, {
				isFullWidth = true,
				isInCard = true,
				layoutOrder = 3,
				shouldAnimate = false,
				conversationId = p0.conversationId,
				onActivated = function()
					-- upvalues: var4 (ref), p0 (ref)
					var4.navigate("SquadLobby", { conversationId = p0.conversationId })
				end,
				squadButtonSource = squadButtonSourceEnum.PartyStartedCard,
				squadLocation = p0.squadLocation
			})
		})
	})
end