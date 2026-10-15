local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local adUpsellVisibilityUtilsModule = require(script.Parent.adUpsellVisibilityUtils)
local _ = require(script.Parent.AdUpsellMilestoneView)
local fFlagBuildAgentAdCampaignCardModule = require(buildExperience.Flags.FFlagBuildAgentAdCampaignCard)
local fFlagBuildAdUpsellPinnedModule = require(buildExperience.Flags.FFlagBuildAdUpsellPinned)

return function(p1)
	-- upvalues: reactModule (ref), fFlagBuildAdUpsellPinnedModule (ref), adUpsellVisibilityUtilsModule (ref), fFlagBuildAgentAdCampaignCardModule (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref), var1 (ref), fFlagBuildAdUpsellPinnedModule (copy), adUpsellVisibilityUtilsModule (copy)
		if p1.isImpressed then
			var2.current = p1.anchorId
			
			return
		elseif var2.current == p1.anchorId then return end
		local current = var1.current
		
		if fFlagBuildAdUpsellPinnedModule then
			if current == nil or not p1.isPageVisible then
				return
			end
			var2.current = p1.anchorId
			p1.onImpression(p1.anchorId)
			
			return
		else
			local current_1 = p1.scrollingFrameRef and p1.scrollingFrameRef.current
			
			if current_1 == nil or current == nil then
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
				-- upvalues: var2 (copy), p1 (copy), current (ref), current_1 (ref), adUpsellVisibilityUtilsModule (copy), var3 (write), t (write)
				if var2.current ~= p1.anchorId and p1.isPageVisible and (current:IsDescendantOf(current_1) and adUpsellVisibilityUtilsModule.isCardVisibleInScrollViewport(current_1, current)) then
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
				current_1:GetPropertyChangedSignal("CanvasPosition"):Connect(reportIfVisible),
				current_1:GetPropertyChangedSignal("AbsolutePosition"):Connect(reportIfVisible),
				current_1:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(reportIfVisible),
				current:GetPropertyChangedSignal("AbsolutePosition"):Connect(reportIfVisible),
				current:GetPropertyChangedSignal("AbsoluteSize"):Connect(reportIfVisible)
			}
			reportIfVisible()
			
			return disconnectListeners
		end
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
		freePromotionsRemaining = if fFlagBuildAgentAdCampaignCardModule then p1.freePromotionsRemaining else nil,
		cardRef = var1,
		isCreatePending = p1.isCreatePending,
		onCreate = p1.onCreate,
		onDismiss = p1.onDismiss
	}
end