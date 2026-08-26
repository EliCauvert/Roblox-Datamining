local parent = script.Parent.Parent
local parent_1 = parent.Parent
local roactModule = require(parent_1.Roact)
local roactFitComponentsModule = require(parent_1.RoactFitComponents)
local fitFrameVertical = roactFitComponentsModule.FitFrameVertical
local fitTextLabel = roactFitComponentsModule.FitTextLabel
local UIBloxModule = require(parent_1.UIBlox)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local iconSize = UIBloxModule.App.Constant.IconSize
local withStyle = UIBloxModule.Core.Style.withStyle
local multiTextLocalizerModule = require(parent.Locale.MultiTextLocalizer)
local modelViewportModule = require(parent.Generic.ModelViewport)
local imageunavailable = images["icons/status/imageunavailable"]
local name = roactModule.Component:extend(script.Name)
name.defaultProps = {
	anchorPoint = Vector2.new(0.5, 0.5),
	position = UDim2.new(0.5, 0, 0.5, 0)
}

function name.init(p1)
	-- upvalues: roactModule (ref)
	p1.contentRef = roactModule.createRef()
	p1.state = { contentSize = Vector2.new(0, 0) }
	
	function p0.changeContentSize(p2)
		-- upvalues: p1 (ref)
		if p1.state.contentSize ~= p2.AbsoluteSize then
			p1:setState({ contentSize = p2.AbsoluteSize })
		end
	end
end

function name.render(p1)
	-- upvalues: roactModule (ref), multiTextLocalizerModule (ref)
	return roactModule.createElement(multiTextLocalizerModule, {
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
		render = function(p2)
			-- upvalues: p1 (ref)
			return p1:renderAlert(p2)
		end
	})
end

function name.renderAlert(p1, p2)
	-- upvalues: withStyle (ref), buttonType (ref), roactModule (ref), imageSetLabel (ref), iconSize (ref), imageunavailable (ref), modelViewportModule (ref), interactiveAlert (ref), fitFrameVertical (ref), fitTextLabel (ref)
	local props = p1.props
	
	return withStyle(function(p3)
		-- upvalues: p2 (ref), props (ref), p1 (ref), buttonType (copy), roactModule (copy), imageSetLabel (copy), iconSize (copy), imageunavailable (copy), modelViewportModule (copy), interactiveAlert (copy), fitFrameVertical (copy), fitTextLabel (copy)
		local theme = p3.Theme
		local font = p3.Font
		local text = p2.YouOwnText .. " " .. p5.BalanceNow:gsub("{robux}", utf8.char(57346) .. tostring(props.balance))
		local var1 = if props.model then roactModule.createElement(modelViewportModule, {
			model = props.model,
			Position = UDim2.fromOffset(5, 5),
			Size = UDim2.fromOffset(85, 85)
		}) elseif props.itemIcon then roactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			ImageTransparency = 0,
			Position = UDim2.new(0, 5, 0, 5),
			Size = UDim2.new(0, 85, 0, 85),
			ScaleType = Enum.ScaleType.Stretch,
			Image = props.itemIcon
		}) else roactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 5, 0, 5),
			Size = UDim2.new(0, iconSize.Large, 0, iconSize.Large),
			ScaleType = Enum.ScaleType.Stretch,
			Image = imageunavailable,
			ImageColor3 = theme.UIDefault.Color,
			ImageTransparency = theme.UIDefault.Transparency
		})
		
		return roactModule.createElement(interactiveAlert, {
			screenSize = props.screenSize,
			position = props.position,
			anchorPoint = props.anchorPoint,
			title = p2.PurchaseSucceededTitle,
			middleContent = function()
				-- upvalues: roactModule (copy), fitFrameVertical (copy), p1 (copy), var1 (write), fitTextLabel (copy), font (ref), text (ref), theme (ref)
				return roactModule.createElement(fitFrameVertical, {
					BackgroundTransparency = 1,
					width = UDim.new(1, 0),
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					contentPadding = UDim.new(0, 24),
					[roactModule.Ref] = p1.contentRef,
					[roactModule.Change.AbsoluteSize] = p1.changeContentSize
				}, {
					ItemIconFrame = roactModule.createElement(fitFrameVertical, {
						LayoutOrder = 0,
						BackgroundTransparency = 1,
						width = UDim.new(1, 0),
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Center
					}, { ItemIcon = var1 }),
					YouOwnText = roactModule.createElement(fitTextLabel, {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						TextWrapped = true,
						width = fitTextLabel.Width.FitToText,
						maximumWidth = p1.state.contentSize.X,
						Font = font.Body.Font,
						Text = text,
						TextSize = font.BaseSize * font.Body.RelativeSize,
						TextColor3 = theme.TextDefault.Color
					})
				})
			end,
			buttonStackInfo = if p1.props.equipActivated then {
				buttons = {
					{
						props = {
							onActivated = props.doneActivated,
							text = p2.BackToShopText,
							inputIcon = props.cancelControllerIcon
						}
					},
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							onActivated = props.equipActivated,
							text = p2.EquipText,
							inputIcon = props.confirmControllerIcon
						}
					}
				}
			} else {
				buttons = {
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							onActivated = props.doneActivated,
							text = p2.BackToGameButtonText,
							inputIcon = props.confirmControllerIcon
						}
					}
				}
			}
		})
	end)
end

return name