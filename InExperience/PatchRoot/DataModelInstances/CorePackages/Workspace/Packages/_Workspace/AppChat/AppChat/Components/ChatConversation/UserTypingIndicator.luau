local Parent = script:FindFirstAncestor("AppChat").Parent
local RoactModule = require(Parent.Roact)
local WithStyleFunction = require(Parent.UIBlox).Style.withStyle
local OtterModule = require(Parent.Otter)
local FoundationModule = require(Parent.Foundation)
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local UIBloxModule = require(Parent.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UserTypingIndicator = RoactModule.PureComponent:extend("UserTypingIndicator")
local config = { dampingRatio = 1.5, frequency = 1.6 }
UserTypingIndicator.defaultProps = {
	LayoutOrder = 1,
	ZIndex = 1,
	oneUserTyping = "PLACEHOLDER {DISPLAY_NAME} is typing...",
	twoUsersTyping = "PLACEHOLDER {DISPLAY_NAME_1} and {DISPLAY_NAME_2} are typing...",
	severalUsersTyping = "PLACEHOLDER Several users are typing...",
	height = 40,
	AnchorPoint = Vector2.new(0, 0),
	Position = UDim2.new(0, 0, 0, 0),
	usersTyping = {},
	maxCharacterLength = require(script.Parent.MessageCharacterLimit)
}

function UserTypingIndicator.init(p1)
	-- upvalues: RoactModule (copy), OtterModule (copy), config (copy)
	function p1.getDisplayText()
		-- upvalues: p1 (copy)
		if p1.props.usersTyping then
			if #p1.props.usersTyping == 1 then
				return p1.props.oneUserTyping
			elseif #p1.props.usersTyping == 2 then
				return p1.props.twoUsersTyping
			elseif #p1.props.usersTyping > 2 then
				return p1.props.severalUsersTyping
			end
		end
		return ""
	end
	
	local Binding, Binding2 = RoactModule.createBinding(1)
	p1.motor = OtterModule.createSingleMotor(1)
	p1.motor:start()
	p1.motor:onStep(Binding2)
	p1.animationProgress = Binding
	
	function p1.updateAnimationGoal()
		-- upvalues: p1 (copy), OtterModule (upval), config (upval)
		p1.motor:setGoal(OtterModule.spring(if #p1.props.usersTyping > 0 then 0 else 1, config))
	end
	
	p1.updateAnimationGoal()
end

function UserTypingIndicator.didUpdate(p1, p2, _)
	if #p2.usersTyping ~= #p1.props.usersTyping then
		p1.updateAnimationGoal()
	end
end

function UserTypingIndicator.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), ImageSetLabel (copy), Images (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), p1 (copy), ImageSetLabel (upval), Images (upval), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval)
		local _Font = p2.Font
		local FooterFont = _Font.Footer.Font
		
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint = p1.props.AnchorPoint,
			LayoutOrder = p1.props.LayoutOrder,
			Position = p1.props.Position,
			Size = UDim2.new(1, 0, 0, p1.props.height),
			ZIndex = p1.props.ZIndex
		}, {
			Layout = RoactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			Padding = RoactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 4),
				PaddingBottom = UDim.new(0, 4)
			}),
			ImageContainer = RoactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(0.9, 0, 1, 0),
				BackgroundColor3 = p2.Theme.NavigationBar.Color,
				BorderColor3 = p2.Theme.Divider.Color,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(8, 8, 9, 9),
				Image = Images["component_assets/circle_17"],
				ImageColor3 = p2.Theme.BackgroundUIDefault.Color,
				ImageTransparency = p1.animationProgress:map(function(p3)
					return p3
				end),
				Position = p1.animationProgress:map(function(YScale): UDim2
					return UDim2.new(0, 0, YScale, 0)
				end)
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Padding = RoactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 12),
					PaddingTop = UDim.new(0, 4),
					PaddingBottom = UDim.new(0, 4),
					PaddingRight = UDim.new(0, 12)
				}),
				TextLabel = RoactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					Text = p1.getDisplayText(),
					TextSize = _Font.BaseSize * _Font.Footer.RelativeSize,
					Font = if FoundationFontFaceMigration then nil else FooterFont,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Tokens.Typography.CaptionSmall.Font) else nil,
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

function UserTypingIndicator.willUnmount(p1)
	if p1.motor then
		p1.motor:destroy()
	end
end

return UserTypingIndicator