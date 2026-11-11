local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local RoactModule = require(Parent1.Roact)
local RoactFitComponentsModule = require(Parent1.RoactFitComponents)
local FitFrameVertical = RoactFitComponentsModule.FitFrameVertical
local FitFrameHorizontal = RoactFitComponentsModule.FitFrameHorizontal
local FitTextLabel = RoactFitComponentsModule.FitTextLabel
local UIBloxModule = require(Parent1.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local MultiTextLocalizerModule = require(Parent.Locale.MultiTextLocalizer)
local IconsCommonRobux = UIBloxModule.App.ImageSet.Images["icons/common/robux"]
local ExtendResult = RoactModule.Component:extend(script.Name)
ExtendResult.defaultProps = {
	anchorPoint = Vector2.new(0.5, 0.5),
	position = UDim2.new(0.5, 0, 0.5, 0)
}

function ExtendResult.render(p1)
	-- upvalues: RoactModule (copy), MultiTextLocalizerModule (copy)
	return RoactModule.createElement(MultiTextLocalizerModule, {
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
			-- upvalues: p1 (copy)
			return p1:renderAlert(p2)
		end
	})
end

function ExtendResult.renderAlert(p1, p2)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), InteractiveAlert (copy), ButtonType (copy), FitFrameVertical (copy), RoactFitComponentsModule (copy), FitTextLabel (copy), FitFrameHorizontal (copy), ImageSetLabel (copy), IconsCommonRobux (copy)
	return WithStyleFunction(function(p3)
		-- upvalues: RoactModule (upval), InteractiveAlert (upval), p1 (copy), p2 (copy), ButtonType (upval), FitFrameVertical (upval), RoactFitComponentsModule (upval), FitTextLabel (upval), FitFrameHorizontal (upval), ImageSetLabel (upval), IconsCommonRobux (upval)
		local _Font = p3.Font
		local Theme = p3.Theme
		local ScaledBaseSize = _Font.BaseSize * _Font.Body.RelativeSize
		
		return RoactModule.createElement(InteractiveAlert, {
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
						buttonType = ButtonType.PrimarySystem,
						props = { onActivated = p1.props.buyRobux, text = p2.buyRobux }
					}
				}
			},
			middleContent = function()
				-- upvalues: RoactModule (upval), FitFrameVertical (upval), RoactFitComponentsModule (upval), FitTextLabel (upval), _Font (copy), p2 (upval), Theme (copy), ScaledBaseSize (copy), FitFrameHorizontal (upval), ImageSetLabel (upval), IconsCommonRobux (upval), p1 (upval)
				return RoactModule.createElement(FitFrameVertical, {
					BackgroundTransparency = 1,
					margin = RoactFitComponentsModule.Rect.quad(10, 0, 10, 0),
					contentPadding = UDim.new(0, 30),
					width = UDim.new(1, 0),
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}, {
					CurrentBalanceLabel = RoactModule.createElement(FitTextLabel, {
						BackgroundTransparency = 1,
						LayoutOrder = 0,
						width = FitTextLabel.Width.FitToText,
						Font = _Font.Body.Font,
						Text = p2.currentBalance,
						TextColor3 = Theme.TextDefault.Color,
						TextTransparency = Theme.TextDefault.Transparency,
						TextSize = ScaledBaseSize
					}),
					RobuxAmount = RoactModule.createElement(FitFrameHorizontal, {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						height = UDim.new(1, 0),
						contentPadding = UDim.new(0, 10),
						FillDirection = Enum.FillDirection.Horizontal,
						VerticalAlignment = Enum.VerticalAlignment.Center
					}, {
						Icon = RoactModule.createElement(ImageSetLabel, {
							LayoutOrder = 1,
							BackgroundTransparency = 1,
							Size = UDim2.fromOffset(ScaledBaseSize, ScaledBaseSize),
							Image = IconsCommonRobux,
							ImageColor3 = Theme.TextDefault.Color,
							ImageTransparency = Theme.TextDefault.Transparency
						}),
						Text = RoactModule.createElement(FitTextLabel, {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							width = FitTextLabel.Width.FitToText,
							Text = p1.props.robuxBalance,
							Font = _Font.Body.Font,
							TextColor3 = Theme.TextDefault.Color,
							TextTransparency = Theme.TextDefault.Transparency,
							TextSize = ScaledBaseSize
						})
					})
				})
			end
		})
	end)
end

return ExtendResult