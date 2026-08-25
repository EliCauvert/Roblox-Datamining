local parent = script:FindFirstAncestor("AppBlox").Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local button = UIBloxModule.App.Button.Button
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local _ = require(script.Parent.MediaGalleryTypes)
local uDim2 = UDim2.fromScale(0.4, 0.512)
local uDim2_1 = UDim2.fromScale(0.25, 0.33)
local t = {
	numItemsShown = 3.5,
	itemAspectRatio = 1.777777777778,
	itemPadding = 16,
	borderRadius = UDim.new(0, 8)
}

return function(p0)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), button (ref), buttonType (ref), uDim2 (ref), imageSetLabel (ref), uDim2_1 (ref), images (ref)
	local var6 = cryoModule.Dictionary.join(t, p0)
	local var7, var8 = reactModule.useState(Vector2.zero)
	local var9 = reactModule.useCallback(function(p1)
		-- upvalues: var6 (ref), var8 (ref)
		local var12 = (p1.AbsoluteSize.X - var6.itemPadding * (var6.numItemsShown - 1)) / var6.numItemsShown
		var8(Vector2.new(var12, var12 / var6.itemAspectRatio))
	end, { var6.itemAspectRatio, var6.numItemsShown })
	local var10 = reactModule.useCallback(function(p2)
		-- upvalues: var6 (ref)
		if var6.onVideoPlayActivated and var6.items[p2].isYouTubeVideo then
			return var6.onVideoPlayActivated(p2)
		elseif var6.onPreviewActivated then
			return var6.onPreviewActivated(p2)
		end
	end, {
		var6.items,
		var6.onVideoPlayActivated,
		var6.onPreviewActivated
	})
	local t_1 = {}
	
	for i, v in var6.items do
		t_1["Item" .. i] = reactModule.createElement("ImageButton", {
			LayoutOrder = i,
			Size = UDim2.fromOffset(var7.X, var7.Y),
			Image = v.imageId,
			ScaleType = Enum.ScaleType.Crop,
			BackgroundTransparency = 1,
			AutoButtonColor = false,
			[reactModule.Event.Activated] = function()
				-- upvalues: var10 (ref), i (ref)
				var10(i)
			end
		}, {
			Corner = reactModule.createElement("UICorner", { CornerRadius = var6.borderRadius }),
			PlayButton = if v.isYouTubeVideo then reactModule.createElement(button, {
				buttonType = buttonType.PrimaryContextual,
				size = uDim2,
				anchorPoint = Vector2.new(0.5, 0.5),
				position = UDim2.fromScale(0.5, 0.5),
				onActivated = function()
					-- upvalues: var10 (ref), i (ref)
					var10(i)
				end
			}) else nil,
			PlayIcon = if v.isYouTubeVideo then reactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = uDim2_1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Image = images["icons/common/play"]
			}) else nil
		})
	end
	return reactModule.createElement("ScrollingFrame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		AutomaticCanvasSize = Enum.AutomaticSize.XY,
		ScrollBarImageTransparency = 1,
		ScrollingDirection = Enum.ScrollingDirection.X,
		ClipsDescendants = false,
		[reactModule.Change.AbsoluteSize] = var9
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, var6.itemPadding)
		}),
		Items = reactModule.createElement(reactModule.Fragment, {}, t_1)
	})
end