local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local useSignalState = require(parent.SignalsReact).useSignalState
local friendCountLabelModule = require(script.Parent.FriendCountLabel)
local memberEntryModule = require(script.Parent.MemberEntry)
local getSelectedUsersStoreModule = require(appChat.Stores.GetSelectedUsersStore)

return reactModule.memo(function(p0)
	-- upvalues: useStyle (ref), reactModule (ref), getSelectedUsersStoreModule (ref), useSignalState (ref), memberEntryModule (ref), foundationModule (ref), friendCountLabelModule (ref)
	local var6 = useStyle()
	local var7 = reactModule.useRef(nil)
	local var8 = useSignalState(getSelectedUsersStoreModule(false).getMaxSize())
	local var9 = reactModule.useMemo(function()
		-- upvalues: var8 (ref), reactModule (copy), memberEntryModule (copy), var6 (ref)
		local t = {}
		
		for i = 1, var8 do
			t[`user-{i}`] = reactModule.createElement(memberEntryModule, { index = i, style = var6 })
		end
		return t
	end, { var8 })
	reactModule.useEffect(function()
		-- upvalues: var7 (ref)
		if var7.current then
			var7.current.ScrollBarThickness = 0
			var7.current.Selectable = false
		end
	end, { var7 })
	
	return reactModule.createElement(foundationModule.View, {
		tag = "row size-full-0 auto-y flex-y-fill padding-x-small gap-medium",
		LayoutOrder = p0.LayoutOrder
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
			scrollingFrameRef = var7
		}, reactModule.createElement(foundationModule.View, {
			tag = "row size-full padding-x-xsmall gap-medium align-y-center"
		}, var9))
	})
end)