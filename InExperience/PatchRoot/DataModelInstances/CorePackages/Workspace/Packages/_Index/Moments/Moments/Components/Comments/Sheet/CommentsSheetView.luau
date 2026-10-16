local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local DialogSize = FoundationModule.Enums.DialogSize
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local Sheet = FoundationModule.Sheet
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseComposedRefFunction = require(Parent.ReactUtils).useComposedRef
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local CommentsComposerContainerModule = require(Moments.Components.Comments.Composer.CommentsComposerContainer)
local CommentsPanelBodyContainerModule = require(Moments.Components.Comments.Panel.CommentsPanelBody.CommentsPanelBodyContainer)
local SheetShimModule = require(Moments.Components.SheetShim)
local CommentsSheetSnapPointsModule = require(script.Parent.CommentsSheetSnapPoints)
local FFlagMomentsCommentsSheetFocusNavigationModule = require(Moments.Flags.FFlagMomentsCommentsSheetFocusNavigation)

local function sizeContentForList(p1) --[[ Line: 38 ]]
	if p1 ~= nil then
		p1.AutomaticSize = Enum.AutomaticSize.None
	end
end

local function sizeContentToFit(p1) --[[ Line: 44 ]]
	if p1 ~= nil then
		p1.AutomaticSize = Enum.AutomaticSize.Y
	end
end

local function useTopSnapPointReporter(Callback) --[[ Line: 52 ]]
	-- upvalues: ReactModule (copy), CommentsSheetSnapPointsModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	
	return ReactModule.useCallback(function(Object) --[[ Line: 54 ]]
		-- upvalues: UseRefResult (copy), CommentsSheetSnapPointsModule (upval), Callback (copy)
		if UseRefResult.current ~= nil then
			UseRefResult.current:Disconnect()
			UseRefResult.current = nil
		end
		if Object ~= nil then
			UseRefResult.current = Object:GetPropertyChangedSignal("ScrollingEnabled"):Connect(function() --[[ Line: 60 ]]
				-- upvalues: Object (copy), CommentsSheetSnapPointsModule (upval), Callback (upval)
				if Object.ScrollingEnabled then
					local CountCommentsSheetSnapPointsModule = #CommentsSheetSnapPointsModule
					Callback(CommentsSheetSnapPointsModule[CountCommentsSheetSnapPointsModule], CountCommentsSheetSnapPointsModule)
				end
			end)
		end
	end, { Callback })
end

return function(p1) --[[ Line: 70 | Named "CommentsSheetView" ]]
	-- upvalues: useTopSnapPointReporter (copy), UseComposedRefFunction (copy), sizeContentForList (copy), sizeContentToFit (copy), FFlagMomentsCommentsSheetFocusNavigationModule (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), ReactModule (copy), SheetShimModule (copy), DialogSize (copy), CommentsSheetSnapPointsModule (copy), Sheet (copy), Text (copy), View (copy), CommentsPanelBodyContainerModule (copy), CommentsComposerContainerModule (copy)
	return ReactModule.createElement(SheetShimModule.Root, {
		hideBackdrop = true,
		testId = "moments-comments-sheet",
		isOpen = p1.isOpen,
		onClose = p1.onClose,
		onSnapPointChanged = p1.onSnapPointChanged,
		onContentInsetChanged = p1.onContentInsetChanged,
		size = DialogSize.Medium,
		snapPoints = CommentsSheetSnapPointsModule,
		ref = if FFlagMomentsCommentsSheetFocusNavigationModule then UseFocusRootFunction({
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
			isFocusable = p1.isOpen
		}) else nil
	}, {
		Header = ReactModule.createElement(Sheet.Header, { hasCloseAffordance = true }, {
			Title = ReactModule.createElement(Text, {
				tag = "auto-xy text-heading-small content-emphasis",
				Text = p1.title
			})
		}),
		Content = ReactModule.createElement(Sheet.Content, {
			scrollingFrameRef = UseComposedRefFunction(UseComposedRefFunction(p1.scrollingFrameRef, (useTopSnapPointReporter(p1.onSnapPointChanged))), if p1.isListDisplayed then sizeContentForList else sizeContentToFit)
		}, {
			ContentSlot = ReactModule.createElement(View, {
				testId = "moments-comments-content-slot",
				tag = {
					["size-full"] = p1.isListDisplayed,
					["size-full-0 auto-y"] = not p1.isListDisplayed
				}
			}, {
				PanelBody = ReactModule.createElement(CommentsPanelBodyContainerModule, p1.panelBodyProps)
			})
		}),
		Actions = ReactModule.createElement(Sheet.Actions, { ref = p1.actionsRef }, {
			ComposerSlot = ReactModule.createElement(View, {
				tag = "size-full-0 auto-y",
				testId = "moments-comments-composer-slot"
			}, {
				Composer = if p1.composerProps == nil then nil else ReactModule.createElement(CommentsComposerContainerModule, p1.composerProps)
			})
		})
	})
end