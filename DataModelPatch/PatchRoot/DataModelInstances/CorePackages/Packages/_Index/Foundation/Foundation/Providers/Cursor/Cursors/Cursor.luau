local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local Images = require(Parent.FoundationImages).Images
local CursorComponentModule = require(script.Parent.Parent.CursorComponent)
local CursorTypeModule = require(Foundation.Enums.CursorType)
local _ = require(Foundation.Enums.ColorMode)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local GetScaledSliceModule = require(script.Parent.Parent.Parent.Parent.Components.Image.ImageSet.getScaledSlice)
local config = {
	[CursorTypeModule.BulletUp] = {
		Tag = "SlicedImage",
		Image = "component_assets/bulletUp_17_stroke_3",
		SliceCenter = Rect.new(8, 8, 9, 9),
		InsetAdjustment = Vector2.new(2, 2)
	},
	[CursorTypeModule.BulletDown] = {
		Tag = "SlicedImage",
		Image = "component_assets/bulletDown_17_stroke_3",
		SliceCenter = Rect.new(8, 8, 9, 9),
		InsetAdjustment = Vector2.new(2, 2)
	},
	[CursorTypeModule.InputFields] = {
		Tag = "SlicedImage",
		Image = "component_assets/circle_22_stroke_3",
		SliceCenter = Rect.new(11, 11, 12, 12),
		InsetAdjustment = Vector2.new(7, 0)
	},
	[CursorTypeModule.SelectionCell] = {
		Tag = "SlicedImage",
		Image = "component_assets/square_7_stroke_3",
		Padding = 50,
		SliceCenter = Rect.new(3.5, 3.5, 3.5, 3.5),
		InsetAdjustment = Vector2.new(2, 2)
	},
	[CursorTypeModule.SelectedKnob] = {
		Tag = "FixedSizeImage",
		Image = "component_assets/circle_42_stroke_3",
		Size = 42
	},
	[CursorTypeModule.UnselectedKnob] = {
		Tag = "FixedSizeImage",
		Image = "component_assets/circle_52_stroke_3",
		Size = 52
	},
	[CursorTypeModule.InputButton] = {
		Tag = "RoundedImage",
		Offset = 11,
		BorderWidth = 3,
		CornerRadius = UDim.new(0, 11)
	},
	[CursorTypeModule.RoundedRect] = {
		Tag = "RoundedImage",
		Offset = 9,
		BorderWidth = 3,
		CornerRadius = UDim.new(0, 8)
	},
	[CursorTypeModule.RoundedRectNoInset] = {
		Tag = "RoundedImage",
		Offset = 0,
		BorderWidth = 3,
		CornerRadius = UDim.new(0, 8)
	},
	[CursorTypeModule.RoundedSlot] = {
		Tag = "RoundedImage",
		Offset = 0,
		BorderWidth = 3,
		CornerRadius = UDim.new(0, 7)
	},
	[CursorTypeModule.SkinToneCircle] = {
		Tag = "RoundedImage",
		Offset = 0,
		BorderWidth = 3,
		CornerRadius = UDim.new(0.5, 0)
	},
	[CursorTypeModule.SmallPill] = {
		Tag = "RoundedImage",
		Offset = 0,
		BorderWidth = 3,
		CornerRadius = UDim.new(0, 15)
	},
	[CursorTypeModule.LargePill] = {
		Tag = "RoundedImage",
		Offset = 0,
		BorderWidth = 3,
		CornerRadius = UDim.new(0, 26)
	},
	[CursorTypeModule.Square] = {
		Tag = "RoundedImage",
		Offset = 2,
		BorderWidth = 3,
		CornerRadius = UDim.new(0, 0)
	},
	[CursorTypeModule.Toggle] = {
		Tag = "RoundedImage",
		Offset = 0,
		BorderWidth = 3,
		CornerRadius = UDim.new(0, 13)
	}
}

return (ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: UseTokensModule (copy), CursorTypeModule (copy), ReactModule (copy), config (copy), Images (copy), GetScaledSliceModule (copy), CursorComponentModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local ColorMode = p1.colorMode
	
	if p1.cursorType == CursorTypeModule.NavHighlight then
		return ReactModule.createElement("Frame", {
			BorderSizePixel = 1,
			BackgroundTransparency = 0,
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, 0, 1, -3),
			Size = UDim2.new(1, 0, 0, 3),
			BackgroundColor3 = UseTokensModuleResult[ColorMode].Selection.Start.Color3,
			BorderColor3 = UseTokensModuleResult[ColorMode].Selection.Start.Color3,
			ref = Ref
		})
	elseif p1.cursorType == CursorTypeModule.Invisible then
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			ref = Ref
		})
	else
		local Entry = config[p1.cursorType]
		
		if Entry.Tag == "FixedSizeImage" then
			local _UDim2 = UDim2.fromOffset(Entry.Size, Entry.Size)
			
			return ReactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				Image = Images[Entry.Image].Image,
				ImageRectOffset = Images[Entry.Image].ImageRectOffset,
				ImageRectSize = Images[Entry.Image].ImageRectSize,
				Size = _UDim2,
				Position = UDim2.new(0.5, -_UDim2.X.Offset / 2, 0.5, -_UDim2.Y.Offset / 2),
				ImageColor3 = UseTokensModuleResult[ColorMode].Selection.Start.Color3,
				ImageTransparency = UseTokensModuleResult[ColorMode].Selection.Start.Transparency,
				ref = Ref
			})
		elseif Entry.Tag == "SlicedImage" then
			local InsetAdjustment = Entry.InsetAdjustment
			local _UDim2 = UDim2.new(1, InsetAdjustment.X * 2, 1, InsetAdjustment.Y * 2)
			local ScaledSliceModule = GetScaledSliceModule(Entry.SliceCenter)
			
			return ReactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				Image = Images[Entry.Image].Image,
				ImageRectOffset = Images[Entry.Image].ImageRectOffset,
				ImageRectSize = Images[Entry.Image].ImageRectSize,
				SliceCenter = ScaledSliceModule.center,
				SliceScale = ScaledSliceModule.scale,
				ScaleType = Enum.ScaleType.Slice,
				Size = _UDim2,
				Position = UDim2.fromOffset(-InsetAdjustment.X, -InsetAdjustment.Y),
				ImageColor3 = UseTokensModuleResult[ColorMode].Selection.Start.Color3,
				ImageTransparency = UseTokensModuleResult[ColorMode].Selection.Start.Transparency,
				ref = Ref
			}, {
				Padding = if Entry.Padding then ReactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, Entry.Padding),
					PaddingBottom = UDim.new(0, Entry.Padding),
					PaddingLeft = UDim.new(0, Entry.Padding),
					PaddingRight = UDim.new(0, Entry.Padding)
				}) else nil
			})
		else
			return if Entry.Tag == "RoundedImage" then ReactModule.createElement(CursorComponentModule, {
				isVisible = p1.isVisible,
				cornerRadius = Entry.CornerRadius,
				offset = Entry.Offset - Entry.BorderWidth,
				borderWidth = Entry.BorderWidth,
				colorMode = p1.colorMode,
				ref = Ref
			}) else nil
		end
	end
end))