local PeopleReactView = script:FindFirstAncestor("PeopleReactView")
local Parent = PeopleReactView.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local GetScrollingFrameStoreModule = require(PeopleReactView.Stores.GetScrollingFrameStore)

local function _(p1, p2, p3, p4): boolean --[[ Line: 10 | Named "isGuiObjectOutOfScrollingFrameView" ]]
	return p1 + p2 < p3 or p3 + p4 < p1
end

return function(p1, Callback, p2) --[[ Line: 24 | Named "useDismissWhenOutOfView" ]]
	-- upvalues: SignalsReactModule (copy), GetScrollingFrameStoreModule (copy), ReactModule (copy), SignalsModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetScrollingFrameStoreModule)
	ReactModule.useEffect(function() --[[ Line: 27 ]]
		-- upvalues: p1 (copy), p2 (copy), UseSignalStateResult (copy), Callback (copy), SignalsModule (upval)
		if not p1 then return end
		local Flag = false
		
		local function dismissIfOutOfView() --[[ Line: 34 ]]
			-- upvalues: Flag (ref), p2 (upval), UseSignalStateResult (upval), Callback (upval)
			if Flag then return end
			local Current = p2.current
			
			if not Current then return end
			local AbsoluteSizeY: number = UseSignalStateResult.getAbsoluteSizeY(false)
			
			if AbsoluteSizeY <= 0 then return end
			local Y = Current.AbsolutePosition.Y
			local AbsolutePositionY: number = UseSignalStateResult.getAbsolutePositionY(false)
			
			if Y + Current.AbsoluteSize.Y < AbsolutePositionY or Y > AbsolutePositionY + AbsoluteSizeY then
				Flag = true
				Callback()
			end
		end
		
		local Effect = SignalsModule.createEffect(function(p3) --[[ Line: 62 ]]
			-- upvalues: UseSignalStateResult (upval), dismissIfOutOfView (copy)
			local _ = UseSignalStateResult.getCanvasPositionY(p3)
			local _ = UseSignalStateResult.getAbsolutePositionY(p3)
			local _ = UseSignalStateResult.getAbsoluteSizeY(p3)
			dismissIfOutOfView()
		end)
		local Connection = if p2.current then p2.current:GetPropertyChangedSignal("AbsolutePosition"):Connect(dismissIfOutOfView) else nil
		
		return function() --[[ Line: 77 ]]
			-- upvalues: Effect (copy), Connection (ref)
			Effect()
			
			if Connection then
				Connection:Disconnect()
			end
		end
	end, { p1, Callback, UseSignalStateResult })
end