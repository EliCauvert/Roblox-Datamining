local FriendsMenu = script:FindFirstAncestor("FriendsMenu")
local Parent = FriendsMenu.Parent
local GetStandardSizeAvatarHeadShotRbxthumbFunction = require(Parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local FFlagFriendsMenuUseProfileFrameThumbnailModule = require(FriendsMenu.Flags.FFlagFriendsMenuUseProfileFrameThumbnail)
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Interactable = UIBloxModule.Core.Control.Interactable
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local _ = require(FriendsMenu.friendsMenuModalType)
local ConstantsModule = require(FriendsMenu.Constants)
local SelectedUsersContextModule = require(FriendsMenu.Context.SelectedUsersContext)
local _UDim = UDim.new(1, 0)

return (ReactModule.forwardRef(function(p1, Ref) --[[ Line: 27 ]]
	-- upvalues: ReactModule (copy), SelectedUsersContextModule (copy), UseStyleFunction (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (copy), FFlagFriendsMenuUseProfileFrameThumbnailModule (copy), Interactable (copy), ConstantsModule (copy), _UDim (copy), ImageSetLabel (copy), Images (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	local UseContextResult = ReactModule.useContext(SelectedUsersContextModule)
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	local UseResult = ReactModule.useCallback(function() --[[ Line: 37 ]]
		-- upvalues: p1 (copy), UseContextResult (copy)
		if p1.onRemoved then
			p1.onRemoved()
		end
		UseContextResult.removeFriend(p1.userId, p1.displayName)
	end, { p1.userId, UseContextResult.removeFriend, p1.onRemoved })
	
	return ReactModule.createElement(Interactable, {
		Size = UDim2.new(0, ConstantsModule.FRIEND_MENU_CARD_SIZE, 0, ConstantsModule.FRIEND_MENU_CARD_SIZE),
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		[ReactModule.Event.Activated] = if p1.unremovable then nil else UseResult,
		ref = Ref
	}, {
		AvatarContainer = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.fromScale(0.5, 0),
			Size = UDim2.fromOffset(60, 60)
		}, {
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = _UDim }),
			Avatar = ReactModule.createElement(ImageSetLabel, {
				ZIndex = 1,
				Size = UDim2.fromOffset(60, 60),
				BackgroundColor3 = Theme.UIDefault.Color,
				Image = GetStandardSizeAvatarHeadShotRbxthumbFunction(p1.userId, FFlagFriendsMenuUseProfileFrameThumbnailModule)
			}, {
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = _UDim })
			}),
			CloseButton = if p1.unremovable then nil else ReactModule.createElement(ImageSetLabel, {
				ZIndex = 2,
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.fromScale(1, 0),
				Size = UDim2.fromOffset(16, 16),
				BackgroundTransparency = Theme.SystemPrimaryDefault.Transparency,
				BackgroundColor3 = Theme.SystemPrimaryDefault.Color,
				Image = Images["icons/navigation/close_small"],
				ImageColor3 = Theme.SystemPrimaryContent.Color
			}, {
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = _UDim })
			})
		}),
		DisplayName = ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 1),
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = UDim2.fromScale(0.5, 1),
			Size = UDim2.fromOffset(ConstantsModule.FRIEND_MENU_CARD_SIZE, 0),
			Font = if FoundationFontFaceMigration then nil else UseStyleResultFont.Footer.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.CaptionSmall.Font) else nil,
			Text = p1.displayName,
			TextColor3 = Theme.TextDefault.Color,
			TextSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Footer.RelativeSize,
			TextTransparency = Theme.TextDefault.Transparency,
			TextTruncate = Enum.TextTruncate.AtEnd
		})
	})
end))