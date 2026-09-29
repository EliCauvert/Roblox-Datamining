local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactUtilsModule = require(parent.ReactUtils)
local imageWithSkeletonModule = require(moments.Components.ImageWithSkeleton)
local commentActionsMenuModule = require(script.Parent.CommentActionsMenu)
local commentDeleteConfirmationDialogModule = require(script.Parent.CommentDeleteConfirmationDialog)
local commentReactionButtonModule = require(script.Parent.CommentReactionButton)
local commentRowHighlightModule = require(script.Parent.CommentRowHighlight)
local radius = foundationModule.Enums.Radius
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local thumbnailSize = foundationModule.Enums.ThumbnailSize
local thumbnailType = foundationModule.Enums.ThumbnailType
local getRbxThumb = foundationModule.Utility.getRbxThumb
local useComposedRef = reactUtilsModule.useComposedRef

local function noop() end

return function(p1)
	-- upvalues: reactModule (ref), useComposedRef (ref), getRbxThumb (ref), thumbnailType (ref), thumbnailSize (ref), foundationModule (ref), commentRowHighlightModule (ref), noop (ref), stateLayerAffordance (ref), imageWithSkeletonModule (ref), radius (ref), commentReactionButtonModule (ref), commentActionsMenuModule (ref), commentDeleteConfirmationDialogModule (ref)
	local actionsMenu = p1.actionsMenu
	local deleteConfirmation = p1.deleteConfirmation
	local var1 = actionsMenu ~= nil and actionsMenu.anchorRef ~= nil
	local var2, var3 = reactModule.useState(nil)
	
	return reactModule.createElement(foundationModule.View, {
		tag = "size-full-0 auto-y",
		LayoutOrder = p1.LayoutOrder,
		GroupTransparency = p1.GroupTransparency,
		ref = p1.rowRef,
		onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
		testId = `moments-comment-row-{p1.commentId}`
	}, {
		Highlight = if actionsMenu == nil or not var1 then nil else reactModule.createElement(commentRowHighlightModule, {
			commentId = p1.commentId,
			phase = if actionsMenu.isOpen then "Active" elseif p1.isLongPressCharging then "Charging" else "Idle"
		}),
		Content = reactModule.createElement(foundationModule.View, {
			tag = {
				["row gap-medium size-full-0 auto-y padding-x-small padding-top-small"] = true,
				["padding-bottom-small"] = not p1.showReactionControl
			},
			ref = useComposedRef(p1.gestureRef, var3),
			onActivated = if p1.isGestureSurfaceActive then noop else nil,
			stateLayer = if p1.isGestureSurfaceActive then { affordance = stateLayerAffordance.None } else nil,
			selection = { Selectable = false },
			testId = `moments-comment-row-content-{p1.commentId}`
		}, {
			Avatar = reactModule.createElement(foundationModule.View, {
				tag = "size-700-700",
				LayoutOrder = 1,
				testId = if p1.avatarUserId ~= nil then `moments-comment-avatar-fallback-{p1.commentId}` else `moments-comment-avatar-{p1.commentId}`
			}, {
				Image = reactModule.createElement(imageWithSkeletonModule, {
					Image = if p1.avatarUserId ~= nil then nil else getRbxThumb(thumbnailType.AvatarHeadShot, p1.avatarUserId, thumbnailSize.Medium),
					Size = UDim2.fromScale(1, 1),
					radius = radius.Circle,
					backgroundStyle = p1.avatarBackgroundStyle
				})
			}),
			TextColumn = reactModule.createElement(foundationModule.View, {
				tag = "col fill gap-small auto-y",
				LayoutOrder = 2,
				testId = `moments-comment-content-{p1.commentId}`
			}, {
				MainContent = reactModule.createElement(foundationModule.View, {
					tag = "col gap-xsmall size-full-0 auto-y",
					LayoutOrder = 1,
					testId = `moments-comment-main-content-{p1.commentId}`
				}, {
					Header = reactModule.createElement(foundationModule.View, {
						tag = "row align-y-center gap-xsmall size-full-0 auto-y clip",
						LayoutOrder = 1,
						testId = `moments-comment-metadata-{p1.commentId}`
					}, {
						Author = if p1.isAuthorLoading then reactModule.createElement(foundationModule.Skeleton, {
							tag = "size-2000-400",
							LayoutOrder = 1,
							radius = radius.Medium,
							testId = `moments-comment-author-loading-{p1.commentId}`
						}) else reactModule.createElement(foundationModule.Text, {
							tag = "shrink auto-xy text-title-small text-truncate-end content-default",
							LayoutOrder = 1,
							Text = p1.authorLabel,
							testId = `moments-comment-author-{p1.commentId}`
						}),
						Separator = if p1.metadataLabel ~= nil then nil else reactModule.createElement(foundationModule.Text, {
							tag = "auto-xy text-body-small content-muted",
							LayoutOrder = 2,
							Text = "\194\183"
						}),
						Timestamp = reactModule.createElement(foundationModule.Text, {
							tag = "auto-xy text-body-small text-truncate-end content-muted",
							LayoutOrder = 3,
							Text = p1.metadataLabel or "",
							testId = `moments-comment-timestamp-{p1.commentId}`
						}),
						HeaderAction = if p1.headerAction ~= nil then nil else reactModule.createElement(foundationModule.View, { tag = "auto-xy", LayoutOrder = 4 }, { Action = p1.headerAction })
					}),
					Body = reactModule.createElement(foundationModule.Text, {
						tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
						LayoutOrder = 2,
						Text = p1.text,
						testId = `moments-comment-body-{p1.commentId}`
					})
				}),
				Reaction = if p1.showReactionControl then reactModule.createElement(commentReactionButtonModule, {
					LayoutOrder = 2,
					commentId = p1.commentId,
					isReactionSelected = p1.isReactionSelected == true,
					isReactionDisabled = p1.isReactionDisabled == true,
					reactionCountLabel = p1.reactionCountLabel or "0",
					onReactionActivated = p1.onReactionActivated or noop
				}) else nil
			}),
			ActionsMenu = if actionsMenu == nil or var1 then nil else reactModule.createElement(commentActionsMenuModule, {
				LayoutOrder = 3,
				commentId = p1.commentId,
				items = actionsMenu.items,
				isOpen = actionsMenu.isOpen,
				onButtonActivated = actionsMenu.onButtonActivated,
				onClose = actionsMenu.onClose
			})
		}),
		RowActionsMenu = if actionsMenu == nil or not var1 or var2 == nil then nil else reactModule.createElement(commentActionsMenuModule, {
			commentId = p1.commentId,
			items = actionsMenu.items,
			isOpen = actionsMenu.isOpen,
			anchorRef = reactModule.useMemo(function()
				-- upvalues: var2 (ref)
				return { current = var2 }
			end, { var2 }),
			onButtonActivated = actionsMenu.onButtonActivated,
			onClose = actionsMenu.onClose
		}),
		DeleteConfirmation = if deleteConfirmation ~= nil then nil else reactModule.createElement(commentDeleteConfirmationDialogModule, {
			commentId = p1.commentId,
			onConfirm = deleteConfirmation.onConfirm,
			onCancel = deleteConfirmation.onCancel
		})
	})
end