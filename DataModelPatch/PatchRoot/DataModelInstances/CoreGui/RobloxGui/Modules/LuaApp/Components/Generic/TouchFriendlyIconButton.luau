local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local DEPRECATEDImageSetLabelModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.DEPRECATED_ImageSetLabel)

local function TouchFriendlyIconButton(Frame: Frame)
	-- upvalues: RoactModule (copy), ImageSetLabel (copy), DEPRECATEDImageSetLabelModule (copy), WithSelectionCursorProviderFunction (copy), Focusable (copy), CursorKind (copy)
	local ZIndex = Frame.ZIndex
	local Position = Frame.Position
	local AnchorPoint = Frame.AnchorPoint
	local Size = Frame.Size
	local LayoutOrder = Frame.LayoutOrder
	local OnActivated = Frame.onActivated
	local Icon = Frame.icon
	local IconSize = Frame.iconSize
	local IconPosition = Frame.iconPosition or UDim2.new(0.5, 0, 0.5, 0)
	local IconAnchorPoint = Frame.iconAnchorPoint or Vector2.new(0.5, 0.5)
	local IconColor = Frame.iconColor
	local IconTransparency = Frame.iconTransparency
	local FrameEntry = Frame[RoactModule.Children]
	local FrameEntry1 = Frame[RoactModule.Change.AbsolutePosition]
	local ImageSetLabel1 = Frame.useUIBloxImageSet and ImageSetLabel or DEPRECATEDImageSetLabelModule
	local ForwardRef = Frame.forwardRef
	
	return WithSelectionCursorProviderFunction(function(Callback)
		-- upvalues: RoactModule (upval), Focusable (upval), ZIndex (copy), Position (copy), AnchorPoint (copy), Size (copy), LayoutOrder (copy), OnActivated (copy), FrameEntry1 (copy), ForwardRef (copy), Frame (copy), CursorKind (upval), ImageSetLabel1 (copy), IconSize (copy), IconPosition (copy), IconAnchorPoint (copy), Icon (copy), IconColor (copy), IconTransparency (copy), FrameEntry (copy)
		return RoactModule.createElement(Focusable.TextButton, {
			ZIndex = ZIndex,
			Position = Position,
			AnchorPoint = AnchorPoint,
			Size = Size,
			LayoutOrder = LayoutOrder,
			BackgroundTransparency = 1,
			Text = "",
			[RoactModule.Event.Activated] = OnActivated,
			[RoactModule.Change.AbsolutePosition] = FrameEntry1,
			[RoactModule.Ref] = ForwardRef,
			NextSelectionLeft = Frame.NextSelectionLeft,
			NextSelectionRight = Frame.NextSelectionRight,
			NextSelectionUp = Frame.NextSelectionUp,
			NextSelectionDown = Frame.NextSelectionDown,
			inputBindings = Frame.inputBindings,
			SelectionImageObject = Callback(CursorKind.RoundedRectNoInset)
		}, {
			NavigationButton = RoactModule.createElement(ImageSetLabel1, {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, IconSize, 0, IconSize),
				Position = IconPosition,
				AnchorPoint = IconAnchorPoint,
				Image = Icon,
				ImageColor3 = IconColor,
				ImageTransparency = IconTransparency
			}, FrameEntry)
		})
	end)
end

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: RoactModule (copy), TouchFriendlyIconButton (copy), CryoModule (copy)
	return RoactModule.createElement(TouchFriendlyIconButton, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)