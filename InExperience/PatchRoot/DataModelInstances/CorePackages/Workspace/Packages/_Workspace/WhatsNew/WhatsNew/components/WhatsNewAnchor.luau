local whatsNew = script:FindFirstAncestor("WhatsNew")
local parent = whatsNew.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local getWhatsNewStoreModule = require(whatsNew.store.GetWhatsNewStore)
local view = foundationModule.View

local function _(p0)
	local absoluteSize = p0.AbsoluteSize
	
	return absoluteSize.X > 0 and absoluteSize.Y > 0
end

return reactModule.memo(function(p1)
	-- upvalues: getWhatsNewStoreModule (ref), reactModule (ref), view (ref)
	local var4 = getWhatsNewStoreModule()
	local anchorId = p1.anchorId
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useCallback(function(p2)
		-- upvalues: var4 (ref), anchorId (ref)
		if p2 == nil then
			return
		end
		local absoluteSize = p2.AbsoluteSize
		var4.setAnchorReady(anchorId, absoluteSize.X > 0 and absoluteSize.Y > 0, p2)
	end, { var4, anchorId })
	local var7 = reactModule.useCallback(function(p3)
		-- upvalues: var5 (ref), var4 (ref), anchorId (ref), var6 (ref)
		if p3 == nil then
			local current = var5.current
			var5.current = nil
			
			if current ~= nil then
				var4.unregisterAnchor(anchorId, current)
			end
			return
		else
			var5.current = p3
			var4.registerAnchor(anchorId, p3)
			
			if var4.getAnchorRef(anchorId) == p3 then
				var6(p3)
			end
		end
	end, { var4, anchorId, var6 })
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), anchorId (ref), var5 (ref)
		return function()
			-- upvalues: var4 (copy), anchorId (copy), var5 (copy)
			var4.unregisterAnchor(anchorId, var5.current)
		end
	end, { var4, anchorId })
	
	return reactModule.createElement(view, {
		ref = var7,
		tag = p1.tag or "size-full-0 auto-y",
		LayoutOrder = p1.LayoutOrder,
		onAbsoluteSizeChanged = reactModule.useCallback(function(p4)
			-- upvalues: var6 (ref)
			var6(p4)
		end, { var6 })
	}, p1.children)
end)