local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local CryoModule = require(CorePackages.Packages.Cryo)
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local TModule = require(CorePackages.Packages.t)
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local Text = require(CorePackages.Workspace.Packages.AppCommonLib).Text
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local WithStyleFunction = UIBloxModule.Style.withStyle
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local CategorySubButtonModule = require(Modules.AvatarExperience.Common.Components.NavBar.CategorySubButton)
local NewItemNotificationModule = require(Modules.AvatarExperience.Common.Components.NavBar.NewItemNotification)
local TextCategoryButton = RoactModule.PureComponent:extend("TextCategoryButton")
local NavButtonElementPadding = ConstantsModule.NavButtonElementPadding
local NavButtonElementMargin = ConstantsModule.NavButtonElementMargin
local NavInnerPadding = ConstantsModule.NavInnerPadding
local NavCornerSize = ConstantsModule.NavCornerSize
local NavButtonBorderSize = ConstantsModule.NavButtonBorderSize
local NavSubButtonInnerPadding = ConstantsModule.NavSubButtonInnerPadding
TextCategoryButton.validateProps = TModule.strictInterface({
	categoryTitle = TModule.string,
	layoutOrder = TModule.number,
	isSelected = TModule.boolean,
	hasNewItemNotification = TModule.optional(TModule.boolean),
	frameRef = TModule.table,
	onActivate = TModule.callback,
	subButtons = TModule.optional(TModule.table),
	onSubButtonSelected = TModule.optional(TModule.callback),
	subcatIndex = TModule.optional(TModule.number),
	forwardRef = TModule.table,
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	inputBindings = TModule.optional(TModule.table)
})

function TextCategoryButton.init(p1)
	-- upvalues: RoactGamepadModule (copy)
	if p1.props.subButtons and #p1.props.subButtons > 0 then
		p1.subButtonRefs = RoactGamepadModule.createRefCache()
	end
end

function TextCategoryButton.getDefaultChild(p1)
	return if p1.props.subButtons == nil or #p1.props.subButtons == 0 then nil else p1.subButtonRefs[1]
end

function TextCategoryButton.getSubButtonNextSelectionLeft(p1, Index: number)
	return if Index > 1 then p1.subButtonRefs[Index - 1] else nil
end

function TextCategoryButton.getSubButtonNextSelectionRight(p1, Index: number)
	return if Index < #p1.props.subButtons then p1.subButtonRefs[Index + 1] else nil
end

function TextCategoryButton.getInnerFrameChildren(p1, p2, p3, XOffset, p4, Color, ScaledBaseSize)
	-- upvalues: NavCornerSize (copy), NavButtonBorderSize (copy), RoactModule (copy), NavButtonElementMargin (copy), NavButtonElementPadding (copy), CategorySubButtonModule (copy)
	local IsSelected = p1.props.isSelected
	local Theme = p3.Theme
	local config = {
		UICorner = RoactModule.createElement("UICorner", {
			CornerRadius = UDim.new(0, if IsSelected then NavCornerSize - NavButtonBorderSize else NavCornerSize)
		}),
		UIPadding = RoactModule.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, 0),
			PaddingTop = UDim.new(0, 0),
			PaddingLeft = UDim.new(0, NavButtonElementMargin),
			PaddingRight = UDim.new(0, NavButtonElementMargin)
		}),
		UIListLayout = RoactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, NavButtonElementPadding),
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		TextLabel = RoactModule.createElement("TextLabel", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(0, XOffset, 1, 0),
			Text = p2.title,
			TextSize = ScaledBaseSize,
			TextColor3 = Color,
			TextTransparency = IsSelected and Theme.TextEmphasis.Transparency or Theme.TextMuted.Transparency,
			Font = p3.Font.Header2.Font
		})
	}
	local SubButtons = p1.props.subButtons
	
	if SubButtons then
		for Index, subButton in SubButtons do
			config[subButton.Name] = RoactModule.createElement(CategorySubButtonModule, {
				title = p2[subButton.Name],
				width = p4[Index],
				layoutOrder = Index + 1,
				index = Index,
				onSubButtonSelected = function(p5)
					-- upvalues: IsSelected (copy), p1 (copy)
					if not IsSelected then
						p1.props.onActivate()
					end
					p1.props.onSubButtonSelected(p5)
				end,
				parentButtonSelected = IsSelected,
				buttonRef = p1.subButtonRefs[Index],
				NextSelectionLeft = p1:getSubButtonNextSelectionLeft(Index),
				NextSelectionRight = p1:getSubButtonNextSelectionRight(Index)
			})
		end
	end
	return config
end

function TextCategoryButton.renderButtonWithText(p5, p6, p7, Callback)
	-- upvalues: Text (copy), NavSubButtonInnerPadding (copy), NavButtonElementPadding (copy), NavButtonElementMargin (copy), RoactModule (copy), Focusable (copy), NavButtonBorderSize (copy), NavInnerPadding (copy), CursorKind (copy), NavCornerSize (copy)
	local _Font = p7.Font
	local HeaderFont = _Font.Header2.Font
	local ScaledBaseSize = _Font.BaseSize * _Font.Header2.RelativeSize
	local TextWidth = Text.GetTextWidth(p6.title, HeaderFont, ScaledBaseSize)
	local Theme = p7.Theme
	local IsSelected = p5.props.isSelected
	local Color = IsSelected and Theme.TextEmphasis.Color or Theme.TextMuted.Color
	local List = {}
	local v1 = 0
	
	if p5.props.subButtons then
		for _, subButton in p5.props.subButtons do
			local NewTextWidth = Text.GetTextWidth(p6[subButton.Name], HeaderFont, ScaledBaseSize) + 2 * NavSubButtonInnerPadding
			table.insert(List, NewTextWidth)
			v1 = v1 + NavButtonElementPadding + NewTextWidth
		end
	end
	local NewNavButtonElementMargin = NavButtonElementMargin + TextWidth + v1 + NavButtonElementMargin
	local DefaultChild = p5:getDefaultChild()
	
	return if IsSelected then RoactModule.createElement(Focusable.TextButton, {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.new(0, NewNavButtonElementMargin + NavButtonBorderSize * 2, 1, -NavInnerPadding),
		BackgroundTransparency = 0,
		BackgroundColor3 = Color,
		[RoactModule.Event.Activated] = function()
			-- upvalues: p5 (copy)
			p5.props.onActivate()
		end,
		[RoactModule.Ref] = p5.props.forwardRef,
		NextSelectionLeft = p5.props.NextSelectionLeft,
		NextSelectionRight = p5.props.NextSelectionRight,
		SelectionImageObject = Callback(CursorKind.NavHighlight),
		defaultChild = DefaultChild
	}, {
		UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, NavCornerSize) }),
		InnerFrame = RoactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			Size = UDim2.new(1, -NavButtonBorderSize * 2, 1, -NavButtonBorderSize * 2),
			Position = UDim2.fromOffset(NavButtonBorderSize, NavButtonBorderSize),
			BackgroundColor3 = Theme.BackgroundUIDefault.Color
		}, p5:getInnerFrameChildren(p6, p7, TextWidth, List, Color, ScaledBaseSize))
	}) else RoactModule.createElement(Focusable.TextButton, {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.new(0, NewNavButtonElementMargin, 1, -NavInnerPadding),
		BackgroundTransparency = 0,
		BackgroundColor3 = Theme.BackgroundUIDefault.Color,
		BorderSizePixel = 0,
		[RoactModule.Event.Activated] = function()
			-- upvalues: p5 (copy)
			p5.props.onActivate()
		end,
		[RoactModule.Ref] = p5.props.forwardRef,
		NextSelectionLeft = p5.props.NextSelectionLeft,
		NextSelectionRight = p5.props.NextSelectionRight,
		SelectionImageObject = Callback(CursorKind.NavHighlight),
		defaultChild = DefaultChild
	}, p5:getInnerFrameChildren(p6, p7, TextWidth, List, Color, ScaledBaseSize))
end

function TextCategoryButton.renderWithProviders(p8, p9, p10, p11)
	-- upvalues: RoactModule (copy), NewItemNotificationModule (copy)
	local IsSelected = p8.props.isSelected
	
	return RoactModule.createElement("Frame", {
		Size = UDim2.new(0, 0, 1, 0),
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundTransparency = 1,
		LayoutOrder = p8.props.layoutOrder,
		[RoactModule.Ref] = p8.props.frameRef
	}, {
		Button = p8:renderButtonWithText(p9, p10, p11),
		NewItemNotification = p8.props.hasNewItemNotification and RoactModule.createElement(NewItemNotificationModule, { isSelected = IsSelected })
	})
end

function TextCategoryButton.render(p8)
	-- upvalues: WithLocalizationFunction (copy), WithStyleFunction (copy), WithSelectionCursorProviderFunction (copy)
	local config = { title = p8.props.categoryTitle }
	
	if p8.props.subButtons then
		for _, subButton in p8.props.subButtons do
			config[subButton.Name] = subButton.Title
		end
	end
	return WithLocalizationFunction(config)(function(p9)
		-- upvalues: WithStyleFunction (upval), WithSelectionCursorProviderFunction (upval), p8 (copy)
		return WithStyleFunction(function(p10)
			-- upvalues: WithSelectionCursorProviderFunction (upval), p8 (upval), p9 (copy)
			return WithSelectionCursorProviderFunction(function(p11)
				-- upvalues: p8 (upval), p9 (upval), p10 (copy)
				return p8:renderWithProviders(p9, p10, p11)
			end)
		end)
	end)
end

return RoactModule.forwardRef(function(p9, ForwardRef)
	-- upvalues: RoactModule (copy), TextCategoryButton (copy), CryoModule (copy)
	return RoactModule.createElement(TextCategoryButton, CryoModule.Dictionary.join(p9, { forwardRef = ForwardRef }))
end)