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

function emoteThumbnailEditor.init(p1)
	-- upvalues: emoteThumbnailParametersModule (ref), roactModule (ref)
	p1:setState({
		thumbnailParameters = p1.props.initialThumbnailParameters or emoteThumbnailParametersModule.defaultParameters
	})
	
	function p0.onCancelPressed()
		-- upvalues: p1 (ref)
		p1.props.closePromptCallback()
	end
	
	function p0.onUpdatePressed()
		-- upvalues: p1 (ref)
		p1.props.updateThumbnailCallback(p1.state.thumbnailParameters)
		p1.props.closePromptCallback()
	end
	
	function p0.onRotateChanged(p2)
		-- upvalues: p1 (ref)
		local cloned = table.clone(p1.state.thumbnailParameters)
		cloned.thumbnailCharacterRotation = p2
		p1:updateThumbnailParameters(cloned)
	end
	
	function p0.onKeyframeOrTimeChanged(p2)
		-- upvalues: p1 (ref)
		local cloned = table.clone(p1.state.thumbnailParameters)
		cloned.thumbnailTime = p2
		cloned.thumbnailKeyframe = p2
		p1:updateThumbnailParameters(cloned)
	end
	
	p1.rotationSliderRef = roactModule.createRef()
	p1.timeSliderRef = roactModule.createRef()
	p1:updateSliderValuesForAnimationClip()
end

function emoteThumbnailEditor.updateSliderValuesForAnimationClip(p1)
	-- upvalues: emoteUtility (ref)
	local props = p1.props
	local var1 = nil
	local var2 = nil
	local var3 = nil
	
	if props.animationClip:IsA("KeyframeSequence") then
		var1 = 1
		var2 = #props.animationClip:GetKeyframes()
		var3 = 1
	elseif props.animationClip:IsA("CurveAnimation") then
		var1 = 0
		var2 = math.floor(emoteUtility.GetCurveAnimationTimeLength(props.animationClip) / 0.01) * 0.01
		var3 = 0.01
	else
		error("Unsupported animation type:", props.animationClip.ClassName)
	end
	p1:setState({
		timeSliderMin = var1,
		timeSliderMax = var2,
		timeSliderStepInterval = var3
	})
end

function emoteThumbnailEditor.updateThumbnailParameters(p1, p2)
	p1:setState({ thumbnailParameters = p2 })
end

function emoteThumbnailEditor.renderMiddle(p1, p2)
	-- upvalues: withStyle (ref), roactModule (ref), roactGamepadModule (ref), emoteThumbnailViewModule (ref), systemSlider (ref), t (ref)
	return withStyle(function(p3)
		-- upvalues: p1 (ref), roactModule (copy), roactGamepadModule (copy), emoteThumbnailViewModule (copy), p2 (ref), systemSlider (copy), t (copy)
		local font = p3.Font
		local theme = p3.Theme
		local t_1 = {}
		
		if p1.props.screenSize.Y > 481 then
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
		local thumbnailParameters = p1.state.thumbnailParameters
		local thumbnailKeyframe = thumbnailParameters.thumbnailKeyframe
		local thumbnailCharacterRotation = thumbnailParameters.thumbnailCharacterRotation
		
		local function _(p4)
			return (p4.Range.Max - p4.Range.Min) / (p4.Increments - 1)
		end
		
		local createElement = roactModule.createElement
		local frame = roactGamepadModule.Focusable.Frame
		local t_2 = {
			Size = t_1.contentSize,
			BackgroundColor3 = Color3.new(1, 0, 1),
			BackgroundTransparency = 1,
			[roactModule.Ref] = p1.middleContentRef
		}
		local t_3 = {}
		local createElement_1 = roactModule.createElement
		local var1 = "Frame"
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
					animationClip = p1.props.animationClip,
					thumbnailParameters = p1.state.thumbnailParameters
				})
			})
		}
		local createElement_2 = roactModule.createElement
		local var2 = "Frame"
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
				Text = p2.timeLabelText,
				TextColor3 = theme.TextDefault.Color,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			TimeSlider = roactModule.createElement(systemSlider, {
				layoutOrder = 1,
				min = p1.state.timeSliderMin,
				max = p1.state.timeSliderMax,
				stepInterval = p1.state.timeSliderStepInterval,
				value = thumbnailKeyframe,
				onValueChanged = p1.onKeyframeOrTimeChanged,
				width = UDim.new(1, 0),
				position = UDim2.new(0, 0, 0.5, 0),
				anchorPoint = Vector2.new(0, 0.5),
				NextSelectionDown = p1.rotationSliderRef,
				[roactModule.Ref] = p1.timeSliderRef
			}),
			RotationDescriptionLabel = roactModule.createElement("TextLabel", {
				LayoutOrder = 2,
				TextSize = 12,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 15),
				Font = font.Body.Font,
				Text = p2.rotationLabelText,
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
		t_8.onValueChanged = p1.onRotateChanged
		t_8.width = UDim.new(1, 0)
		t_8.position = UDim2.new(0, 0, 0.5, 0)
		t_8.anchorPoint = Vector2.new(0, 0.5)
		t_8.NextSelectionUp = p1.timeSliderRef
		t_8[roactModule.Ref] = p1.rotationSliderRef
		t_7.RotationSlider = createElement_3(systemSlider, t_8)
		t_5.Levers = createElement_2(var2, t_6, t_7)
		t_3.TopSection = createElement_1(var1, t_4, t_5)
		
		return createElement(frame, t_2, t_3)
	end)
end

function emoteThumbnailEditor.renderAlertLocalized(p1, p2)
	-- upvalues: roactModule (ref), interactiveAlert (ref), buttonType (ref)
	return roactModule.createElement(interactiveAlert, {
		isMiddleContentFocusable = true,
		title = p2.titleText or "",
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = {
						onActivated = p1.onCancelPressed,
						text = p2.cancelButtonText
					}
				},
				{
					isDefaultChild = false,
					buttonType = buttonType.PrimarySystem,
					props = {
						onActivated = p1.onUpdatePressed,
						text = p2.updateButtonText
					}
				}
			}
		},
		middleContent = function()
			-- upvalues: p1 (ref), p2 (ref)
			return p1:renderMiddle(p2)
		end,
		screenSize = p1.props.screenSize,
		defaultChildRef = p1.props.defaultChildRef
	})
end

local function GetLocalizedStrings()
	-- upvalues: robloxTranslatorModule (ref)
	return {
		cancelButtonText = robloxTranslatorModule:FormatByKey("CoreScripts.EmoteThumbnailEditor.Action.Cancel"),
		updateButtonText = robloxTranslatorModule:FormatByKey("CoreScripts.EmoteThumbnailEditor.Action.Update"),
		titleText = robloxTranslatorModule:FormatByKey("CoreScripts.EmoteThumbnailEditor.Heading.EditThumbnail"),
		rotationLabelText = robloxTranslatorModule:FormatByKey("CoreScripts.EmoteThumbnailEditor.Label.Rotation"),
		timeLabelText = robloxTranslatorModule:FormatByKey("CoreScripts.EmoteThumbnailEditor.Label.Time")
	}
end

function emoteThumbnailEditor.render(p1)
	-- upvalues: GetLocalizedStrings (ref)
	return p1:renderAlertLocalized(GetLocalizedStrings())
end

return emoteThumbnailEditor