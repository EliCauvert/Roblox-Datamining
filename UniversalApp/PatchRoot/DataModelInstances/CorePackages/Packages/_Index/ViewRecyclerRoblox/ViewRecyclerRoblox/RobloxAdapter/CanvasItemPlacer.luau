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
	getGeometry = function(p0, p1, p2, p3, p4, p5)
		-- upvalues: slotGeometryModule (ref)
		if p1.mainAxisOffset ~= nil then
			p0 = {
				startOffset = p1.mainAxisOffset,
				length = p1.mainAxisLength or p0.length
			}
			p4 = 0
		end
		local var3, var4 = slotGeometryModule.get(p0, p2, p3, p4)
		p5 = p5 or {}
		p5.position = var3
		p5.size = var4
		p5.automaticSize = slotGeometryModule.getAutomaticSize(p2, p3)
		p5.zIndexOffset = p1.zIndex
		
		return p5
	end,
	place = function(p6, p7, p8, p9, p10)
		local var6 = 0
		
		if p6.Parent ~= p7 or p9.parent ~= p7 then
			if p6.Parent ~= p7 then
				p6.Parent = p7
				var6 += 1
			end
			p9.parent = p7
			p9.anchorPointInitialized = false
			p9.position = nil
			p9.size = nil
			p9.automaticSize = nil
			p9.visible = nil
			p9.zIndex = nil
		end
		if not p9.anchorPointInitialized then
			p6.AnchorPoint = Vector2.zero
			p9.anchorPointInitialized = true
			var6 += 1
		end
		if p9.position ~= p8.position then
			p6.Position = p8.position
			p9.position = p8.position
			var6 += 1
		end
		if p9.size ~= p8.size then
			p6.Size = p8.size
			p9.size = p8.size
			var6 += 1
		end
		if p9.automaticSize ~= p8.automaticSize then
			p6.AutomaticSize = p8.automaticSize
			p9.automaticSize = p8.automaticSize
			var6 += 1
		end
		if p9.visible ~= p10 then
			p6.Visible = p10
			p9.visible = p10
			var6 += 1
		end
		local unpinnedZIndex = nil
		local zIndexOffset = p8.zIndexOffset
		
		if zIndexOffset ~= nil then
			if p9.unpinnedZIndex == nil then
				p9.unpinnedZIndex = p6.ZIndex
			end
			unpinnedZIndex = p9.unpinnedZIndex + zIndexOffset
		elseif p9.unpinnedZIndex ~= nil then
			unpinnedZIndex = p9.unpinnedZIndex
			p9.unpinnedZIndex = nil
		end
		if unpinnedZIndex == nil or p9.zIndex == unpinnedZIndex then
			if unpinnedZIndex == nil then
				p9.zIndex = p6.ZIndex
			end
			return var6
		else
			p6.ZIndex = unpinnedZIndex
			p9.zIndex = unpinnedZIndex
			var6 += 1
			
			return var6
		end
	end,
	hide = function(p11, p12)
		if p12.visible ~= false then
			p11.Visible = false
			p12.visible = false
		end
	end,
	detach = function(p13, p14)
		local var7 = 0
		
		if p14.unpinnedZIndex ~= nil then
			if p13.ZIndex ~= p14.unpinnedZIndex then
				p13.ZIndex = p14.unpinnedZIndex
				var7 += 1
			end
			p14.unpinnedZIndex = nil
		end
		if p13.Visible then
			p13.Visible = false
			var7 += 1
		end
		if p13.Parent ~= nil then
			p13.Parent = nil
			var7 += 1
		end
		p14.parent = nil
		p14.anchorPointInitialized = false
		p14.position = nil
		p14.size = nil
		p14.automaticSize = nil
		p14.visible = nil
		p14.zIndex = nil
		
		return var7
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

function t.detachForTransfer(p15, p16)
	-- upvalues: t (ref)
	local var8 = t.detach(p15, p16)
	
	if p15.Position ~= UDim2.new() then
		p15.Position = UDim2.new()
		var8 += 1
	end
	if p15.Size ~= UDim2.new() then
		p15.Size = UDim2.new()
		var8 += 1
	end
	if p15.AutomaticSize ~= Enum.AutomaticSize.None then
		p15.AutomaticSize = Enum.AutomaticSize.None
		var8 += 1
	end
	return var8
end

return t