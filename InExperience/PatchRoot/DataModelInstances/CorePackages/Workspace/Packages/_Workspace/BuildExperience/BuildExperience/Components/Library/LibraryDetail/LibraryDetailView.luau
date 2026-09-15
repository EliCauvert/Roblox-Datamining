local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local overflowMenuPageShellModule = require(buildExperience.Components.BuildPillMenu.OverflowMenuPageShell)
local chatActionsModule = require(buildExperience.Components.Chat.ChatActions)
local _ = require(buildExperience.Components.Library.LibraryTypes)
local modelViewportModule = require(buildExperience.Components.Library.ModelViewport)
local libraryAudioPlayerContainerModule = require(buildExperience.Components.Library.LibraryAudioPlayer.LibraryAudioPlayerContainer)
local button = foundationModule.Button
local iconButton = foundationModule.IconButton
local image = foundationModule.Image
local skeleton = foundationModule.Skeleton
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local radius = foundationModule.Enums.Radius

return function(p1)
	-- upvalues: reactModule (ref), view (ref), modelViewportModule (ref), iconButton (ref), iconName (ref), inputSize (ref), buttonVariant (ref), button (ref), text (ref), image (ref), libraryAudioPlayerContainerModule (ref), skeleton (ref), radius (ref), chatActionsModule (ref), overflowMenuPageShellModule (ref)
	local liveModel = p1.liveModel
	local var1 = reactModule.useRef(nil)
	local var2 = if liveModel ~= nil then p1.modelName or "" else liveModel.displayName
	local _ = nil
	local var3 = if p1.status == "Ready" and liveModel ~= nil then reactModule.createElement(view, {
		tag = "col size-full clip bg-surface-100",
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
				isInteractive = false,
				testId = "Library.Preview.Model",
				model = liveModel.model,
				size = UDim2.fromScale(1, 1),
				controllerRef = var1
			})
		}),
		Controls = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row align-x-right align-y-center gap-small size-full-0 auto-y padding-medium",
			testId = "Library.Preview.Controls"
		}, {
			RotateLeft = reactModule.createElement(iconButton, {
				LayoutOrder = 1,
				isCircular = true,
				testId = "Library.Preview.RotateLeft",
				icon = iconName.ArrowCurlToLeft,
				onActivated = function()
					-- upvalues: var1 (ref)
					if var1.current ~= nil then
						var1.current.rotateLeft()
					end
				end,
				size = inputSize.Medium,
				variant = buttonVariant.Utility
			}),
			RotateRight = reactModule.createElement(iconButton, {
				LayoutOrder = 2,
				isCircular = true,
				testId = "Library.Preview.RotateRight",
				icon = iconName.ArrowCurlToRight,
				onActivated = function()
					-- upvalues: var1 (ref)
					if var1.current ~= nil then
						var1.current.rotateRight()
					end
				end,
				size = inputSize.Medium,
				variant = buttonVariant.Utility
			}),
			ViewInWorld = if p1.onSeeInWorld ~= nil then nil else reactModule.createElement(button, {
				LayoutOrder = 3,
				text = "View in World",
				testId = "Library.Preview.SeeInWorld",
				width = UDim.new(0, 115),
				onActivated = function()
					-- upvalues: p1 (ref), liveModel (ref)
					p1.onSeeInWorld(liveModel)
				end,
				variant = buttonVariant.Emphasis,
				size = inputSize.Small
			})
		})
	}) elseif p1.status == "Ready" and p1.image ~= nil then if p1.imageLoadFailed then reactModule.createElement(text, {
		Text = "Unable to load image.",
		tag = "size-full-0 auto-y padding-large text-body-medium text-align-x-center content-default"
	}) else reactModule.createElement(image, {
		tag = "size-full bg-surface-100",
		testId = "Library.Preview.Image",
		Image = p1.image,
		onLoaded = p1.onImageLoaded,
		ScaleType = Enum.ScaleType.Fit
	}) elseif p1.status == "Ready" and p1.soundId ~= nil then reactModule.createElement(view, {
		tag = "col align-x-center align-y-center size-full padding-x-large bg-surface-100",
		testId = "Library.Preview.Sound"
	}, {
		[p1.soundId] = reactModule.createElement(libraryAudioPlayerContainerModule, { soundId = p1.soundId, title = var2 })
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
	
	return if p1.presentation == "Sheet" or p1.chatActions ~= nil then reactModule.createElement(view, {
		tag = "col size-full bg-surface-100",
		testId = "Library.Preview",
		onAbsolutePositionChanged = p1.onPageMetricsChanged,
		onAbsoluteSizeChanged = p1.onPageMetricsChanged,
		padding = { bottom = UDim.new(0, p1.keyboardOverlap or 0) }
	}, {
		Header = reactModule.createElement(view, {
			LayoutOrder = 1,
			testId = "Library.Preview-header",
			tag = {
				["composition-content-header"] = true,
				["row align-y-center gap-small size-full-0 auto-y padding-y-small"] = true
			}
		}, {
			Back = reactModule.createElement(iconButton, {
				LayoutOrder = 1,
				isCircular = true,
				testId = "Library.Preview-close",
				icon = iconName.ChevronLargeLeft,
				onActivated = p1.onBack,
				size = inputSize.Medium,
				variant = buttonVariant.Utility
			}),
			Title = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "fill text-heading-medium text-align-x-left text-truncate-end content-emphasis",
				testId = "Library.Preview-title",
				Text = var2
			})
		}),
		Content = reactModule.createElement(view, { LayoutOrder = 2, tag = "fill size-full-0" }, { Body = var3 }),
		Composer = if p1.chatActions ~= nil then nil else reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "col size-full-0 auto-y padding-x-medium padding-bottom-medium bg-surface-100",
			testId = "Library.Preview.Composer"
		}, {
			Actions = reactModule.createElement(chatActionsModule, p1.chatActions)
		})
	}) else reactModule.createElement(overflowMenuPageShellModule, {
		testId = "Library.Preview",
		title = var2,
		closeIcon = iconName.ChevronLargeLeft,
		onClose = p1.onBack,
		disableScrolling = p1.status == "Ready",
		content = var3
	})
end