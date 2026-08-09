local friendsMenu = script:FindFirstAncestor("FriendsMenu")
local parent = friendsMenu.Parent
local context = friendsMenu.Context
local getStandardSizeAvatarHeadShotRbxthumb = require(parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local interactable = UIBloxModule.Core.Control.Interactable
local useStyle = UIBloxModule.Core.Style.useStyle
local _ = require(friendsMenu.friendsMenuModalType)
local constantsModule = require(friendsMenu.Constants)
local selectedUsersContextModule = require(context.SelectedUsersContext)
local uDim = UDim.new(1, 0)

return reactModule.forwardRef(function(p0, p1) --[[ line: 23 ]]
	-- upvalues: reactModule (ref), selectedUsersContextModule (ref), useStyle (ref), getStandardSizeAvatarHeadShotRbxthumb (ref), interactable (ref), constantsModule (ref), uDim (ref), imageSetLabel (ref), images (ref)
	local var6 = reactModule.useContext(selectedUsersContextModule)
	local var7 = useStyle()
	local theme = var7.Theme
	local font = var7.Font
	
	return reactModule.createElement(interactable, {
		Size = UDim2.new(0, constantsModule.FRIEND_MENU_CARD_SIZE, 0, constantsModule.FRIEND_MENU_CARD_SIZE),
		BackgroundTransparency = 1,
		LayoutOrder = p0.layoutOrder,
		[reactModule.Event.Activated] = if p0.unremovable then nil else reactModule.useCallback(function() --[[ line: 33 ]]
			-- upvalues: p0 (ref), var6 (ref)
			if p0.onRemoved then
				p0.onRemoved()
			end
			var6.removeFriend(p0.userId, p0.displayName)
		end, { p0.userId, var6.removeFriend, p0.onRemoved }),
		ref = p1
	}, {
		AvatarContainer = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.fromScale(0.5, 0),
			Size = UDim2.fromOffset(60, 60)
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = uDim }),
			Avatar = reactModule.createElement(imageSetLabel, {
				ZIndex = 1,
				Size = UDim2.fromOffset(60, 60),
				BackgroundColor3 = theme.UIDefault.Color,
				Image = getStandardSizeAvatarHeadShotRbxthumb(p0.userId)
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = uDim })
			}),
			CloseButton = if p0.unremovable then nil else reactModule.createElement(imageSetLabel, {
				ZIndex = 2,
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.fromScale(1, 0),
				Size = UDim2.fromOffset(16, 16),
				BackgroundTransparency = theme.SystemPrimaryDefault.Transparency,
				BackgroundColor3 = theme.SystemPrimaryDefault.Color,
				Image = images["icons/navigation/close_small"],
				ImageColor3 = theme.SystemPrimaryContent.Color
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = uDim })
			})
		}),
		DisplayName = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 1),
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = UDim2.fromScale(0.5, 1),
			Size = UDim2.fromOffset(constantsModule.FRIEND_MENU_CARD_SIZE, 0),
			Font = font.Footer.Font,
			Text = p0.displayName,
			TextColor3 = theme.TextDefault.Color,
			TextSize = font.BaseSize * font.Footer.RelativeSize,
			TextTransparency = theme.TextDefault.Transparency,
			TextTruncate = Enum.TextTruncate.AtEnd
		})
	})
end)