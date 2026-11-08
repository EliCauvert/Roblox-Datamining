local ShareSheet = script:FindFirstAncestor("ShareSheet")
local ReactModule = require(ShareSheet.Parent.React)
local _ = require(ShareSheet.Types)
local ShareSheetConstantsModule = require(ShareSheet.ShareSheetConstants)
local FIntShareSheetPeoplePickerLoadMoreThresholdWindowHundredthsPercentRatio = ShareSheetConstantsModule.FIntShareSheetPeoplePickerLoadMoreThresholdWindowHundredthsPercent / 10000

local function _(p1: number, p2: number, p3): boolean
	-- upvalues: FIntShareSheetPeoplePickerLoadMoreThresholdWindowHundredthsPercentRatio (copy)
	return p2 > 0 and p3 - p2 * FIntShareSheetPeoplePickerLoadMoreThresholdWindowHundredthsPercentRatio <= p1 + p2
end

local _ = function(p1: number, p2): boolean
	return p1 > 0 and p2 <= p1
end

return function(p1)
	-- upvalues: ShareSheetConstantsModule (copy), ReactModule (copy), FIntShareSheetPeoplePickerLoadMoreThresholdWindowHundredthsPercentRatio (copy)
	local IsPeoplePickerDisplayed = p1.isPeoplePickerDisplayed
	local ListResult = p1.listResult
	local IsFetchingNextPage = ListResult.isFetchingNextPage
	local HasNextPageToken = ListResult.nextPageToken ~= nil
	local IsEligibilityLoading = p1.isEligibilityLoading or IsFetchingNextPage
	local NextPageToken = not IsEligibilityLoading and (HasNextPageToken and p1.conversationCount < ShareSheetConstantsModule.FIntShareSheetPeoplePickerMaxConversations) and ListResult.nextPageToken or ""
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: NextPageToken (copy), UseRefResult (copy), p1 (copy)
		if NextPageToken ~= "" and UseRefResult.current ~= NextPageToken then
			UseRefResult.current = NextPageToken
			p1.loadMore(NextPageToken)
			
			return
		end
	end, { NextPageToken, p1.loadMore })
	local UseRefResult2 = ReactModule.useRef({
		contentLength = nil,
		scrollOffset = 0,
		viewportLength = nil
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseResult1 = ReactModule.useCallback(function(): boolean
		-- upvalues: UseRefResult1 (copy), FIntShareSheetPeoplePickerLoadMoreThresholdWindowHundredthsPercentRatio (upval), UseRefResult2 (copy)
		local Current = UseRefResult1.current
		
		if Current then
			local Y: number = Current.CanvasPosition.Y
			local Y1: number = Current.AbsoluteWindowSize.Y
			local Y2 = Current.AbsoluteCanvasSize.Y
			
			return Y1 > 0 and Y2 - Y1 * FIntShareSheetPeoplePickerLoadMoreThresholdWindowHundredthsPercentRatio <= Y + Y1
		end
		local Current1 = UseRefResult2.current
		
		if Current1.viewportLength == nil or Current1.contentLength == nil then
			return false
		else
			local ScrollOffset: number = Current1.scrollOffset
			local ViewportLength: number = Current1.viewportLength
			local ContentLength = Current1.contentLength
			
			return ViewportLength > 0 and ContentLength - ViewportLength * FIntShareSheetPeoplePickerLoadMoreThresholdWindowHundredthsPercentRatio <= ScrollOffset + ViewportLength
		end
	end, {})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult2 (copy), IsPeoplePickerDisplayed (copy), UseResult (copy)
		local Current = UseRefResult2.current
		
		if IsPeoplePickerDisplayed and Current.viewportLength ~= nil and Current.contentLength ~= nil then
			local ViewportLength: number = Current.viewportLength
			local ContentLength = Current.contentLength
			
			if ViewportLength > 0 and ViewportLength >= ContentLength then
				UseResult()
			end
		end
	end, { IsPeoplePickerDisplayed, UseResult })
	local UseResult3 = ReactModule.useCallback(function(ContentLength)
		-- upvalues: UseRefResult2 (copy), UseResult2 (copy)
		UseRefResult2.current.contentLength = ContentLength
		UseResult2()
	end, { UseResult2 })
	local UseResult4 = ReactModule.useCallback(function(ScrollOffset)
		-- upvalues: UseRefResult2 (copy), IsPeoplePickerDisplayed (copy), UseResult1 (copy), UseRefResult (copy)
		UseRefResult2.current.scrollOffset = ScrollOffset
		
		if not IsPeoplePickerDisplayed then return end
		if not UseResult1() then
			UseRefResult.current = nil
		end
	end, { IsPeoplePickerDisplayed, UseResult1 })
	local UseResult5 = ReactModule.useCallback(function(Vector)
		-- upvalues: UseRefResult2 (copy), UseStateResult2 (copy), FIntShareSheetPeoplePickerLoadMoreThresholdWindowHundredthsPercentRatio (upval), UseResult2 (copy)
		UseRefResult2.current.viewportLength = Vector.Y
		UseStateResult2(Vector.Y * FIntShareSheetPeoplePickerLoadMoreThresholdWindowHundredthsPercentRatio)
		UseResult2()
	end, { UseResult2 })
	local UseResult6 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult1 (copy)
		UseRefResult1.current = Current
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: IsPeoplePickerDisplayed (copy), UseRefResult (copy), UseResult2 (copy)
		if not IsPeoplePickerDisplayed then
			UseRefResult.current = nil
			
			return
		end
		local Flag = false
		task.defer(function()
			-- upvalues: Flag (ref), UseResult2 (upval)
			if not Flag then
				UseResult2()
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { IsPeoplePickerDisplayed, UseResult2 })
	
	return {
		isLoading = IsEligibilityLoading,
		paginationProps = {
			endReachedThreshold = UseStateResult,
			scrollingFrameRef = UseResult6,
			onContentLengthChanged = UseResult3,
			onEndReached = if IsPeoplePickerDisplayed and NextPageToken ~= "" then UseResult else nil,
			onScrollOffsetChanged = UseResult4,
			onViewportChanged = UseResult5
		}
	}
end