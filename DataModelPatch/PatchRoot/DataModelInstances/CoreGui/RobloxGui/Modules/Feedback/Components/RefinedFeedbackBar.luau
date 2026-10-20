local CorePackages = game:GetService("CorePackages")
local TextService = game:GetService("TextService")
local ExperienceStateCaptureService = game:GetService("ExperienceStateCaptureService")
local ShowHelpModalThunkModule = require(script.Parent.Parent.Thunks.ShowHelpModalThunk)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local FeedbackBarHintModule = require(script.Parent.FeedbackBarHint)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local TModule = require(CorePackages.Packages.t)
local CryoModule = require(CorePackages.Packages.Cryo)
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local ButtonStack = UIBloxModule.App.Button.ButtonStack
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local RefinedFeedbackBar = RoactModule.PureComponent:extend("RefinedFeedbackBar")

local function GetTextSize(...): Vector2
	-- upvalues: TextService (copy)
	return TextService:GetTextSize(...) + Vector2.new(2, 2)
end

RefinedFeedbackBar.validateProps = TModule.strictInterface({
	leftHint = TModule.strictInterface({ text = TModule.string })
})

function RefinedFeedbackBar.init(p1)
	-- upvalues: ExperienceStateCaptureService (copy)
	p1.state = {
		barWidth = 0,
		hintStringsConcat = nil,
		requiredSpace = nil,
		hintRatios = nil
	}
	
	function p1.onExitFeedbackMode()
		-- upvalues: ExperienceStateCaptureService (upval)
		ExperienceStateCaptureService:ToggleCaptureMode()
	end
	
	function p1.openHelpModal()
		-- upvalues: p1 (copy)
		p1.props.showHelpModal(true)
	end
end

function RefinedFeedbackBar.calculateHintRatios(LeftHint)
	-- upvalues: CryoModule (copy), GetTextSize (copy)
	local v1 = 84
	local Text = ""
	local t = {}
	local Total = 0
	local JoinResult = CryoModule.List.join({ LeftHint }, {})
	
	for _, value in ipairs(JoinResult) do
		t[value.text] = GetTextSize(value.text, 17, 2, Vector2.new(10000, 10000)).X
		Total += t[value.text]
		v1 = v1 + 36 + 8
		Text ..= value.text
	end
	for i, value1 in pairs(t) do
		t[i] = value1 / Total
	end
	return t, v1 + math.max(#JoinResult - 2, 0) * 40, Text
end

function RefinedFeedbackBar.getDerivedStateFromProps(p1)
	-- upvalues: RefinedFeedbackBar (copy)
	local HintRatios, HintRatios2, HintRatios3 = RefinedFeedbackBar.calculateHintRatios(p1.leftHint)
	
	return {
		hintRatios = HintRatios,
		requiredSpace = HintRatios2,
		hintStringsConcat = HintRatios3
	}
end

function RefinedFeedbackBar.calculateHintSize(p1, p2, p3)
	-- upvalues: GetTextSize (copy)
	local v2 = p2 - p1.state.requiredSpace
	local ScaledRelativeSize = p3.Header2.RelativeSize * p3.BaseSize
	local ScaledRelativeMinSize = p3.Header2.RelativeMinSize * p3.BaseSize
	local X = GetTextSize(p1.state.hintStringsConcat, ScaledRelativeMinSize, p3.Header2.Font, Vector2.new(10000, 10000)).X
	
	if X <= v2 then
		local X1 = GetTextSize(p1.state.hintStringsConcat, ScaledRelativeSize, p3.Header2.Font, Vector2.new(10000, 10000)).X
		local ScaledRelativeSizeRatio = (ScaledRelativeSize - ScaledRelativeMinSize) / (X1 - X)
		
		return nil, (math.clamp(v2 * ScaledRelativeSizeRatio + (ScaledRelativeSize - ScaledRelativeSizeRatio * X1), ScaledRelativeMinSize, ScaledRelativeSize))
	end
	local t = {}
	
	for i, hintRatio in pairs(p1.state.hintRatios) do
		t[i] = hintRatio * v2
	end
	return t
end

function RefinedFeedbackBar.render(p4)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), FeedbackBarHintModule (copy), WithLocalizationFunction (copy), ButtonStack (copy), ButtonType (copy)
	return WithStyleFunction(function(p5)
		-- upvalues: RoactModule (upval), FeedbackBarHintModule (upval), p4 (copy), WithLocalizationFunction (upval), ButtonStack (upval), ButtonType (upval)
		local Theme = p5.Theme
		
		return RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = Theme.BackgroundUIContrast.Transparency,
			BackgroundColor3 = Theme.BackgroundUIContrast.Color,
			Size = UDim2.new(1, 0, 0, 72),
			Position = UDim2.fromScale(0, 1),
			AnchorPoint = Vector2.new(0, 1),
			[RoactModule.Change.AbsoluteSize] = function(Frame)
				-- upvalues: p4 (upval)
				p4:setState({ barWidth = Frame.AbsoluteSize.X })
			end,
			[RoactModule.Event.AncestryChanged] = function(Frame)
				-- upvalues: p4 (upval)
				p4:setState({ barWidth = Frame.AbsoluteSize.X })
			end
		}, {
			Padding = RoactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, 24),
				PaddingRight = UDim.new(0, 24)
			}),
			LeftFrame = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(0.5, 1)
			}, {
				RoactModule.createElement("UIListLayout", {
					key = "Layout",
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 40)
				}),
				(function(p6)
					-- upvalues: RoactModule (upval), FeedbackBarHintModule (upval)
					return RoactModule.createElement(FeedbackBarHintModule, p6)
				end)(p4.props.leftHint)
			}),
			RightFrame = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(0.35, 1),
				Position = UDim2.fromScale(1, 0),
				AnchorPoint = Vector2.new(1, 0)
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Right,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 40)
				}),
				Buttons = WithLocalizationFunction({
					helpButtonText = "CoreScripts.Feedback.FeedbackBar.HelpButton",
					exitFeedbackButtonText = "CoreScripts.Feedback.FeedbackBar.ExitFeedbackButton"
				})(function(p6)
					-- upvalues: RoactModule (upval), ButtonStack (upval), ButtonType (upval), p4 (upval)
					return RoactModule.createElement(ButtonStack, {
						buttonHeight = 50,
						buttons = {
							{
								buttonType = ButtonType.Secondary,
								props = {
									onActivated = p4.openHelpModal,
									text = p6.helpButtonText
								}
							},
							{
								buttonType = ButtonType.PrimarySystem,
								props = {
									isDisabled = false,
									onActivated = p4.onExitFeedbackMode,
									text = p6.exitFeedbackButtonText
								}
							}
						},
						forcedFillDirection = Enum.FillDirection.Horizontal
					})
				end)
			})
		})
	end)
end

return RoactRoduxModule.connect(function()
	return {}
end, function(Callback)
	-- upvalues: ShowHelpModalThunkModule (copy)
	return {
		showHelpModal = function(p4)
			-- upvalues: Callback (copy), ShowHelpModalThunkModule (upval)
			Callback(ShowHelpModalThunkModule(p4))
		end
	}
end)(RefinedFeedbackBar)