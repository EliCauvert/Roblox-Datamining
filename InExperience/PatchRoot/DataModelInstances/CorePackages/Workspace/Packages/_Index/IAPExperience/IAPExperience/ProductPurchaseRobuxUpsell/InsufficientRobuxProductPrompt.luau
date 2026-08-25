local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local fitFrameVertical = require(parent_2.RoactFitComponents).FitFrameVertical
local UIBloxModule = require(parent_2.UIBlox)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local withStyle = UIBloxModule.Core.Style.withStyle
local multiTextLocalizerModule = require(parent_1.Locale.MultiTextLocalizer)
local productDetailsModule = require(parent.ProductDetails)
local name = roactModule.Component:extend(script.Name)
name.defaultProps = {
	anchorPoint = Vector2.new(0.5, 0.5),
	position = UDim2.new(0.5, 0, 0.5, 0)
}

function name.init(p0)
	-- upvalues: roactModule (ref)
	p0.contentRef = roactModule.createRef()
	p0.state = {
		contentSize = Vector2.new(0, 0),
		footerSize = Vector2.new(0, 0)
	}
	
	function p0.changeContentSize(p1)
		-- upvalues: p0 (ref)
		if p0.state.contentSize ~= p1.AbsoluteSize then
			p0:setState({ contentSize = p1.AbsoluteSize })
		end
	end
end

function name.render(p2)
	-- upvalues: roactModule (ref), multiTextLocalizerModule (ref)
	return roactModule.createElement(multiTextLocalizerModule, {
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
		render = function(p3)
			-- upvalues: p2 (ref)
			return p2:renderAlert(p3)
		end
	})
end

function name.renderAlert(p4, p5)
	-- upvalues: withStyle (ref), roactModule (ref), interactiveAlert (ref), fitFrameVertical (ref), productDetailsModule (ref), buttonType (ref)
	local props = p4.props
	
	return withStyle(function(p6)
		-- upvalues: props (ref), p5 (ref), roactModule (copy), interactiveAlert (copy), fitFrameVertical (copy), p4 (ref), productDetailsModule (copy), buttonType (copy)
		local theme = p6.Theme
		local font = p6.Font
		local var5 = p5.YouNeed:gsub("{robux}", string.format("<font color=\"rgb(%s)\">%s%s</font>", tostring(Color3.new(math.round(theme.TextEmphasis.Color.R * 255), math.round(theme.TextEmphasis.Color.G * 255), math.round(theme.TextEmphasis.Color.B * 255))), utf8.char(57346), tostring(props.itemRobuxCost - props.balanceAmount)))
		
		return roactModule.createElement(interactiveAlert, {
			screenSize = props.screenSize,
			position = props.position,
			anchorPoint = props.anchorPoint,
			title = p5.InsufficientRobuxTitle,
			middleContent = function()
				-- upvalues: roactModule (copy), fitFrameVertical (copy), p4 (copy), productDetailsModule (copy), props (copy), theme (ref), font (ref), var5 (ref)
				return roactModule.createElement(fitFrameVertical, {
					BackgroundTransparency = 1,
					width = UDim.new(1, 0),
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					contentPadding = UDim.new(0, 15),
					[roactModule.Ref] = p4.contentRef,
					[roactModule.Change.AbsoluteSize] = p4.changeContentSize
				}, {
					ProductDetails = roactModule.createElement(productDetailsModule, {
						layoutOrder = 1,
						model = props.model,
						itemIcon = props.itemIcon,
						itemName = props.itemName,
						itemRobuxCost = props.itemRobuxCost
					}),
					Underline = roactModule.createElement("Frame", {
						LayoutOrder = 2,
						BorderSizePixel = 0,
						BackgroundColor3 = theme.Divider.Color,
						BackgroundTransparency = theme.Divider.Transparency,
						Size = UDim2.new(1, 0, 0, 1)
					}),
					AdditionalBuyText = roactModule.createElement("TextLabel", {
						LayoutOrder = 3,
						BackgroundTransparency = 1,
						RichText = true,
						TextWrapped = true,
						Size = UDim2.new(0, p4.state.contentSize.X, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						Font = font.Body.Font,
						Text = var5,
						TextSize = font.BaseSize * font.Body.RelativeSize,
						TextColor3 = theme.TextDefault.Color,
						TextTransparency = theme.TextDefault.Transparency
					})
				})
			end,
			buttonStackInfo = {
				buttons = {
					{
						props = {
							onActivated = props.cancelPurchaseActivated,
							text = p5.ButtonCancel,
							inputIcon = props.cancelControllerIcon
						}
					},
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							onActivated = props.robuxStoreActivated,
							text = p5.RobuxStore,
							inputIcon = props.acceptControllerIcon
						}
					}
				}
			}
		})
	end)
end

return name