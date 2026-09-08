local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local adUpsellVisibilityUtilsModule = require(script.Parent.adUpsellVisibilityUtils)
local _ = require(script.Parent.AdUpsellMilestoneView)

return function(p1)
	-- upvalues: reactModule (ref), adUpsellVisibilityUtilsModule (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref), var1 (ref), adUpsellVisibilityUtilsModule (copy)
		if p1.isImpressed then
			var2.current = p1.anchorId
			
			return
		elseif var2.current == p1.anchorId then return end
		local current = p1.scrollingFrameRef.current
		local current_1 = var1.current
		
		if current == nil or current_1 == nil then
			return
		end
		local t = {}
		local var3 = false
		
		local function disconnectListeners()
			-- upvalues: var3 (write), t (write)
			if var3 then return end
			var3 = true
			
			for i, v in t do
				v:Disconnect()
			end
			table.clear(t)
		end
		
		local function reportIfVisible()
			-- upvalues: var2 (copy), p1 (copy), current_1 (ref), current (ref), adUpsellVisibilityUtilsModule (copy), var3 (write), t (write)
			if var2.current ~= p1.anchorId and p1.isPageVisible and (current_1:IsDescendantOf(current) and adUpsellVisibilityUtilsModule.isCardVisibleInScrollViewport(current, current_1)) then
				var2.current = p1.anchorId
				p1.onImpression(p1.anchorId)
				
				if var3 then return end
				var3 = true
				
				for i, v in t do
					v:Disconnect()
				end
				table.clear(t)
			end
		end
		
		t = {
			current:GetPropertyChangedSignal("CanvasPosition"):Connect(reportIfVisible),
			current:GetPropertyChangedSignal("AbsolutePosition"):Connect(reportIfVisible),
			current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(reportIfVisible),
			current_1:GetPropertyChangedSignal("AbsolutePosition"):Connect(reportIfVisible),
			current_1:GetPropertyChangedSignal("AbsoluteSize"):Connect(reportIfVisible)
		}
		reportIfVisible()
		
		return disconnectListeners
	end, {
		p1.anchorId,
		p1.isImpressed,
		p1.isPageVisible,
		p1.onImpression,
		p1.scrollingFrameRef
	})
	
	return {
		order = p1.order,
		congratsText = p1.congratsText,
		cardRef = var1,
		isCreatePending = p1.isCreatePending,
		onCreate = p1.onCreate,
		onDismiss = p1.onDismiss
	}
end