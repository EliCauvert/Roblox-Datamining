local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local FriendCountLabelModule = require(script.Parent.FriendCountLabel)
local MemberEntryModule = require(script.Parent.MemberEntry)
local GetSelectedUsersStoreModule = require(AppChat.Stores.GetSelectedUsersStore)

return ReactModule.memo(function(Frame) --[[ Line: 20 | Named "SelectedMembersBar" ]]
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), GetSelectedUsersStoreModule (copy), UseSignalStateFunction (copy), MemberEntryModule (copy), FoundationModule (copy), FriendCountLabelModule (copy)
	local UseStyleResult = UseStyleFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseSignalStateResult = UseSignalStateFunction(GetSelectedUsersStoreModule(false).getMaxSize())
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 27 ]]
		-- upvalues: UseSignalStateResult (copy), ReactModule (upval), MemberEntryModule (upval), UseStyleResult (copy)
		local Elements = {}
		
		for i = 1, UseSignalStateResult do
			Elements[`user-{i}`] = ReactModule.createElement(MemberEntryModule, { index = i, style = UseStyleResult })
		end
		return Elements
	end, { UseSignalStateResult })
	ReactModule.useEffect(function() --[[ Line: 39 ]]
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current then
			UseRefResult.current.ScrollBarThickness = 0
			UseRefResult.current.Selectable = false
		end
	end, { UseRefResult })
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "row size-full-0 auto-y flex-y-fill padding-x-small gap-medium",
		LayoutOrder = Frame.LayoutOrder
	}, {
		FriendCountContainer = ReactModule.createElement(FoundationModule.View, { tag = "auto-xy padding-y-small", LayoutOrder = 1 }, {
			FriendCount = ReactModule.createElement(FriendCountLabelModule)
		}),
		UserScrollBar = ReactModule.createElement(FoundationModule.ScrollView, {
			tag = "fill auto-y",
			LayoutOrder = 2,
			scroll = {
				scrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility.None,
				ScrollingDirection = Enum.ScrollingDirection.X,
				AutomaticCanvasSize = Enum.AutomaticSize.XY
			},
			scrollingFrameRef = UseRefResult
		}, ReactModule.createElement(FoundationModule.View, {
			tag = "row size-full padding-x-xsmall gap-medium align-y-center"
		}, UseMemoResult))
	})
end)