local corePackagesService = game:GetService("CorePackages")
local textService = game:GetService("TextService")
local experienceStateCaptureService = game:GetService("ExperienceStateCaptureService")
local showHelpModalThunkModule = require(script.Parent.Parent.Thunks.ShowHelpModalThunk)
local withLocalization = require(corePackagesService.Workspace.Packages.Localization).withLocalization
local feedbackBarHintModule = require(script.Parent.FeedbackBarHint)
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local tModule = require(corePackagesService.Packages.t)
local cryoModule = require(corePackagesService.Packages.Cryo)
local withStyle = UIBloxModule.Core.Style.withStyle
local buttonStack = UIBloxModule.App.Button.ButtonStack
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local refinedFeedbackBar = roactModule.PureComponent:extend("RefinedFeedbackBar")

local function GetTextSize(...) --[[ line: 41 ]]
	-- upvalues: textService (ref)
	return textService:GetTextSize(...) + Vector2.new(2, 2)
end

refinedFeedbackBar.validateProps = tModule.strictInterface({
	leftHint = tModule.strictInterface({ text = tModule.string })
})

function refinedFeedbackBar.init(p0) --[[ line: 55 ]]
	-- upvalues: experienceStateCaptureService (ref)
	p0.state = {
		barWidth = 0,
		hintStringsConcat = nil,
		requiredSpace = nil,
		hintRatios = nil
	}
	
	function p0.onExitFeedbackMode() --[[ line: 63 ]]
		-- upvalues: experienceStateCaptureService (copy)
		experienceStateCaptureService:ToggleCaptureMode()
	end
	
	function p0.openHelpModal() --[[ line: 67 ]]
		-- upvalues: p0 (ref)
		p0.props.showHelpModal(true)
	end
end

function refinedFeedbackBar.calculateHintRatios(p1) --[[ line: 73 ]]
	-- upvalues: cryoModule (ref), GetTextSize (ref)
	local var12 = 84
	local var13 = ""
	local t = {}
	local var15 = 0
	local var16 = cryoModule.List.join({ p1 }, {})
	
	for i, v in ipairs(var16) do
		t[v.text] = GetTextSize(v.text, 17, 2, Vector2.new(10000, 10000)).X
		var15 += t[v.text]
		var12 = var12 + 36 + 8
		var13 ..= v.text
	end
	for i_1, v_1 in pairs(t) do
		t[i_1] = v_1 / var15
	end
	return t, var12 + math.max(#var16 - 2, 0) * 40, var13
end

function refinedFeedbackBar.getDerivedStateFromProps(p2) --[[ line: 105 ]]
	-- upvalues: refinedFeedbackBar (ref)
	local var17, var18, var19 = refinedFeedbackBar.calculateHintRatios(p2.leftHint)
	
	return {
		hintRatios = var17,
		requiredSpace = var18,
		hintStringsConcat = var19
	}
end

function refinedFeedbackBar.calculateHintSize(p3, p4, p5) --[[ line: 116 ]]
	-- upvalues: GetTextSize (ref)
	local var20 = p4 - p3.state.requiredSpace
	local var21 = p5.Header2.RelativeSize * p5.BaseSize
	local var22 = p5.Header2.RelativeMinSize * p5.BaseSize
	local x = GetTextSize(p3.state.hintStringsConcat, var22, p5.Header2.Font, Vector2.new(10000, 10000)).X
	
	if x <= var20 then
		local x_1 = GetTextSize(p3.state.hintStringsConcat, var21, p5.Header2.Font, Vector2.new(10000, 10000)).X
		local var23 = (var21 - var22) / (x_1 - x)
		
		return nil, math.clamp(var20 * var23 + (var21 - var23 * x_1), var22, var21)
	end
	local t = {}
	
	for i, v in pairs(p3.state.hintRatios) do
		t[i] = v * var20
	end
	return t
end

function refinedFeedbackBar.render(p6) --[[ line: 155 ]]
	-- upvalues: withStyle (ref), roactModule (ref), feedbackBarHintModule (ref), withLocalization (ref), buttonStack (ref), buttonType (ref)
	return withStyle(function(p7) --[[ line: 156 ]]
		-- upvalues: roactModule (copy), feedbackBarHintModule (copy), p6 (ref), withLocalization (copy), buttonStack (copy), buttonType (copy)
		local theme = p7.Theme
		
		return roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = theme.BackgroundUIContrast.Transparency,
			BackgroundColor3 = theme.BackgroundUIContrast.Color,
			Size = UDim2.new(1, 0, 0, 72),
			Position = UDim2.fromScale(0, 1),
			AnchorPoint = Vector2.new(0, 1),
			[roactModule.Change.AbsoluteSize] = function(p8) --[[ line: 169 ]]
				-- upvalues: p6 (copy)
				p6:setState({ barWidth = p8.AbsoluteSize.X })
			end,
			[roactModule.Event.AncestryChanged] = function(p9) --[[ line: 174 ]]
				-- upvalues: p6 (copy)
				p6:setState({ barWidth = p9.AbsoluteSize.X })
			end
		}, {
			Padding = roactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, 24),
				PaddingRight = UDim.new(0, 24)
			}),
			LeftFrame = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(0.5, 1)
			}, {
				roactModule.createElement("UIListLayout", {
					key = "Layout",
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 40)
				}),
				(function(p10) --[[ line: 158 | named "makeHint" ]]
					-- upvalues: roactModule (copy), feedbackBarHintModule (copy)
					return roactModule.createElement(feedbackBarHintModule, p10)
				end)(p6.props.leftHint)
			}),
			RightFrame = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(0.35, 1),
				Position = UDim2.fromScale(1, 0),
				AnchorPoint = Vector2.new(1, 0)
			}, {
				Layout = roactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Right,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 40)
				}),
				Buttons = withLocalization({
					helpButtonText = "CoreScripts.Feedback.FeedbackBar.HelpButton",
					exitFeedbackButtonText = "CoreScripts.Feedback.FeedbackBar.ExitFeedbackButton"
				})(function(p11) --[[ line: 217 ]]
					-- upvalues: roactModule (copy), buttonStack (copy), buttonType (copy), p6 (copy)
					return roactModule.createElement(buttonStack, {
						buttonHeight = 50,
						buttons = {
							{
								buttonType = buttonType.Secondary,
								props = {
									onActivated = p6.openHelpModal,
									text = p11.helpButtonText
								}
							},
							{
								buttonType = buttonType.PrimarySystem,
								props = {
									isDisabled = false,
									onActivated = p6.onExitFeedbackMode,
									text = p11.exitFeedbackButtonText
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

return roactRoduxModule.connect(function() --[[ line: 245 ]]
	return {}
end, function(p12) --[[ line: 247 ]]
	-- upvalues: showHelpModalThunkModule (ref)
	return {
		showHelpModal = function(p13) --[[ line: 249 ]]
			-- upvalues: p12 (ref), showHelpModalThunkModule (copy)
			p12(showHelpModalThunkModule(p13))
		end
	}
end)(refinedFeedbackBar)