local viewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local _ = require(viewRecyclerRoblox.Parent.ViewRecycler)
local slotGeometryModule = require(viewRecyclerRoblox.RobloxAdapter.SlotGeometry)
local t = {
	createState = function()
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
	getGeometry = function(p1, p2, p3, p4, p5, p6)
		-- upvalues: slotGeometryModule (ref)
		if p2.mainAxisOffset ~= nil then
			p1 = {
				startOffset = p2.mainAxisOffset,
				length = p2.mainAxisLength or p1.length
			}
			p5 = 0
		end
		local var1, var2 = slotGeometryModule.get(p1, p3, p4, p5)
		p6 = p6 or {}
		p6.position = var1
		p6.size = var2
		p6.automaticSize = slotGeometryModule.getAutomaticSize(p3, p4)
		p6.zIndexOffset = p2.zIndex
		
		return p6
	end,
	place = function(p1, p2, p3, p4, p5)
		local var1 = 0
		
		if p1.Parent ~= p2 or p4.parent ~= p2 then
			if p1.Parent ~= p2 then
				p1.Parent = p2
				var1 += 1
			end
			p4.parent = p2
			p4.anchorPointInitialized = false
			p4.position = nil
			p4.size = nil
			p4.automaticSize = nil
			p4.visible = nil
			p4.zIndex = nil
		end
		if not p4.anchorPointInitialized then
			p1.AnchorPoint = Vector2.zero
			p4.anchorPointInitialized = true
			var1 += 1
		end
		if p4.position ~= p3.position then
			p1.Position = p3.position
			p4.position = p3.position
			var1 += 1
		end
		if p4.size ~= p3.size then
			p1.Size = p3.size
			p4.size = p3.size
			var1 += 1
		end
		if p4.automaticSize ~= p3.automaticSize then
			p1.AutomaticSize = p3.automaticSize
			p4.automaticSize = p3.automaticSize
			var1 += 1
		end
		if p4.visible ~= p5 then
			p1.Visible = p5
			p4.visible = p5
			var1 += 1
		end
		local unpinnedZIndex = nil
		local zIndexOffset = p3.zIndexOffset
		
		if zIndexOffset ~= nil then
			if p4.unpinnedZIndex == nil then
				p4.unpinnedZIndex = p1.ZIndex
			end
			unpinnedZIndex = p4.unpinnedZIndex + zIndexOffset
		elseif p4.unpinnedZIndex ~= nil then
			unpinnedZIndex = p4.unpinnedZIndex
			p4.unpinnedZIndex = nil
		end
		if unpinnedZIndex == nil or p4.zIndex == unpinnedZIndex then
			if unpinnedZIndex == nil then
				p4.zIndex = p1.ZIndex
			end
			return var1
		else
			p1.ZIndex = unpinnedZIndex
			p4.zIndex = unpinnedZIndex
			var1 += 1
			
			return var1
		end
	end,
	hide = function(p1, p2)
		if p2.visible ~= false then
			p1.Visible = false
			p2.visible = false
		end
	end,
	detach = function(p1, p2)
		local var1 = 0
		
		if p2.unpinnedZIndex ~= nil then
			if p1.ZIndex ~= p2.unpinnedZIndex then
				p1.ZIndex = p2.unpinnedZIndex
				var1 += 1
			end
			p2.unpinnedZIndex = nil
		end
		if p1.Visible then
			p1.Visible = false
			var1 += 1
		end
		if p1.Parent ~= nil then
			p1.Parent = nil
			var1 += 1
		end
		p2.parent = nil
		p2.anchorPointInitialized = false
		p2.position = nil
		p2.size = nil
		p2.automaticSize = nil
		p2.visible = nil
		p2.zIndex = nil
		
		return var1
	end
}

local function _(value)
	value.anchorPointInitialized = false
	value.position = nil
	value.size = nil
	value.automaticSize = nil
	value.visible = nil
	value.zIndex = nil
end

function t.detachForTransfer(p1, p2)
	-- upvalues: t (ref)
	local var1 = t.detach(p1, p2)
	
	if p1.Position ~= UDim2.new() then
		p1.Position = UDim2.new()
		var1 += 1
	end
	if p1.Size ~= UDim2.new() then
		p1.Size = UDim2.new()
		var1 += 1
	end
	if p1.AutomaticSize ~= Enum.AutomaticSize.None then
		p1.AutomaticSize = Enum.AutomaticSize.None
		var1 += 1
	end
	return var1
end

return t