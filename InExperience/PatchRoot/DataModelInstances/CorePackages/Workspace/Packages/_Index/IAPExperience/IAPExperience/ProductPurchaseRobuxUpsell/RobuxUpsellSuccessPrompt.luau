local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local RoactModule = require(Parent1.Roact)
local RoactFitComponentsModule = require(Parent1.RoactFitComponents)
local FitFrameVertical = RoactFitComponentsModule.FitFrameVertical
local FitTextLabel = RoactFitComponentsModule.FitTextLabel
local UIBloxModule = require(Parent1.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local IconSize = UIBloxModule.App.Constant.IconSize
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local MultiTextLocalizerModule = require(Parent.Locale.MultiTextLocalizer)
local ModelViewportModule = require(Parent.Generic.ModelViewport)
local IconsStatusImageunavailable = UIBloxModule.App.ImageSet.Images["icons/status/imageunavailable"]
local ExtendResult = RoactModule.Component:extend(script.Name)
ExtendResult.defaultProps = {
	anchorPoint = Vector2.new(0.5, 0.5),
	position = UDim2.new(0.5, 0, 0.5, 0)
}

function ExtendResult.init(p1) --[[ Line: 48 ]]
	-- upvalues: RoactModule (copy)
	p1.contentRef = RoactModule.createRef()
	p1.state = { contentSize = Vector2.new(0, 0) }
	
	function p1.changeContentSize(Frame: Frame) --[[ Line: 54 ]]
		-- upvalues: p1 (copy)
		if p1.state.contentSize ~= Frame.AbsoluteSize then
			p1:setState({ contentSize = Frame.AbsoluteSize })
		end
	end
end

function ExtendResult.render(p1) --[[ Line: 63 ]]
	-- upvalues: RoactModule (copy), MultiTextLocalizerModule (copy)
	return RoactModule.createElement(MultiTextLocalizerModule, {
		keys = {
			PurchaseSucceededTitle = {
				key = "IAPExperience.PurchaseSuccess.Title.PurchaseSucceeded"
			},
			YouOwnText = {
				key = "IAPExperience.PurchaseSuccess.Text.YouOwn",
				params = { name = p1.props.itemName }
			},
			BalanceNow = { key = "IAPExperience.PurchaseSuccess.Text.BalanceNow" },
			BackToGameButtonText = { key = "IAPExperience.PurchaseSuccess.Action.BackToGame" },
			EquipText = { key = "IAPExperience.PurchaseSuccess.Action.Equip" },
			BackToShopText = { key = "IAPExperience.PurchaseSuccess.Action.BackToShop" }
		},
		render = function(p2) --[[ Line: 88 ]]
			-- upvalues: p1 (copy)
			return p1:renderAlert(p2)
		end
	})
end

function ExtendResult.renderAlert(p1, p2) --[[ Line: 94 ]]
	-- upvalues: WithStyleFunction (copy), ButtonType (copy), RoactModule (copy), ImageSetLabel (copy), IconSize (copy), IconsStatusImageunavailable (copy), ModelViewportModule (copy), InteractiveAlert (copy), FitFrameVertical (copy), FitTextLabel (copy)
	local Props = p1.props
	
	return WithStyleFunction(function(p3) --[[ Line: 97 ]]
		-- upvalues: p2 (copy), Props (copy), p1 (copy), ButtonType (upval), RoactModule (upval), ImageSetLabel (upval), IconSize (upval), IconsStatusImageunavailable (upval), ModelViewportModule (upval), InteractiveAlert (upval), FitFrameVertical (upval), FitTextLabel (upval)
		local Theme = p3.Theme
		local _Font = p3.Font
		local Text = p2.YouOwnText .. " " .. p2.BalanceNow:gsub("{robux}", utf8.char(57346) .. tostring(Props.balance))
		local Element = if Props.model then RoactModule.createElement(ModelViewportModule, {
			model = Props.model,
			Position = UDim2.fromOffset(5, 5),
			Size = UDim2.fromOffset(85, 85)
		}) elseif Props.itemIcon then RoactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			Position = UDim2.new(0, 5, 0, 5),
			Size = UDim2.new(0, 85, 0, 85),
			ScaleType = Enum.ScaleType.Stretch,
			Image = Props.itemIcon
		}) else RoactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 5, 0, 5),
			Size = UDim2.new(0, IconSize.Large, 0, IconSize.Large),
			ScaleType = Enum.ScaleType.Stretch,
			Image = IconsStatusImageunavailable,
			ImageColor3 = Theme.UIDefault.Color,
			ImageTransparency = Theme.UIDefault.Transparency
		})
		
		return RoactModule.createElement(InteractiveAlert, {
			screenSize = Props.screenSize,
			position = Props.position,
			anchorPoint = Props.anchorPoint,
			title = p2.PurchaseSucceededTitle,
			middleContent = function() --[[ Line: 175 ]]
				-- upvalues: RoactModule (upval), FitFrameVertical (upval), p1 (upval), Element (ref), FitTextLabel (upval), _Font (copy), Text (copy), Theme (copy)
				return RoactModule.createElement(FitFrameVertical, {
					BackgroundTransparency = 1,
					width = UDim.new(1, 0),
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					contentPadding = UDim.new(0, 24),
					[RoactModule.Ref] = p1.contentRef,
					[RoactModule.Change.AbsoluteSize] = p1.changeContentSize
				}, {
					ItemIconFrame = RoactModule.createElement(FitFrameVertical, {
						LayoutOrder = 0,
						BackgroundTransparency = 1,
						width = UDim.new(1, 0),
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Center
					}, { ItemIcon = Element }),
					YouOwnText = RoactModule.createElement(FitTextLabel, {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						TextWrapped = true,
						width = FitTextLabel.Width.FitToText,
						maximumWidth = p1.state.contentSize.X,
						Font = _Font.Body.Font,
						Text = Text,
						TextSize = _Font.BaseSize * _Font.Body.RelativeSize,
						TextColor3 = Theme.TextDefault.Color
					})
				})
			end,
			buttonStackInfo = if p1.props.equipActivated then {
				buttons = {
					{
						props = {
							onActivated = Props.doneActivated,
							text = p2.BackToShopText,
							inputIcon = Props.cancelControllerIcon
						}
					},
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							onActivated = Props.equipActivated,
							text = p2.EquipText,
							inputIcon = Props.confirmControllerIcon
						}
					}
				}
			} else {
				buttons = {
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							onActivated = Props.doneActivated,
							text = p2.BackToGameButtonText,
							inputIcon = Props.confirmControllerIcon
						}
					}
				}
			}
		})
	end)
end

return ExtendResult