local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(script.Parent.ChatCaptureGalleryView)
local FFlagBuildExperienceChatCaptureGalleryNewestFirstModule = require(BuildExperience.Flags.FFlagBuildExperienceChatCaptureGalleryNewestFirst)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

local function cloneCaptures(Tbl)
	return table.clone(Tbl)
end

local function sortCapturesOldestFirst(Captures)
	local List = {}
	
	for Index, capture in Captures do
		local CaptureTime = capture.CaptureTime
		table.insert(List, {
			capture = capture,
			index = Index,
			timestamp = if typeof(CaptureTime) == "DateTime" then CaptureTime.UnixTimestampMillis else 0
		})
	end
	table.sort(List, function(A, B): boolean
		return if A.timestamp == B.timestamp then A.index < B.index else A.timestamp < B.timestamp
	end)
	local Captures1 = {}
	
	for _, value in List do
		table.insert(Captures1, value.capture)
	end
	return Captures1
end

return function(p1)
	-- upvalues: SignalsReactModule (copy), ReactModule (copy), FFlagBuildExperienceChatCaptureGalleryNewestFirstModule (copy), sortCapturesOldestFirst (copy), cloneCaptures (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(p1.captureSource.getCaptures)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(p1.captureSource.getIsFinished)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult (copy), FFlagBuildExperienceChatCaptureGalleryNewestFirstModule (upval), sortCapturesOldestFirst (upval)
		local List = {}
		
		for _, value in UseSignalStateResult do
			if value.CaptureType == Enum.CaptureType.Screenshot then
				table.insert(List, value)
			end
		end
		return if FFlagBuildExperienceChatCaptureGalleryNewestFirstModule then List else sortCapturesOldestFirst(List)
	end, { UseSignalStateResult })
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		-- upvalues: cloneCaptures (upval), p1 (copy)
		return cloneCaptures(p1.initialCaptures)
	end)
	local UseRefResult = ReactModule.useRef(p1.isOpen)
	local UseLocalizationResult = UseLocalizationFunction({
		add = LocalizationStringsModule.CHAT_CAPTURE_GALLERY_ADD,
		empty = LocalizationStringsModule.CHAT_CAPTURE_GALLERY_EMPTY,
		selectionCount = {
			LocalizationStringsModule.CHAT_CAPTURE_GALLERY_SELECTION_COUNT,
			SELECTED_COUNT = #UseStateResult,
			MAX_SELECTIONS = p1.maxSelections
		},
		showMore = LocalizationStringsModule.CHAT_CAPTURE_GALLERY_SHOW_MORE,
		title = LocalizationStringsModule.CHAT_CAPTURE_GALLERY_TITLE
	})
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseRefResult (copy), UseStateResult2 (copy), cloneCaptures (upval)
		if p1.isOpen and not UseRefResult.current then
			UseStateResult2(cloneCaptures(p1.initialCaptures))
		end
		UseRefResult.current = p1.isOpen
	end, { p1.isOpen, p1.initialCaptures })
	
	return {
		addText = UseLocalizationResult.add,
		captures = UseMemoResult,
		emptyText = UseLocalizationResult.empty,
		isFinished = UseSignalStateResult1,
		isLoading = #UseSignalStateResult == 0 and not UseSignalStateResult1,
		isOpen = p1.isOpen,
		maxSelections = p1.maxSelections,
		selectedCount = #UseStateResult,
		selectionCountText = UseLocalizationResult.selectionCount,
		showMoreText = UseLocalizationResult.showMore,
		titleText = UseLocalizationResult.title,
		isSelected = ReactModule.useCallback(function(Value): boolean
			-- upvalues: UseStateResult (copy)
			return table.find(UseStateResult, Value) ~= nil
		end, { UseStateResult }),
		onCaptureToggled = ReactModule.useCallback(function(Value)
			-- upvalues: UseStateResult2 (copy), p1 (copy)
			UseStateResult2(function(List)
				-- upvalues: Value (copy), p1 (upval)
				local FoundIndex: number? = table.find(List, Value)
				
				if FoundIndex ~= nil then
					local Copy = table.clone(List)
					table.remove(Copy, FoundIndex)
					
					return Copy
				elseif p1.maxSelections <= #List then
					return List
				else
					local Copy = table.clone(List)
					table.insert(Copy, Value)
					
					return Copy
				end
			end)
		end, { p1.maxSelections }),
		onClose = p1.onClose,
		onConfirm = ReactModule.useCallback(function()
			-- upvalues: p1 (copy), UseStateResult (copy)
			p1.onConfirm(UseStateResult)
		end, { p1.onConfirm, UseStateResult }),
		onShowMore = p1.captureSource.fetchMore,
		shouldProgressivelyLoad = p1.shouldProgressivelyLoad
	}
end