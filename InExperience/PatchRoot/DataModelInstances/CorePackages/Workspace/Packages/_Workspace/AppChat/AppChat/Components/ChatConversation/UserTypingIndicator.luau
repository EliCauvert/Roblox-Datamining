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

function userTypingIndicator.init(p0) --[[ line: 33 ]]
	-- upvalues: roactModule (ref), otterModule (ref), t (ref)
	function p0.getDisplayText() --[[ line: 34 ]]
		-- upvalues: p0 (ref)
		if p0.props.usersTyping then
			return if #p0.props.usersTyping == 1 then p0.props.oneUserTyping elseif #p0.props.usersTyping == 2 then p0.props.twoUsersTyping elseif #p0.props.usersTyping > 2 then p0.props.severalUsersTyping else ""
		end
	end
	
	local var6, var7 = roactModule.createBinding(1)
	p0.motor = otterModule.createSingleMotor(1)
	p0.motor:start()
	p0.motor:onStep(var7)
	p0.animationProgress = var6
	
	function p0.updateAnimationGoal() --[[ line: 55 ]]
		-- upvalues: p0 (ref), otterModule (copy), t (copy)
		p0.motor:setGoal(otterModule.spring(if #p0.props.usersTyping > 0 then 0 else 1, t))
	end
	
	p0.updateAnimationGoal()
end

function userTypingIndicator.didUpdate(p1, p2, _) --[[ line: 63 ]]
	if #p2.usersTyping ~= #p1.props.usersTyping then
		p1.updateAnimationGoal()
	end
end

function userTypingIndicator.render(p3) --[[ line: 69 ]]
	-- upvalues: withStyle (ref), roactModule (ref), imageSetLabel (ref), images (ref)
	return withStyle(function(p4) --[[ line: 70 ]]
		-- upvalues: roactModule (copy), p3 (ref), imageSetLabel (copy), images (copy)
		local font = p4.Font
		
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint = p3.props.AnchorPoint,
			LayoutOrder = p3.props.LayoutOrder,
			Position = p3.props.Position,
			Size = UDim2.new(1, 0, 0, p3.props.height),
			ZIndex = p3.props.ZIndex
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
				BackgroundColor3 = p4.Theme.NavigationBar.Color,
				BorderColor3 = p4.Theme.Divider.Color,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(8, 8, 9, 9),
				Image = images["component_assets/circle_17"],
				ImageColor3 = p4.Theme.BackgroundUIDefault.Color,
				ImageTransparency = p3.animationProgress:map(function(p5) --[[ line: 105 ]]
					return p5
				end),
				Position = p3.animationProgress:map(function(p6) --[[ line: 108 ]]
					return UDim2.new(0, 0, p6, 0)
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
					Text = p3.getDisplayText(),
					TextSize = font.BaseSize * font.Footer.RelativeSize,
					Font = font.Footer.Font,
					TextColor3 = p4.Theme.TextMuted.Color,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center,
					TextTransparency = p3.animationProgress:map(function(p7) --[[ line: 134 ]]
						return p7
					end)
				})
			})
		})
	end)
end

function userTypingIndicator.willUnmount(p8) --[[ line: 143 ]]
	if p8.motor then
		p8.motor:destroy()
	end
end

return userTypingIndicator