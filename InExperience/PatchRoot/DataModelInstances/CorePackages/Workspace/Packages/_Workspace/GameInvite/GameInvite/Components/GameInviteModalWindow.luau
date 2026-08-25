local gameInvite = script:FindFirstAncestor("GameInvite")
local context = gameInvite.Context
local parent = gameInvite.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local fFlagGameInviteModalUnlockMouse = require(parent.SharedFlags).FFlagGameInviteModalUnlockMouse
local gameInviteModalLayoutContextModule = require(context.GameInviteModalLayoutContext)
local gameInviteModalManagerModule = require(gameInvite.GameInviteModalManager)
local useStyle = UIBloxModule.Core.Style.useStyle
local imageSet = UIBloxModule.Core.ImageSet
local images = UIBloxModule.App.ImageSet.Images
local rect = Rect.new(8, 8, 9, 9)

return function(p0)
	-- upvalues: useStyle (ref), reactModule (ref), gameInviteModalLayoutContextModule (ref), imageSet (ref), fFlagGameInviteModalUnlockMouse (ref), gameInviteModalManagerModule (ref), images (ref), rect (ref)
	local vector2, var9, uDim2
	local var6 = useStyle()
	local theme = var6.Theme
	local _ = nil
	local _ = nil
	local _ = nil
	local var7 = reactModule.useContext(gameInviteModalLayoutContextModule)
	local modalSize = var7.modalSize
	
	if var7.isFullWidth or var7.isFullHeight then
		vector2 = Vector2.new(0.5, 1)
		var9 = "component_assets/bullet_17"
		uDim2 = UDim2.new(0.5, 0, 1, 0)
	else
		vector2 = Vector2.new(0.5, 0.5)
		var9 = "component_assets/circle_17"
		uDim2 = UDim2.new(0.5, 0, 0.5, 0)
	end
	return reactModule.createElement(imageSet.ImageSetButton, {
		Selectable = false,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = var6.Theme.Overlay.Color,
		Transparency = var6.Theme.Overlay.Transparency,
		AutoButtonColor = false,
		Modal = if fFlagGameInviteModalUnlockMouse then true else nil,
		ZIndex = 0,
		[reactModule.Event.Activated] = function()
			-- upvalues: gameInviteModalManagerModule (copy)
			gameInviteModalManagerModule:closeModal()
		end
	}, {
		GameInviteModalContainer = reactModule.createElement(imageSet.ImageSetButton, {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutoButtonColor = false,
			ClipsDescendants = true,
			Selectable = false,
			Position = uDim2,
			Size = modalSize,
			AnchorPoint = vector2,
			Image = images[var9],
			ImageColor3 = theme.BackgroundDefault.Color,
			ImageTransparency = theme.BackgroundDefault.Transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = rect
		}, p0.children)
	})
end