local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local roactModule = require(parent.Roact)
local otterModule = require(parent.Otter)
local timerModule = require(expChat.Timer)
local UIBloxModule = require(parent.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local localizationModule = require(expChat.Localization)
local gameSettings = UserSettings().GameSettings
local chatTranslationFTUX = roactModule.Component:extend("ChatTranslationFTUX")
chatTranslationFTUX.defaultProps = { timer = timerModule.new(10) }
local font = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
local font_1 = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
local t = { dampingRatio = 1, frequency = 2 }

if game:GetEngineFeature("TextChatServiceSettingsSaved") then
	gameSettings.ChatTranslationFTUXShown = true
end
function chatTranslationFTUX.init(p0)
	-- upvalues: roactModule (ref), otterModule (ref)
	local var10, var11 = roactModule.createBinding(1)
	p0.transparency = var10
	p0.updateTransparency = var11
	p0.transparencyMotor = otterModule.createSingleMotor(1)
	p0.transparencyMotor:onStep(p0.updateTransparency)
end

function chatTranslationFTUX.render(p1)
	-- upvalues: roactModule (ref), imageSetLabel (ref), images (ref), font (ref), font_1 (ref)
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Position = UDim2.new(0, 10, 0, 20),
		Size = UDim2.new(0.25, 0, 0, 0)
	}, {
		BubbleTail = roactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			ZIndex = 100,
			Size = UDim2.new(0, 15, 0, 10),
			ImageTransparency = p1.transparency,
			ImageColor3 = Color3.new(0.5, 0.5, 0.5),
			Image = images["component_assets/triangleUp_16"],
			Position = UDim2.new(0, 15, 0, -10)
		}),
		BubbleBody = roactModule.createElement("Frame", {
			Active = true,
			BackgroundTransparency = p1.transparency,
			BackgroundColor3 = Color3.new(0.5, 0.5, 0.5),
			AutomaticSize = Enum.AutomaticSize.XY,
			ZIndex = 100,
			Style = Enum.FrameStyle.Custom,
			[roactModule.Event.TouchTap] = function()
				-- upvalues: p1 (ref)
				p1:fadeOut()
			end,
			[roactModule.Event.InputEnded] = function(_, p2)
				-- upvalues: p1 (ref)
				if p2.UserInputType == Enum.UserInputType.MouseButton1 then
					p1:fadeOut()
				end
			end
		}, {
			RoundCorners = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 5) }),
			SizeConstraint = roactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(300, 400) }),
			Padding = roactModule.createElement("UIPadding", {
				PaddingRight = UDim.new(0, 10),
				PaddingTop = UDim.new(0, 10),
				PaddingBottom = UDim.new(0, 10),
				PaddingLeft = UDim.new(0, 10)
			}),
			Layout = roactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, 10)
			}),
			Title = roactModule.createElement("TextLabel", {
				TextSize = 16,
				TextWrapped = true,
				BackgroundTransparency = 1,
				ZIndex = 101,
				LayoutOrder = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0),
				Text = if p1.props.FTUXTitle ~= "" then "Chat translation is on for supported languages" else p1.props.FTUXTitle,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextTransparency = p1.transparency,
				FontFace = font,
				TextColor3 = Color3.new(1, 1, 1)
			}),
			Body = roactModule.createElement("TextLabel", {
				TextSize = 16,
				TextWrapped = true,
				BackgroundTransparency = 1,
				ZIndex = 101,
				LayoutOrder = 2,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0),
				Text = if p1.props.FTUXBody ~= "" then "Messages you send and receive will be translated automatically" else p1.props.FTUXBody,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextTransparency = p1.transparency,
				FontFace = font_1,
				TextColor3 = Color3.new(1, 1, 1)
			})
		})
	})
end

function chatTranslationFTUX.fadeOut(p3)
	-- upvalues: otterModule (ref), t (ref)
	if not p3.isFadingOut then
		p3.isFadingOut = true
		p3.transparencyMotor:setGoal((function(p4)
			-- upvalues: otterModule (copy), t (copy)
			return otterModule.spring(p4, t)
		end)(1))
	end
end

function chatTranslationFTUX.didMount(p5)
	-- upvalues: otterModule (ref), t (ref)
	p5.transparencyMotor:setGoal((function(p6)
		-- upvalues: otterModule (copy), t (copy)
		return otterModule.spring(p6, t)
	end)(0))
	p5.props.timer:start():andThen(function()
		-- upvalues: p5 (ref)
		p5:fadeOut()
	end)
end

function chatTranslationFTUX.willUnmount(p7)
	p7.transparencyMotor:destroy()
end

return localizationModule.connect(function()
	return {
		FTUXTitle = "CoreScripts.TextChat.ChatTranslation.FTUX.TitleNew",
		FTUXBody = "CoreScripts.TextChat.ChatTranslation.FTUX.BodyNew"
	}
end)(chatTranslationFTUX)