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

function name.render(p0)
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
		render = function(p1)
			-- upvalues: p0 (ref)
			return p0:renderAlert(p1)
		end
	})
end

function name.renderAlert(p2, p3)
	-- upvalues: withStyle (ref), roactModule (ref), interactiveAlert (ref), buttonType (ref), fitFrameVertical (ref), roactFitComponentsModule (ref), fitTextLabel (ref), fitFrameHorizontal (ref), imageSetLabel (ref), robux (ref)
	return withStyle(function(p4)
		-- upvalues: roactModule (copy), interactiveAlert (copy), p2 (ref), p3 (ref), buttonType (copy), fitFrameVertical (copy), roactFitComponentsModule (copy), fitTextLabel (copy), fitFrameHorizontal (copy), imageSetLabel (copy), robux (copy)
		local font = p4.Font
		local theme = p4.Theme
		local var5 = font.BaseSize * font.Body.RelativeSize
		
		return roactModule.createElement(interactiveAlert, {
			screenSize = p2.props.screenSize,
			title = p3.title,
			bodyText = p3.dontHaveEnough,
			buttonStackInfo = {
				buttons = {
					{
						isDefaultChild = true,
						props = { onActivated = p2.props.closePrompt, text = p3.cancel }
					},
					{
						buttonType = buttonType.PrimarySystem,
						props = { onActivated = p2.props.buyRobux, text = p3.buyRobux }
					}
				}
			},
			middleContent = function()
				-- upvalues: roactModule (copy), fitFrameVertical (copy), roactFitComponentsModule (copy), fitTextLabel (copy), font (ref), p3 (copy), theme (ref), var5 (ref), fitFrameHorizontal (copy), imageSetLabel (copy), robux (copy), p2 (copy)
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
						Text = p3.currentBalance,
						TextColor3 = theme.TextDefault.Color,
						TextTransparency = theme.TextDefault.Transparency,
						TextSize = var5
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
							Size = UDim2.fromOffset(var5, var5),
							Image = robux,
							ImageColor3 = theme.TextDefault.Color,
							ImageTransparency = theme.TextDefault.Transparency
						}),
						Text = roactModule.createElement(fitTextLabel, {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							width = fitTextLabel.Width.FitToText,
							Text = p2.props.robuxBalance,
							Font = font.Body.Font,
							TextColor3 = theme.TextDefault.Color,
							TextTransparency = theme.TextDefault.Transparency,
							TextSize = var5
						})
					})
				})
			end
		})
	end)
end

return name