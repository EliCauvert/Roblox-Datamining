local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local Skeleton = require(CorePackages.Packages.Foundation).Skeleton
local TModule = require(CorePackages.Packages.t)
local ExpandableTextArea = UIBloxModule.App.Text.ExpandableTextArea
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseSelectionCursorFunction = UIBloxModule.App.SelectionImage.useSelectionCursor
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local WrapResult = require(CorePackages.Workspace.Packages.ArgCheck).wrap(TModule.strictInterface({
	compactNumberOfLines = TModule.optional(TModule.integer),
	isLoading = TModule.boolean,
	descriptionText = TModule.optional(TModule.string),
	width = TModule.optional(TModule.integer),
	Position = TModule.optional(TModule.UDim2),
	LayoutOrder = TModule.optional(TModule.integer)
}))

return function(Frame)
	-- upvalues: WrapResult (copy), UseStyleFunction (copy), UseSelectionCursorFunction (copy), CursorKind (copy), FFlagRenameDeprecatedUIBloxTokens (copy), RoactModule (copy), Focusable (copy), Skeleton (copy), ExpandableTextArea (copy)
	assert(WrapResult(Frame))
	local LayoutOrder = Frame.LayoutOrder
	local UseStyleResult = UseStyleFunction()
	local CompactNumberOfLines = Frame.compactNumberOfLines or 3
	local DescriptionText = Frame.descriptionText
	local IsLoading = Frame.isLoading
	local Position = Frame.Position
	local UseStyleResultFont = UseStyleResult.Font
	local NewCompactNumberOfLines = CompactNumberOfLines * (UseStyleResultFont.BaseSize * UseStyleResultFont.Body.RelativeSize) + (if FFlagRenameDeprecatedUIBloxTokens then UseStyleResult.Tokens.Size.Size_150 else UseStyleResult.Tokens.Global.Space_75)
	local YOffset = NewCompactNumberOfLines + (if FFlagRenameDeprecatedUIBloxTokens then UseStyleResult.Tokens.Size.Size_0 else UseStyleResult.Tokens.Global.Space_0)
	
	return RoactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		LayoutOrder = LayoutOrder,
		Position = UDim2.fromScale(0, 0),
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		SelectionImageObject = UseSelectionCursorFunction(CursorKind.RoundedRect)
	}, {
		DescriptionShimmer = if IsLoading then RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, YOffset)
		}, {
			ShimmerPanel = RoactModule.createElement(Skeleton, {
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.new(0, 0, 1, 0),
				Size = UDim2.new(1, 0, 0, NewCompactNumberOfLines)
			})
		}) else nil,
		DescriptionExpandable = if DescriptionText and DescriptionText ~= "" then RoactModule.createElement(ExpandableTextArea, {
			LayoutOrder = LayoutOrder,
			Position = Position,
			Text = DescriptionText,
			compactNumberOfLines = CompactNumberOfLines,
			padding = Vector2.new(0, 0)
		}) else nil
	})
end