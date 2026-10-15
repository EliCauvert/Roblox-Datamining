local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local chatActionsModule = require(buildExperience.Components.Chat.ChatActions)
local _ = require(buildExperience.Chat.chatTypes)
local fFlagBuildExperienceAnswerFormModule = require(buildExperience.Flags.FFlagBuildExperienceAnswerForm)
local var1 = if fFlagBuildExperienceAnswerFormModule then require(buildExperience.Components.AnswerForm.AnswerFormContainer) else nil
local _ = require(buildExperience.Components.Chat.ChatComposer)
local _ = require(buildExperience.Components.Library.LibraryTypes)
local modelViewportModule = require(buildExperience.Components.Library.ModelViewport)
local libraryAudioPlayerContainerModule = require(buildExperience.Components.Library.LibraryAudioPlayer.LibraryAudioPlayerContainer)
local useHardwareInsetsModule = require(buildExperience.Components.ChatSheet.useHardwareInsets)
local fFlagBuildExperienceLibrary = require(parent.SharedFlags).FFlagBuildExperienceLibrary
local image = foundationModule.Image
local skeleton = foundationModule.Skeleton
local scrollView = foundationModule.ScrollView
local text = foundationModule.Text
local view = foundationModule.View
local radius = foundationModule.Enums.Radius

return function(p1)
	-- upvalues: useHardwareInsetsModule (ref), fFlagBuildExperienceAnswerFormModule (ref), foundationModule (ref), reactModule (ref), fFlagBuildExperienceLibrary (ref), view (ref), modelViewportModule (ref), text (ref), image (ref), scrollView (ref), libraryAudioPlayerContainerModule (ref), skeleton (ref), radius (ref), var1 (ref), chatActionsModule (ref)
	local var2, var3, var4
	local bottom = useHardwareInsetsModule().bottom
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildExperienceAnswerFormModule then
		var2 = foundationModule.Hooks.useScaledValue(400)
		local var5, var6 = reactModule.useBinding(0)
		var3 = var5
		var4 = var6
	else
		var2 = nil
		var3 = nil
		var4 = nil
	end
	local var7, var8 = reactModule.useState(false)
	local var9 = reactModule.useCallback(function(p2)
		-- upvalues: var8 (ref)
		var8(p2.AbsoluteSize.Y < 400)
	end, {})
	local var10 = reactModule.useRef(nil)
	local var11 = if p1.chatActions ~= nil then nil else table.clone(p1.chatActions)
	
	if var11 ~= nil then
		var11.textBoxRef = var10
		var11.allowsTypingWhileResponding = true
		
		if fFlagBuildExperienceLibrary then
			var11.onRemoveResourceAttachment = nil
		end
		local onSend = var11.onSend
		
		function var11.onSend()
			-- upvalues: onSend (ref), var10 (ref)
			local var12 = onSend()
			
			if var12 and var10.current ~= nil then
				var10.current.releaseFocus()
			end
			return var12
		end
	end
	local var12 = fFlagBuildExperienceAnswerFormModule and (p1.isActive ~= false and (var11 ~= nil and var11.answerForm ~= nil))
	local liveModel = p1.liveModel
	local _ = nil
	
	return reactModule.createElement(view, {
		tag = "col size-full",
		testId = "Library.Preview",
		onAbsolutePositionChanged = p1.onPageMetricsChanged,
		onAbsoluteSizeChanged = p1.onPageMetricsChanged,
		padding = {
			bottom = UDim.new(0, math.max(p1.keyboardOverlap or 0, bottom))
		}
	}, {
		Content = reactModule.createElement(view, { LayoutOrder = 1, tag = "fill size-full-0" }, {
			Body = if p1.status == "Ready" and liveModel ~= nil then reactModule.createElement(view, {
				tag = "col size-full clip",
				testId = "Library.Preview.ModelRegion"
			}, {
				Viewport = reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = "fill size-full-0 clip",
					testId = "Library.Preview.ViewportRegion"
				}, {
					Model = reactModule.createElement(modelViewportModule, {
						backgroundTransparency = 1,
						cameraDistanceScale = 1.25,
						testId = "Library.Preview.Model",
						model = liveModel.model,
						size = UDim2.fromScale(1, 1),
						isInteractive = p1.isActive ~= false,
						unavailableText = p1.unavailableText
					})
				})
			}) elseif p1.status == "Ready" and p1.image ~= nil then if p1.imageLoadFailed then reactModule.createElement(text, {
				tag = "size-full-0 auto-y padding-large text-body-medium text-align-x-center content-default",
				Text = p1.unavailableText
			}) else reactModule.createElement(image, {
				tag = "size-full",
				testId = "Library.Preview.Image",
				Image = p1.image,
				onLoaded = p1.onImageLoaded,
				ScaleType = Enum.ScaleType.Fit
			}) elseif p1.status == "Ready" and p1.soundId ~= nil then reactModule.createElement(scrollView, {
				tag = "size-full clip",
				testId = "Library.Preview.Sound",
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.fromOffset(0, 0),
					ScrollingDirection = Enum.ScrollingDirection.Y
				},
				onAbsoluteSizeChanged = var9
			}, {
				Content = reactModule.createElement(view, {
					tag = "col align-x-center align-y-center size-full auto-y padding-x-large padding-y-medium"
				}, {
					[p1.soundId] = reactModule.createElement(libraryAudioPlayerContainerModule, {
						soundId = p1.soundId,
						unavailableText = p1.unavailableText,
						soundLabel = p1.soundLabel,
						title = if liveModel ~= nil then p1.modelName or "" else liveModel.displayName,
						isActive = p1.isActive,
						isCompact = var7
					})
				})
			}) elseif p1.status == "Failed" then reactModule.createElement(text, {
				tag = "size-full-0 auto-y padding-large text-body-medium text-align-x-center content-default",
				Text = p1.unavailableText
			}) else reactModule.createElement(view, {
				tag = "col align-x-center gap-large size-full-0 auto-y padding-y-xlarge",
				testId = "Library.Preview.Skeleton"
			}, {
				Preview = reactModule.createElement(skeleton, {
					Size = UDim2.fromOffset(320, 320),
					radius = radius.Medium
				})
			})
		}),
		Description = if p1.description == nil or p1.status ~= "Ready" then nil else reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col size-full-0 auto-y padding-x-xlarge padding-bottom-xlarge padding-top-medium"
		}, {
			Text = reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-muted",
				testId = "Library.Preview.Description",
				Text = p1.description
			})
		}),
		AnswerForm = if var12 then reactModule.createElement(scrollView, {
			LayoutOrder = 3,
			tag = "shrink size-full-0 padding-x-medium",
			testId = "Library.Preview.AnswerFormScroll",
			Size = var3:map(function(p2)
				-- upvalues: var2 (write)
				return UDim2.new(1, 0, 0, math.min(p2, var2))
			end),
			onAbsoluteCanvasSizeChanged = function(value)
				-- upvalues: var4 (write)
				var4(value.AbsoluteCanvasSize.Y)
			end,
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(),
				ScrollingDirection = Enum.ScrollingDirection.Y
			}
		}, reactModule.createElement(var1, {
			state = var11.answerForm,
			actions = var11.localToolActions,
			onSubmitText = var11.onSubmitAnswerText,
			onStop = var11.onStop,
			errorText = var11.composerErrorText
		})) else nil,
		Composer = if var11 == nil or p1.isActive == false or var12 then nil else reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "col size-full-0 auto-y padding-x-medium padding-bottom-medium",
			testId = "Library.Preview.Composer"
		}, {
			Actions = reactModule.createElement(chatActionsModule, var11)
		})
	})
end