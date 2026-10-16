local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local PromiseModule = require(Parent.Promise)
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local UseCompositionLayoutFunction = require(Parent.AppComposition).useCompositionLayout
local ScrollView = FoundationModule.ScrollView
local View = FoundationModule.View
local SignalsReactModule = require(Parent.SignalsReact)
local GetGameMediaStoreFunction = require(Parent.DataHydration).Game.getGameMediaStore
local UniverseConfigurationModule = require(Parent.DataHydration.UniverseConfiguration)
local CreateGalleryCaptureSourceModule = require(Parent.Moments.createGalleryCaptureSource)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local GetGameMediaForUniverseModule = require(BuildExperience.utils.getGameMediaForUniverse)
local UseMediaUpdaterModule = require(BuildExperience.utils.useMediaUpdater)
local UploadCaptureAsyncModule = require(BuildExperience.utils.uploadCaptureAsync)
local GetThumbnailUrlAsyncModule = require(BuildExperience.utils.getThumbnailUrlAsync)
local CreateImageAssetAsyncModule = require(BuildExperience.utils.createImageAssetAsync)
local CaptureSelectionViewModule = require(script.Parent.CaptureSelectionView)
local FilmstripSlotModule = require(script.Parent.FilmstripSlot)
local MediaPreviewModule = require(script.Parent.MediaPreview)
local _ = require(script.Parent.types)
local FFlagMediaSelectorErrorLoggingModule = require(BuildExperience.Flags.FFlagMediaSelectorErrorLogging)
local FormatErrorModule = require(BuildExperience.utils.formatError)
local Snackbar = FoundationModule.Snackbar

return function(p1) --[[ Line: 55 | Named "IconThumbnailsEditor" ]]
	-- upvalues: UseCompositionLayoutFunction (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), FFlagMediaSelectorErrorLoggingModule (copy), GetGameMediaForUniverseModule (copy), ReactModule (copy), UniverseConfigurationModule (copy), SignalsReactModule (copy), UseTokensFunction (copy), CreateGalleryCaptureSourceModule (copy), UseMediaUpdaterModule (copy), GetGameMediaStoreFunction (copy), FormatErrorModule (copy), UploadCaptureAsyncModule (copy), GetThumbnailUrlAsyncModule (copy), PromiseModule (copy), CreateImageAssetAsyncModule (copy), CaptureSelectionViewModule (copy), FilmstripSlotModule (copy), View (copy), Snackbar (copy), MediaPreviewModule (copy), ScrollView (copy), FoundationModule (copy)
	local UseCompositionLayoutResult = UseCompositionLayoutFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		captureLibrary = LocalizationStringsModule.MEDIA_SELECTION_CAPTURE_LIBRARY,
		delete = LocalizationStringsModule.MEDIA_SELECTION_DELETE
	})
	local UseLocalizationResult1 = if FFlagMediaSelectorErrorLoggingModule then UseLocalizationFunction({ mediaError = "Feature.Moments.Label.Error" }) else nil
	local CaptureLibrary = UseLocalizationResult.captureLibrary
	local Delete = UseLocalizationResult.delete
	local GameMediaForUniverseModule = GetGameMediaForUniverseModule(p1.universeId)
	local UseSignalStateResult = SignalsReactModule.useSignalState(ReactModule.useMemo(function() --[[ Line: 69 ]]
		-- upvalues: UniverseConfigurationModule (upval), p1 (copy)
		return UniverseConfigurationModule.getUniverseConfigurationStore().getAndFetchSummary(p1.universeId)
	end, { p1.universeId }).data)
	local Text = if UseSignalStateResult then tostring(UseSignalStateResult.rootPlaceId) else nil
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(GameMediaForUniverseModule.icon)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(GameMediaForUniverseModule.thumbnails)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState({ kind = "icon" })
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(nil)
	local Editor, Editor2 = ReactModule.useState("editor")
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(nil)
	local UseStateResult7, UseStateResult2_6 = ReactModule.useState({})
	local UseStateResult8, UseStateResult2_7 = ReactModule.useState("")
	local UseRefResult = ReactModule.useRef(0)
	local UseRefResult1 = ReactModule.useRef(false)
	local UseRefResult2 = ReactModule.useRef(#GameMediaForUniverseModule.thumbnails + 1)
	local UseRefResult3 = ReactModule.useRef(nil)
	
	if UseRefResult3.current == nil then
		UseRefResult3.current = CreateGalleryCaptureSourceModule(nil, nil, { Enum.CaptureType.Screenshot })
	end
	local UseRefResult4 = ReactModule.useRef(UseStateResult1)
	UseRefResult4.current = UseStateResult1
	ReactModule.useRef(UseStateResult).current = UseStateResult
	local UseMediaUpdaterModuleResult = UseMediaUpdaterModule()
	ReactModule.useEffect(function() --[[ Line: 101 ]]
		-- upvalues: UseRefResult (copy), UseStateResult2_1 (copy), GameMediaForUniverseModule (copy)
		if UseRefResult.current == 0 then
			UseStateResult2_1(GameMediaForUniverseModule.thumbnails)
			
			return
		end
	end, { GameMediaForUniverseModule.thumbnails })
	ReactModule.useEffect(function() --[[ Line: 112 ]]
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy), GameMediaForUniverseModule (copy)
		if UseRefResult.current == 0 then
			UseStateResult2(GameMediaForUniverseModule.icon)
		end
	end, { GameMediaForUniverseModule.icon })
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 118 ]]
		-- upvalues: UseStateResult1 (copy)
		local List = {}
		
		for _, value in UseStateResult1 do
			table.insert(List, value)
		end
		return List
	end, { UseStateResult1 })
	local HasText = Text ~= nil
	local HasText1: boolean = #UseMemoResult < 10 and HasText
	local Id = if UseMemoResult[1] then UseMemoResult[1].id else nil
	local UseResult = ReactModule.useCallback(function(p2, p3) --[[ Line: 133 ]]
		-- upvalues: UseStateResult2_6 (copy)
		UseStateResult2_6(function(Tbl) --[[ Line: 134 ]]
			-- upvalues: p2 (copy), p3 (copy)
			local Copy = table.clone(Tbl)
			Copy[p2] = if p3 then true else nil
			
			return Copy
		end)
	end, {})
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 141 ]]
		-- upvalues: UseRefResult (copy)
		UseRefResult.current += 1
	end, {})
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 145 ]]
		-- upvalues: UseRefResult (copy)
		UseRefResult.current = math.max(0, UseRefResult.current - 1)
	end, {})
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 149 ]]
		-- upvalues: UseStateResult2_7 (copy)
		UseStateResult2_7("")
	end, {})
	local UseResult4 = ReactModule.useCallback(function(Id1) --[[ Line: 153 ]]
		-- upvalues: HasText (copy), CaptureLibrary (copy), Id (copy), Delete (copy)
		local List = {}
		
		if HasText then
			table.insert(List, {
				id = "capture_library",
				icon = "icons/common/image",
				text = CaptureLibrary
			})
		end
		if Id1 ~= "icon" and Id1 ~= Id and Id1 ~= "empty" then
			table.insert(List, {
				id = "delete",
				icon = "icons/common/trash",
				text = Delete
			})
		end
		return { { items = List } }
	end, { HasText, CaptureLibrary, Delete, Id })
	local UseResult5 = ReactModule.useCallback(function(p2) --[[ Line: 174 ]]
		-- upvalues: UseStateResult7 (copy), UseRefResult1 (copy), UseStateResult2_4 (copy), UseStateResult2_3 (copy)
		if not UseStateResult7[p2] and (not UseRefResult1.current or p2 == "icon" or p2 == "empty") then
			UseStateResult2_4(p2)
			UseStateResult2_3(true)
			
			return
		end
	end, { UseStateResult7 })
	local UseResult6 = ReactModule.useCallback(function(p2) --[[ Line: 183 ]]
		-- upvalues: UseStateResult2_3 (copy), UseRefResult1 (copy), UseStateResult5 (copy), HasText (copy), UseStateResult2_5 (copy), Editor2 (copy), Text (copy), UseStateResult7 (copy), UseStateResult1 (copy), UseResult1 (copy), UseResult (copy), UseStateResult2_1 (copy), UseStateResult3 (copy), UseStateResult2_2 (copy), UseMediaUpdaterModuleResult (copy), GetGameMediaStoreFunction (upval), p1 (copy), FFlagMediaSelectorErrorLoggingModule (upval), FormatErrorModule (upval), UseStateResult2_7 (copy), UseLocalizationResult1 (copy), UseResult2 (copy)
		UseStateResult2_3(false)
		
		if UseRefResult1.current and UseStateResult5 ~= "icon" and UseStateResult5 ~= "empty" then return end
		if p2 == "capture_library" and HasText then
			UseStateResult2_5(UseStateResult5)
			Editor2("captureSelection")
			
			return
		end
		if p2 == "delete" then
			if UseStateResult5 == nil or Text == nil or UseStateResult7[UseStateResult5] then return end
			local v1 = nil
			local v2 = nil
			
			for i, value in UseStateResult1 do
				if value.id == UseStateResult5 then
					v1 = i
					v2 = value
					break
				end
			end
			if v1 == nil or v2 == nil then return end
			local v3 = v2
			
			if not v3.assetResourceName then return end
			local AssetResourceName = v3.assetResourceName
			UseRefResult1.current = true
			UseResult1()
			UseResult(UseStateResult5, true)
			UseStateResult2_1(function(List) --[[ Line: 219 ]]
				-- upvalues: UseStateResult5 (copy)
				local List1 = {}
				
				for _, value in List do
					if value.id ~= UseStateResult5 then
						table.insert(List1, value)
					end
				end
				return List1
			end)
			
			if UseStateResult3.kind == "thumbnail" and UseStateResult3.id == UseStateResult5 then
				UseStateResult2_2({ kind = "icon" })
			end
			UseMediaUpdaterModuleResult.removePreview(Text, AssetResourceName):andThen(function() --[[ Line: 234 ]]
				-- upvalues: GetGameMediaStoreFunction (upval), p1 (upval)
				GetGameMediaStoreFunction().fetchGameMedia((tostring(p1.universeId)))
			end):catch(function(Err) --[[ Line: 237 ]]
				-- upvalues: FFlagMediaSelectorErrorLoggingModule (upval), FormatErrorModule (upval), UseStateResult2_7 (upval), UseLocalizationResult1 (upval), UseStateResult2_1 (upval), UseStateResult5 (copy), v1 (ref), v3 (copy)
				if FFlagMediaSelectorErrorLoggingModule then
					warn(`[BuildExperience] MediaSelector delete failed: {FormatErrorModule(Err)}`)
					UseStateResult2_7(UseLocalizationResult1.mediaError)
				end
				UseStateResult2_1(function(Tbl) --[[ Line: 242 ]]
					-- upvalues: UseStateResult5 (upval), v1 (upval), v3 (upval)
					for _, value in Tbl do
						if value.id == UseStateResult5 then
							return Tbl
						end
					end
					local Copy = table.clone(Tbl)
					table.insert(Copy, math.min(v1, #Copy + 1), v3)
					
					return Copy
				end)
			end):finally(function() --[[ Line: 253 ]]
				-- upvalues: UseRefResult1 (upval), UseResult (upval), UseStateResult5 (copy), UseResult2 (upval)
				UseRefResult1.current = false
				UseResult(UseStateResult5, false)
				UseResult2()
			end)
		end
	end, {
		UseStateResult5, UseStateResult3, UseStateResult1, UseMediaUpdaterModuleResult,
		Text, HasText, UseStateResult7, UseResult1, UseResult2, UseResult,
		UseLocalizationResult1, p1.universeId
	})
	local UseResult7 = ReactModule.useCallback(function() --[[ Line: 276 ]]
		-- upvalues: UseStateResult2_3 (copy)
		UseStateResult2_3(false)
	end, {})
	local UseResult8 = ReactModule.useCallback(function() --[[ Line: 280 ]]
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2({ kind = "icon" })
	end, {})
	local UseResult9 = ReactModule.useCallback(function(Id) --[[ Line: 284 ]]
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2({ kind = "thumbnail", id = Id })
	end, {})
	local UseResult10 = ReactModule.useCallback(function() --[[ Line: 288 ]]
		-- upvalues: UseResult5 (copy)
		UseResult5("icon")
	end, { UseResult5 })
	local UseResult11 = ReactModule.useCallback(function() --[[ Line: 292 ]]
		-- upvalues: UseResult5 (copy)
		UseResult5("empty")
	end, { UseResult5 })
	local UseResult12 = ReactModule.useCallback(function(p3) --[[ Line: 296 ]]
		-- upvalues: UseResult5 (copy)
		UseResult5(p3)
	end, { UseResult5 })
	local UseResult13 = ReactModule.useCallback(function(p3) --[[ Line: 301 ]]
		-- upvalues: UseStateResult6 (copy), Text (copy), UseStateResult7 (copy), Editor2 (copy), UseStateResult2_5 (copy), UseRefResult4 (copy), UseRefResult2 (copy), UseResult1 (copy), UseResult (copy), UseStateResult2_2 (copy), UseStateResult2_1 (copy), UploadCaptureAsyncModule (upval), GetThumbnailUrlAsyncModule (upval), PromiseModule (upval), UseSignalStateResult (copy), CreateImageAssetAsyncModule (upval), UseMediaUpdaterModuleResult (copy), UseStateResult2 (copy), GetGameMediaStoreFunction (upval), p1 (copy), FFlagMediaSelectorErrorLoggingModule (upval), FormatErrorModule (upval), UseStateResult2_7 (copy), UseLocalizationResult1 (copy), UseResult2 (copy)
		if UseStateResult6 == nil or Text == nil or UseStateResult7[UseStateResult6] then return end
		Editor2("editor")
		UseStateResult2_5(nil)
		local v4 = nil
		local v5 = nil
		
		if UseStateResult6 ~= "icon" and UseStateResult6 ~= "empty" then
			for i, value in UseRefResult4.current do
				if value.id == UseStateResult6 then
					v4 = i
					v5 = value
					break
				end
			end
			if v4 == nil or v5 == nil then return end
			if not v5.assetResourceName then return end
		end
		local ThumbnailName = nil
		
		if UseStateResult6 == "empty" then
			ThumbnailName = `thumbnail_pending_{UseRefResult2.current}`
			UseRefResult2.current += 1
		else
			ThumbnailName = UseStateResult6
		end
		UseResult1()
		UseResult(ThumbnailName, true)
		
		if UseStateResult6 == "icon" then
			UseStateResult2_2({ kind = "icon" })
		elseif UseStateResult6 == "empty" then
			UseStateResult2_1(function(Tbl) --[[ Line: 342 ]]
				-- upvalues: ThumbnailName (ref)
				local Copy = table.clone(Tbl)
				table.insert(Copy, {
					mediaType = "image",
					assetSource = nil,
					id = ThumbnailName
				})
				
				return Copy
			end)
			UseStateResult2_2({ kind = "thumbnail", id = ThumbnailName })
		else
			UseStateResult2_1(function(Tbl) --[[ Line: 353 ]]
				-- upvalues: UseStateResult6 (copy)
				local Copy = table.clone(Tbl)
				
				for i, value in Copy do
					if value.id == UseStateResult6 then
						Copy[i] = { mediaType = "image", assetSource = nil, id = value.id }
						
						return Copy
					end
				end
				return Copy
			end)
		end
		local Promise = UploadCaptureAsyncModule(p3):andThen(function(Result) --[[ Line: 370 ]]
			-- upvalues: GetThumbnailUrlAsyncModule (upval)
			return GetThumbnailUrlAsyncModule(Result.assetId)
		end):andThen(function(Result) --[[ Line: 373 ]]
			-- upvalues: PromiseModule (upval), UseSignalStateResult (upval), CreateImageAssetAsyncModule (upval), UseStateResult6 (copy)
			if typeof(Result) == "table" and Result.status == "in_review" then
				return PromiseModule.reject({
					code = "IN_REVIEW",
					message = "Capture is under moderation review"
				})
			else
				local ImageUrl = Result.imageUrl
				
				return CreateImageAssetAsyncModule(ImageUrl, nil, UseStateResult6 == "icon", if UseSignalStateResult then {
					creatorType = UseSignalStateResult.creatorType,
					creatorTargetId = UseSignalStateResult.creatorTargetId
				} else nil):andThen(function(Result) --[[ Line: 387 ]]
					-- upvalues: ImageUrl (copy)
					return {
						imageAssetId = tostring(Result.assetId),
						displayUrl = ImageUrl
					}
				end)
			end
		end)
		local v6 = Promise:andThen(function(Result) --[[ Line: 395 ]]
			return Result.imageAssetId
		end)
		;(if UseStateResult6 == "icon" then UseMediaUpdaterModuleResult.setIcon(Text, v6) elseif UseStateResult6 == "empty" then UseMediaUpdaterModuleResult.addPreview(Text, v6) else UseMediaUpdaterModuleResult.replacePreview(Text, v6, v5.assetResourceName)):andThen(function() --[[ Line: 413 ]]
			-- upvalues: Promise (copy)
			return Promise
		end):andThen(function(Result) --[[ Line: 416 ]]
			-- upvalues: UseStateResult6 (copy), UseStateResult2 (upval), UseStateResult2_1 (upval), ThumbnailName (ref), UseStateResult2_2 (upval), GetGameMediaStoreFunction (upval), p1 (upval)
			if UseStateResult6 == "icon" then
				UseStateResult2(Result.displayUrl)
			else
				local ImageAssetId = Result.imageAssetId
				UseStateResult2_1(function(Tbl) --[[ Line: 424 ]]
					-- upvalues: ThumbnailName (upval), ImageAssetId (copy), Result (copy)
					local Copy = table.clone(Tbl)
					
					for i, value in Copy do
						if value.id == ThumbnailName then
							Copy[i] = {
								mediaType = "image",
								id = ImageAssetId,
								assetSource = Result.displayUrl,
								assetResourceName = `assets/{Result.imageAssetId}`
							}
							
							return Copy
						end
					end
					return Copy
				end)
				UseStateResult2_2(function(p4) --[[ Line: 439 ]]
					-- upvalues: ThumbnailName (upval), ImageAssetId (copy)
					return if p4.kind == "thumbnail" and p4.id == ThumbnailName then { kind = "thumbnail", id = ImageAssetId } else p4
				end)
			end
			GetGameMediaStoreFunction().fetchGameMedia((tostring(p1.universeId)))
		end):catch(function(Err) --[[ Line: 448 ]]
			-- upvalues: FFlagMediaSelectorErrorLoggingModule (upval), FormatErrorModule (upval), UseStateResult2_7 (upval), UseLocalizationResult1 (upval), UseStateResult6 (copy), UseStateResult2_1 (upval), ThumbnailName (ref), UseStateResult2_2 (upval), v5 (ref)
			if FFlagMediaSelectorErrorLoggingModule then
				warn(`[BuildExperience] MediaSelector upload failed: {FormatErrorModule(Err)}`)
				UseStateResult2_7(UseLocalizationResult1.mediaError)
			end
			if UseStateResult6 == "icon" then return end
			if UseStateResult6 == "empty" then
				UseStateResult2_1(function(List) --[[ Line: 456 ]]
					-- upvalues: ThumbnailName (upval)
					local List1 = {}
					
					for _, value in List do
						if value.id ~= ThumbnailName then
							table.insert(List1, value)
						end
					end
					return List1
				end)
				UseStateResult2_2(function(p4) --[[ Line: 465 ]]
					-- upvalues: ThumbnailName (upval)
					return if p4.kind == "thumbnail" and p4.id == ThumbnailName then { kind = "icon" } else p4
				end)
				
				return
			else
				local v7 = v5
				UseStateResult2_1(function(Tbl) --[[ Line: 472 ]]
					-- upvalues: ThumbnailName (upval), v7 (copy)
					local Copy = table.clone(Tbl)
					
					for i, value in Copy do
						if value.id == ThumbnailName then
							Copy[i] = v7
							
							return Copy
						end
					end
					return Copy
				end)
			end
		end):finally(function() --[[ Line: 484 ]]
			-- upvalues: UseResult (upval), ThumbnailName (ref), UseResult2 (upval)
			UseResult(ThumbnailName, false)
			UseResult2()
		end)
	end, {
		UseStateResult6, UseMediaUpdaterModuleResult, Text, UseSignalStateResult,
		UseStateResult7, UseResult1, UseResult2, UseResult, UseLocalizationResult1,
		p1.universeId
	})
	local UseResult14 = ReactModule.useCallback(function() --[[ Line: 503 ]]
		-- upvalues: Editor2 (copy), UseStateResult2_5 (copy)
		Editor2("editor")
		UseStateResult2_5(nil)
	end, {})
	ReactModule.useEffect(function() --[[ Line: 508 ]]
		-- upvalues: p1 (copy), Editor (copy), UseResult14 (copy)
		local BackHandlerRef = p1.backHandlerRef
		
		if BackHandlerRef then
			BackHandlerRef.current = if Editor == "captureSelection" then UseResult14 else nil
		end
		return function() --[[ Line: 513 ]]
			-- upvalues: BackHandlerRef (copy)
			if BackHandlerRef then
				BackHandlerRef.current = nil
			end
		end
	end, { Editor, UseResult14, p1.backHandlerRef })
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 520 ]]
		-- upvalues: UseStateResult5 (copy), UseResult4 (copy)
		return if UseStateResult5 then UseResult4(UseStateResult5) else { { items = {} } }
	end, { UseStateResult5, UseResult4 })
	
	if Editor == "captureSelection" then
		return (ReactModule.createElement(CaptureSelectionViewModule, {
			captureSource = UseRefResult3.current,
			onCaptureConfirmed = UseResult13
		}))
	end
	local MediaType = nil
	local AssetSource = nil
	local IsIcon = false
	local Icon = false
	
	if UseStateResult3.kind == "icon" then
		IsIcon = true
		AssetSource = UseStateResult
		MediaType = "image"
		Icon = UseStateResult7.icon or false
	elseif UseStateResult3.kind == "thumbnail" then
		for _, value in UseMemoResult do
			if value.id == UseStateResult3.id then
				MediaType = value.mediaType
				AssetSource = value.assetSource
				Icon = UseStateResult7[value.id] or false
				break
			end
		end
	end
	local IsIcon1: boolean = UseStateResult4 and UseStateResult5 == "icon"
	local config = {
		IconSlot = ReactModule.createElement(FilmstripSlotModule, {
			aspectRatio = "square",
			mediaType = "image",
			isFilled = true,
			LayoutOrder = 1,
			assetSource = UseStateResult,
			isSelected = UseStateResult3.kind == "icon",
			isLoading = UseStateResult7.icon or false,
			isMenuOpen = IsIcon1,
			menuItems = if IsIcon1 then UseMemoResult1 else nil,
			onMenuActivated = UseResult6,
			onMenuClose = UseResult7,
			onSelect = UseResult8,
			onEditPressed = if HasText then UseResult10 else nil
		})
	}
	
	for i, value1 in UseMemoResult do
		local Id1 = value1.id
		local IsUseStateResultMatch: boolean = UseStateResult4 and UseStateResult5 == Id1
		config[Id1] = ReactModule.createElement(FilmstripSlotModule, {
			aspectRatio = "wide",
			isFilled = true,
			mediaType = value1.mediaType,
			assetSource = value1.assetSource,
			isSelected = UseStateResult3.kind == "thumbnail" and UseStateResult3.id == Id1,
			isLoading = UseStateResult7[Id1] or false,
			isMenuOpen = IsUseStateResultMatch,
			menuItems = if IsUseStateResultMatch then UseMemoResult1 else nil,
			onMenuActivated = UseResult6,
			onMenuClose = UseResult7,
			onSelect = function() --[[ Line: 590 ]]
				-- upvalues: UseResult9 (copy), Id1 (copy)
				UseResult9(Id1)
			end,
			onEditPressed = if HasText or Id1 ~= Id then function() --[[ Line: 594 ]]
				-- upvalues: UseResult12 (copy), Id1 (copy)
				UseResult12(Id1)
			end else nil,
			LayoutOrder = i + 1
		})
	end
	if HasText1 then
		local IsEmpty: boolean = UseStateResult4 and UseStateResult5 == "empty"
		config.EmptySlot = ReactModule.createElement(FilmstripSlotModule, {
			aspectRatio = "wide",
			mediaType = nil,
			assetSource = nil,
			isFilled = false,
			isSelected = false,
			isMenuOpen = IsEmpty,
			menuItems = if IsEmpty then UseMemoResult1 else nil,
			onMenuActivated = UseResult6,
			onMenuClose = UseResult7,
			onSelect = UseResult11,
			onEmptySlotPressed = UseResult11,
			LayoutOrder = #UseMemoResult + 2
		})
	end
	return ReactModule.createElement(View, { tag = "col gap-xlarge size-full" }, {
		ErrorSnackbar = if FFlagMediaSelectorErrorLoggingModule and UseStateResult8 ~= "" then ReactModule.createElement(View, {
			tag = "row align-x-center size-full-0 auto-y padding-x-large",
			LayoutOrder = 0
		}, {
			Snackbar = ReactModule.createElement(Snackbar, {
				testId = "MediaSelector.error-snackbar",
				title = UseStateResult8,
				onClose = UseResult3
			})
		}) else nil,
		Preview = ReactModule.createElement(View, {
			LayoutOrder = 1,
			testId = "MediaSelector.Preview",
			tag = {
				["align-x-center align-y-center fill size-full-0"] = true,
				["composition-content-body padding-y-xxlarge"] = true
			}
		}, {
			PreviewContent = ReactModule.createElement(MediaPreviewModule, {
				mediaType = MediaType,
				assetSource = AssetSource,
				isIcon = IsIcon,
				isLoading = Icon
			})
		}),
		Filmstrip = ReactModule.createElement(ScrollView, {
			tag = "size-full-0 auto-y",
			LayoutOrder = 2,
			testId = "MediaSelector.Filmstrip",
			padding = {
				top = UDim.new(0, UseTokensResult.Padding.XXLarge),
				bottom = UDim.new(0, UseTokensResult.Padding.XXLarge),
				left = UDim.new(0, UseCompositionLayoutResult.margin),
				right = UDim.new(0, UseCompositionLayoutResult.margin)
			},
			layout = {
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, UseTokensResult.Gap.Medium)
			},
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.X,
				CanvasSize = UDim2.new(0, 0, 1, 0),
				ScrollingDirection = Enum.ScrollingDirection.X,
				scrollBarVisibility = FoundationModule.Enums.Visibility.None
			}
		}, config)
	})
end