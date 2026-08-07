local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roactGamepadModule = require(corePackagesService.Packages.RoactGamepad)
local tModule = require(corePackagesService.Packages.t)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local emoteUtility = require(corePackagesService.Packages.Thumbnailing).EmoteUtility
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local withStyle = UIBloxModule.Style.withStyle
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local systemSlider = UIBloxModule.App.Slider.SystemSlider
local emoteThumbnailParametersModule = require(script.Parent.EmoteThumbnailParameters)
local emoteThumbnailViewModule = require(script.Parent.EmoteThumbnailView)
local _ = { CurveAnimationTimeIncrements = 0.01 }
local t = {
	Rotation = {
		Precision = 0,
		Default = 0,
		Increments = 361,
		Range = NumberRange.new(0, 360)
	}
}
local emoteThumbnailEditor = roactModule.PureComponent:extend("EmoteThumbnailEditor")
emoteThumbnailEditor.validateProps = tModule.strictInterface({
	screenSize = tModule.Vector2,
	animationClip = tModule.instanceIsA("AnimationClip"),
	initialThumbnailParameters = tModule.optional(emoteThumbnailParametersModule.validate),
	closePromptCallback = tModule.callback,
	updateThumbnailCallback = tModule.callback
})

function emoteThumbnailEditor.init(p0) --[[ line: 62 ]]
	-- upvalues: emoteThumbnailParametersModule (ref), roactModule (ref)
	p0:setState({
		thumbnailParameters = p0.props.initialThumbnailParameters or emoteThumbnailParametersModule.defaultParameters
	})
	
	function p0.onCancelPressed() --[[ line: 70 ]]
		-- upvalues: p0 (ref)
		p0.props.closePromptCallback()
	end
	
	function p0.onUpdatePressed() --[[ line: 74 ]]
		-- upvalues: p0 (ref)
		p0.props.updateThumbnailCallback(p0.state.thumbnailParameters)
		p0.props.closePromptCallback()
	end
	
	function p0.onRotateChanged(p1) --[[ line: 80 ]]
		-- upvalues: p0 (ref)
		local cloned = table.clone(p0.state.thumbnailParameters)
		cloned.thumbnailCharacterRotation = p1
		p0:updateThumbnailParameters(cloned)
	end
	
	function p0.onKeyframeOrTimeChanged(p2) --[[ line: 86 ]]
		-- upvalues: p0 (ref)
		local cloned = table.clone(p0.state.thumbnailParameters)
		cloned.thumbnailTime = p2
		cloned.thumbnailKeyframe = p2
		p0:updateThumbnailParameters(cloned)
	end
	
	p0.rotationSliderRef = roactModule.createRef()
	p0.timeSliderRef = roactModule.createRef()
	p0:updateSliderValuesForAnimationClip()
end

function emoteThumbnailEditor.updateSliderValuesForAnimationClip(p3) --[[ line: 100 ]]
	-- upvalues: emoteUtility (ref)
	local props = p3.props
	local var13 = nil
	local var14 = nil
	local var15 = nil
	
	if props.animationClip:IsA("KeyframeSequence") then
		var13 = 1
		var14 = #props.animationClip:GetKeyframes()
		var15 = 1
	elseif props.animationClip:IsA("CurveAnimation") then
		var13 = 0
		var14 = math.floor(emoteUtility.GetCurveAnimationTimeLength(props.animationClip) / 0.01) * 0.01
		var15 = 0.01
	else
		error("Unsupported animation type:", props.animationClip.ClassName)
	end
	p3:setState({
		timeSliderMin = var13,
		timeSliderMax = var14,
		timeSliderStepInterval = var15
	})
end

function emoteThumbnailEditor.updateThumbnailParameters(p4, p5) --[[ line: 128 ]]
	p4:setState({ thumbnailParameters = p5 })
end

function emoteThumbnailEditor.renderMiddle(p6, p7) --[[ line: 134 ]]
	-- upvalues: withStyle (ref), roactModule (ref), roactGamepadModule (ref), emoteThumbnailViewModule (ref), systemSlider (ref), t (ref)
	return withStyle(function(p8) --[[ line: 135 ]]
		-- upvalues: p6 (ref), roactModule (copy), roactGamepadModule (copy), emoteThumbnailViewModule (copy), p7 (ref), systemSlider (copy), t (copy)
		local font = p8.Font
		local theme = p8.Theme
		local t_1 = {}
		
		if p6.props.screenSize.Y > 481 then
			t_1.contentSize = UDim2.new(1, 0, 0, 262)
			t_1.thumbnailPosition = UDim2.new(0.5, 0, 0, 0)
			t_1.thumbnailAnchorPoint = Vector2.new(0.5, 0)
			t_1.leversPosition = UDim2.new(0, 0, 0, 160)
			t_1.leversSize = UDim2.new(1, 0, 0, 102)
		else
			t_1.contentSize = UDim2.new(1, 0, 0, 150)
			t_1.thumbnailPosition = UDim2.new(0, 0, 0, 0)
			t_1.thumbnailAnchorPoint = Vector2.new(0, 0)
			t_1.leversPosition = UDim2.new(0, 160, 0, 0)
			t_1.leversSize = UDim2.new(1, -160, 0, 102)
		end
		local thumbnailParameters = p6.state.thumbnailParameters
		local thumbnailKeyframe = thumbnailParameters.thumbnailKeyframe
		local thumbnailCharacterRotation = thumbnailParameters.thumbnailCharacterRotation
		
		local function _(p9) --[[ line: 161 | named "getStepIntervalForOption" ]]
			return (p9.Range.Max - p9.Range.Min) / (p9.Increments - 1)
		end
		
		local createElement = roactModule.createElement
		local frame = roactGamepadModule.Focusable.Frame
		local t_2 = {
			Size = t_1.contentSize,
			BackgroundColor3 = Color3.new(1, 0, 1),
			BackgroundTransparency = 1,
			[roactModule.Ref] = p6.middleContentRef
		}
		local t_3 = {}
		local createElement_1 = roactModule.createElement
		local var19 = "Frame"
		local t_4 = { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }
		local t_5 = {
			ThumbnailViewParent = roactModule.createElement("Frame", {
				LayoutOrder = 0,
				BackgroundTransparency = 1,
				Position = t_1.thumbnailPosition,
				AnchorPoint = t_1.thumbnailAnchorPoint,
				Size = UDim2.new(0, 150, 0, 150),
				BackgroundColor3 = Color3.new(1, 1, 0)
			}, {
				EmoteThumbnailView = roactModule.createElement(emoteThumbnailViewModule, {
					position = UDim2.new(0.5, 0, 0.5, 0),
					anchorPoint = Vector2.new(0.5, 0.5),
					animationClip = p6.props.animationClip,
					thumbnailParameters = p6.state.thumbnailParameters
				})
			})
		}
		local createElement_2 = roactModule.createElement
		local var22 = "Frame"
		local t_6 = {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = t_1.leversSize,
			AnchorPoint = Vector2.new(0, 0),
			Position = t_1.leversPosition,
			BackgroundColor3 = Color3.new(1, 0, 0)
		}
		local t_7 = {
			ListLayout = roactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			FrameDescriptionLabel = roactModule.createElement("TextLabel", {
				LayoutOrder = 0,
				TextSize = 12,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 15),
				Font = font.Body.Font,
				Text = p7.timeLabelText,
				TextColor3 = theme.TextDefault.Color,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			TimeSlider = roactModule.createElement(systemSlider, {
				layoutOrder = 1,
				min = p6.state.timeSliderMin,
				max = p6.state.timeSliderMax,
				stepInterval = p6.state.timeSliderStepInterval,
				value = thumbnailKeyframe,
				onValueChanged = p6.onKeyframeOrTimeChanged,
				width = UDim.new(1, 0),
				position = UDim2.new(0, 0, 0.5, 0),
				anchorPoint = Vector2.new(0, 0.5),
				NextSelectionDown = p6.rotationSliderRef,
				[roactModule.Ref] = p6.timeSliderRef
			}),
			RotationDescriptionLabel = roactModule.createElement("TextLabel", {
				LayoutOrder = 2,
				TextSize = 12,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 15),
				Font = font.Body.Font,
				Text = p7.rotationLabelText,
				TextColor3 = theme.TextDefault.Color,
				TextXAlignment = Enum.TextXAlignment.Left
			})
		}
		local createElement_3 = roactModule.createElement
		local t_8 = {
			layoutOrder = 3,
			min = t.Rotation.Range.Min,
			max = t.Rotation.Range.Max
		}
		local rotation = t.Rotation
		t_8.stepInterval = (rotation.Range.Max - rotation.Range.Min) / (rotation.Increments - 1)
		t_8.value = thumbnailCharacterRotation
		t_8.onValueChanged = p6.onRotateChanged
		t_8.width = UDim.new(1, 0)
		t_8.position = UDim2.new(0, 0, 0.5, 0)
		t_8.anchorPoint = Vector2.new(0, 0.5)
		t_8.NextSelectionUp = p6.timeSliderRef
		t_8[roactModule.Ref] = p6.rotationSliderRef
		t_7.RotationSlider = createElement_3(systemSlider, t_8)
		t_5.Levers = createElement_2(var22, t_6, t_7)
		t_3.TopSection = createElement_1(var19, t_4, t_5)
		
		return createElement(frame, t_2, t_3)
	end)
end

function emoteThumbnailEditor.renderAlertLocalized(p10, p11) --[[ line: 258 ]]
	-- upvalues: roactModule (ref), interactiveAlert (ref), buttonType (ref)
	return roactModule.createElement(interactiveAlert, {
		isMiddleContentFocusable = true,
		title = p11.titleText or "",
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = {
						onActivated = p10.onCancelPressed,
						text = p11.cancelButtonText
					}
				},
				{
					isDefaultChild = false,
					buttonType = buttonType.PrimarySystem,
					props = {
						onActivated = p10.onUpdatePressed,
						text = p11.updateButtonText
					}
				}
			}
		},
		middleContent = function() --[[ line: 280 ]]
			-- upvalues: p10 (ref), p11 (ref)
			return p10:renderMiddle(p11)
		end,
		screenSize = p10.props.screenSize,
		defaultChildRef = p10.props.defaultChildRef
	})
end

local function GetLocalizedStrings() --[[ line: 289 ]]
	-- upvalues: robloxTranslatorModule (ref)
	return {
		cancelButtonText = robloxTranslatorModule:FormatByKey("CoreScripts.EmoteThumbnailEditor.Action.Cancel"),
		updateButtonText = robloxTranslatorModule:FormatByKey("CoreScripts.EmoteThumbnailEditor.Action.Update"),
		titleText = robloxTranslatorModule:FormatByKey("CoreScripts.EmoteThumbnailEditor.Heading.EditThumbnail"),
		rotationLabelText = robloxTranslatorModule:FormatByKey("CoreScripts.EmoteThumbnailEditor.Label.Rotation"),
		timeLabelText = robloxTranslatorModule:FormatByKey("CoreScripts.EmoteThumbnailEditor.Label.Time")
	}
end

function emoteThumbnailEditor.render(p12) --[[ line: 301 ]]
	-- upvalues: GetLocalizedStrings (ref)
	return p12:renderAlertLocalized(GetLocalizedStrings())
end

return emoteThumbnailEditor