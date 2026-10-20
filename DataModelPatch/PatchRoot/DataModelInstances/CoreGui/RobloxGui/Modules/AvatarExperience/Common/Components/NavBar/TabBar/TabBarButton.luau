local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseCursorByTypeFunction = UIBloxModule.App.SelectionCursor.useCursorByType
local CursorType = UIBloxModule.App.SelectionCursor.CursorType

return function(Gui)
	-- upvalues: UseStyleFunction (copy), UseCursorByTypeFunction (copy), CursorType (copy), ReactModule (copy), Focusable (copy)
	local UseStyleResult = UseStyleFunction()
	local UseStyleResultFont = UseStyleResult.Font
	local Theme = UseStyleResult.Theme
	local IsSelected = Gui.isSelected
	local TabsLength: number = Gui.tabsLength
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(if TabsLength > 0 then 1 / TabsLength else 1, 0, 1, 0),
		LayoutOrder = Gui.layoutOrder,
		ref = Gui.frameRef
	}, {
		Button = ReactModule.createElement(Focusable.TextButton, {
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 0, 0.5, 0),
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			Text = Gui.tabTitle,
			TextSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Header2.RelativeSize,
			TextColor3 = IsSelected and Theme.TextEmphasis.Color or Theme.TextMuted.Color,
			TextTransparency = IsSelected and Theme.TextEmphasis.Transparency or Theme.TextMuted.Transparency,
			Font = UseStyleResultFont.Header2.Font,
			[ReactModule.Event.Activated] = function()
				-- upvalues: Gui (copy)
				Gui.onActivate(Gui.tabIndex)
			end,
			ref = Gui.ref,
			NextSelectionLeft = Gui.NextSelectionLeft,
			NextSelectionRight = Gui.NextSelectionRight,
			NextSelectionUp = Gui.NextSelectionUp,
			NextSelectionDown = Gui.NextSelectionDown,
			SelectionImageObject = UseCursorByTypeFunction(CursorType.NavHighlight)
		}),
		Frame = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, 0, 1, 0),
			Size = UDim2.new(1, 0, 0, if IsSelected then 3 else 1),
			BackgroundColor3 = if IsSelected then Theme.IconEmphasis.Color else Theme.Divider.Color,
			BackgroundTransparency = if IsSelected then Theme.IconEmphasis.Transparency else Theme.Divider.Transparency
		})
	})
end