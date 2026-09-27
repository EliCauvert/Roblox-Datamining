local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local chatActionsModule = require(buildExperience.Components.Chat.ChatActions)
local _ = require(buildExperience.Components.Chat.ChatComposer)
local _ = require(buildExperience.Components.Library.LibraryTypes)
local modelViewportModule = require(buildExperience.Components.Library.ModelViewport)
local libraryAudioPlayerContainerModule = require(buildExperience.Components.Library.LibraryAudioPlayer.LibraryAudioPlayerContainer)
local image = foundationModule.Image
local skeleton = foundationModule.Skeleton
local scrollView = foundationModule.ScrollView
local text = foundationModule.Text
local view = foundationModule.View
local radius = foundationModule.Enums.Radius

return function(p1)
	-- upvalues: reactModule (ref), view (ref), modelViewportModule (ref), text (ref), image (ref), scrollView (ref), libraryAudioPlayerContainerModule (ref), skeleton (ref), radius (ref), chatActionsModule (ref)
	local var1, var2 = reactModule.useState(false)
	local var3 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref)
		var2(p2.AbsoluteSize.Y < 400)
	end, {})
	local var4 = reactModule.useRef(nil)
	local var5 = if p1.chatActions ~= nil then nil else table.clone(p1.chatActions)
	
	if var5 ~= nil then
		var5.textBoxRef = var4
		var5.allowsTypingWhileResponding = true
		local onSend = var5.onSend
		
		function var10.onSend()
			-- upvalues: onSend (ref), var4 (ref)
			local var6 = onSend()
			
			if var6 and var4.current ~= nil then
				var4.current.releaseFocus()
			end
			return var6
		end
	end
	local liveModel = p1.liveModel
	local _ = nil
	
	return reactModule.createElement(view, {
		tag = "col size-full",
		testId = "Library.Preview",
		onAbsolutePositionChanged = p1.onPageMetricsChanged,
		onAbsoluteSizeChanged = p1.onPageMetricsChanged,
		padding = { bottom = UDim.new(0, p1.keyboardOverlap or 0) }
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
				onAbsoluteSizeChanged = var3
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
						isCompact = var1
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
		Composer = if var5 == nil or p1.isActive == false then nil else reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "col size-full-0 auto-y padding-x-medium padding-bottom-medium",
			testId = "Library.Preview.Composer"
		}, {
			Actions = reactModule.createElement(chatActionsModule, var5)
		})
	})
end