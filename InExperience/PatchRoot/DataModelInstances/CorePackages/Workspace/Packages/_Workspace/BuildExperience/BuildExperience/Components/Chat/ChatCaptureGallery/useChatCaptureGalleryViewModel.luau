local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(script.Parent.ChatCaptureGalleryView)
local fFlagBuildExperienceChatCaptureGalleryNewestFirstModule = require(buildExperience.Flags.FFlagBuildExperienceChatCaptureGalleryNewestFirst)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local useLocalization = localizationModule.Hooks.useLocalization

local function cloneCaptures(p1)
	return table.clone(p1)
end

local function sortCapturesOldestFirst(p1)
	local t = {}
	
	for i, v in p1 do
		local captureTime = v.CaptureTime
		table.insert(t, {
			capture = v,
			index = i,
			timestamp = if typeof(captureTime) == "DateTime" then captureTime.UnixTimestampMillis else 0
		})
	end
	table.sort(t, function(p2, p3)
		return if p2.timestamp == p3.timestamp then p2.index < p3.index else p2.timestamp < p3.timestamp
	end)
	local t_1 = {}
	
	for i_1, v_1 in t do
		table.insert(t_1, v_1.capture)
	end
	return t_1
end

return function(p2)
	-- upvalues: signalsReactModule (ref), reactModule (ref), fFlagBuildExperienceChatCaptureGalleryNewestFirstModule (ref), sortCapturesOldestFirst (ref), cloneCaptures (ref), useLocalization (ref), localizationStringsModule (ref)
	local var1 = signalsReactModule.useSignalState(p2.captureSource.getCaptures)
	local var2 = signalsReactModule.useSignalState(p2.captureSource.getIsFinished)
	local var3 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), fFlagBuildExperienceChatCaptureGalleryNewestFirstModule (copy), sortCapturesOldestFirst (copy)
		local t = {}
		
		for i, v in var1 do
			if v.CaptureType == Enum.CaptureType.Screenshot then
				table.insert(t, v)
			end
		end
		return if fFlagBuildExperienceChatCaptureGalleryNewestFirstModule then t else sortCapturesOldestFirst(t)
	end, { var1 })
	local var4, var5 = reactModule.useState(function()
		-- upvalues: cloneCaptures (copy), p2 (ref)
		return cloneCaptures(p2.initialCaptures)
	end)
	local var6 = reactModule.useRef(p2.isOpen)
	local var7 = useLocalization({
		add = localizationStringsModule.CHAT_CAPTURE_GALLERY_ADD,
		empty = localizationStringsModule.CHAT_CAPTURE_GALLERY_EMPTY,
		selectionCount = {
			localizationStringsModule.CHAT_CAPTURE_GALLERY_SELECTION_COUNT,
			SELECTED_COUNT = #var4,
			MAX_SELECTIONS = p2.maxSelections
		},
		showMore = localizationStringsModule.CHAT_CAPTURE_GALLERY_SHOW_MORE,
		title = localizationStringsModule.CHAT_CAPTURE_GALLERY_TITLE
	})
	reactModule.useEffect(function()
		-- upvalues: p2 (ref), var6 (ref), var5 (ref), cloneCaptures (copy)
		if p2.isOpen and not var6.current then
			var5(cloneCaptures(p2.initialCaptures))
		end
		var6.current = p2.isOpen
	end, { p2.isOpen, p2.initialCaptures })
	
	return {
		addText = var7.add,
		captures = var3,
		emptyText = var7.empty,
		isFinished = var2,
		isLoading = #var1 == 0 and not var2,
		isOpen = p2.isOpen,
		maxSelections = p2.maxSelections,
		selectedCount = #var4,
		selectionCountText = var7.selectionCount,
		showMoreText = var7.showMore,
		titleText = var7.title,
		isSelected = reactModule.useCallback(function(p3)
			-- upvalues: var4 (ref)
			return table.find(var4, p3) ~= nil
		end, { var4 }),
		onCaptureToggled = reactModule.useCallback(function(p3)
			-- upvalues: var5 (ref), p2 (ref)
			var5(function(p4)
				-- upvalues: p3 (ref), p2 (copy)
				local index = table.find(p4, p3)
				
				if index ~= nil then
					local cloned = table.clone(p4)
					table.remove(cloned, index)
					
					return cloned
				elseif p2.maxSelections <= #p4 then
					return p4
				end
				local cloned = table.clone(p4)
				table.insert(cloned, p3)
				
				return cloned
			end)
		end, { p2.maxSelections }),
		onClose = p2.onClose,
		onConfirm = reactModule.useCallback(function()
			-- upvalues: p2 (ref), var4 (ref)
			p2.onConfirm(var4)
		end, { p2.onConfirm, var4 }),
		onShowMore = p2.captureSource.fetchMore,
		shouldProgressivelyLoad = p2.shouldProgressivelyLoad
	}
end