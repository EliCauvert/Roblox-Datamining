local WhatsNew = script:FindFirstAncestor("WhatsNew")
local Parent = WhatsNew.Parent
local ReactModule = require(Parent.React)
local GetWhatsNewStoreModule = require(WhatsNew.store.GetWhatsNewStore)
local View = require(Parent.Foundation).View

local function _(Frame): boolean
	local AbsoluteSize = Frame.AbsoluteSize
	
	return AbsoluteSize.X > 0 and AbsoluteSize.Y > 0
end

return ReactModule.memo(function(Frame)
	-- upvalues: GetWhatsNewStoreModule (copy), ReactModule (copy), View (copy)
	local WhatsNewStoreModule = GetWhatsNewStoreModule()
	local AnchorId = Frame.anchorId
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: WhatsNewStoreModule (copy), AnchorId (copy)
		if Frame ~= nil then
			local AbsoluteSize = Frame.AbsoluteSize
			WhatsNewStoreModule.setAnchorReady(AnchorId, AbsoluteSize.X > 0 and AbsoluteSize.Y > 0, Frame)
			
			return
		end
	end, { WhatsNewStoreModule, AnchorId })
	local UseResult1 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), WhatsNewStoreModule (copy), AnchorId (copy), UseResult (copy)
		if Current == nil then
			local Current1 = UseRefResult.current
			UseRefResult.current = nil
			
			if Current1 ~= nil then
				WhatsNewStoreModule.unregisterAnchor(AnchorId, Current1)
			end
			return
		else
			UseRefResult.current = Current
			WhatsNewStoreModule.registerAnchor(AnchorId, Current)
			
			if WhatsNewStoreModule.getAnchorRef(AnchorId) == Current then
				UseResult(Current)
			end
		end
	end, { WhatsNewStoreModule, AnchorId, UseResult })
	ReactModule.useEffect(function()
		-- upvalues: WhatsNewStoreModule (copy), AnchorId (copy), UseRefResult (copy)
		return function()
			-- upvalues: WhatsNewStoreModule (upval), AnchorId (upval), UseRefResult (upval)
			WhatsNewStoreModule.unregisterAnchor(AnchorId, UseRefResult.current)
		end
	end, { WhatsNewStoreModule, AnchorId })
	
	return ReactModule.createElement(View, {
		ref = UseResult1,
		tag = Frame.tag or "size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder,
		onAbsoluteSizeChanged = ReactModule.useCallback(function(p1)
			-- upvalues: UseResult (copy)
			UseResult(p1)
		end, { UseResult })
	}, Frame.children)
end)