local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local FFlagMomentsCommentRowRedesignModule = require(Moments.Flags.FFlagMomentsCommentRowRedesign)
local ImageWithSkeletonModule = require(Moments.Components.ImageWithSkeleton)
local CommentActionsMenuModule = require(script.Parent.CommentActionsMenu)
local CommentDeleteConfirmationDialogModule = require(script.Parent.CommentDeleteConfirmationDialog)
local CommentReactionButtonModule = require(script.Parent.CommentReactionButton)
local CommentRowHighlightModule = require(script.Parent.CommentRowHighlight)
local Radius = FoundationModule.Enums.Radius
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local ThumbnailSize = FoundationModule.Enums.ThumbnailSize
local ThumbnailType = FoundationModule.Enums.ThumbnailType
local GetRbxThumbFunction = FoundationModule.Utility.getRbxThumb
local UseComposedRefFunction = require(Parent.ReactUtils).useComposedRef
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function noop() --[[ Line: 65 ]] end

return function(Frame) --[[ Line: 67 | Named "CommentRowView" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), UseComposedRefFunction (copy), GetRbxThumbFunction (copy), ThumbnailType (copy), ThumbnailSize (copy), FoundationModule (copy), CommentRowHighlightModule (copy), FFlagMomentsCommentRowRedesignModule (copy), noop (copy), StateLayerAffordance (copy), ImageWithSkeletonModule (copy), Radius (copy), CommentReactionButtonModule (copy), CommentActionsMenuModule (copy), CommentDeleteConfirmationDialogModule (copy)
	local UseTokensResult = UseTokensFunction()
	local ActionsMenu = Frame.actionsMenu
	local DeleteConfirmation = Frame.deleteConfirmation
	local HasAnchorRef: boolean = ActionsMenu ~= nil and ActionsMenu.anchorRef ~= nil
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 75 ]]
		-- upvalues: UseStateResult (copy)
		return { current = UseStateResult }
	end, { UseStateResult })
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder,
		GroupTransparency = Frame.GroupTransparency,
		testId = `moments-comment-row-{Frame.commentId}`
	}, {
		Highlight = if ActionsMenu == nil or not HasAnchorRef then nil else ReactModule.createElement(CommentRowHighlightModule, {
			commentId = Frame.commentId,
			phase = if ActionsMenu.isOpen then "Active" elseif Frame.isLongPressCharging then "Charging" else "Idle"
		}),
		Content = ReactModule.createElement(FoundationModule.View, {
			tag = {
				["row gap-medium size-full-0 auto-y padding-x-small padding-top-small"] = true,
				["padding-bottom-small"] = FFlagMomentsCommentRowRedesignModule or not Frame.showReactionControl
			},
			ref = UseComposedRefFunction(Frame.gestureRef, UseStateResult2),
			onActivated = if Frame.isGestureSurfaceActive then noop else nil,
			onStateChanged = if Frame.isGestureSurfaceActive then Frame.onContentStateChanged else nil,
			stateLayer = if Frame.isGestureSurfaceActive then { affordance = StateLayerAffordance.None } else nil,
			selection = { Selectable = false },
			testId = `moments-comment-row-content-{Frame.commentId}`
		}, {
			Avatar = ReactModule.createElement(FoundationModule.View, {
				LayoutOrder = 1,
				tag = {
					["size-800-800"] = FFlagMomentsCommentRowRedesignModule,
					["size-700-700"] = not FFlagMomentsCommentRowRedesignModule
				},
				testId = if Frame.avatarUserId == nil then `moments-comment-avatar-fallback-{Frame.commentId}` else `moments-comment-avatar-{Frame.commentId}`
			}, {
				Image = ReactModule.createElement(ImageWithSkeletonModule, {
					Image = if Frame.avatarUserId == nil then nil else GetRbxThumbFunction(ThumbnailType.AvatarHeadShot, Frame.avatarUserId, ThumbnailSize.Medium),
					Size = UDim2.fromScale(1, 1),
					radius = Radius.Circle,
					backgroundStyle = Frame.avatarBackgroundStyle
				})
			}),
			TextColumn = ReactModule.createElement(FoundationModule.View, {
				LayoutOrder = 2,
				tag = {
					["col fill auto-y"] = true,
					["gap-xsmall"] = FFlagMomentsCommentRowRedesignModule,
					["gap-small"] = not FFlagMomentsCommentRowRedesignModule
				},
				testId = `moments-comment-content-{Frame.commentId}`
			}, {
				MainContent = ReactModule.createElement(FoundationModule.View, {
					LayoutOrder = 1,
					tag = {
						["col size-full-0 auto-y"] = true,
						["gap-xxsmall"] = FFlagMomentsCommentRowRedesignModule,
						["gap-xsmall"] = not FFlagMomentsCommentRowRedesignModule
					},
					testId = `moments-comment-main-content-{Frame.commentId}`
				}, {
					Header = ReactModule.createElement(FoundationModule.View, {
						tag = "row align-y-center gap-xsmall size-full-0 auto-y clip",
						LayoutOrder = 1,
						testId = `moments-comment-metadata-{Frame.commentId}`
					}, {
						Author = if Frame.isAuthorLoading then ReactModule.createElement(FoundationModule.Skeleton, {
							tag = "size-2000-400",
							LayoutOrder = 1,
							radius = Radius.Medium,
							testId = `moments-comment-author-loading-{Frame.commentId}`
						}) else ReactModule.createElement(FoundationModule.Text, {
							LayoutOrder = 1,
							tag = {
								["shrink auto-xy text-truncate-end"] = true,
								["text-title-medium content-emphasis"] = FFlagMomentsCommentRowRedesignModule,
								["text-title-small content-default"] = not FFlagMomentsCommentRowRedesignModule
							},
							Text = Frame.authorLabel,
							testId = `moments-comment-author-{Frame.commentId}`
						}),
						Separator = if FFlagMomentsCommentRowRedesignModule or Frame.metadataLabel == nil then nil else ReactModule.createElement(FoundationModule.Text, {
							tag = "auto-xy text-body-small content-muted",
							LayoutOrder = 2,
							Text = "·"
						}),
						Timestamp = if FFlagMomentsCommentRowRedesignModule then nil else ReactModule.createElement(FoundationModule.Text, {
							tag = "auto-xy text-body-small text-truncate-end content-muted",
							LayoutOrder = 3,
							Text = Frame.metadataLabel or "",
							testId = `moments-comment-timestamp-{Frame.commentId}`
						}),
						HeaderAction = if FFlagMomentsCommentRowRedesignModule or Frame.headerAction == nil then nil else ReactModule.createElement(FoundationModule.View, { tag = "auto-xy", LayoutOrder = 4 }, { Action = Frame.headerAction })
					}),
					Body = ReactModule.createElement(FoundationModule.Text, {
						tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left",
						LayoutOrder = 2,
						Text = Frame.bodyText or Frame.text,
						RichText = Frame.bodyText ~= nil,
						textStyle = Frame.bodyTextStyle or (if FFlagMomentsCommentRowRedesignModule then UseTokensResult.Color.Content.Default else UseTokensResult.Color.Content.Emphasis),
						ref = Frame.bodyRef,
						onAbsoluteSizeChanged = Frame.onBodyAbsoluteSizeChanged,
						testId = `moments-comment-body-{Frame.commentId}`
					}),
					BodyMeasure = if Frame.bodyMeasureRef == nil then nil else ReactModule.createElement(FoundationModule.Text, {
						tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left",
						LayoutOrder = 3,
						RichText = true,
						Visible = false,
						ref = Frame.bodyMeasureRef,
						testId = `moments-comment-body-measure-{Frame.commentId}`
					})
				}),
				Reaction = if FFlagMomentsCommentRowRedesignModule or not Frame.showReactionControl then nil else ReactModule.createElement(CommentReactionButtonModule, {
					LayoutOrder = 2,
					commentId = Frame.commentId,
					isReactionSelected = Frame.isReactionSelected == true,
					isReactionDisabled = Frame.isReactionDisabled == true,
					reactionCountLabel = Frame.reactionCountLabel or "0",
					isReactionCountHidden = Frame.isReactionCountHidden,
					onReactionActivated = Frame.onReactionActivated or noop
				}),
				Footer = if FFlagMomentsCommentRowRedesignModule and (Frame.metadataLabel ~= nil or (Frame.headerAction ~= nil or Frame.showReactionControl)) then ReactModule.createElement(FoundationModule.View, {
					tag = "row align-y-center gap-small size-full-0 auto-y",
					LayoutOrder = 2,
					testId = `moments-comment-footer-{Frame.commentId}`
				}, {
					Metadata = ReactModule.createElement(FoundationModule.View, {
						tag = "row align-y-center fill gap-small auto-y clip",
						LayoutOrder = 1,
						testId = `moments-comment-footer-metadata-{Frame.commentId}`
					}, {
						Timestamp = if Frame.metadataLabel == nil then nil else ReactModule.createElement(FoundationModule.Text, {
							tag = "auto-xy text-body-small text-truncate-end content-muted",
							LayoutOrder = 1,
							Text = Frame.metadataLabel,
							testId = `moments-comment-timestamp-{Frame.commentId}`
						}),
						HeaderAction = if Frame.headerAction == nil then nil else ReactModule.createElement(FoundationModule.View, { tag = "auto-xy", LayoutOrder = 2 }, { Action = Frame.headerAction })
					}),
					Reaction = if Frame.showReactionControl then ReactModule.createElement(CommentReactionButtonModule, {
						LayoutOrder = 2,
						commentId = Frame.commentId,
						isReactionSelected = Frame.isReactionSelected == true,
						isReactionDisabled = Frame.isReactionDisabled == true,
						reactionCountLabel = Frame.reactionCountLabel or "0",
						isReactionCountHidden = Frame.isReactionCountHidden,
						onReactionActivated = Frame.onReactionActivated or noop
					}) else nil
				}) else nil
			}),
			ActionsMenu = if ActionsMenu == nil or HasAnchorRef then nil else ReactModule.createElement(CommentActionsMenuModule, {
				LayoutOrder = 3,
				commentId = Frame.commentId,
				items = ActionsMenu.items,
				isOpen = ActionsMenu.isOpen,
				onButtonActivated = ActionsMenu.onButtonActivated,
				onClose = ActionsMenu.onClose
			})
		}),
		RowActionsMenu = if ActionsMenu == nil or (not HasAnchorRef or UseStateResult == nil) then nil else ReactModule.createElement(CommentActionsMenuModule, {
			commentId = Frame.commentId,
			items = ActionsMenu.items,
			isOpen = ActionsMenu.isOpen,
			anchorRef = UseMemoResult,
			onButtonActivated = ActionsMenu.onButtonActivated,
			onClose = ActionsMenu.onClose
		}),
		DeleteConfirmation = if DeleteConfirmation == nil then nil else ReactModule.createElement(CommentDeleteConfirmationDialogModule, {
			commentId = Frame.commentId,
			onConfirm = DeleteConfirmation.onConfirm,
			onCancel = DeleteConfirmation.onCancel
		})
	})
end