local UserInputService = game:GetService("UserInputService")
local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local FitTextLabelModule = require(Modules.LuaApp.Components.FitTextLabel)
local DEPRECATEDImageSetLabelModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetLabel)
local FFlagBoldSearchListPickerSuggestionsModule = require(Modules.LuaApp.Flags.FFlagBoldSearchListPickerSuggestions)
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local SearchBarListPickerItem = RoactModule.PureComponent:extend("SearchBarListPickerItem")
SearchBarListPickerItem.defaultProps = { displayIcon = nil }

function SearchBarListPickerItem.init(p1)
	-- upvalues: UserInputService (copy)
	p1.state = { menuItemDown = false }
	
	function p1:onMenuItemInputBegan(Input)
		-- upvalues: p1 (copy)
		if (Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.MouseButton1) and Input.UserInputState == Enum.UserInputState.Begin then
			p1.onMenuItemDown()
		end
	end
	
	function p1:onMenuItemInputEnd(_)
		-- upvalues: p1 (copy)
		p1.onMenuItemUp()
	end
	
	function p1.eventDisconnect()
		-- upvalues: p1 (copy)
		if p1.userInputServiceConn then
			p1.userInputServiceConn:Disconnect()
			p1.userInputServiceConn = nil
		end
	end
	
	function p1.onMenuItemDown()
		-- upvalues: p1 (copy), UserInputService (upval)
		if not p1.state.menuItemDown then
			p1.eventDisconnect()
			p1.userInputServiceConn = UserInputService.InputEnded:Connect(function()
				-- upvalues: p1 (upval)
				p1.onMenuItemUp()
			end)
			p1:setState({ menuItemDown = true })
		end
	end
	
	function p1.onMenuItemUp(MenuItemActive)
		-- upvalues: p1 (copy)
		if p1.state.menuItemDown or p1.state.menuItemActive ~= MenuItemActive then
			p1:setState({ menuItemDown = false })
		end
		p1.eventDisconnect()
	end
end

function SearchBarListPickerItem.renderWithProviders(p1, Callback)
	-- upvalues: WithStyleFunction (copy), FFlagBoldSearchListPickerSuggestionsModule (copy), RoactModule (copy), Focusable (copy), CursorKind (copy), ImageSetLabel (copy), Images (copy), DEPRECATEDImageSetLabelModule (copy), FitTextLabelModule (copy), FitChildrenModule (copy), LoadableImage (copy)
	local Item = p1.props.item
	local LayoutOrder = p1.props.layoutOrder
	local SeparatorEnabled = p1.props.separatorEnabled
	local MenuItemDown = p1.state.menuItemDown
	local IsRichItem = Item.isRichItem
	local IsRecentCatalogSearchItem = Item.isRecentCatalogSearchItem
	local ForwardRef = p1.props.forwardRef
	
	return WithStyleFunction(function(p2)
		-- upvalues: FFlagBoldSearchListPickerSuggestionsModule (upval), Item (copy), p1 (copy), IsRichItem (copy), RoactModule (upval), Focusable (upval), MenuItemDown (copy), LayoutOrder (copy), ForwardRef (copy), Callback (copy), CursorKind (upval), IsRecentCatalogSearchItem (copy), ImageSetLabel (upval), Images (upval), DEPRECATEDImageSetLabelModule (upval), FitTextLabelModule (upval), FitChildrenModule (upval), LoadableImage (upval), SeparatorEnabled (copy)
		local Text = if FFlagBoldSearchListPickerSuggestionsModule then Item.text else nil
		
		if FFlagBoldSearchListPickerSuggestionsModule and p1.props.currentKeyword and not IsRichItem then
			local EmphasisColor3 = p2.Tokens.Color.Content.Emphasis.Color3
			local Text1: string = `rgb({math.round(EmphasisColor3.r * 255)},{math.round(EmphasisColor3.g * 255)},{math.round(EmphasisColor3.b * 255)})`
			local StartIndex: number = Text:lower():find(p1.props.currentKeyword:lower())
			
			if StartIndex then
				local Segment: string = Text:sub(StartIndex, StartIndex + p1.props.currentKeyword:len() - 1)
				local ColorName: string = `<font color="{Text1}"><b>`
				Text = `{ColorName}{Text:gsub(Segment, `</b></font>{Segment}{ColorName}`, 1)}</b></font>`
			elseif not p1.props.currentKeyword:lower():find(Text:lower()) then
				Text = `<font color="{Text1}"><b>` .. Text .. "</b></font>"
			end
		end
		return RoactModule.createElement(Focusable.ImageButton, {
			BackgroundColor3 = MenuItemDown and p2.Theme.BackgroundOnPress.Color or p2.Theme.BackgroundDefault.Color,
			BackgroundTransparency = MenuItemDown and p2.Theme.BackgroundOnPress.Transparency or 1,
			AutoButtonColor = false,
			BorderSizePixel = 0,
			ClipsDescendants = false,
			LayoutOrder = LayoutOrder,
			Size = UDim2.new(1, 0, 0, if IsRichItem then 64 else 56),
			AutomaticSize = Enum.AutomaticSize.Y,
			[RoactModule.Event.Activated] = Item.onSelect,
			[RoactModule.Event.InputBegan] = p1.onMenuItemInputBegan,
			[RoactModule.Event.InputEnded] = p1.onMenuItemInputEnd,
			NextSelectionLeft = p1.props.NextSelectionLeft,
			NextSelectionRight = p1.props.NextSelectionRight,
			NextSelectionUp = p1.props.NextSelectionUp,
			NextSelectionDown = p1.props.NextSelectionDown,
			[RoactModule.Ref] = ForwardRef,
			SelectionImageObject = Callback(CursorKind.RoundedRectNoInset)
		}, {
			Container = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 9)
				}),
				LeftSpacing = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 1,
					Size = UDim2.new(0, 0, 0, if IsRichItem then 64 else 56)
				}),
				SearchIcon = if IsRecentCatalogSearchItem then RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 2,
					Size = UDim2.new(0, 24, 0, 24),
					Image = Images["icons/menu/recent"],
					ImageColor3 = p2.Theme.IconDefault.Color,
					ImageTransparency = p2.Theme.IconDefault.Transparency
				}) else RoactModule.createElement(DEPRECATEDImageSetLabelModule, {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Image = "LuaApp/icons/ic-search-new",
					LayoutOrder = 2,
					Size = UDim2.new(0, 24, 0, 24),
					ImageColor3 = p2.Theme.IconDefault.Color,
					ImageTransparency = p2.Theme.IconDefault.Transparency
				}),
				Content = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 3,
					Size = UDim2.new(1, -112, 1, 0)
				}, {
					Layout = RoactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						Padding = UDim.new(0, 5)
					}),
					TitleText = RoactModule.createElement(FitTextLabelModule, {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						LayoutOrder = 1,
						TextWrapped = true,
						Size = UDim2.new(1, 0, 0, 0),
						RichText = if FFlagBoldSearchListPickerSuggestionsModule then p1.props.currentKeyword ~= nil and not IsRichItem else nil,
						Text = if FFlagBoldSearchListPickerSuggestionsModule then Text else Item.text,
						Font = p2.Font.Body.Font,
						TextSize = p2.Font.BaseSize * p2.Font.Body.RelativeSize,
						TextColor3 = p2.Theme.TextDefault.Color,
						TextTransparency = p2.Theme.TextDefault.Transparency,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = if FFlagBoldSearchListPickerSuggestionsModule then IsRichItem and Enum.TextYAlignment.Top or Enum.TextYAlignment.Center else Enum.TextYAlignment.Top,
						fitAxis = FitChildrenModule.FitAxis.Height
					}),
					CategoryText = IsRichItem and RoactModule.createElement(FitTextLabelModule, {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						LayoutOrder = 1,
						Text = "Game",
						TextWrapped = true,
						Size = UDim2.new(1, 0, 0, 0),
						Font = p2.Font.CaptionBody.Font,
						TextSize = p2.Font.BaseSize * p2.Font.CaptionBody.RelativeSize,
						TextColor3 = p2.Theme.TextMuted.Color,
						TextTransparency = p2.Theme.TextMuted.Transparency,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Top,
						fitAxis = FitChildrenModule.FitAxis.Height
					})
				}),
				RichIcon = IsRichItem and RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 4,
					Size = UDim2.new(0, 44, 0, 44),
					Position = UDim2.new(1, -44, 0, 0)
				}, {
					Shadow = RoactModule.createElement("Frame", {
						BorderSizePixel = 0,
						ZIndex = 10,
						Size = UDim2.new(0, 36, 0, 36),
						Position = UDim2.new(0, 8, 0, 0),
						BackgroundColor3 = p2.Theme.BackgroundOnHover.Color,
						BackgroundTransparency = p2.Theme.BackgroundOnHover.Transparency
					}),
					Border = RoactModule.createElement("Frame", {
						BorderSizePixel = 0,
						ZIndex = 11,
						Size = UDim2.new(0, 36, 0, 36),
						Position = UDim2.new(0, 2, 0, 6),
						BackgroundColor3 = p2.Theme.BackgroundDefault.Color,
						BackgroundTransparency = p2.Theme.BackgroundDefault.Transparency
					}),
					GameIcon = RoactModule.createElement(LoadableImage, {
						BackgroundTransparency = 1,
						useShimmerAnimationWhileLoading = true,
						ZIndex = 12,
						Size = UDim2.new(0, 36, 0, 36),
						Position = UDim2.new(0, 0, 0, 8),
						Image = Item.displayIcon
					})
				})
			}),
			Separator = SeparatorEnabled and RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundColor3 = p2.Theme.Divider.Color,
				BackgroundTransparency = p2.Theme.Divider.Transparency,
				Size = UDim2.new(1, 0, 0, 1),
				Position = UDim2.new(0, 0, 1, 0)
			})
		})
	end)
end

function SearchBarListPickerItem.render(p1)
	-- upvalues: WithSelectionCursorProviderFunction (copy)
	return WithSelectionCursorProviderFunction(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithProviders(p2)
	end)
end

function SearchBarListPickerItem.willUnmount(p1)
	p1.eventDisconnect()
end

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: RoactModule (copy), SearchBarListPickerItem (copy), CryoModule (copy)
	return RoactModule.createElement(SearchBarListPickerItem, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)