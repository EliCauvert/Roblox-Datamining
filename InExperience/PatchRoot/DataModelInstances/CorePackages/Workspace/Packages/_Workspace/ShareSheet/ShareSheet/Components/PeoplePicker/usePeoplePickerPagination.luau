local shareSheet = script:FindFirstAncestor("ShareSheet")
local parent = shareSheet.Parent
local reactModule = require(parent.React)
local _ = require(parent.AppChat.GetConversationListStore)
local fetchConversationListPageToSignalsModule = require(parent.AppChat.fetchConversationListPageToSignals)
local shareSheetConstantsModule = require(shareSheet.ShareSheetConstants)
local shareSheetPeoplePickerLoadMoreThresholdWindowHundredthsPercent = game:DefineFastInt("ShareSheetPeoplePickerLoadMoreThresholdWindowHundredthsPercent", 5000)

local function _(p1)
	-- upvalues: shareSheetPeoplePickerLoadMoreThresholdWindowHundredthsPercent (ref)
	return p1.AbsoluteCanvasSize.Y - p1.AbsoluteWindowSize.Y * shareSheetPeoplePickerLoadMoreThresholdWindowHundredthsPercent / 10000 <= p1.CanvasPosition.Y + p1.AbsoluteWindowSize.Y
end

return function(p1)
	-- upvalues: shareSheetConstantsModule (ref), reactModule (ref), fetchConversationListPageToSignalsModule (ref), shareSheetPeoplePickerLoadMoreThresholdWindowHundredthsPercent (ref)
	local isPeoplePickerDisplayed = p1.isPeoplePickerDisplayed
	local isEligibilityLoading = p1.isEligibilityLoading or p1.listStatus.isFetchingConversations == true
	local var1 = if not isEligibilityLoading and (p1.listStatus.oldestConversationIsFetched ~= true and p1.conversationCount < shareSheetConstantsModule.FIntShareSheetPeoplePickerMaxConversations) then p1.listStatus.nextCursor or "" else ""
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), var2 (ref), fetchConversationListPageToSignalsModule (copy)
		if var1 == "" or var2.current == var1 then
			return
		end
		var2.current = var1
		fetchConversationListPageToSignalsModule({ cursor = var1 })
	end, { var1 })
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useCallback(function(p2)
		-- upvalues: var4 (ref), isPeoplePickerDisplayed (ref)
		var4.current = p2
		
		if p2 then
			p2.AutomaticSize = if isPeoplePickerDisplayed then Enum.AutomaticSize.None else Enum.AutomaticSize.Y
			p2.ScrollBarThickness = 0
		end
	end, { isPeoplePickerDisplayed })
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), isPeoplePickerDisplayed (ref), var2 (ref), shareSheetPeoplePickerLoadMoreThresholdWindowHundredthsPercent (copy), var3 (ref)
		local current = var4.current
		
		if isPeoplePickerDisplayed and current ~= nil then
			local function handleLayoutChanged()
				-- upvalues: current (ref), shareSheetPeoplePickerLoadMoreThresholdWindowHundredthsPercent (copy), var3 (copy)
				if current.AbsoluteCanvasSize.Y - current.AbsoluteWindowSize.Y * shareSheetPeoplePickerLoadMoreThresholdWindowHundredthsPercent / 10000 <= current.CanvasPosition.Y + current.AbsoluteWindowSize.Y then
					var3()
				end
			end
			
			local list = {
				current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(handleLayoutChanged),
				current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(handleLayoutChanged),
				current:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
					-- upvalues: current (ref), shareSheetPeoplePickerLoadMoreThresholdWindowHundredthsPercent (copy), var3 (copy), var2 (copy)
					if current.AbsoluteCanvasSize.Y - current.AbsoluteWindowSize.Y * shareSheetPeoplePickerLoadMoreThresholdWindowHundredthsPercent / 10000 <= current.CanvasPosition.Y + current.AbsoluteWindowSize.Y then
						var3()
						
						return
					end
					var2.current = nil
				end)
			}
			local var6 = false
			task.defer(function()
				-- upvalues: var6 (write), current (ref), shareSheetPeoplePickerLoadMoreThresholdWindowHundredthsPercent (copy), var3 (copy)
				if not var6 then
					local var7 = current
					
					if var7.AbsoluteCanvasSize.Y - var7.AbsoluteWindowSize.Y * shareSheetPeoplePickerLoadMoreThresholdWindowHundredthsPercent / 10000 <= var7.CanvasPosition.Y + var7.AbsoluteWindowSize.Y then
						var3()
					end
				end
			end)
			
			return function()
				-- upvalues: var6 (write), list (ref)
				var6 = true
				
				for i, v in list do
					v:Disconnect()
				end
			end
		end
		var2.current = nil
	end, { isPeoplePickerDisplayed, var3 })
	
	return {
		isLoading = isEligibilityLoading,
		scrollingFrameRef = var5
	}
end