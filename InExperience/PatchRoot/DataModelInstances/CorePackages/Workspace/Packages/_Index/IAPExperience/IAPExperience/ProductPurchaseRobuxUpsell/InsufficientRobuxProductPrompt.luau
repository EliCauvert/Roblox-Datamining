local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local FitFrameVertical = require(Parent2.RoactFitComponents).FitFrameVertical
local UIBloxModule = require(Parent2.UIBlox)
local FoundationModule = require(Parent2.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local MultiTextLocalizerModule = require(Parent1.Locale.MultiTextLocalizer)
local ProductDetailsModule = require(Parent.ProductDetails)
local ExtendResult = RoactModule.Component:extend(script.Name)
ExtendResult.defaultProps = {
	anchorPoint = Vector2.new(0.5, 0.5),
	position = UDim2.new(0.5, 0, 0.5, 0)
}

function ExtendResult.init(p1)
	-- upvalues: RoactModule (copy)
	p1.contentRef = RoactModule.createRef()
	p1.state = {
		contentSize = Vector2.new(0, 0),
		footerSize = Vector2.new(0, 0)
	}
	
	function p1.changeContentSize(Frame: Frame)
		-- upvalues: p1 (copy)
		if p1.state.contentSize ~= Frame.AbsoluteSize then
			p1:setState({ contentSize = Frame.AbsoluteSize })
		end
	end
end

function ExtendResult.render(p1)
	-- upvalues: RoactModule (copy), MultiTextLocalizerModule (copy)
	return RoactModule.createElement(MultiTextLocalizerModule, {
		keys = {
			InsufficientRobuxTitle = {
				key = "IAPExperience.InsufficientRobux.Title.InsufficientRobux"
			},
			YouNeed = { key = "IAPExperience.InsufficientRobux.Text.YouNeed" },
			RobuxStore = {
				key = "IAPExperience.InsufficientRobux.Action.RobuxStore"
			},
			ButtonCancel = { key = "IAPExperience.InsufficientRobux.Action.Cancel" }
		},
		render = function(p2)
			-- upvalues: p1 (copy)
			return p1:renderAlert(p2)
		end
	})
end

function ExtendResult.renderAlert(p1, p2)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), InteractiveAlert (copy), FitFrameVertical (copy), ProductDetailsModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), ButtonType (copy)
	local Props = p1.props
	
	return WithStyleFunction(function(p3)
		-- upvalues: Props (copy), p2 (copy), RoactModule (upval), InteractiveAlert (upval), FitFrameVertical (upval), p1 (copy), ProductDetailsModule (upval), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval), ButtonType (upval)
		local Theme = p3.Theme
		local _Font = p3.Font
		local Robux = p2.YouNeed:gsub("{robux}", (string.format("<font color=\"rgb(%s)\">%s%s</font>", tostring((Color3.new(math.round(Theme.TextEmphasis.Color.R * 255), math.round(Theme.TextEmphasis.Color.G * 255), (math.round(Theme.TextEmphasis.Color.B * 255))))), utf8.char(57346), (tostring(Props.itemRobuxCost - Props.balanceAmount)))))
		
		return RoactModule.createElement(InteractiveAlert, {
			screenSize = Props.screenSize,
			position = Props.position,
			anchorPoint = Props.anchorPoint,
			title = p2.InsufficientRobuxTitle,
			middleContent = function()
				-- upvalues: RoactModule (upval), FitFrameVertical (upval), p1 (upval), ProductDetailsModule (upval), Props (upval), Theme (copy), FoundationFontFaceMigration (upval), _Font (copy), NormalizeFontFaceFunction (upval), p3 (copy), Robux (copy)
				return RoactModule.createElement(FitFrameVertical, {
					BackgroundTransparency = 1,
					width = UDim.new(1, 0),
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					contentPadding = UDim.new(0, 15),
					[RoactModule.Ref] = p1.contentRef,
					[RoactModule.Change.AbsoluteSize] = p1.changeContentSize
				}, {
					ProductDetails = RoactModule.createElement(ProductDetailsModule, {
						layoutOrder = 1,
						model = Props.model,
						itemIcon = Props.itemIcon,
						itemName = Props.itemName,
						itemRobuxCost = Props.itemRobuxCost
					}),
					Underline = RoactModule.createElement("Frame", {
						LayoutOrder = 2,
						BorderSizePixel = 0,
						BackgroundColor3 = Theme.Divider.Color,
						BackgroundTransparency = Theme.Divider.Transparency,
						Size = UDim2.new(1, 0, 0, 1)
					}),
					AdditionalBuyText = RoactModule.createElement("TextLabel", {
						LayoutOrder = 3,
						BackgroundTransparency = 1,
						RichText = true,
						TextWrapped = true,
						Size = UDim2.new(0, p1.state.contentSize.X, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						Font = if FoundationFontFaceMigration then nil else _Font.Body.Font,
						FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p3.Tokens.Typography.BodyLarge.Font) else nil,
						Text = Robux,
						TextSize = _Font.BaseSize * _Font.Body.RelativeSize,
						TextColor3 = Theme.TextDefault.Color,
						TextTransparency = Theme.TextDefault.Transparency
					})
				})
			end,
			buttonStackInfo = {
				buttons = {
					{
						props = {
							onActivated = Props.cancelPurchaseActivated,
							text = p2.ButtonCancel,
							inputIcon = Props.cancelControllerIcon
						}
					},
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							onActivated = Props.robuxStoreActivated,
							text = p2.RobuxStore,
							inputIcon = Props.acceptControllerIcon
						}
					}
				}
			}
		})
	end)
end

return ExtendResult