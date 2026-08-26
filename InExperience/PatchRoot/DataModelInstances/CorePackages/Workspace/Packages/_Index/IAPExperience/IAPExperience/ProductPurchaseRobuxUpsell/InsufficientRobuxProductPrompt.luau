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

function name.init(p1)
	-- upvalues: roactModule (ref)
	p1.contentRef = roactModule.createRef()
	p1.state = {
		contentSize = Vector2.new(0, 0),
		footerSize = Vector2.new(0, 0)
	}
	
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
			-- upvalues: p1 (ref)
			return p1:renderAlert(p2)
		end
	})
end

function name.renderAlert(p1, p2)
	-- upvalues: withStyle (ref), roactModule (ref), interactiveAlert (ref), fitFrameVertical (ref), productDetailsModule (ref), buttonType (ref)
	local props = p1.props
	
	return withStyle(function(p3)
		-- upvalues: props (ref), p2 (ref), roactModule (copy), interactiveAlert (copy), fitFrameVertical (copy), p1 (ref), productDetailsModule (copy), buttonType (copy)
		local theme = p3.Theme
		local font = p3.Font
		local var1 = p2.YouNeed:gsub("{robux}", string.format("<font color=\"rgb(%s)\">%s%s</font>", tostring(Color3.new(math.round(theme.TextEmphasis.Color.R * 255), math.round(theme.TextEmphasis.Color.G * 255), math.round(theme.TextEmphasis.Color.B * 255))), utf8.char(57346), tostring(props.itemRobuxCost - props.balanceAmount)))
		
		return roactModule.createElement(interactiveAlert, {
			screenSize = props.screenSize,
			position = props.position,
			anchorPoint = props.anchorPoint,
			title = p2.InsufficientRobuxTitle,
			middleContent = function()
				-- upvalues: roactModule (copy), fitFrameVertical (copy), p1 (copy), productDetailsModule (copy), props (copy), theme (ref), font (ref), var1 (ref)
				return roactModule.createElement(fitFrameVertical, {
					BackgroundTransparency = 1,
					width = UDim.new(1, 0),
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					contentPadding = UDim.new(0, 15),
					[roactModule.Ref] = p1.contentRef,
					[roactModule.Change.AbsoluteSize] = p1.changeContentSize
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
						Size = UDim2.new(0, p1.state.contentSize.X, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						Font = font.Body.Font,
						Text = var1,
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
							text = p2.ButtonCancel,
							inputIcon = props.cancelControllerIcon
						}
					},
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							onActivated = props.robuxStoreActivated,
							text = p2.RobuxStore,
							inputIcon = props.acceptControllerIcon
						}
					}
				}
			}
		})
	end)
end

return name