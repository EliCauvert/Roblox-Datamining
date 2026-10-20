local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local TModule = require(CorePackages.Packages.t)
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local WithStyleFunction = UIBloxModule.Style.withStyle
local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Constants)
local CategorySubButton = RoactModule.PureComponent:extend("CategorySubButton")
local NavCornerSize = ConstantsModule.NavCornerSize
local NavButtonBorderSize = ConstantsModule.NavButtonBorderSize
CategorySubButton.validateProps = TModule.strictInterface({
	title = TModule.string,
	width = TModule.number,
	layoutOrder = TModule.number,
	index = TModule.number,
	onSubButtonSelected = TModule.callback,
	parentButtonSelected = TModule.boolean,
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	isClippedWhenParentUnselected = TModule.optional(TModule.boolean),
	buttonRef = TModule.table,
	selectedSubButtonIndex = TModule.optional(TModule.number)
})

function CategorySubButton.renderWithProviders(p1, p2, Callback)
	-- upvalues: RoactModule (copy), NavCornerSize (copy), NavButtonBorderSize (copy), Focusable (copy), CursorKind (copy)
	local IsSelectedSubButtonIndexMatch: boolean = if p1.props.parentButtonSelected and p1.props.selectedSubButtonIndex then p1.props.selectedSubButtonIndex == p1.props.index else p1.props.index == 1
	local Theme = p2.Theme
	local _Font = p2.Font
	local Color = p1.props.parentButtonSelected and Theme.TextEmphasis.Color or Theme.TextMuted.Color
	local config = {
		UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, NavCornerSize) }),
		InnerButton = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 0,
			Size = UDim2.new(1, -NavButtonBorderSize * 2, 1, -NavButtonBorderSize * 2),
			Position = UDim2.fromOffset(NavButtonBorderSize, NavButtonBorderSize),
			Text = p1.props.title,
			BackgroundColor3 = if IsSelectedSubButtonIndexMatch then Color else Theme.BackgroundUIDefault.Color,
			TextSize = _Font.BaseSize * _Font.Header2.RelativeSize,
			TextColor3 = if IsSelectedSubButtonIndexMatch then Theme.BackgroundUIDefault.Color else Color,
			TextTransparency = p1.props.parentButtonSelected and Theme.TextEmphasis.Transparency or Theme.TextMuted.Transparency,
			Font = _Font.Header2.Font
		}, {
			UICorner = RoactModule.createElement("UICorner", {
				CornerRadius = UDim.new(0, NavCornerSize - NavButtonBorderSize)
			})
		})
	}
	
	return if p1.props.isClippedWhenParentUnselected and not p1.props.parentButtonSelected then RoactModule.createElement("TextButton", {
		Size = UDim2.new(0, p1.props.width, 1, -4),
		LayoutOrder = p1.props.layoutOrder,
		[RoactModule.Event.Activated] = function()
			-- upvalues: p1 (copy)
			p1.props.onSubButtonSelected(p1.props.index)
		end,
		BorderSizePixel = 0,
		BackgroundColor3 = Color,
		Text = "",
		[RoactModule.Ref] = p1.props.buttonRef
	}, config) else RoactModule.createElement(Focusable.TextButton, {
		Size = UDim2.new(0, p1.props.width, 1, -4),
		LayoutOrder = p1.props.layoutOrder,
		[RoactModule.Event.Activated] = function()
			-- upvalues: p1 (copy)
			p1.props.onSubButtonSelected(p1.props.index)
		end,
		BorderSizePixel = 0,
		BackgroundColor3 = Color,
		Text = "",
		SelectionImageObject = Callback(CursorKind.NavHighlight),
		NextSelectionRight = p1.props.NextSelectionRight,
		NextSelectionLeft = p1.props.NextSelectionLeft,
		[RoactModule.Ref] = p1.props.buttonRef
	}, config)
end

function CategorySubButton.render(p1)
	-- upvalues: WithStyleFunction (copy), WithSelectionCursorProviderFunction (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: WithSelectionCursorProviderFunction (upval), p1 (copy)
		return WithSelectionCursorProviderFunction(function(p3)
			-- upvalues: p1 (upval), p2 (copy)
			return p1:renderWithProviders(p2, p3)
		end)
	end)
end

return (RoactRoduxModule.connect(function(p1, _)
	return {
		selectedSubButtonIndex = p1.AvatarExperience.AvatarEditor.Categories.subButton
	}
end)(CategorySubButton))