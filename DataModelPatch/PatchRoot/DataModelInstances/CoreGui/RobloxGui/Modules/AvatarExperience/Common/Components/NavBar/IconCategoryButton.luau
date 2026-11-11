local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local CryoModule = require(CorePackages.Packages.Cryo)
local Images = UIBloxModule.App.ImageSet.Images
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local TModule = require(CorePackages.Packages.t)
local OtterModule = require(CorePackages.Packages.Otter)
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local Text = require(CorePackages.Workspace.Packages.AppCommonLib).Text
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local WithStyleFunction = UIBloxModule.Style.withStyle
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local CategorySubButtonModule = require(Modules.AvatarExperience.Common.Components.NavBar.CategorySubButton)
local NewItemNotificationModule = require(Modules.AvatarExperience.Common.Components.NavBar.NewItemNotification)
local NavInnerPadding = ConstantsModule.NavInnerPadding
local NavCornerSize = ConstantsModule.NavCornerSize
local NavSubButtonInnerPadding = ConstantsModule.NavSubButtonInnerPadding
local NavButtonElementPadding = ConstantsModule.NavButtonElementPadding
local NavButtonElementMargin = ConstantsModule.NavButtonElementMargin
local config = { frequency = 3.0303030303030303, dampingRatio = 1 }
local IconCategoryButton = RoactModule.PureComponent:extend("IconCategoryButton")
IconCategoryButton.validateProps = TModule.strictInterface({
	categoryTitle = TModule.string,
	iconOn = TModule.string,
	iconOff = TModule.string,
	navHeight = TModule.number,
	isSubNavigationButton = TModule.boolean,
	layoutOrder = TModule.number,
	isSelected = TModule.boolean,
	hasNewItemNotification = TModule.optional(TModule.boolean),
	frameRef = TModule.table,
	forwardRef = TModule.table,
	onActivate = TModule.callback,
	subButtons = TModule.optional(TModule.table),
	onSubButtonSelected = TModule.optional(TModule.callback),
	subcatIndex = TModule.optional(TModule.number),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	inputBindings = TModule.optional(TModule.table)
})

function IconCategoryButton.init(p1)
	-- upvalues: RoactModule (copy), OtterModule (copy), RoactGamepadModule (copy)
	local v1: number = if p1.props.isSelected then 1 else 0
	p1.nonIconSizeMultiplierBinding, p1.nonIconSizeMultiplierBindingUpdate = RoactModule.createBinding(v1)
	p1.motor = OtterModule.createSingleMotor(v1)
	p1.motor:onStep(p1.nonIconSizeMultiplierBindingUpdate)
	
	if p1.props.subButtons and #p1.props.subButtons > 0 then
		p1.subButtonRefs = RoactGamepadModule.createRefCache()
	end
end

function IconCategoryButton.didUpdate(p1, p2, _)
	-- upvalues: OtterModule (copy), config (copy)
	if p1.props.isSelected ~= p2.isSelected then
		p1.motor:setGoal(OtterModule.spring(if p1.props.isSelected then 1 else 0, config))
	end
end

function IconCategoryButton.willUnmount(p1)
	p1.motor:destroy()
end

function IconCategoryButton.getDefaultChild(p1)
	return if p1.props.isSelected then if p1.props.subButtons == nil or #p1.props.subButtons == 0 then nil else p1.subButtonRefs[1] else nil
end

function IconCategoryButton.getSubButtonNextSelectionLeft(p1, Index: number)
	return if Index > 1 then p1.subButtonRefs[Index - 1] else p1.props.NextSelectionLeft
end

function IconCategoryButton.getSubButtonNextSelectionRight(p1, Index: number)
	return if Index < #p1.props.subButtons then p1.subButtonRefs[Index + 1] else p1.props.NextSelectionRight
end

function IconCategoryButton.getInnerFrameChildren(p1, p2, p3, XOffset, p4, XOffset1, TextSize, p5, p6)
	-- upvalues: RoactModule (copy), NavButtonElementPadding (copy), CategorySubButtonModule (copy), NavCornerSize (copy), NavButtonElementMargin (copy), ImageSetLabel (copy), Images (copy)
	local t = {}
	local Theme = p3.Theme
	local IsSelected = p1.props.isSelected
	local config = {
		UIPadding = RoactModule.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, 0),
			PaddingTop = UDim.new(0, 0),
			PaddingLeft = UDim.new(0, NavButtonElementPadding),
			PaddingRight = UDim.new(0, 0)
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
			TextSize = TextSize,
			TextColor3 = IsSelected and Theme.TextEmphasis.Color or Theme.TextMuted.Color,
			TextTransparency = IsSelected and Theme.TextEmphasis.Transparency or Theme.TextMuted.Transparency,
			Font = p3.Font.Header2.Font
		})
	}
	local SubButtons = p1.props.subButtons
	
	if SubButtons then
		for Index, subButton in SubButtons do
			config[subButton.Name] = RoactModule.createElement(CategorySubButtonModule, {
				isClippedWhenParentUnselected = true,
				title = p2[subButton.Name],
				width = p4[Index],
				layoutOrder = Index + 1,
				index = Index,
				onSubButtonSelected = function(p7)
					-- upvalues: IsSelected (copy), p1 (copy)
					if not IsSelected then
						p1.props.onActivate()
					end
					p1.props.onSubButtonSelected(p7)
				end,
				parentButtonSelected = IsSelected,
				buttonRef = p1.subButtonRefs[Index],
				NextSelectionLeft = p1:getSubButtonNextSelectionLeft(Index),
				NextSelectionRight = p1:getSubButtonNextSelectionRight(Index)
			})
		end
	end
	t.UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, NavCornerSize) })
	t.UIPadding = RoactModule.createElement("UIPadding", {
		PaddingBottom = UDim.new(0, 0),
		PaddingTop = UDim.new(0, 0),
		PaddingLeft = UDim.new(0, NavButtonElementMargin),
		PaddingRight = UDim.new(0, NavButtonElementMargin)
	})
	t.Icon = RoactModule.createElement(ImageSetLabel, {
		LayoutOrder = 2,
		BackgroundTransparency = 1,
		Image = if IsSelected then Images[p1.props.iconOn] else Images[p1.props.iconOff],
		ImageColor3 = Theme.IconEmphasis.Color,
		Size = UDim2.new(0, XOffset1, 1, -p5),
		ScaleType = Enum.ScaleType.Fit,
		Position = UDim2.new(0, 0, 0, 0)
	})
	t.ScaledFrame = RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Size = p1.nonIconSizeMultiplierBinding:map(function(p7): UDim2
			-- upvalues: p6 (copy), p5 (copy)
			return UDim2.new(0, p7 * p6, 1, -p5)
		end),
		Position = UDim2.fromOffset(XOffset1, 0)
	}, config)
	
	return t
end

function IconCategoryButton.renderButtonWithTextAndIcon(p7, p8, p9, Callback, p10, TextWidth, p11, NavHeightDelta, p12)
	-- upvalues: RoactModule (copy), Focusable (copy), NavInnerPadding (copy), CursorKind (copy)
	local _Font = p9.Font
	local Theme = p9.Theme
	local IsSubNavigationButton = p7.props.isSubNavigationButton
	
	return RoactModule.createElement(Focusable.ImageButton, {
		AnchorPoint = Vector2.new(0, 0),
		Position = UDim2.new(0, 0, 0, NavInnerPadding),
		Size = UDim2.new(1, 0, 1, -NavInnerPadding + p10),
		BackgroundTransparency = if IsSubNavigationButton then Theme.BackgroundUIDefault.Transparency else Theme.BackgroundDefault.Transparency,
		BackgroundColor3 = if IsSubNavigationButton then Theme.BackgroundUIDefault.Color else Theme.BackgroundDefault.Color,
		[RoactModule.Event.Activated] = p7.props.onActivate,
		[RoactModule.Ref] = p7.props.forwardRef,
		NextSelectionLeft = p7.props.NextSelectionLeft,
		NextSelectionRight = p7.props.NextSelectionRight,
		SelectionImageObject = Callback(CursorKind.NavHighlight),
		restorePreviousChildFocus = true,
		defaultChild = p7:getDefaultChild()
	}, p7:getInnerFrameChildren(p8, p9, TextWidth, p11, NavHeightDelta, _Font.BaseSize * _Font.Header2.RelativeSize, p10, p12))
end

function IconCategoryButton.renderWithProviders(p7, p8, p9, p10)
	-- upvalues: Text (copy), NavSubButtonInnerPadding (copy), NavButtonElementPadding (copy), NavCornerSize (copy), NavInnerPadding (copy), NavButtonElementMargin (copy), RoactModule (copy), NewItemNotificationModule (copy)
	local IsSelected = p7.props.isSelected
	local HasNewItemNotification = p7.props.hasNewItemNotification
	local FrameRef = p7.props.frameRef
	local _Font = p9.Font
	local HeaderFont = _Font.Header2.Font
	local ScaledBaseSize = _Font.BaseSize * _Font.Header2.RelativeSize
	local TextWidth: number = Text.GetTextWidth(p8.title, HeaderFont, ScaledBaseSize)
	local List = {}
	local v1 = 0
	
	if p7.props.subButtons then
		for _, subButton in p7.props.subButtons do
			local NewTextWidth = Text.GetTextWidth(p8[subButton.Name], HeaderFont, ScaledBaseSize) + 2 * NavSubButtonInnerPadding
			table.insert(List, NewTextWidth)
			v1 = v1 + NavButtonElementPadding + NewTextWidth
		end
	end
	local NavCornerSize1 = if p7.props.isSubNavigationButton then 0 else NavCornerSize
	local NavHeightDelta = p7.props.navHeight - NavInnerPadding - 2 * NavButtonElementPadding
	local NewNavButtonElementPadding = NavButtonElementPadding + TextWidth + v1
	local NewNavButtonElementMargin = NavButtonElementMargin + NavHeightDelta + NavButtonElementMargin
	
	return RoactModule.createElement("Frame", {
		Size = p7.nonIconSizeMultiplierBinding:map(function(p11): UDim2
			-- upvalues: NewNavButtonElementMargin (copy), NewNavButtonElementPadding (copy), NavInnerPadding (upval), NavCornerSize1 (copy)
			return UDim2.new(0, NewNavButtonElementMargin + p11 * NewNavButtonElementPadding, 1, -NavInnerPadding + NavCornerSize1)
		end),
		BackgroundTransparency = 1,
		LayoutOrder = p7.props.layoutOrder,
		[RoactModule.Ref] = FrameRef
	}, {
		Button = p7:renderButtonWithTextAndIcon(p8, p9, p10, NavCornerSize1, TextWidth, List, NavHeightDelta, NewNavButtonElementPadding),
		NewItemNotification = HasNewItemNotification and RoactModule.createElement(NewItemNotificationModule, { isSelected = IsSelected })
	})
end

function IconCategoryButton.render(p11)
	-- upvalues: WithLocalizationFunction (copy), WithStyleFunction (copy), WithSelectionCursorProviderFunction (copy)
	local config = { title = p11.props.categoryTitle }
	
	if p11.props.subButtons then
		for _, subButton in p11.props.subButtons do
			config[subButton.Name] = subButton.Title
		end
	end
	return WithLocalizationFunction(config)(function(p12)
		-- upvalues: WithStyleFunction (upval), WithSelectionCursorProviderFunction (upval), p11 (copy)
		return WithStyleFunction(function(p13)
			-- upvalues: WithSelectionCursorProviderFunction (upval), p11 (upval), p12 (copy)
			return WithSelectionCursorProviderFunction(function(p14)
				-- upvalues: p11 (upval), p12 (upval), p13 (copy)
				return p11:renderWithProviders(p12, p13, p14)
			end)
		end)
	end)
end

return RoactModule.forwardRef(function(p12, ForwardRef)
	-- upvalues: RoactModule (copy), IconCategoryButton (copy), CryoModule (copy)
	return RoactModule.createElement(IconCategoryButton, CryoModule.Dictionary.join(p12, { forwardRef = ForwardRef }))
end)