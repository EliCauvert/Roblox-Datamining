local ViewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local _ = require(ViewRecyclerRoblox.Parent.ViewRecycler)
local SlotGeometryModule = require(ViewRecyclerRoblox.RobloxAdapter.SlotGeometry)

local function _(State) --[[ Line: 39 | Named "resetAppliedState" ]]
	State.anchorPointInitialized = false
	State.position = nil
	State.size = nil
	State.automaticSize = nil
	State.visible = nil
	State.zIndex = nil
end

local CanvasItemPlacerModule = {
	createState = function() --[[ Line: 26 ]]
		return {
			unpinnedZIndex = nil,
			parent = nil,
			anchorPointInitialized = false,
			position = nil,
			size = nil,
			automaticSize = nil,
			visible = nil,
			zIndex = nil
		}
	end,
	getGeometry = function(p1, p2, p3, p4, p5: number, p6) --[[ Line: 48 ]]
		-- upvalues: SlotGeometryModule (copy)
		if p2.mainAxisOffset ~= nil then
			p1 = {
				startOffset = p2.mainAxisOffset,
				length = p2.mainAxisLength or p1.length
			}
			p5 = 0
		end
		local GetResult, GetResult2 = SlotGeometryModule.get(p1, p3, p4, p5)
		local P6 = p6 or {}
		P6.position = GetResult
		P6.size = GetResult2
		P6.automaticSize = SlotGeometryModule.getAutomaticSize(p3, p4)
		P6.zIndexOffset = p2.zIndex
		
		return P6
	end,
	place = function(p1, Parent, State, State1, Visible): number --[[ Line: 72 ]]
		local Count = 0
		
		if p1.Parent ~= Parent or State1.parent ~= Parent then
			if p1.Parent ~= Parent then
				p1.Parent = Parent
				Count += 1
			end
			State1.parent = Parent
			State1.anchorPointInitialized = false
			State1.position = nil
			State1.size = nil
			State1.automaticSize = nil
			State1.visible = nil
			State1.zIndex = nil
		end
		if not State1.anchorPointInitialized then
			p1.AnchorPoint = Vector2.zero
			State1.anchorPointInitialized = true
			Count += 1
		end
		if State1.position ~= State.position then
			p1.Position = State.position
			State1.position = State.position
			Count += 1
		end
		if State1.size ~= State.size then
			p1.Size = State.size
			State1.size = State.size
			Count += 1
		end
		if State1.automaticSize ~= State.automaticSize then
			p1.AutomaticSize = State.automaticSize
			State1.automaticSize = State.automaticSize
			Count += 1
		end
		if State1.visible ~= Visible then
			p1.Visible = Visible
			State1.visible = Visible
			Count += 1
		end
		local ZIndex = nil
		local ZIndexOffset = State.zIndexOffset
		
		if ZIndexOffset == nil then
			if State1.unpinnedZIndex ~= nil then
				ZIndex = State1.unpinnedZIndex
				State1.unpinnedZIndex = nil
			end
		else
			if State1.unpinnedZIndex == nil then
				State1.unpinnedZIndex = p1.ZIndex
			end
			ZIndex = State1.unpinnedZIndex + ZIndexOffset
		end
		if ZIndex == nil or State1.zIndex == ZIndex then
			if ZIndex == nil then
				State1.zIndex = p1.ZIndex
			end
			return Count
		else
			p1.ZIndex = ZIndex
			State1.zIndex = ZIndex
			Count += 1
			
			return Count
		end
	end,
	updatePosition = function(p1, p2, p3): boolean --[[ Line: 135 ]]
		if p3.position == p2.position then
			return false
		else
			p1.Position = p2.position
			p3.position = p2.position
			
			return true
		end
	end,
	hide = function(p1, p2) --[[ Line: 144 ]]
		if p2.visible ~= false then
			p1.Visible = false
			p2.visible = false
		end
	end,
	detach = function(Frame, State): number --[[ Line: 151 ]]
		local Count = 0
		
		if State.unpinnedZIndex ~= nil then
			if Frame.ZIndex ~= State.unpinnedZIndex then
				Frame.ZIndex = State.unpinnedZIndex
				Count += 1
			end
			State.unpinnedZIndex = nil
		end
		if Frame.Visible then
			Frame.Visible = false
			Count += 1
		end
		if Frame.Parent ~= nil then
			Frame.Parent = nil
			Count += 1
		end
		State.parent = nil
		State.anchorPointInitialized = false
		State.position = nil
		State.size = nil
		State.automaticSize = nil
		State.visible = nil
		State.zIndex = nil
		
		return Count
	end
}

function CanvasItemPlacerModule.detachForTransfer(Frame, p1) --[[ Line: 173 ]]
	-- upvalues: CanvasItemPlacerModule (copy)
	local DetachResult = CanvasItemPlacerModule.detach(Frame, p1)
	
	if Frame.Position ~= UDim2.new() then
		Frame.Position = UDim2.new()
		DetachResult += 1
	end
	if Frame.Size ~= UDim2.new() then
		Frame.Size = UDim2.new()
		DetachResult += 1
	end
	if Frame.AutomaticSize ~= Enum.AutomaticSize.None then
		Frame.AutomaticSize = Enum.AutomaticSize.None
		DetachResult += 1
	end
	return DetachResult
end

return CanvasItemPlacerModule