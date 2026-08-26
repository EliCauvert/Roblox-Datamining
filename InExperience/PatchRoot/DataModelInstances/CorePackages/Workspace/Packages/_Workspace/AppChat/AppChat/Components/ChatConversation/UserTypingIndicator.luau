local parent = script:FindFirstAncestor("AppChat").Parent
local roactModule = require(parent.Roact)
local withStyle = require(parent.UIBlox).Style.withStyle
local otterModule = require(parent.Otter)
local UIBloxModule = require(parent.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local messageCharacterLimitModule = require(script.Parent.MessageCharacterLimit)
local userTypingIndicator = roactModule.PureComponent:extend("UserTypingIndicator")
local t = { dampingRatio = 1.5, frequency = 1.6 }
userTypingIndicator.defaultProps = {
	LayoutOrder = 1,
	ZIndex = 1,
	oneUserTyping = "PLACEHOLDER {DISPLAY_NAME} is typing...",
	twoUsersTyping = "PLACEHOLDER {DISPLAY_NAME_1} and {DISPLAY_NAME_2} are typing...",
	severalUsersTyping = "PLACEHOLDER Several users are typing...",
	height = 40,
	AnchorPoint = Vector2.new(0, 0),
	Position = UDim2.new(0, 0, 0, 0),
	usersTyping = {},
	maxCharacterLength = messageCharacterLimitModule
}

function userTypingIndicator.init(p1)
	-- upvalues: roactModule (ref), otterModule (ref), t (ref)
	function p0.getDisplayText()
		-- upvalues: p1 (ref)
		if p1.props.usersTyping then
			return if #p1.props.usersTyping == 1 then p1.props.oneUserTyping elseif #p1.props.usersTyping == 2 then p1.props.twoUsersTyping elseif #p1.props.usersTyping > 2 then p1.props.severalUsersTyping else ""
		end
	end
	
	local var1, var2 = roactModule.createBinding(1)
	p1.motor = otterModule.createSingleMotor(1)
	p1.motor:start()
	p1.motor:onStep(var2)
	p1.animationProgress = var1
	
	function p0.updateAnimationGoal()
		-- upvalues: p1 (ref), otterModule (copy), t (copy)
		p1.motor:setGoal(otterModule.spring(if #p1.props.usersTyping > 0 then 0 else 1, t))
	end
	
	p1.updateAnimationGoal()
end

function userTypingIndicator.didUpdate(p1, p2, _)
	if #p2.usersTyping ~= #p1.props.usersTyping then
		p1.updateAnimationGoal()
	end
end

function userTypingIndicator.render(p1)
	-- upvalues: withStyle (ref), roactModule (ref), imageSetLabel (ref), images (ref)
	return withStyle(function(p2)
		-- upvalues: roactModule (copy), p1 (ref), imageSetLabel (copy), images (copy)
		local font = p2.Font
		
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint = p1.props.AnchorPoint,
			LayoutOrder = p1.props.LayoutOrder,
			Position = p1.props.Position,
			Size = UDim2.new(1, 0, 0, p1.props.height),
			ZIndex = p1.props.ZIndex
		}, {
			Layout = roactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			Padding = roactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 4),
				PaddingBottom = UDim.new(0, 4)
			}),
			ImageContainer = roactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(0.9, 0, 1, 0),
				BackgroundColor3 = p2.Theme.NavigationBar.Color,
				BorderColor3 = p2.Theme.Divider.Color,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(8, 8, 9, 9),
				Image = images["component_assets/circle_17"],
				ImageColor3 = p2.Theme.BackgroundUIDefault.Color,
				ImageTransparency = p1.animationProgress:map(function(p3)
					return p3
				end),
				Position = p1.animationProgress:map(function(p3)
					return UDim2.new(0, 0, p3, 0)
				end)
			}, {
				Layout = roactModule.createElement("UIListLayout", {
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Padding = roactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 12),
					PaddingTop = UDim.new(0, 4),
					PaddingBottom = UDim.new(0, 4),
					PaddingRight = UDim.new(0, 12)
				}),
				TextLabel = roactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					Text = p1.getDisplayText(),
					TextSize = font.BaseSize * font.Footer.RelativeSize,
					Font = font.Footer.Font,
					TextColor3 = p2.Theme.TextMuted.Color,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center,
					TextTransparency = p1.animationProgress:map(function(p3)
						return p3
					end)
				})
			})
		})
	end)
end

function userTypingIndicator.willUnmount(p1)
	if p1.motor then
		p1.motor:destroy()
	end
end

return userTypingIndicator