local GameInvite = script:FindFirstAncestor("GameInvite")
local Parent = GameInvite.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local FFlagGameInviteModalUnlockMouse = require(Parent.SharedFlags).FFlagGameInviteModalUnlockMouse
local GameInviteModalLayoutContextModule = require(GameInvite.Context.GameInviteModalLayoutContext)
local GameInviteModalManagerModule = require(GameInvite.GameInviteModalManager)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ImageSet = UIBloxModule.Core.ImageSet
local Images = UIBloxModule.App.ImageSet.Images
local _Rect = Rect.new(8, 8, 9, 9)

return function(p1) --[[ Line: 22 ]]
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), GameInviteModalLayoutContextModule (copy), ImageSet (copy), FFlagGameInviteModalUnlockMouse (copy), GameInviteModalManagerModule (copy), Images (copy), _Rect (copy)
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseContextResult = ReactModule.useContext(GameInviteModalLayoutContextModule)
	local IsFullHeight = UseContextResult.isFullHeight
	local ModalSize = UseContextResult.modalSize
	local _Vector2 = nil
	local v1 = nil
	local _UDim2 = nil
	
	if UseContextResult.isFullWidth or IsFullHeight then
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
		[ReactModule.Event.Activated] = function() --[[ Line: 52 ]]
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