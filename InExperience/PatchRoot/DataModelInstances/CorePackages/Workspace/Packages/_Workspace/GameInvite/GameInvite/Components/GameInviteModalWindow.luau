local GameInvite = script:FindFirstAncestor("GameInvite")
local Parent = GameInvite.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagGameInviteModalUnlockMouse = SharedFlagsModule.FFlagGameInviteModalUnlockMouse
local FFlagKeepSideSheetOpenBesideMenu = SharedFlagsModule.FFlagKeepSideSheetOpenBesideMenu
local GameInviteModalLayoutContextModule = require(GameInvite.Context.GameInviteModalLayoutContext)
local GameInviteModalManagerModule = require(GameInvite.GameInviteModalManager)
local UseInviteFriendsAreaBesideSideSheetModule = require(GameInvite.utils.useInviteFriendsAreaBesideSideSheet)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ImageSet = UIBloxModule.Core.ImageSet
local Images = UIBloxModule.App.ImageSet.Images
local _Rect = Rect.new(8, 8, 9, 9)

return function(p1)
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), GameInviteModalLayoutContextModule (copy), FFlagKeepSideSheetOpenBesideMenu (copy), UseInviteFriendsAreaBesideSideSheetModule (copy), ImageSet (copy), Images (copy), _Rect (copy), FFlagGameInviteModalUnlockMouse (copy), GameInviteModalManagerModule (copy)
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseContextResult = ReactModule.useContext(GameInviteModalLayoutContextModule)
	local IsFullWidth = UseContextResult.isFullWidth
	local IsFullHeight = UseContextResult.isFullHeight
	local ModalSize = UseContextResult.modalSize
	local UseInviteFriendsAreaBesideSideSheetModuleResult = if FFlagKeepSideSheetOpenBesideMenu then UseInviteFriendsAreaBesideSideSheetModule() else nil
	
	if UseInviteFriendsAreaBesideSideSheetModuleResult and not p1.isSpatialPanel then
		return ReactModule.createElement(ImageSet.ImageSetButton, {
			Name = "GameInviteBesideSideSheet",
			Selectable = false,
			BackgroundTransparency = 1,
			AutoButtonColor = false,
			Active = false,
			Modal = false,
			ZIndex = 0,
			Size = UDim2.fromOffset(UseInviteFriendsAreaBesideSideSheetModuleResult.size.X, UseInviteFriendsAreaBesideSideSheetModuleResult.size.Y),
			Position = UDim2.fromOffset(UseInviteFriendsAreaBesideSideSheetModuleResult.position.X, UseInviteFriendsAreaBesideSideSheetModuleResult.position.Y),
			AnchorPoint = Vector2.zero
		}, {
			GameInviteModalContainer = ReactModule.createElement(ImageSet.ImageSetButton, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AutoButtonColor = false,
				ClipsDescendants = true,
				Selectable = false,
				Position = UDim2.fromScale(0, 0),
				Size = UDim2.fromScale(1, 1),
				AnchorPoint = Vector2.zero,
				Image = Images["component_assets/circle_17"],
				ImageColor3 = Theme.BackgroundDefault.Color,
				ImageTransparency = Theme.BackgroundDefault.Transparency,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = _Rect
			}, p1.children)
		})
	end
	local _Vector2 = nil
	local v1 = nil
	local _UDim2 = nil
	if IsFullWidth or IsFullHeight then
		_Vector2 = Vector2.new(0.5, 1)
		v1 = "component_assets/bullet_17"
		_UDim2 = UDim2.new(0.5, 0, 1, 0)
	else
		_Vector2 = Vector2.new(0.5, 0.5)
		v1 = "component_assets/circle_17"
		_UDim2 = UDim2.new(0.5, 0, 0.5, 0)
	end
	return ReactModule.createElement(ImageSet.ImageSetButton, {
		Selectable = false,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = UseStyleResult.Theme.Overlay.Color,
		Transparency = UseStyleResult.Theme.Overlay.Transparency,
		AutoButtonColor = false,
		Modal = if FFlagGameInviteModalUnlockMouse then true else nil,
		ZIndex = 0,
		[ReactModule.Event.Activated] = function()
			-- upvalues: GameInviteModalManagerModule (upval)
			GameInviteModalManagerModule:closeModal()
		end
	}, {
		GameInviteModalContainer = ReactModule.createElement(ImageSet.ImageSetButton, {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutoButtonColor = false,
			ClipsDescendants = true,
			Selectable = false,
			Position = _UDim2,
			Size = ModalSize,
			AnchorPoint = _Vector2,
			Image = Images[v1],
			ImageColor3 = Theme.BackgroundDefault.Color,
			ImageTransparency = Theme.BackgroundDefault.Transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = _Rect
		}, p1.children)
	})
end