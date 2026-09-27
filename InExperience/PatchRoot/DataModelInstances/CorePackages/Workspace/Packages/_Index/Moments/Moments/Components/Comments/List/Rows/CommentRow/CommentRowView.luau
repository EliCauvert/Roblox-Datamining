local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local imageWithSkeletonModule = require(moments.Components.ImageWithSkeleton)
local _ = require(script.Parent.Parent.CommentRowTypes)
local commentActionsMenuModule = require(script.Parent.CommentActionsMenu)
local commentDeleteConfirmationDialogModule = require(script.Parent.CommentDeleteConfirmationDialog)
local commentReactionColumnModule = require(script.Parent.CommentReactionColumn)
local commentReactionSummaryModule = require(script.Parent.CommentReactionSummary)
local radius = foundationModule.Enums.Radius
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local thumbnailSize = foundationModule.Enums.ThumbnailSize
local thumbnailType = foundationModule.Enums.ThumbnailType
local getRbxThumb = foundationModule.Utility.getRbxThumb

local function _(p1)
	return {
		Font = p1.font,
		FontSize = p1.fontSize,
		LineHeight = p1.lineHeight
	}
end

local function noop() end

return function(p1)
	-- upvalues: getRbxThumb (ref), thumbnailType (ref), thumbnailSize (ref), reactModule (ref), foundationModule (ref), noop (ref), stateLayerAffordance (ref), imageWithSkeletonModule (ref), radius (ref), commentActionsMenuModule (ref), commentReactionColumnModule (ref), commentReactionSummaryModule (ref), commentDeleteConfirmationDialogModule (ref)
	local createElement_5
	local rowLayout = p1.rowLayout
	local ceiled = math.ceil(rowLayout.authorTypography.fontSize * rowLayout.authorTypography.lineHeight)
	local ceiled_1 = math.ceil(rowLayout.metadataTypography.fontSize * rowLayout.metadataTypography.lineHeight)
	local var1 = p1.showReactionControl == true
	local actionsMenu = p1.actionsMenu
	local deleteConfirmation = p1.deleteConfirmation
	local reactionSummary = p1.reactionSummary
	local var2 = var1 or actionsMenu ~= nil
	local var3 = if var1 then rowLayout.reactionColumnGap + rowLayout.reactionColumnWidth else 0
	local var4 = if p1.avatarUserId ~= nil then nil else getRbxThumb(thumbnailType.AvatarHeadShot, p1.avatarUserId, thumbnailSize.Medium)
	local createElement = reactModule.createElement
	local view = foundationModule.View
	local t = {
		LayoutOrder = p1.LayoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		GroupTransparency = p1.GroupTransparency,
		ref = p1.rowRef,
		onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
		testId = `moments-comment-row-{p1.commentId}`
	}
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local view_1 = foundationModule.View
	local t_2 = {
		Size = UDim2.new(1, 0, 0, 2 * rowLayout.verticalPadding + rowLayout.avatarSize),
		AutomaticSize = Enum.AutomaticSize.Y,
		padding = {
			top = UDim.new(0, rowLayout.verticalPadding),
			bottom = UDim.new(0, rowLayout.verticalPadding)
		},
		ref = p1.contentRef,
		onActivated = if p1.isGestureSurfaceActive then noop else nil,
		stateLayer = if p1.isGestureSurfaceActive then { affordance = stateLayerAffordance.None } else nil,
		selection = { Selectable = false },
		testId = `moments-comment-main-content-{p1.commentId}`
	}
	local t_3 = {}
	local createElement_2 = reactModule.createElement
	local view_2 = foundationModule.View
	local t_4 = {
		tag = "col",
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		testId = `moments-comment-content-{p1.commentId}`
	}
	local t_5 = {}
	local createElement_3 = reactModule.createElement
	local view_3 = foundationModule.View
	local t_6 = {
		LayoutOrder = 1,
		ClipsDescendants = true,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		testId = `moments-comment-metadata-{p1.commentId}`
	}
	local t_7 = {}
	local createElement_4 = reactModule.createElement
	local view_4 = foundationModule.View
	local t_8 = {
		LayoutOrder = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		flexItem = { FlexMode = Enum.UIFlexMode.Shrink },
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, rowLayout.avatarContentGap),
			SortOrder = Enum.SortOrder.LayoutOrder
		}
	}
	local t_9 = {
		Avatar = reactModule.createElement(foundationModule.View, {
			LayoutOrder = 1,
			Size = UDim2.fromOffset(rowLayout.avatarSize, rowLayout.avatarSize),
			testId = if p1.avatarUserId ~= nil then `moments-comment-avatar-fallback-{p1.commentId}` else `moments-comment-avatar-{p1.commentId}`
		}, {
			Image = reactModule.createElement(imageWithSkeletonModule, {
				Image = var4,
				Size = UDim2.fromScale(1, 1),
				radius = radius.Circle,
				backgroundStyle = p1.avatarBackgroundStyle
			})
		})
	}
	
	if p1.isAuthorLoading then
		createElement_5 = reactModule.createElement(foundationModule.Skeleton, {
			LayoutOrder = 2,
			Size = UDim2.fromOffset(ceiled * 4, ceiled),
			radius = radius.Medium,
			testId = `moments-comment-author-loading-{p1.commentId}`
		})
	else
		createElement_5 = reactModule.createElement
		local text = foundationModule.Text
		local t_10 = {
			LayoutOrder = 2,
			tag = "shrink auto-x content-emphasis",
			Size = UDim2.fromOffset(0, ceiled),
			Text = p1.authorLabel,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left
		}
		local authorTypography = rowLayout.authorTypography
		t_10.fontStyle = {
			Font = authorTypography.font,
			FontSize = authorTypography.fontSize,
			LineHeight = authorTypography.lineHeight
		}
		t_10.testId = `moments-comment-author-{p1.commentId}`
		createElement_5 = createElement_5(text, t_10)
	end
	t_9.Author = createElement_5
	t_7.Leading = createElement_4(view_4, t_8, t_9)
	local createElement_6 = reactModule.createElement
	local view_5 = foundationModule.View
	local t_10 = {
		LayoutOrder = 2,
		AutomaticSize = Enum.AutomaticSize.XY,
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, rowLayout.reactionColumnGap),
			SortOrder = Enum.SortOrder.LayoutOrder
		}
	}
	local t_11 = {}
	local createElement_7 = reactModule.createElement
	local text = foundationModule.Text
	local t_12 = {
		LayoutOrder = 1,
		tag = "auto-x content-muted",
		Size = UDim2.fromOffset(0, ceiled_1),
		Text = p1.metadataLabel or "",
		TextTruncate = Enum.TextTruncate.AtEnd,
		TextXAlignment = Enum.TextXAlignment.Right
	}
	local metadataTypography = rowLayout.metadataTypography
	t_12.fontStyle = {
		Font = metadataTypography.font,
		FontSize = metadataTypography.fontSize,
		LineHeight = metadataTypography.lineHeight
	}
	t_12.testId = `moments-comment-timestamp-{p1.commentId}`
	t_11.Timestamp = createElement_7(text, t_12)
	t_11.HeaderAction = if p1.headerAction ~= nil then nil else reactModule.createElement(foundationModule.View, { LayoutOrder = 2, tag = "auto-xy" }, { Action = p1.headerAction })
	t_11.ActionsColumn = if var2 then reactModule.createElement(foundationModule.View, {
		LayoutOrder = 3,
		tag = "col align-x-center",
		Size = UDim2.fromOffset(rowLayout.reactionColumnWidth, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		ActionsMenu = if actionsMenu ~= nil then nil else reactModule.createElement(commentActionsMenuModule, {
			commentId = p1.commentId,
			items = actionsMenu.items,
			isOpen = actionsMenu.isOpen,
			anchorRef = actionsMenu.anchorRef,
			onButtonActivated = actionsMenu.onButtonActivated,
			onClose = actionsMenu.onClose
		})
	}) else nil
	t_7.Trailing = createElement_6(view_5, t_10, t_11)
	t_5.Header = createElement_3(view_3, t_6, t_7)
	t_5.HeaderBodyGap = reactModule.createElement(foundationModule.View, {
		LayoutOrder = 2,
		Size = UDim2.new(1, 0, 0, rowLayout.authorBodyGap)
	})
	local createElement_8 = reactModule.createElement
	local view_6 = foundationModule.View
	local t_13 = {
		LayoutOrder = 3,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Bottom,
			Padding = UDim.new(0, if var1 then rowLayout.reactionColumnGap else 0),
			SortOrder = Enum.SortOrder.LayoutOrder
		}
	}
	local t_14 = {}
	local createElement_9 = reactModule.createElement
	local text_1 = foundationModule.Text
	local t_15 = {
		LayoutOrder = 1,
		TextWrapped = true,
		tag = "text-wrap content-emphasis",
		Size = UDim2.new(1, -var3, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Text = p1.text,
		TextTruncate = Enum.TextTruncate.None,
		TextXAlignment = Enum.TextXAlignment.Left
	}
	local bodyTypography = rowLayout.bodyTypography
	t_15.fontStyle = {
		Font = bodyTypography.font,
		FontSize = bodyTypography.fontSize,
		LineHeight = bodyTypography.lineHeight
	}
	t_15.testId = `moments-comment-body-{p1.commentId}`
	t_14.Body = createElement_9(text_1, t_15)
	t_14.ReactionColumn = if var1 then reactModule.createElement(commentReactionColumnModule, {
		LayoutOrder = 2,
		commentId = p1.commentId,
		rowLayout = rowLayout,
		isReactionSelected = p1.isReactionSelected == true,
		isReactionDisabled = p1.isReactionDisabled == true,
		onReactionActivated = p1.onReactionActivated or noop
	}) else nil
	t_5.BodyRow = createElement_8(view_6, t_13, t_14)
	t_5.ReactionSummaryGap = if reactionSummary ~= nil then nil else reactModule.createElement(foundationModule.View, {
		LayoutOrder = 4,
		Size = UDim2.new(1, 0, 0, rowLayout.reactionSummaryGap)
	})
	t_5.ReactionSummary = if reactionSummary ~= nil then nil else reactModule.createElement(commentReactionSummaryModule, {
		LayoutOrder = 5,
		commentId = p1.commentId,
		rowLayout = rowLayout,
		reactionTypes = reactionSummary.reactionTypes,
		label = reactionSummary.label
	})
	t_3.TextContent = createElement_2(view_2, t_4, t_5)
	t_1.MainContent = createElement_1(view_1, t_2, t_3)
	t_1.DeleteConfirmation = if deleteConfirmation ~= nil then nil else reactModule.createElement(commentDeleteConfirmationDialogModule, {
		commentId = p1.commentId,
		onConfirm = deleteConfirmation.onConfirm,
		onCancel = deleteConfirmation.onCancel
	})
	
	return createElement(view, t, t_1)
end