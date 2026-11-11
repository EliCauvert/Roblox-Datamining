local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local Parent2 = Parent1.Parent
local Parent3 = Parent2.Parent
local RoactModule = require(Parent3.Roact)
local TModule = require(Parent3.t)
local FitFrameVertical = require(Parent3.FitFrame).FitFrameVertical
local Label = require(Parent2.Core.ImageSet.ImageSetComponent).Label
local GenericTextLabelModule = require(Parent2.Core.Text.GenericTextLabel.GenericTextLabel)
local WithStyleModule = require(Parent2.Core.Style.withStyle)
local ButtonTypeModule = require(Parent2.App.Button.Enum.ButtonType)
local GetIconSizeModule = require(Parent1.ImageSet.getIconSize)
local IconSizeModule = require(Parent1.ImageSet.Enum.IconSize)
local Checkbox = require(Parent3.Foundation).Checkbox
local PartialPageModalModule = require(Parent.PartialPageModal)
local EducationalModal = RoactModule.PureComponent:extend("EducationalModal")
EducationalModal.validateProps = TModule.strictInterface({
	bodyContents = TModule.array(TModule.strictInterface({
		icon = TModule.optional(TModule.union(TModule.string, TModule.table)),
		text = TModule.string,
		layoutOrder = TModule.optional(TModule.integer),
		isSystemMenuIcon = TModule.optional(TModule.boolean)
	})),
	hasDoNotShow = TModule.optional(TModule.boolean),
	cancelText = TModule.string,
	confirmText = TModule.string,
	doNotShowText = TModule.optional(TModule.string),
	titleText = TModule.optional(TModule.string),
	titleBackgroundImageProps = TModule.strictInterface({
		image = TModule.string,
		imageHeight = TModule.number,
		text = TModule.optional(TModule.string)
	}),
	screenSize = TModule.Vector2,
	onDismiss = TModule.callback,
	onCancel = TModule.callback,
	onConfirm = TModule.callback
})

local function ContentItem(p1)
	-- upvalues: RoactModule (copy), Label (copy), GetIconSizeModule (copy), IconSizeModule (copy), GenericTextLabelModule (copy)
	local _Vector2 = Vector2.new(16, 16)
	local IsSystemMenuIcon = p1.isSystemMenuIcon or false
	local IsSystemMenuIcon1 = IsSystemMenuIcon or p1.icon
	local StylePalette = p1.stylePalette
	local Theme = StylePalette.Theme
	local StylePaletteFont = StylePalette.Font
	local ScaledRelativeSize = StylePaletteFont.Body.RelativeSize * StylePaletteFont.BaseSize
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = IsSystemMenuIcon1 and UDim2.new(0, 253, 0, _Vector2.Y) or UDim2.new(1, 0, 0, _Vector2.Y),
		AutomaticSize = IsSystemMenuIcon1 and Enum.AutomaticSize.None or Enum.AutomaticSize.Y,
		LayoutOrder = p1.layoutOrder
	}, {
		HorizontalLayout = RoactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = IsSystemMenuIcon and UDim.new(0, 10) or UDim.new(0, 8),
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		Padding = RoactModule.createElement("UIPadding", {
			PaddingLeft = IsSystemMenuIcon and UDim.new(0, 2) or UDim.new(0, 0)
		}),
		Icon = IsSystemMenuIcon and RoactModule.createElement(Label, {
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/TopBar/iconBase.png",
			LayoutOrder = 1,
			Size = UDim2.fromOffset(32, 32)
		}, {
			Icon = RoactModule.createElement(Label, {
				ZIndex = 1,
				BackgroundTransparency = 1,
				Image = "rbxasset://textures/ui/TopBar/coloredlogo.png",
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.fromOffset(24, 24)
			})
		}) or (IsSystemMenuIcon1 and RoactModule.createElement(Label, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Image = p1.icon,
			Size = UDim2.fromOffset(GetIconSizeModule(IconSizeModule.Medium), GetIconSizeModule(IconSizeModule.Medium)),
			ImageColor3 = Theme.IconDefault.Color,
			ImageTransparency = Theme.IconDefault.Transparency
		}) or nil),
		Text = p1.text and RoactModule.createElement(GenericTextLabelModule, {
			BackgroundTransparency = 1,
			TextWrapped = true,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, _Vector2.Y),
			AutomaticSize = IsSystemMenuIcon1 and Enum.AutomaticSize.None or Enum.AutomaticSize.Y,
			Text = p1.text,
			TextSize = ScaledRelativeSize,
			colorStyle = Theme.TextDefault,
			TextTransparency = Theme.TextDefault.Transparency,
			fontStyle = StylePaletteFont.Body,
			TextXAlignment = IsSystemMenuIcon1 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center
		})
	})
end

function EducationalModal.init(p1)
	-- upvalues: RoactModule (copy)
	p1.state = { shouldNotShowAgain = false }
	p1.contentSize, p1.changeContentSize = RoactModule.createBinding(Vector2.new(0, 0))
	
	function p1.toggleDoNotShow()
		-- upvalues: p1 (copy)
		p1:setState(function(p2)
			return { shouldNotShowAgain = not p2.shouldNotShowAgain }
		end)
	end
	
	function p1.onDismiss()
		-- upvalues: p1 (copy)
		p1.props.onDismiss(p1.state.shouldNotShowAgain)
	end
	
	function p1.onCancel()
		-- upvalues: p1 (copy)
		p1.props.onCancel(p1.state.shouldNotShowAgain)
	end
	
	function p1.onConfirm()
		-- upvalues: p1 (copy)
		p1.props.onConfirm(p1.state.shouldNotShowAgain)
	end
end

function EducationalModal.render(p1)
	-- upvalues: WithStyleModule (copy), RoactModule (copy), ContentItem (copy), Checkbox (copy), PartialPageModalModule (copy), ButtonTypeModule (copy), FitFrameVertical (copy)
	local Props = p1.props
	local HasDoNotShow = Props.hasDoNotShow
	
	return WithStyleModule(function(StylePalette)
		-- upvalues: Props (copy), RoactModule (upval), ContentItem (upval), HasDoNotShow (copy), Checkbox (upval), p1 (copy), PartialPageModalModule (upval), ButtonTypeModule (upval), FitFrameVertical (upval)
		local Count = 0
		local List = {}
		
		for LayoutOrder, bodyContent in ipairs(Props.bodyContents) do
			table.insert(List, (RoactModule.createElement(ContentItem, {
				key = tostring(LayoutOrder),
				icon = bodyContent.icon,
				text = bodyContent.text,
				layoutOrder = LayoutOrder,
				isSystemMenuIcon = bodyContent.isSystemMenuIcon,
				stylePalette = StylePalette
			})))
			Count += 1
		end
		local Theme = StylePalette.Theme
		
		if HasDoNotShow then
			table.insert(List, (RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 50),
				LayoutOrder = Count + 1
			}, {
				UIListLayout = RoactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, 21),
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Center
				}),
				Divider = RoactModule.createElement("Frame", {
					LayoutOrder = 1,
					BorderSizePixel = 0,
					BackgroundColor3 = Theme.Divider.Color,
					BackgroundTransparency = Theme.Divider.Transparency,
					Size = UDim2.new(1, 0, 0, 1)
				}),
				DoNotShowCheckbox = RoactModule.createElement(Checkbox, {
					LayoutOrder = 2,
					label = Props.doNotShowText,
					onActivated = p1.toggleDoNotShow,
					isChecked = p1.state.shouldNotShowAgain
				})
			})))
		end
		return RoactModule.createElement(PartialPageModalModule, {
			bottomPadding = 50,
			title = Props.titleText,
			titleBackgroundImageProps = Props.titleBackgroundImageProps,
			screenSize = Props.screenSize,
			buttonStackProps = {
				buttons = {
					{
						props = {
							isDisabled = false,
							onActivated = if HasDoNotShow then p1.onCancel else Props.onCancel,
							text = Props.cancelText
						}
					},
					{
						buttonType = ButtonTypeModule.PrimarySystem,
						props = {
							isDisabled = false,
							onActivated = if HasDoNotShow then p1.onConfirm else Props.onConfirm,
							text = Props.confirmText
						}
					}
				}
			},
			onCloseClicked = if HasDoNotShow then p1.onDismiss else Props.onDismiss
		}, {
			BodyContents = RoactModule.createElement(FitFrameVertical, {
				BackgroundTransparency = 1,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				width = UDim.new(1, 0),
				contentPadding = UDim.new(0, 28),
				margin = { top = 36, bottom = 36 },
				[RoactModule.Change.AbsoluteSize] = function(Frame)
					-- upvalues: p1 (upval)
					p1.changeContentSize(Frame.AbsoluteSize)
				end
			}, List)
		})
	end)
end

return EducationalModal