local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ChatActionsModule = require(BuildExperience.Components.Chat.ChatActions)
local FFlagBuildExperienceAnswerFormModule = require(BuildExperience.Flags.FFlagBuildExperienceAnswerForm)
local AnswerFormContainerModule = if FFlagBuildExperienceAnswerFormModule then require(BuildExperience.Components.AnswerForm.AnswerFormContainer) else nil
local _ = require(BuildExperience.Components.Chat.ChatComposer)
local _ = require(BuildExperience.Components.Library.LibraryTypes)
local ModelViewportModule = require(BuildExperience.Components.Library.ModelViewport)
local LibraryAudioPlayerContainerModule = require(BuildExperience.Components.Library.LibraryAudioPlayer.LibraryAudioPlayerContainer)
local UseHardwareInsetsModule = require(BuildExperience.Components.ChatSheet.useHardwareInsets)
local FFlagBuildExperienceLibrary = require(Parent.SharedFlags).FFlagBuildExperienceLibrary
local Image = FoundationModule.Image
local Skeleton = FoundationModule.Skeleton
local ScrollView = FoundationModule.ScrollView
local Text = FoundationModule.Text
local View = FoundationModule.View
local Radius = FoundationModule.Enums.Radius

return function(p1)
	-- upvalues: UseHardwareInsetsModule (copy), FFlagBuildExperienceAnswerFormModule (copy), FoundationModule (copy), ReactModule (copy), FFlagBuildExperienceLibrary (copy), View (copy), ModelViewportModule (copy), Text (copy), Image (copy), ScrollView (copy), LibraryAudioPlayerContainerModule (copy), Skeleton (copy), Radius (copy), AnswerFormContainerModule (copy), ChatActionsModule (copy)
	local Bottom: number = UseHardwareInsetsModule().bottom
	local UseScaledValueResult = nil
	local Callback = nil
	local UseBindingResult = nil
	
	if FFlagBuildExperienceAnswerFormModule then
		UseScaledValueResult = FoundationModule.Hooks.useScaledValue(400)
		UseBindingResult, Callback = ReactModule.useBinding(0)
	else
		UseScaledValueResult = nil
		UseBindingResult = nil
		Callback = nil
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(Frame.AbsoluteSize.Y < 400)
	end, {})
	local UseRefResult = ReactModule.useRef(nil)
	local Copy = if p1.chatActions == nil then nil else table.clone(p1.chatActions)
	
	if Copy ~= nil then
		Copy.textBoxRef = UseRefResult
		Copy.allowsTypingWhileResponding = true
		
		if FFlagBuildExperienceLibrary then
			Copy.onRemoveResourceAttachment = nil
		end
		local OnSendFunction = Copy.onSend
		
		function Copy.onSend()
			-- upvalues: OnSendFunction (copy), UseRefResult (copy)
			local OnSendResult = OnSendFunction()
			
			if OnSendResult and UseRefResult.current ~= nil then
				UseRefResult.current.releaseFocus()
			end
			return OnSendResult
		end
	end
	local HasAnswerForm: boolean = FFlagBuildExperienceAnswerFormModule and (p1.isActive ~= false and (Copy ~= nil and Copy.answerForm ~= nil))
	local LiveModel = p1.liveModel
	local ModelName = if LiveModel == nil then p1.modelName or "" else LiveModel.displayName
	
	return (ReactModule.createElement(View, {
		tag = "col size-full",
		testId = "Library.Preview",
		onAbsolutePositionChanged = p1.onPageMetricsChanged,
		onAbsoluteSizeChanged = p1.onPageMetricsChanged,
		padding = {
			bottom = UDim.new(0, (math.max(p1.keyboardOverlap or 0, Bottom)))
		}
	}, {
		Content = ReactModule.createElement(View, { LayoutOrder = 1, tag = "fill size-full-0" }, {
			Body = if p1.status == "Ready" and LiveModel ~= nil then ReactModule.createElement(View, {
				tag = "col size-full clip",
				testId = "Library.Preview.ModelRegion"
			}, {
				Viewport = ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = "fill size-full-0 clip",
					testId = "Library.Preview.ViewportRegion"
				}, {
					Model = ReactModule.createElement(ModelViewportModule, {
						backgroundTransparency = 1,
						cameraDistanceScale = 1.25,
						testId = "Library.Preview.Model",
						model = LiveModel.model,
						size = UDim2.fromScale(1, 1),
						isInteractive = p1.isActive ~= false,
						unavailableText = p1.unavailableText
					})
				})
			}) elseif p1.status == "Ready" and p1.image ~= nil then if p1.imageLoadFailed then ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y padding-large text-body-medium text-align-x-center content-default",
				Text = p1.unavailableText
			}) else ReactModule.createElement(Image, {
				tag = "size-full",
				testId = "Library.Preview.Image",
				Image = p1.image,
				onLoaded = p1.onImageLoaded,
				ScaleType = Enum.ScaleType.Fit
			}) elseif p1.status == "Ready" and p1.soundId ~= nil then ReactModule.createElement(ScrollView, {
				tag = "size-full clip",
				testId = "Library.Preview.Sound",
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.fromOffset(0, 0),
					ScrollingDirection = Enum.ScrollingDirection.Y
				},
				onAbsoluteSizeChanged = UseResult
			}, {
				Content = ReactModule.createElement(View, {
					tag = "col align-x-center align-y-center size-full auto-y padding-x-large padding-y-medium"
				}, {
					[p1.soundId] = ReactModule.createElement(LibraryAudioPlayerContainerModule, {
						soundId = p1.soundId,
						unavailableText = p1.unavailableText,
						soundLabel = p1.soundLabel,
						title = ModelName,
						isActive = p1.isActive,
						isCompact = UseStateResult
					})
				})
			}) elseif p1.status == "Failed" then ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y padding-large text-body-medium text-align-x-center content-default",
				Text = p1.unavailableText
			}) else ReactModule.createElement(View, {
				tag = "col align-x-center gap-large size-full-0 auto-y padding-y-xlarge",
				testId = "Library.Preview.Skeleton"
			}, {
				Preview = ReactModule.createElement(Skeleton, {
					Size = UDim2.fromOffset(320, 320),
					radius = Radius.Medium
				})
			})
		}),
		Description = if p1.description == nil or p1.status ~= "Ready" then nil else ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "col size-full-0 auto-y padding-x-xlarge padding-bottom-xlarge padding-top-medium"
		}, {
			Text = ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-muted",
				testId = "Library.Preview.Description",
				Text = p1.description
			})
		}),
		AnswerForm = if HasAnswerForm then ReactModule.createElement(ScrollView, {
			LayoutOrder = 3,
			tag = "shrink size-full-0 padding-x-medium",
			testId = "Library.Preview.AnswerFormScroll",
			Size = UseBindingResult:map(function(p2: number): UDim2
				-- upvalues: UseScaledValueResult (ref)
				return UDim2.new(1, 0, 0, (math.min(p2, UseScaledValueResult)))
			end),
			onAbsoluteCanvasSizeChanged = function(ScrollFrame)
				-- upvalues: Callback (ref)
				Callback(ScrollFrame.AbsoluteCanvasSize.Y)
			end,
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(),
				ScrollingDirection = Enum.ScrollingDirection.Y
			}
		}, ReactModule.createElement(AnswerFormContainerModule, {
			state = Copy.answerForm,
			actions = Copy.localToolActions,
			onSubmitText = Copy.onSubmitAnswerText,
			onStop = Copy.onStop,
			errorText = Copy.composerErrorText,
			isReadOnly = Copy.isReadOnly
		})) else nil,
		Composer = if Copy == nil or (p1.isActive == false or HasAnswerForm) then nil else ReactModule.createElement(View, {
			LayoutOrder = 3,
			tag = "col size-full-0 auto-y padding-x-medium padding-bottom-medium",
			testId = "Library.Preview.Composer"
		}, {
			Actions = ReactModule.createElement(ChatActionsModule, Copy)
		})
	}))
end