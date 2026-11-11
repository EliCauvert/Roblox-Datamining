local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Skeleton = require(CorePackages.Packages.Foundation).Skeleton
local TModule = require(CorePackages.Packages.t)
local ExpandableTextArea = UIBloxModule.App.Text.ExpandableTextArea
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseSelectionCursorFunction = UIBloxModule.App.SelectionImage.useSelectionCursor
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local GetFFlagL2ControllerSupportModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Flags.GetFFlagL2ControllerSupport)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local WrapResult = require(CorePackages.Workspace.Packages.ArgCheck).wrap(TModule.strictInterface({
	compactNumberOfLines = TModule.optional(TModule.integer),
	descriptionText = TModule.optional(TModule.string),
	width = TModule.optional(TModule.integer),
	Position = TModule.optional(TModule.UDim2),
	LayoutOrder = TModule.optional(TModule.integer),
	forwardRef = TModule.optional(TModule.table),
	NextSelectionUp = if GetFFlagL2ControllerSupportModule() then TModule.optional(TModule.table) else nil,
	NextSelectionDown = TModule.optional(TModule.table)
}))

local function renderItemDescription(p1, SelectionImageObject, Frame)
	-- upvalues: GetFFlagL2ControllerSupportModule (copy), RoactModule (copy), ExpandableTextArea (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), Focusable (copy), Skeleton (copy)
	local CompactNumberOfLines = Frame.compactNumberOfLines or 3
	local DescriptionText = Frame.descriptionText
	local Position = Frame.Position
	local LayoutOrder = Frame.LayoutOrder
	local NextSelectionUp = if GetFFlagL2ControllerSupportModule() then Frame.NextSelectionUp else nil
	local NextSelectionDown = Frame.NextSelectionDown
	
	if DescriptionText then
		return RoactModule.createElement(ExpandableTextArea, {
			LayoutOrder = LayoutOrder,
			Position = Position,
			Text = DescriptionText,
			compactNumberOfLines = CompactNumberOfLines,
			NextSelectionUp = if FFlagAXMigrateAXToGlobalAutofocus then nil else NextSelectionUp,
			NextSelectionDown = if FFlagAXMigrateAXToGlobalAutofocus then nil else NextSelectionDown
		})
	else
		local _Font = p1.Font
		local NewCompactNumberOfLines = CompactNumberOfLines * (_Font.BaseSize * _Font.Body.RelativeSize) + 5
		
		return RoactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then "Frame" else Focusable.Frame, {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, NewCompactNumberOfLines + 30),
			NextSelectionUp = if FFlagAXMigrateAXToGlobalAutofocus then nil else NextSelectionUp,
			NextSelectionDown = if FFlagAXMigrateAXToGlobalAutofocus then nil else NextSelectionDown,
			SelectionImageObject = SelectionImageObject
		}, {
			ShimmerPanel = RoactModule.createElement(Skeleton, {
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.new(0, 0, 1, 0),
				Size = UDim2.new(1, 0, 0, NewCompactNumberOfLines)
			})
		})
	end
end

local function ItemDescription(Frame: Frame)
	-- upvalues: WrapResult (copy), UseStyleFunction (copy), UseSelectionCursorFunction (copy), CursorKind (copy), RoactModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), Focusable (copy), renderItemDescription (copy)
	assert(WrapResult(Frame))
	local LayoutOrder = Frame.LayoutOrder
	local ForwardRef = Frame.forwardRef
	local UseStyleResult = UseStyleFunction()
	local UseSelectionCursorResult = UseSelectionCursorFunction(CursorKind.RoundedRect)
	
	return RoactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then "Frame" else Focusable.Frame, {
		LayoutOrder = LayoutOrder,
		Position = UDim2.fromScale(0, 0),
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		[RoactModule.Ref] = ForwardRef,
		NextSelectionDown = if FFlagAXMigrateAXToGlobalAutofocus then nil else Frame.NextSelectionDown,
		SelectionImageObject = UseSelectionCursorResult
	}, {
		renderItemDescription(UseStyleResult, UseSelectionCursorResult, Frame)
	})
end

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: RoactModule (copy), ItemDescription (copy), CryoModule (copy)
	return RoactModule.createElement(ItemDescription, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)