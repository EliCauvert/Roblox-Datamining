local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(script.Parent.ChatCaptureGalleryView)
local _ = require(script.Parent.ChatCaptureToolbarIllustration)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local FFlagBuildExperienceChatCaptureGalleryEmptyEducationEnabledModule = require(BuildExperience.Flags.FFlagBuildExperienceChatCaptureGalleryEmptyEducationEnabled)
local DisplayModule = if FFlagBuildExperienceChatCaptureGalleryEmptyEducationEnabledModule then require(Parent.Display) else nil
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

local function cloneCaptures(Tbl)
	return table.clone(Tbl)
end

local function _(DisplaySize, Vector): string
	return if DisplaySize == nil or DisplaySize == Enum.DisplaySize.Small then if Vector.Y < Vector.X then "sideRail" else "bottomBar" else "floating"
end

return function(p1)
	-- upvalues: SignalsReactModule (copy), ReactModule (copy), cloneCaptures (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), FFlagBuildExperienceChatCaptureGalleryEmptyEducationEnabledModule (copy), DisplayModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(p1.captureSource.getCaptures)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(p1.captureSource.getIsFinished)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult (copy)
		local List = {}
		
		for _, value in UseSignalStateResult do
			if value.CaptureType == Enum.CaptureType.Screenshot then
				table.insert(List, value)
			end
		end
		return List
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
	local UseResult = ReactModule.useCallback(function(Value): boolean
		-- upvalues: UseStateResult (copy)
		return table.find(UseStateResult, Value) ~= nil
	end, { UseStateResult })
	local UseResult1 = ReactModule.useCallback(function(Value)
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
	end, { p1.maxSelections })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseStateResult (copy)
		p1.onConfirm(UseStateResult)
	end, { p1.onConfirm, UseStateResult })
	local Education = nil
	
	if FFlagBuildExperienceChatCaptureGalleryEmptyEducationEnabledModule then
		local DisplayStore = DisplayModule.GetDisplayStore(false)
		local UseSignalStateResult2 = SignalsReactModule.useSignalState(DisplayStore.getDisplaySize)
		local UseSignalStateResult3 = SignalsReactModule.useSignalState(DisplayStore.getViewportSize)
		local UseLocalizationResult1 = UseLocalizationFunction({
			description = LocalizationStringsModule.CHAT_CAPTURE_GALLERY_EMPTY_DESCRIPTION,
			dismiss = LocalizationStringsModule.CHAT_CAPTURE_GALLERY_EMPTY_DISMISS,
			step1 = LocalizationStringsModule.CHAT_CAPTURE_GALLERY_HOW_TO_STEP_1,
			step2 = LocalizationStringsModule.CHAT_CAPTURE_GALLERY_HOW_TO_STEP_2,
			step3 = LocalizationStringsModule.CHAT_CAPTURE_GALLERY_HOW_TO_STEP_3
		})
		Education = {
			descriptionText = UseLocalizationResult1.description,
			dismissText = UseLocalizationResult1.dismiss,
			howToSteps = {
				UseLocalizationResult1.step1,
				UseLocalizationResult1.step2,
				UseLocalizationResult1.step3
			},
			isShown = UseSignalStateResult1 and #UseMemoResult == 0,
			toolbarLayout = if UseSignalStateResult2 == nil or UseSignalStateResult2 == Enum.DisplaySize.Small then if UseSignalStateResult3.Y < UseSignalStateResult3.X then "sideRail" else "bottomBar" else "floating"
		}
	end
	return {
		addText = UseLocalizationResult.add,
		captures = UseMemoResult,
		education = Education,
		emptyText = UseLocalizationResult.empty,
		isFinished = UseSignalStateResult1,
		isLoading = #UseSignalStateResult == 0 and not UseSignalStateResult1,
		isOpen = p1.isOpen,
		maxSelections = p1.maxSelections,
		selectedCount = #UseStateResult,
		selectionCountText = UseLocalizationResult.selectionCount,
		showMoreText = UseLocalizationResult.showMore,
		titleText = UseLocalizationResult.title,
		isSelected = UseResult,
		onCaptureToggled = UseResult1,
		onClose = p1.onClose,
		onConfirm = UseResult2,
		onShowMore = p1.captureSource.fetchMore,
		shouldProgressivelyLoad = p1.shouldProgressivelyLoad
	}
end