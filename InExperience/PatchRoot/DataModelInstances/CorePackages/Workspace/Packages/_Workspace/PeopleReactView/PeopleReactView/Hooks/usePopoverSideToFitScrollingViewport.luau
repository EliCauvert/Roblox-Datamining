local PeopleReactView = script:FindFirstAncestor("PeopleReactView")
local Parent = PeopleReactView.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local GetScrollingFrameStoreModule = require(PeopleReactView.Stores.GetScrollingFrameStore)
local PopoverSide = require(Parent.Foundation).Enums.PopoverSide

local function choosePopoverSideForViewport(p1, p2, Y, NewY, AbsolutePositionY, p3, p4: number, p5: number)
	-- upvalues: PopoverSide (copy)
	if p4 <= 0 then
		return p1
	end
	local v1 = p4 + p5
	local YDelta = Y - AbsolutePositionY
	local v2 = p3 - NewY
	
	local function _(Top)
		-- upvalues: PopoverSide (upval), YDelta (copy), v2 (copy)
		return if Top == PopoverSide.Top then YDelta else v2
	end
	
	local _ = function(Top): boolean
		-- upvalues: PopoverSide (upval), YDelta (copy), v2 (copy), v1 (copy)
		return v1 <= (if Top == PopoverSide.Top then YDelta else v2)
	end
	
	local Top = if p2 == nil then p1 else p2
	
	if v1 <= (if Top == PopoverSide.Top then YDelta else v2) then
		return Top
	else
		local Bottom = if Top == PopoverSide.Top then PopoverSide.Bottom else PopoverSide.Top
		
		return if v1 <= (if Bottom == PopoverSide.Top then YDelta else v2) then Bottom elseif YDelta < v2 then PopoverSide.Bottom else PopoverSide.Top
	end
end

return function(p1, p2, p3, p4, p5)
	-- upvalues: SignalsReactModule (copy), GetScrollingFrameStoreModule (copy), ReactModule (copy), choosePopoverSideForViewport (copy), SignalsModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetScrollingFrameStoreModule)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResult2 (copy), p3 (copy), UseSignalStateResult (copy), choosePopoverSideForViewport (upval), p2 (copy), p4 (copy), p5 (copy), SignalsModule (upval)
		if not p1 then
			UseStateResult2(nil)
			
			return
		end
		local function updateSide()
			-- upvalues: p3 (upval), UseSignalStateResult (upval), UseStateResult2 (upval), choosePopoverSideForViewport (upval), p2 (upval), p4 (upval), p5 (upval)
			local Current = p3.current
			
			if not Current then return end
			local AbsolutePositionY: number = UseSignalStateResult.getAbsolutePositionY(false)
			local AbsoluteSizeY: number = UseSignalStateResult.getAbsoluteSizeY(false)
			
			if AbsoluteSizeY > 0 then
				local Y = Current.AbsolutePosition.Y
				local NewY = Y + Current.AbsoluteSize.Y
				local NewAbsolutePositionY = AbsolutePositionY + AbsoluteSizeY
				UseStateResult2(function(p6)
					-- upvalues: choosePopoverSideForViewport (upval), p2 (upval), Y (copy), NewY (copy), AbsolutePositionY (copy), NewAbsolutePositionY (copy), p4 (upval), p5 (upval)
					return (choosePopoverSideForViewport(p2, p6, Y, NewY, AbsolutePositionY, NewAbsolutePositionY, p4, p5))
				end)
				
				return
			end
		end
		
		local Effect = SignalsModule.createEffect(function(p6)
			-- upvalues: UseSignalStateResult (upval), updateSide (copy)
			local _ = UseSignalStateResult.getCanvasPositionY(p6)
			local _ = UseSignalStateResult.getAbsolutePositionY(p6)
			local _ = UseSignalStateResult.getAbsoluteSizeY(p6)
			updateSide()
		end)
		local List = {}
		
		if p3.current then
			table.insert(List, p3.current:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateSide))
			table.insert(List, p3.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateSide))
		end
		return function()
			-- upvalues: Effect (copy), List (copy)
			Effect()
			
			for _, Connection in List do
				Connection:Disconnect()
			end
		end
	end, {
		p1,
		p2,
		p4,
		p5,
		UseSignalStateResult
	})
	
	return p1 and UseStateResult or p2
end