local parent = script.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local parent_3 = parent_2.Parent
local roactModule = require(parent_3.Roact)
local tModule = require(parent_3.t)
local foundationModule = require(parent_3.Foundation)
local fitFrameVertical = require(parent_3.FitFrame).FitFrameVertical
local label = require(parent_2.Core.ImageSet.ImageSetComponent).Label
local genericTextLabelModule = require(parent_2.Core.Text.GenericTextLabel.GenericTextLabel)
local withStyleModule = require(parent_2.Core.Style.withStyle)
local buttonTypeModule = require(parent_2.App.Button.Enum.ButtonType)
local getIconSizeModule = require(parent_1.ImageSet.getIconSize)
local iconSizeModule = require(parent_1.ImageSet.Enum.IconSize)
local checkbox = foundationModule.Checkbox
local partialPageModalModule = require(parent.PartialPageModal)
local educationalModal = roactModule.PureComponent:extend("EducationalModal")
educationalModal.validateProps = tModule.strictInterface({
	bodyContents = tModule.array(tModule.strictInterface({
		icon = tModule.optional(tModule.union(tModule.string, tModule.table)),
		text = tModule.string,
		layoutOrder = tModule.optional(tModule.integer),
		isSystemMenuIcon = tModule.optional(tModule.boolean)
	})),
	hasDoNotShow = tModule.optional(tModule.boolean),
	cancelText = tModule.string,
	confirmText = tModule.string,
	doNotShowText = tModule.optional(tModule.string),
	titleText = tModule.optional(tModule.string),
	titleBackgroundImageProps = tModule.strictInterface({
		image = tModule.string,
		imageHeight = tModule.number,
		text = tModule.optional(tModule.string)
	}),
	screenSize = tModule.Vector2,
	onDismiss = tModule.callback,
	onCancel = tModule.callback,
	onConfirm = tModule.callback
})

local function ContentItem(p0)
	-- upvalues: roactModule (ref), label (ref), getIconSizeModule (ref), iconSizeModule (ref), genericTextLabelModule (ref)
	local vector2 = Vector2.new(16, 16)
	local isSystemMenuIcon = p0.isSystemMenuIcon or false
	local isSystemMenuIcon_1 = isSystemMenuIcon or p0.icon
	local stylePalette = p0.stylePalette
	local theme = stylePalette.Theme
	local font = stylePalette.Font
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = isSystemMenuIcon_1 and UDim2.new(0, 253, 0, vector2.Y) or UDim2.new(1, 0, 0, vector2.Y),
		AutomaticSize = if isSystemMenuIcon_1 then Enum.AutomaticSize.None else Enum.AutomaticSize.Y,
		LayoutOrder = p0.layoutOrder
	}, {
		HorizontalLayout = roactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = isSystemMenuIcon and UDim.new(0, 10) or UDim.new(0, 8),
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		Padding = roactModule.createElement("UIPadding", {
			PaddingLeft = isSystemMenuIcon and UDim.new(0, 2) or UDim.new(0, 0)
		}),
		Icon = isSystemMenuIcon and roactModule.createElement(label, {
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/TopBar/iconBase.png",
			LayoutOrder = 1,
			Size = UDim2.fromOffset(32, 32)
		}, {
			Icon = roactModule.createElement(label, {
				ZIndex = 1,
				BackgroundTransparency = 1,
				Image = "rbxasset://textures/ui/TopBar/coloredlogo.png",
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.fromOffset(24, 24)
			})
		}) or (isSystemMenuIcon_1 and roactModule.createElement(label, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Image = p0.icon,
			Size = UDim2.fromOffset(getIconSizeModule(iconSizeModule.Medium), getIconSizeModule(iconSizeModule.Medium)),
			ImageColor3 = theme.IconDefault.Color,
			ImageTransparency = theme.IconDefault.Transparency
		}) or nil),
		Text = p0.text and roactModule.createElement(genericTextLabelModule, {
			BackgroundTransparency = 1,
			TextWrapped = true,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, vector2.Y),
			AutomaticSize = if isSystemMenuIcon_1 then Enum.AutomaticSize.None else Enum.AutomaticSize.Y,
			Text = p0.text,
			TextSize = font.Body.RelativeSize * font.BaseSize,
			colorStyle = theme.TextDefault,
			TextTransparency = theme.TextDefault.Transparency,
			fontStyle = font.Body,
			TextXAlignment = if isSystemMenuIcon_1 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center
		})
	})
end

function educationalModal.init(p1)
	-- upvalues: roactModule (ref)
	p1.state = { shouldNotShowAgain = false }
	local var14, var15 = roactModule.createBinding(Vector2.new(0, 0))
	p1.contentSize = var14
	p1.changeContentSize = var15
	
	function p1.toggleDoNotShow()
		-- upvalues: p1 (ref)
		p1:setState(function(p2)
			return { shouldNotShowAgain = not p2.shouldNotShowAgain }
		end)
	end
	
	function p1.onDismiss()
		-- upvalues: p1 (ref)
		p1.props.onDismiss(p1.state.shouldNotShowAgain)
	end
	
	function p1.onCancel()
		-- upvalues: p1 (ref)
		p1.props.onCancel(p1.state.shouldNotShowAgain)
	end
	
	function p1.onConfirm()
		-- upvalues: p1 (ref)
		p1.props.onConfirm(p1.state.shouldNotShowAgain)
	end
end

function educationalModal.render(p3)
	-- upvalues: withStyleModule (ref), roactModule (ref), ContentItem (ref), checkbox (ref), partialPageModalModule (ref), buttonTypeModule (ref), fitFrameVertical (ref)
	local props = p3.props
	local hasDoNotShow = props.hasDoNotShow
	
	return withStyleModule(function(p4)
		-- upvalues: props (ref), roactModule (copy), ContentItem (copy), hasDoNotShow (ref), checkbox (copy), p3 (ref), partialPageModalModule (copy), buttonTypeModule (copy), fitFrameVertical (copy)
		local var16 = 0
		local t = {}
		
		for i, v in ipairs(props.bodyContents) do
			table.insert(t, roactModule.createElement(ContentItem, {
				key = tostring(i),
				icon = v.icon,
				text = v.text,
				layoutOrder = i,
				isSystemMenuIcon = v.isSystemMenuIcon,
				stylePalette = p4
			}))
			var16 += 1
		end
		local theme = p4.Theme
		
		if hasDoNotShow then
			table.insert(t, roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 50),
				LayoutOrder = var16 + 1
			}, {
				UIListLayout = roactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, 21),
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Center
				}),
				Divider = roactModule.createElement("Frame", {
					LayoutOrder = 1,
					BorderSizePixel = 0,
					BackgroundColor3 = theme.Divider.Color,
					BackgroundTransparency = theme.Divider.Transparency,
					Size = UDim2.new(1, 0, 0, 1)
				}),
				DoNotShowCheckbox = roactModule.createElement(checkbox, {
					LayoutOrder = 2,
					label = props.doNotShowText,
					onActivated = p3.toggleDoNotShow,
					isChecked = p3.state.shouldNotShowAgain
				})
			}))
		end
		return roactModule.createElement(partialPageModalModule, {
			bottomPadding = 50,
			title = props.titleText,
			titleBackgroundImageProps = props.titleBackgroundImageProps,
			screenSize = props.screenSize,
			buttonStackProps = {
				buttons = {
					{
						props = {
							isDisabled = false,
							onActivated = if hasDoNotShow then p3.onCancel else props.onCancel,
							text = props.cancelText
						}
					},
					{
						buttonType = buttonTypeModule.PrimarySystem,
						props = {
							isDisabled = false,
							onActivated = if hasDoNotShow then p3.onConfirm else props.onConfirm,
							text = props.confirmText
						}
					}
				}
			},
			onCloseClicked = if hasDoNotShow then p3.onDismiss else props.onDismiss
		}, {
			BodyContents = roactModule.createElement(fitFrameVertical, {
				BackgroundTransparency = 1,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				width = UDim.new(1, 0),
				contentPadding = UDim.new(0, 28),
				margin = { top = 36, bottom = 36 },
				[roactModule.Change.AbsoluteSize] = function(p5)
					-- upvalues: p3 (copy)
					p3.changeContentSize(p5.AbsoluteSize)
				end
			}, t)
		})
	end)
end

return educationalModal