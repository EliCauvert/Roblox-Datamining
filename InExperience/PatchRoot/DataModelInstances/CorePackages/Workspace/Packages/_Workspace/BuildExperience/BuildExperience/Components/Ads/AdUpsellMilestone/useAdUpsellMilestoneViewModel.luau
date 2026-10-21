local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local AdUpsellVisibilityUtilsModule = require(script.Parent.adUpsellVisibilityUtils)
local _ = require(script.Parent.AdUpsellMilestoneView)
local FFlagBuildAgentAdCampaignCardModule = require(BuildExperience.Flags.FFlagBuildAgentAdCampaignCard)
local FFlagBuildAdUpsellPinnedModule = require(BuildExperience.Flags.FFlagBuildAdUpsellPinned)

return function(p1)
	-- upvalues: ReactModule (copy), FFlagBuildAdUpsellPinnedModule (copy), AdUpsellVisibilityUtilsModule (copy), FFlagBuildAgentAdCampaignCardModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseRefResult1 (copy), UseRefResult (copy), FFlagBuildAdUpsellPinnedModule (upval), AdUpsellVisibilityUtilsModule (upval)
		if p1.isImpressed then
			UseRefResult1.current = p1.anchorId
			
			return
		end
		if UseRefResult1.current == p1.anchorId then return end
		local Current = UseRefResult.current
		
		if not FFlagBuildAdUpsellPinnedModule then
			local Current1 = p1.scrollingFrameRef and p1.scrollingFrameRef.current
			
			if Current1 == nil or Current == nil then return end
			local Tbl = {}
			local Flag = false
			
			local function disconnectListeners()
				-- upvalues: Flag (ref), Tbl (ref)
				if Flag then return end
				Flag = true
				
				for _, Connection in Tbl do
					Connection:Disconnect()
				end
				table.clear(Tbl)
			end
			
			local function reportIfVisible()
				-- upvalues: UseRefResult1 (upval), p1 (upval), Current (copy), Current1 (copy), AdUpsellVisibilityUtilsModule (upval), Flag (ref), Tbl (ref)
				if UseRefResult1.current ~= p1.anchorId and p1.isPageVisible and Current:IsDescendantOf(Current1) and AdUpsellVisibilityUtilsModule.isCardVisibleInScrollViewport(Current1, Current) then
					UseRefResult1.current = p1.anchorId
					p1.onImpression(p1.anchorId)
					
					if Flag then return end
					Flag = true
					
					for _, Connection in Tbl do
						Connection:Disconnect()
					end
					table.clear(Tbl)
				end
			end
			
			Tbl = {
				Current1:GetPropertyChangedSignal("CanvasPosition"):Connect(reportIfVisible),
				Current1:GetPropertyChangedSignal("AbsolutePosition"):Connect(reportIfVisible),
				Current1:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(reportIfVisible),
				Current:GetPropertyChangedSignal("AbsolutePosition"):Connect(reportIfVisible),
				Current:GetPropertyChangedSignal("AbsoluteSize"):Connect(reportIfVisible)
			}
			reportIfVisible()
			
			return disconnectListeners
		elseif Current ~= nil and p1.isPageVisible then
			UseRefResult1.current = p1.anchorId
			p1.onImpression(p1.anchorId)
			
			return
		else
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
		freePromotionsRemaining = if FFlagBuildAgentAdCampaignCardModule then p1.freePromotionsRemaining else nil,
		cardRef = UseRefResult,
		isCreatePending = p1.isCreatePending,
		isCreateDisabled = p1.isCreateDisabled,
		onCreate = p1.onCreate,
		onDismiss = p1.onDismiss
	}
end