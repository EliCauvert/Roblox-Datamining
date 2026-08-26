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

local function GetTextSize(...)
	-- upvalues: textService (ref)
	return textService:GetTextSize(...) + Vector2.new(2, 2)
end

refinedFeedbackBar.validateProps = tModule.strictInterface({
	leftHint = tModule.strictInterface({ text = tModule.string })
})

function refinedFeedbackBar.init(p1)
	-- upvalues: experienceStateCaptureService (ref)
	p1.state = {
		barWidth = 0,
		hintStringsConcat = nil,
		requiredSpace = nil,
		hintRatios = nil
	}
	
	function p0.onExitFeedbackMode()
		-- upvalues: experienceStateCaptureService (copy)
		experienceStateCaptureService:ToggleCaptureMode()
	end
	
	function p0.openHelpModal()
		-- upvalues: p1 (ref)
		p1.props.showHelpModal(true)
	end
end

function refinedFeedbackBar.calculateHintRatios(p1)
	-- upvalues: cryoModule (ref), GetTextSize (ref)
	local var1 = 84
	local var2 = ""
	local t = {}
	local var3 = 0
	local var4 = cryoModule.List.join({ p1 }, {})
	
	for i, v in ipairs(var4) do
		t[v.text] = GetTextSize(v.text, 17, 2, Vector2.new(10000, 10000)).X
		var3 += t[v.text]
		var1 = var1 + 36 + 8
		var2 ..= v.text
	end
	for i_1, v_1 in pairs(t) do
		t[i_1] = v_1 / var3
	end
	return t, var1 + math.max(#var4 - 2, 0) * 40, var2
end

function refinedFeedbackBar.getDerivedStateFromProps(p2)
	-- upvalues: refinedFeedbackBar (ref)
	local var5, var6, var7 = refinedFeedbackBar.calculateHintRatios(p2.leftHint)
	
	return {
		hintRatios = var5,
		requiredSpace = var6,
		hintStringsConcat = var7
	}
end

function refinedFeedbackBar.calculateHintSize(p2, p3, p4)
	-- upvalues: GetTextSize (ref)
	local var5 = p3 - p2.state.requiredSpace
	local var6 = p4.Header2.RelativeSize * p4.BaseSize
	local var7 = p4.Header2.RelativeMinSize * p4.BaseSize
	local x = GetTextSize(p2.state.hintStringsConcat, var7, p4.Header2.Font, Vector2.new(10000, 10000)).X
	
	if x <= var5 then
		local x_1 = GetTextSize(p2.state.hintStringsConcat, var6, p4.Header2.Font, Vector2.new(10000, 10000)).X
		local var8 = (var6 - var7) / (x_1 - x)
		
		return nil, math.clamp(var5 * var8 + (var6 - var8 * x_1), var7, var6)
	end
	local t = {}
	
	for i, v in pairs(p2.state.hintRatios) do
		t[i] = v * var5
	end
	return t
end

function refinedFeedbackBar.render(p5)
	-- upvalues: withStyle (ref), roactModule (ref), feedbackBarHintModule (ref), withLocalization (ref), buttonStack (ref), buttonType (ref)
	return withStyle(function(p6)
		-- upvalues: roactModule (copy), feedbackBarHintModule (copy), p5 (ref), withLocalization (copy), buttonStack (copy), buttonType (copy)
		local theme = p6.Theme
		
		return roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = theme.BackgroundUIContrast.Transparency,
			BackgroundColor3 = theme.BackgroundUIContrast.Color,
			Size = UDim2.new(1, 0, 0, 72),
			Position = UDim2.fromScale(0, 1),
			AnchorPoint = Vector2.new(0, 1),
			[roactModule.Change.AbsoluteSize] = function(p7)
				-- upvalues: p5 (copy)
				p5:setState({ barWidth = p7.AbsoluteSize.X })
			end,
			[roactModule.Event.AncestryChanged] = function(p7)
				-- upvalues: p5 (copy)
				p5:setState({ barWidth = p7.AbsoluteSize.X })
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
				(function(p7)
					-- upvalues: roactModule (copy), feedbackBarHintModule (copy)
					return roactModule.createElement(feedbackBarHintModule, p7)
				end)(p5.props.leftHint)
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
				})(function(p7)
					-- upvalues: roactModule (copy), buttonStack (copy), buttonType (copy), p5 (copy)
					return roactModule.createElement(buttonStack, {
						buttonHeight = 50,
						buttons = {
							{
								buttonType = buttonType.Secondary,
								props = {
									onActivated = p5.openHelpModal,
									text = p7.helpButtonText
								}
							},
							{
								buttonType = buttonType.PrimarySystem,
								props = {
									isDisabled = false,
									onActivated = p5.onExitFeedbackMode,
									text = p7.exitFeedbackButtonText
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

return roactRoduxModule.connect(function()
	return {}
end, function(p5)
	-- upvalues: showHelpModalThunkModule (ref)
	return {
		showHelpModal = function(p6)
			-- upvalues: p5 (ref), showHelpModalThunkModule (copy)
			p5(showHelpModalThunkModule(p6))
		end
	}
end)(refinedFeedbackBar)