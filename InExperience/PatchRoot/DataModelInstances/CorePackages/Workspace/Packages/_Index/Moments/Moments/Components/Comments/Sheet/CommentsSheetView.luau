local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactUtilsModule = require(parent.ReactUtils)
local dialogSize = foundationModule.Enums.DialogSize
local sheet = foundationModule.Sheet
local text = foundationModule.Text
local view = foundationModule.View
local useComposedRef = reactUtilsModule.useComposedRef
local commentsComposerContainerModule = require(moments.Components.Comments.Composer.CommentsComposerContainer)
local commentsPanelBodyContainerModule = require(moments.Components.Comments.Panel.CommentsPanelBody.CommentsPanelBodyContainer)
local sheetShimModule = require(moments.Components.SheetShim)
local commentsSheetSnapPointsModule = require(script.Parent.CommentsSheetSnapPoints)

local function sizeContentForList(p1)
	if p1 ~= nil then
		p1.AutomaticSize = Enum.AutomaticSize.None
	end
end

local function sizeContentToFit(p1)
	if p1 ~= nil then
		p1.AutomaticSize = Enum.AutomaticSize.Y
	end
end

local function useTopSnapPointReporter(value)
	-- upvalues: reactModule (ref), commentsSheetSnapPointsModule (ref)
	local var1 = reactModule.useRef(nil)
	
	return reactModule.useCallback(function(p1)
		-- upvalues: var1 (ref), commentsSheetSnapPointsModule (copy), value (ref)
		if var1.current ~= nil then
			var1.current:Disconnect()
			var1.current = nil
		end
		if p1 ~= nil then
			var1.current = p1:GetPropertyChangedSignal("ScrollingEnabled"):Connect(function()
				-- upvalues: p1 (ref), commentsSheetSnapPointsModule (copy), value (copy)
				if p1.ScrollingEnabled then
					local commentsSheetSnapPointsModuleCount = #commentsSheetSnapPointsModule
					value(commentsSheetSnapPointsModule[commentsSheetSnapPointsModuleCount], commentsSheetSnapPointsModuleCount)
				end
			end)
		end
	end, { value })
end

return function(p1)
	-- upvalues: useTopSnapPointReporter (ref), useComposedRef (ref), sizeContentForList (ref), sizeContentToFit (ref), reactModule (ref), sheetShimModule (ref), dialogSize (ref), commentsSheetSnapPointsModule (ref), sheet (ref), text (ref), view (ref), commentsPanelBodyContainerModule (ref), commentsComposerContainerModule (ref)
	return reactModule.createElement(sheetShimModule.Root, {
		hideBackdrop = true,
		testId = "moments-comments-sheet",
		isOpen = p1.isOpen,
		onClose = p1.onClose,
		onSnapPointChanged = p1.onSnapPointChanged,
		onContentInsetChanged = p1.onContentInsetChanged,
		size = dialogSize.Medium,
		snapPoints = commentsSheetSnapPointsModule
	}, {
		Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = true }, {
			Title = reactModule.createElement(text, {
				tag = "auto-xy text-heading-small content-emphasis",
				Text = p1.title
			})
		}),
		Content = reactModule.createElement(sheet.Content, {
			scrollingFrameRef = useComposedRef(useComposedRef(p1.scrollingFrameRef, useTopSnapPointReporter(p1.onSnapPointChanged)), if p1.isListDisplayed then sizeContentForList else sizeContentToFit)
		}, {
			ContentSlot = reactModule.createElement(view, {
				testId = "moments-comments-content-slot",
				tag = {
					["size-full"] = p1.isListDisplayed,
					["size-full-0 auto-y"] = not p1.isListDisplayed
				}
			}, {
				PanelBody = reactModule.createElement(commentsPanelBodyContainerModule, p1.panelBodyProps)
			})
		}),
		Actions = reactModule.createElement(sheet.Actions, { ref = p1.actionsRef }, {
			ComposerSlot = reactModule.createElement(view, {
				tag = "size-full-0 auto-y",
				testId = "moments-comments-composer-slot"
			}, {
				Composer = if p1.composerProps ~= nil then nil else reactModule.createElement(commentsComposerContainerModule, p1.composerProps)
			})
		})
	})
end