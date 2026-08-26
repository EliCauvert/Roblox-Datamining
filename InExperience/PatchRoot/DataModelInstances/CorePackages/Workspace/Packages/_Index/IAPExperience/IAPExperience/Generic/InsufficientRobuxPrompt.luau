local parent = script.Parent.Parent
local parent_1 = parent.Parent
local roactModule = require(parent_1.Roact)
local roactFitComponentsModule = require(parent_1.RoactFitComponents)
local fitFrameVertical = roactFitComponentsModule.FitFrameVertical
local fitFrameHorizontal = roactFitComponentsModule.FitFrameHorizontal
local fitTextLabel = roactFitComponentsModule.FitTextLabel
local UIBloxModule = require(parent_1.UIBlox)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local withStyle = UIBloxModule.Core.Style.withStyle
local multiTextLocalizerModule = require(parent.Locale.MultiTextLocalizer)
local robux = images["icons/common/robux"]
local name = roactModule.Component:extend(script.Name)
name.defaultProps = {
	anchorPoint = Vector2.new(0.5, 0.5),
	position = UDim2.new(0.5, 0, 0.5, 0)
}

function name.render(p1)
	-- upvalues: roactModule (ref), multiTextLocalizerModule (ref)
	return roactModule.createElement(multiTextLocalizerModule, {
		keys = {
			title = {
				key = "IAPExperience.InsufficientRobux.Title.InsufficientRobux"
			},
			dontHaveEnough = {
				key = "IAPExperience.InsufficientRobux.Text.DontHaveEnough"
			},
			currentBalance = {
				key = "IAPExperience.InsufficientRobux.Text.CurrentBalance"
			},
			cancel = { key = "IAPExperience.InsufficientRobux.Action.Cancel" },
			buyRobux = { key = "IAPExperience.InsufficientRobux.Action.BuyRobux" }
		},
		render = function(p2)
			-- upvalues: p1 (ref)
			return p1:renderAlert(p2)
		end
	})
end

function name.renderAlert(p1, p2)
	-- upvalues: withStyle (ref), roactModule (ref), interactiveAlert (ref), buttonType (ref), fitFrameVertical (ref), roactFitComponentsModule (ref), fitTextLabel (ref), fitFrameHorizontal (ref), imageSetLabel (ref), robux (ref)
	return withStyle(function(p3)
		-- upvalues: roactModule (copy), interactiveAlert (copy), p1 (ref), p2 (ref), buttonType (copy), fitFrameVertical (copy), roactFitComponentsModule (copy), fitTextLabel (copy), fitFrameHorizontal (copy), imageSetLabel (copy), robux (copy)
		local font = p3.Font
		local theme = p3.Theme
		local var1 = font.BaseSize * font.Body.RelativeSize
		
		return roactModule.createElement(interactiveAlert, {
			screenSize = p1.props.screenSize,
			title = p2.title,
			bodyText = p2.dontHaveEnough,
			buttonStackInfo = {
				buttons = {
					{
						isDefaultChild = true,
						props = { onActivated = p1.props.closePrompt, text = p2.cancel }
					},
					{
						buttonType = buttonType.PrimarySystem,
						props = { onActivated = p1.props.buyRobux, text = p2.buyRobux }
					}
				}
			},
			middleContent = function()
				-- upvalues: roactModule (copy), fitFrameVertical (copy), roactFitComponentsModule (copy), fitTextLabel (copy), font (ref), p2 (copy), theme (ref), var1 (ref), fitFrameHorizontal (copy), imageSetLabel (copy), robux (copy), p1 (copy)
				return roactModule.createElement(fitFrameVertical, {
					BackgroundTransparency = 1,
					margin = roactFitComponentsModule.Rect.quad(10, 0, 10, 0),
					contentPadding = UDim.new(0, 30),
					width = UDim.new(1, 0),
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}, {
					CurrentBalanceLabel = roactModule.createElement(fitTextLabel, {
						BackgroundTransparency = 1,
						LayoutOrder = 0,
						width = fitTextLabel.Width.FitToText,
						Font = font.Body.Font,
						Text = p2.currentBalance,
						TextColor3 = theme.TextDefault.Color,
						TextTransparency = theme.TextDefault.Transparency,
						TextSize = var1
					}),
					RobuxAmount = roactModule.createElement(fitFrameHorizontal, {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						height = UDim.new(1, 0),
						contentPadding = UDim.new(0, 10),
						FillDirection = Enum.FillDirection.Horizontal,
						VerticalAlignment = Enum.VerticalAlignment.Center
					}, {
						Icon = roactModule.createElement(imageSetLabel, {
							LayoutOrder = 1,
							BackgroundTransparency = 1,
							Size = UDim2.fromOffset(var1, var1),
							Image = robux,
							ImageColor3 = theme.TextDefault.Color,
							ImageTransparency = theme.TextDefault.Transparency
						}),
						Text = roactModule.createElement(fitTextLabel, {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							width = fitTextLabel.Width.FitToText,
							Text = p1.props.robuxBalance,
							Font = font.Body.Font,
							TextColor3 = theme.TextDefault.Color,
							TextTransparency = theme.TextDefault.Transparency,
							TextSize = var1
						})
					})
				})
			end
		})
	end)
end

return name