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

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), button (ref), buttonType (ref), uDim2 (ref), imageSetLabel (ref), uDim2_1 (ref), images (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2, var3 = reactModule.useState(Vector2.zero)
	local var4 = reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), var3 (ref)
		local var5 = (p2.AbsoluteSize.X - var1.itemPadding * (var1.numItemsShown - 1)) / var1.numItemsShown
		var3(Vector2.new(var5, var5 / var1.itemAspectRatio))
	end, { var1.itemAspectRatio, var1.numItemsShown })
	local var5 = reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref)
		if var1.onVideoPlayActivated and var1.items[p2].isYouTubeVideo then
			return var1.onVideoPlayActivated(p2)
		elseif var1.onPreviewActivated then
			return var1.onPreviewActivated(p2)
		end
	end, {
		var1.items,
		var1.onVideoPlayActivated,
		var1.onPreviewActivated
	})
	local t_1 = {}
	
	for i, v in var1.items do
		t_1["Item" .. i] = reactModule.createElement("ImageButton", {
			LayoutOrder = i,
			Size = UDim2.fromOffset(var2.X, var2.Y),
			Image = v.imageId,
			ScaleType = Enum.ScaleType.Crop,
			BackgroundTransparency = 1,
			AutoButtonColor = false,
			[reactModule.Event.Activated] = function()
				-- upvalues: var5 (ref), i (ref)
				var5(i)
			end
		}, {
			Corner = reactModule.createElement("UICorner", { CornerRadius = var1.borderRadius }),
			PlayButton = if v.isYouTubeVideo then reactModule.createElement(button, {
				buttonType = buttonType.PrimaryContextual,
				size = uDim2,
				anchorPoint = Vector2.new(0.5, 0.5),
				position = UDim2.fromScale(0.5, 0.5),
				onActivated = function()
					-- upvalues: var5 (ref), i (ref)
					var5(i)
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
		[reactModule.Change.AbsoluteSize] = var4
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, var1.itemPadding)
		}),
		Items = reactModule.createElement(reactModule.Fragment, {}, t_1)
	})
end