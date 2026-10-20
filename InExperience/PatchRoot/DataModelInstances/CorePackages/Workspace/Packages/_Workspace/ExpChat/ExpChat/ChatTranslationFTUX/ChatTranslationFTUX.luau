local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local RoactModule = require(Parent.Roact)
local OtterModule = require(Parent.Otter)
local UIBloxModule = require(Parent.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local LocalizationModule = require(ExpChat.Localization)
local FFlagExpChatUnmountTranslationFTUXModule = require(ExpChat.Flags.FFlagExpChatUnmountTranslationFTUX)
local GameSettings = UserSettings().GameSettings
local ChatTranslationFTUX = RoactModule.Component:extend("ChatTranslationFTUX")
ChatTranslationFTUX.defaultProps = { timer = require(ExpChat.Timer).new(10) }
local _Font = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
local _Font1 = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
local config = { dampingRatio = 1, frequency = 2 }

if game:GetEngineFeature("TextChatServiceSettingsSaved") then
	GameSettings.ChatTranslationFTUXShown = true
end
function ChatTranslationFTUX.init(p1)
	-- upvalues: RoactModule (copy), OtterModule (copy)
	p1.transparency, p1.updateTransparency = RoactModule.createBinding(1)
	p1.transparencyMotor = OtterModule.createSingleMotor(1)
	p1.transparencyMotor:onStep(p1.updateTransparency)
end

function ChatTranslationFTUX.render(p1)
	-- upvalues: FFlagExpChatUnmountTranslationFTUXModule (copy), RoactModule (copy), ImageSetLabel (copy), Images (copy), _Font (copy), _Font1 (copy)
	return if FFlagExpChatUnmountTranslationFTUXModule and p1.state.isDismissed then nil else RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Position = UDim2.new(0, 10, 0, 20),
		Size = UDim2.new(0.25, 0, 0, 0)
	}, {
		BubbleTail = RoactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			ZIndex = 100,
			Size = UDim2.new(0, 15, 0, 10),
			ImageTransparency = p1.transparency,
			ImageColor3 = Color3.new(0.5, 0.5, 0.5),
			Image = Images["component_assets/triangleUp_16"],
			Position = UDim2.new(0, 15, 0, -10)
		}),
		BubbleBody = RoactModule.createElement("Frame", {
			Active = true,
			BackgroundTransparency = p1.transparency,
			BackgroundColor3 = Color3.new(0.5, 0.5, 0.5),
			AutomaticSize = Enum.AutomaticSize.XY,
			ZIndex = 100,
			Style = Enum.FrameStyle.Custom,
			[RoactModule.Event.TouchTap] = function()
				-- upvalues: p1 (copy)
				p1:fadeOut()
			end,
			[RoactModule.Event.InputEnded] = function(_, Input)
				-- upvalues: p1 (copy)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 then
					p1:fadeOut()
				end
			end
		}, {
			RoundCorners = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 5) }),
			SizeConstraint = RoactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(300, 400) }),
			Padding = RoactModule.createElement("UIPadding", {
				PaddingRight = UDim.new(0, 10),
				PaddingTop = UDim.new(0, 10),
				PaddingBottom = UDim.new(0, 10),
				PaddingLeft = UDim.new(0, 10)
			}),
			Layout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, 10)
			}),
			Title = RoactModule.createElement("TextLabel", {
				TextSize = 16,
				TextWrapped = true,
				BackgroundTransparency = 1,
				ZIndex = 101,
				LayoutOrder = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0),
				Text = if p1.props.FTUXTitle == "" then "Chat translation is on for supported languages" else p1.props.FTUXTitle,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextTransparency = p1.transparency,
				FontFace = _Font,
				TextColor3 = Color3.new(1, 1, 1)
			}),
			Body = RoactModule.createElement("TextLabel", {
				TextSize = 16,
				TextWrapped = true,
				BackgroundTransparency = 1,
				ZIndex = 101,
				LayoutOrder = 2,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0),
				Text = if p1.props.FTUXBody == "" then "Messages you send and receive will be translated automatically" else p1.props.FTUXBody,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextTransparency = p1.transparency,
				FontFace = _Font1,
				TextColor3 = Color3.new(1, 1, 1)
			})
		})
	})
end

function ChatTranslationFTUX.fadeOut(p1)
	-- upvalues: FFlagExpChatUnmountTranslationFTUXModule (copy), OtterModule (copy), config (copy)
	if not p1.isFadingOut then
		p1.isFadingOut = true
		
		if FFlagExpChatUnmountTranslationFTUXModule then
			p1.transparencyMotor:onComplete(function()
				-- upvalues: p1 (copy)
				p1:setState({ isDismissed = true })
			end)
		end
		p1.transparencyMotor:setGoal((function(p2)
			-- upvalues: OtterModule (upval), config (upval)
			return OtterModule.spring(p2, config)
		end)(1))
	end
end

function ChatTranslationFTUX.didMount(p1)
	-- upvalues: OtterModule (copy), config (copy)
	p1.transparencyMotor:setGoal((function(p2)
		-- upvalues: OtterModule (upval), config (upval)
		return OtterModule.spring(p2, config)
	end)(0))
	p1.props.timer:start():andThen(function()
		-- upvalues: p1 (copy)
		p1:fadeOut()
	end)
end

function ChatTranslationFTUX.willUnmount(p1)
	p1.transparencyMotor:destroy()
end

return LocalizationModule.connect(function()
	return {
		FTUXTitle = "CoreScripts.TextChat.ChatTranslation.FTUX.TitleNew",
		FTUXBody = "CoreScripts.TextChat.ChatTranslation.FTUX.BodyNew"
	}
end)(ChatTranslationFTUX)