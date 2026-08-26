local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local useSignalState = require(parent.SignalsReact).useSignalState
local friendCountLabelModule = require(script.Parent.FriendCountLabel)
local memberEntryModule = require(script.Parent.MemberEntry)
local getSelectedUsersStoreModule = require(appChat.Stores.GetSelectedUsersStore)

return reactModule.memo(function(p1)
	-- upvalues: useStyle (ref), reactModule (ref), getSelectedUsersStoreModule (ref), useSignalState (ref), memberEntryModule (ref), foundationModule (ref), friendCountLabelModule (ref)
	local var1 = useStyle()
	local var2 = reactModule.useRef(nil)
	local var3 = useSignalState(getSelectedUsersStoreModule(false).getMaxSize())
	local var4 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), reactModule (copy), memberEntryModule (copy), var1 (ref)
		local t = {}
		
		for i = 1, var3 do
			t[`user-{i}`] = reactModule.createElement(memberEntryModule, { index = i, style = var1 })
		end
		return t
	end, { var3 })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref)
		if var2.current then
			var2.current.ScrollBarThickness = 0
			var2.current.Selectable = false
		end
	end, { var2 })
	
	return reactModule.createElement(foundationModule.View, {
		tag = "row size-full-0 auto-y flex-y-fill padding-x-small gap-medium",
		LayoutOrder = p1.LayoutOrder
	}, {
		FriendCountContainer = reactModule.createElement(foundationModule.View, { tag = "auto-xy padding-y-small", LayoutOrder = 1 }, {
			FriendCount = reactModule.createElement(friendCountLabelModule)
		}),
		UserScrollBar = reactModule.createElement(foundationModule.ScrollView, {
			tag = "fill auto-y",
			LayoutOrder = 2,
			scroll = {
				scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility.None,
				ScrollingDirection = Enum.ScrollingDirection.X,
				AutomaticCanvasSize = Enum.AutomaticSize.XY
			},
			scrollingFrameRef = var2
		}, reactModule.createElement(foundationModule.View, {
			tag = "row size-full padding-x-xsmall gap-medium align-y-center"
		}, var4))
	})
end)