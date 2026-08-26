local whatsNew = script:FindFirstAncestor("WhatsNew")
local parent = whatsNew.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local getWhatsNewStoreModule = require(whatsNew.store.GetWhatsNewStore)
local view = foundationModule.View

local function _(p1)
	local absoluteSize = p1.AbsoluteSize
	
	return absoluteSize.X > 0 and absoluteSize.Y > 0
end

return reactModule.memo(function(p1)
	-- upvalues: getWhatsNewStoreModule (ref), reactModule (ref), view (ref)
	local var1 = getWhatsNewStoreModule()
	local anchorId = p1.anchorId
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), anchorId (ref)
		if p2 == nil then
			return
		end
		local absoluteSize = p2.AbsoluteSize
		var1.setAnchorReady(anchorId, absoluteSize.X > 0 and absoluteSize.Y > 0, p2)
	end, { var1, anchorId })
	local var4 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), var1 (ref), anchorId (ref), var3 (ref)
		if p2 == nil then
			local current = var2.current
			var2.current = nil
			
			if current ~= nil then
				var1.unregisterAnchor(anchorId, current)
			end
			return
		else
			var2.current = p2
			var1.registerAnchor(anchorId, p2)
			
			if var1.getAnchorRef(anchorId) == p2 then
				var3(p2)
			end
		end
	end, { var1, anchorId, var3 })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), anchorId (ref), var2 (ref)
		return function()
			-- upvalues: var1 (copy), anchorId (copy), var2 (copy)
			var1.unregisterAnchor(anchorId, var2.current)
		end
	end, { var1, anchorId })
	
	return reactModule.createElement(view, {
		ref = var4,
		tag = p1.tag or "size-full-0 auto-y",
		LayoutOrder = p1.LayoutOrder,
		onAbsoluteSizeChanged = reactModule.useCallback(function(p2)
			-- upvalues: var3 (ref)
			var3(p2)
		end, { var3 })
	}, p1.children)
end)