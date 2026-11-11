local CorePackages = game:GetService("CorePackages")
local DashModule = require(CorePackages.Packages.Dash)
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseSelectionCursorFunction = UIBloxModule.App.SelectionImage.useSelectionCursor
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local Interactable = UIBloxModule.Core.Control.Interactable
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local MoreTextModule = require(script.Parent.MoreText)
local SubheaderText = MoreTextModule.SubheaderText
local BodyText = MoreTextModule.BodyText

return (ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: UseDesignTokensFunction (copy), UseSelectionCursorFunction (copy), CursorKind (copy), ReactModule (copy), Interactable (copy), DashModule (copy), SubheaderText (copy), ImageSetLabel (copy), BodyText (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local Size800 = UseDesignTokensResult.Size.Size_800
	
	return ReactModule.createElement(Interactable, {
		ref = Ref,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_1400),
		BackgroundTransparency = 1,
		SelectionImageObject = UseSelectionCursorFunction(CursorKind.RoundedRect),
		[ReactModule.Event.Activated] = p1.onActivated,
		onStateChanged = DashModule.noop
	}, {
		TitleFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0, 0.5),
			Size = UDim2.new(),
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			Title = ReactModule.createElement(SubheaderText, { layoutOrder = 1, text = p1.title })
		}),
		StatusFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.new(1, -UseDesignTokensResult.Size.Size_600, 0.5, 0),
			AnchorPoint = Vector2.new(1, 0.5),
			Size = UDim2.new(),
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			Icon = if p1.icon then ReactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				Image = p1.icon,
				ImageColor3 = UseDesignTokensResult.Color.Content.Default.Color3,
				ImageTransparency = UseDesignTokensResult.Color.Content.Default.Transparency,
				Size = UDim2.fromOffset(Size800, Size800)
			}) else nil,
			Status = if p1.status then ReactModule.createElement(BodyText, {
				text = p1.status,
				TextXAlignment = Enum.TextXAlignment.Right
			}) else nil
		})
	})
end))