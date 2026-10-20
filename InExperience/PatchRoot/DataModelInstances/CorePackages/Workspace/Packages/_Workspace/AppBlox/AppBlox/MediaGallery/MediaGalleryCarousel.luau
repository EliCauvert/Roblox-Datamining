local Parent = script:FindFirstAncestor("AppBlox").Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local _ = require(script.Parent.MediaGalleryTypes)
local _UDim2 = UDim2.fromScale(0.4, 0.512)
local _UDim2_1 = UDim2.fromScale(0.25, 0.33)
local config = {
	numItemsShown = 3.5,
	itemAspectRatio = 1.7777777777777777,
	itemPadding = 16,
	borderRadius = UDim.new(0, 8)
}

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), ReactModule (copy), Button (copy), ButtonType (copy), _UDim2 (copy), ImageSetLabel (copy), _UDim2_1 (copy), Images (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.zero)
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: JoinResult (copy), UseStateResult2 (copy)
		local XRatio = (Frame.AbsoluteSize.X - JoinResult.itemPadding * (JoinResult.numItemsShown - 1)) / JoinResult.numItemsShown
		UseStateResult2(Vector2.new(XRatio, XRatio / JoinResult.itemAspectRatio))
	end, { JoinResult.itemAspectRatio, JoinResult.numItemsShown })
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: JoinResult (copy)
		if JoinResult.onVideoPlayActivated and JoinResult.items[p2].isYouTubeVideo then
			return JoinResult.onVideoPlayActivated(p2)
		elseif not JoinResult.onPreviewActivated then return end
		return JoinResult.onPreviewActivated(p2)
	end, {
		JoinResult.items,
		JoinResult.onVideoPlayActivated,
		JoinResult.onPreviewActivated
	})
	local ImageButtons = {}
	
	for LayoutOrder, item in JoinResult.items do
		ImageButtons["Item" .. LayoutOrder] = ReactModule.createElement("ImageButton", {
			LayoutOrder = LayoutOrder,
			Size = UDim2.fromOffset(UseStateResult.X, UseStateResult.Y),
			Image = item.imageId,
			ScaleType = Enum.ScaleType.Crop,
			BackgroundTransparency = 1,
			AutoButtonColor = false,
			[ReactModule.Event.Activated] = function()
				-- upvalues: UseResult1 (copy), LayoutOrder (copy)
				UseResult1(LayoutOrder)
			end
		}, {
			Corner = ReactModule.createElement("UICorner", { CornerRadius = JoinResult.borderRadius }),
			PlayButton = if item.isYouTubeVideo then ReactModule.createElement(Button, {
				buttonType = ButtonType.PrimaryContextual,
				size = _UDim2,
				anchorPoint = Vector2.new(0.5, 0.5),
				position = UDim2.fromScale(0.5, 0.5),
				onActivated = function()
					-- upvalues: UseResult1 (copy), LayoutOrder (copy)
					UseResult1(LayoutOrder)
				end
			}) else nil,
			PlayIcon = if item.isYouTubeVideo then ReactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = _UDim2_1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Image = Images["icons/common/play"]
			}) else nil
		})
	end
	return ReactModule.createElement("ScrollingFrame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		AutomaticCanvasSize = Enum.AutomaticSize.XY,
		ScrollBarImageTransparency = 1,
		ScrollingDirection = Enum.ScrollingDirection.X,
		ClipsDescendants = false,
		[ReactModule.Change.AbsoluteSize] = UseResult
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, JoinResult.itemPadding)
		}),
		Items = ReactModule.createElement(ReactModule.Fragment, {}, ImageButtons)
	})
end