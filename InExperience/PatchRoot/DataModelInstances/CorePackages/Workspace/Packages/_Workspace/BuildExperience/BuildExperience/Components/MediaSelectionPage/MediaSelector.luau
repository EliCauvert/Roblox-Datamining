local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local fFlagBuildDesktopReadinessModule = require(buildExperience.Flags.FFlagBuildDesktopReadiness)
local var2 = if fFlagBuildDesktopReadinessModule then require(parent.AppComposition) else nil
local promiseModule = require(parent.Promise)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local var8 = if fFlagBuildDesktopReadinessModule then var2.useCompositionLayout else nil
local scrollView = foundationModule.ScrollView
local view = foundationModule.View
local signalsReactModule = require(parent.SignalsReact)
local getGameMediaStore = require(parent.DataHydration).Game.getGameMediaStore
local universeConfigurationModule = require(parent.DataHydration.UniverseConfiguration)
local createGalleryCaptureSourceModule = require(parent.Moments.createGalleryCaptureSource)
local useTokens = foundationModule.Hooks.useTokens
local getGameMediaForUniverseModule = require(buildExperience.utils.getGameMediaForUniverse)
local useMediaUpdaterModule = require(buildExperience.utils.useMediaUpdater)
local uploadCaptureAsyncModule = require(buildExperience.utils.uploadCaptureAsync)
local getThumbnailUrlAsyncModule = require(buildExperience.utils.getThumbnailUrlAsync)
local createImageAssetAsyncModule = require(buildExperience.utils.createImageAssetAsync)
local captureSelectionViewModule = require(script.Parent.CaptureSelectionView)
local filmstripSlotModule = require(script.Parent.FilmstripSlot)
local mediaPreviewModule = require(script.Parent.MediaPreview)
local _ = require(script.Parent.types)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local fFlagMediaSelectorErrorLoggingModule = require(buildExperience.Flags.FFlagMediaSelectorErrorLogging)
local formatErrorModule = require(buildExperience.utils.formatError)
local snackbar = foundationModule.Snackbar

return function(p0) --[[ line: 59 | named "IconThumbnailsEditor" ]]
	-- upvalues: fFlagBuildDesktopReadinessModule (ref), var8 (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), fFlagMediaSelectorErrorLoggingModule (ref), getGameMediaForUniverseModule (ref), reactModule (ref), universeConfigurationModule (ref), signalsReactModule (ref), useTokens (ref), createGalleryCaptureSourceModule (ref), useMediaUpdaterModule (ref), getGameMediaStore (ref), formatErrorModule (ref), uploadCaptureAsyncModule (ref), getThumbnailUrlAsyncModule (ref), promiseModule (ref), createImageAssetAsyncModule (ref), captureSelectionViewModule (ref), filmstripSlotModule (ref), view (ref), snackbar (ref), mediaPreviewModule (ref), scrollView (ref), foundationModule (ref)
	local MEDIA_SELECTION_CAPTURE_LIBRARY, MEDIA_SELECTION_DELETE
	local var22 = if fFlagBuildDesktopReadinessModule then var8() else nil
	local var23 = if fFlagBuildLocalization then useLocalization({
		captureLibrary = localizationStringsModule.MEDIA_SELECTION_CAPTURE_LIBRARY,
		delete = localizationStringsModule.MEDIA_SELECTION_DELETE
	}) else nil
	local var24 = if fFlagMediaSelectorErrorLoggingModule then useLocalization({ mediaError = "Feature.Moments.Label.Error" }) else nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		MEDIA_SELECTION_CAPTURE_LIBRARY = var23.captureLibrary
		MEDIA_SELECTION_DELETE = var23.delete
	else
		MEDIA_SELECTION_CAPTURE_LIBRARY = localizationStringsModule.MEDIA_SELECTION_CAPTURE_LIBRARY
		MEDIA_SELECTION_DELETE = localizationStringsModule.MEDIA_SELECTION_DELETE
	end
	local var25 = getGameMediaForUniverseModule(p0.universeId)
	local var26 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 82 ]]
		-- upvalues: universeConfigurationModule (copy), p0 (ref)
		return universeConfigurationModule.getUniverseConfigurationStore().getAndFetchSummary(p0.universeId)
	end, { p0.universeId }).data)
	local var27 = if var26 then tostring(var26.rootPlaceId) else nil
	local var28 = useTokens()
	local var29, var30 = reactModule.useState(var25.icon)
	local var31, var32 = reactModule.useState(var25.thumbnails)
	local var33, var34 = reactModule.useState({ kind = "icon" })
	local var35, var36 = reactModule.useState(false)
	local var37, var38 = reactModule.useState(nil)
	local editor, editor_1 = reactModule.useState("editor")
	local var41, var42 = reactModule.useState(nil)
	local var43, var44 = reactModule.useState({})
	local var45, var46 = reactModule.useState("")
	local var47 = reactModule.useRef(0)
	local var48 = reactModule.useRef(false)
	local var49 = reactModule.useRef(#var25.thumbnails + 1)
	local var50 = reactModule.useRef(nil)
	
	if var50.current == nil then
		var50.current = createGalleryCaptureSourceModule(nil, nil, { Enum.CaptureType.Screenshot })
	end
	local var51 = reactModule.useRef(var31)
	var51.current = var31
	reactModule.useRef(var29).current = var29
	local var52 = useMediaUpdaterModule()
	reactModule.useEffect(function() --[[ line: 114 ]]
		-- upvalues: var47 (ref), var32 (ref), var25 (ref)
		if var47.current == 0 then
			var32(var25.thumbnails)
			
			return
		end
	end, { var25.thumbnails })
	reactModule.useEffect(function() --[[ line: 125 ]]
		-- upvalues: var47 (ref), var30 (ref), var25 (ref)
		if var47.current == 0 then
			var30(var25.icon)
		end
	end, { var25.icon })
	local var53 = reactModule.useMemo(function() --[[ line: 131 ]]
		-- upvalues: var31 (ref)
		local t = {}
		
		for i, v in var31 do
			table.insert(t, v)
		end
		return t
	end, { var31 })
	local var54 = var27 ~= nil
	local var55 = #var53 < 10 and var54
	local var56 = if var53[1] then var53[1].id else nil
	local var57 = reactModule.useCallback(function(p1, p2) --[[ line: 146 ]]
		-- upvalues: var44 (ref)
		var44(function(p3) --[[ line: 147 ]]
			-- upvalues: p1 (ref), p2 (ref)
			local cloned = table.clone(p3)
			cloned[p1] = if p2 then true else nil
			
			return cloned
		end)
	end, {})
	local var58 = reactModule.useCallback(function() --[[ line: 154 ]]
		-- upvalues: var47 (ref)
		var47.current += 1
	end, {})
	local var59 = reactModule.useCallback(function() --[[ line: 158 ]]
		-- upvalues: var47 (ref)
		var47.current = math.max(0, var47.current - 1)
	end, {})
	local var60 = reactModule.useCallback(function() --[[ line: 162 ]]
		-- upvalues: var46 (ref)
		var46("")
	end, {})
	local var61 = reactModule.useCallback(function(p4) --[[ line: 166 ]]
		-- upvalues: var54 (ref), MEDIA_SELECTION_CAPTURE_LIBRARY (write), var56 (ref), MEDIA_SELECTION_DELETE (write)
		local t = {}
		
		if var54 then
			table.insert(t, {
				id = "capture_library",
				icon = "icons/common/image",
				text = MEDIA_SELECTION_CAPTURE_LIBRARY
			})
		end
		if p4 ~= "icon" and p4 ~= var56 and p4 ~= "empty" then
			table.insert(t, {
				id = "delete",
				icon = "icons/common/trash",
				text = MEDIA_SELECTION_DELETE
			})
		end
		return { { items = t } }
	end, {
		var54,
		MEDIA_SELECTION_CAPTURE_LIBRARY,
		MEDIA_SELECTION_DELETE,
		var56
	})
	local var62 = reactModule.useCallback(function(p5) --[[ line: 187 ]]
		-- upvalues: var43 (ref), var48 (ref), var38 (ref), var36 (ref)
		if var43[p5] or var48.current and p5 ~= "icon" and p5 ~= "empty" then
			return
		end
		var38(p5)
		var36(true)
	end, { var43 })
	local var63 = reactModule.useCallback(function(p6) --[[ line: 196 ]]
		-- upvalues: var36 (ref), var48 (ref), var37 (ref), var54 (ref), var42 (ref), editor_1 (ref), var27 (ref), var43 (ref), var31 (ref), var58 (ref), var57 (ref), var32 (ref), var33 (ref), var34 (ref), var52 (ref), getGameMediaStore (copy), p0 (ref), fFlagMediaSelectorErrorLoggingModule (copy), formatErrorModule (copy), var46 (ref), var24 (ref), var59 (ref)
		var36(false)
		
		if var48.current and var37 ~= "icon" and var37 ~= "empty" then return end
		if p6 == "capture_library" and var54 then
			var42(var37)
			editor_1("captureSelection")
			
			return
		elseif p6 == "delete" then
			local var82 = var37
			
			if var82 == nil or var27 == nil or var43[var82] then return end
			local var83 = nil
			local var84 = nil
			
			for i, v in var31 do
				if v.id == var82 then
					var83 = i
					var84 = v
					break
				end
			end
			if var83 == nil or var84 == nil then return end
			local var85 = var84
			
			if not var85.assetResourceName then return end
			local assetResourceName = var85.assetResourceName
			var48.current = true
			var58()
			var57(var82, true)
			var32(function(p7) --[[ line: 232 ]]
				-- upvalues: var82 (ref)
				local t = {}
				
				for i, v in p7 do
					if v.id ~= var82 then
						table.insert(t, v)
					end
				end
				return t
			end)
			
			if var33.kind == "thumbnail" and var33.id == var82 then
				var34({ kind = "icon" })
			end
			var52.removePreview(var27, assetResourceName):andThen(function() --[[ line: 247 ]]
				-- upvalues: getGameMediaStore (copy), p0 (copy)
				getGameMediaStore().fetchGameMedia(tostring(p0.universeId))
			end):catch(function(p8) --[[ line: 250 ]]
				-- upvalues: fFlagMediaSelectorErrorLoggingModule (copy), formatErrorModule (copy), var46 (copy), var24 (copy), var32 (copy), var82 (ref), var83 (write), var85 (ref)
				if fFlagMediaSelectorErrorLoggingModule then
					warn(`[BuildExperience] MediaSelector delete failed: {formatErrorModule(p8)}`)
					var46(var24.mediaError)
				end
				var32(function(p9) --[[ line: 255 ]]
					-- upvalues: var82 (copy), var83 (copy), var85 (copy)
					for i, v in p9 do
						if v.id == var82 then
							return p9
						end
					end
					local cloned = table.clone(p9)
					table.insert(cloned, math.min(var83, #cloned + 1), var85)
					
					return cloned
				end)
			end):finally(function() --[[ line: 266 ]]
				-- upvalues: var48 (copy), var57 (copy), var82 (ref), var59 (copy)
				var48.current = false
				var57(var82, false)
				var59()
			end)
		end
	end, {
		var37, var33, var31, var52, var27, var54, var43, var58, var59, var57, var24,
		p0.universeId
	})
	local var64 = reactModule.useCallback(function() --[[ line: 289 ]]
		-- upvalues: var36 (ref)
		var36(false)
	end, {})
	local var65 = reactModule.useCallback(function() --[[ line: 293 ]]
		-- upvalues: var34 (ref)
		var34({ kind = "icon" })
	end, {})
	local var66 = reactModule.useCallback(function(p10) --[[ line: 297 ]]
		-- upvalues: var34 (ref)
		var34({ kind = "thumbnail", id = p10 })
	end, {})
	local var67 = reactModule.useCallback(function() --[[ line: 301 ]]
		-- upvalues: var62 (ref)
		var62("icon")
	end, { var62 })
	local var68 = reactModule.useCallback(function() --[[ line: 305 ]]
		-- upvalues: var62 (ref)
		var62("empty")
	end, { var62 })
	local var69 = reactModule.useCallback(function(p11) --[[ line: 309 ]]
		-- upvalues: var62 (ref)
		var62(p11)
	end, { var62 })
	local var70 = reactModule.useCallback(function(p12) --[[ line: 314 ]]
		-- upvalues: var41 (ref), var27 (ref), var43 (ref), editor_1 (ref), var42 (ref), var51 (ref), var49 (ref), var58 (ref), var57 (ref), var34 (ref), var32 (ref), uploadCaptureAsyncModule (copy), getThumbnailUrlAsyncModule (copy), promiseModule (copy), var26 (ref), createImageAssetAsyncModule (copy), var52 (ref), var30 (ref), getGameMediaStore (copy), p0 (ref), fFlagMediaSelectorErrorLoggingModule (copy), formatErrorModule (copy), var46 (ref), var24 (ref), var59 (ref)
		if var41 == nil or var27 == nil or var43[var41] then return end
		editor_1("editor")
		var42(nil)
		local var88 = nil
		local var89 = nil
		
		if var41 ~= "icon" and var41 ~= "empty" then
			for i, v in var51.current do
				if v.id == var41 then
					var88 = i
					var89 = v
					break
				end
			end
			if var88 == nil or var89 == nil then return end
			if not var89.assetResourceName then return end
		end
		local current
		local _ = nil
		
		if var41 == "empty" then
			current = `thumbnail_pending_{var49.current}`
			var49.current += 1
		else
			current = var41
		end
		var58()
		var57(current, true)
		
		if var41 == "icon" then
			var34({ kind = "icon" })
		elseif var41 == "empty" then
			var32(function(p13) --[[ line: 355 ]]
				-- upvalues: current (write)
				local cloned = table.clone(p13)
				table.insert(cloned, { mediaType = "image", assetSource = nil, id = current })
				
				return cloned
			end)
			var34({ kind = "thumbnail", id = current })
		else
			var32(function(p14) --[[ line: 366 ]]
				-- upvalues: var41 (ref)
				local cloned = table.clone(p14)
				
				for i, v in cloned do
					if v.id == var41 then
						cloned[i] = { mediaType = "image", assetSource = nil, id = v.id }
						
						return cloned
					end
				end
				return cloned
			end)
		end
		local var91 = uploadCaptureAsyncModule(p12):andThen(function(p17) --[[ line: 383 ]]
			-- upvalues: getThumbnailUrlAsyncModule (copy)
			return getThumbnailUrlAsyncModule(p17.assetId)
		end):andThen(function(p15) --[[ line: 386 ]]
			-- upvalues: promiseModule (copy), var26 (copy), createImageAssetAsyncModule (copy), var41 (ref)
			if typeof(p15) == "table" and p15.status == "in_review" then
				return promiseModule.reject({
					code = "IN_REVIEW",
					message = "Capture is under moderation review"
				})
			end
			local imageUrl = p15.imageUrl
			
			return createImageAssetAsyncModule(imageUrl, nil, var41 == "icon", if var26 then {
				creatorType = var26.creatorType,
				creatorTargetId = var26.creatorTargetId
			} else nil):andThen(function(p16) --[[ line: 400 ]]
				-- upvalues: imageUrl (ref)
				return {
					imageAssetId = tostring(p16.assetId),
					displayUrl = imageUrl
				}
			end)
		end)
		local var92 = var91:andThen(function(p18) --[[ line: 408 ]]
			return p18.imageAssetId
		end)
		;(if var41 == "icon" then var52.setIcon(var27, var92) elseif var41 == "empty" then var52.addPreview(var27, var92) else var52.replacePreview(var27, var92, var89.assetResourceName)):andThen(function() --[[ line: 426 ]]
			-- upvalues: var91 (ref)
			return var91
		end):andThen(function(p23) --[[ line: 429 ]]
			-- upvalues: var41 (ref), var30 (copy), var32 (copy), current (write), var34 (copy), getGameMediaStore (copy), p0 (copy)
			if var41 == "icon" then
				var30(p23.displayUrl)
			else
				local imageAssetId = p23.imageAssetId
				var32(function(p24) --[[ line: 437 ]]
					-- upvalues: current (copy), imageAssetId (ref), p23 (ref)
					local cloned = table.clone(p24)
					
					for i, v in cloned do
						if v.id == current then
							cloned[i] = {
								mediaType = "image",
								id = imageAssetId,
								assetSource = p23.displayUrl,
								assetResourceName = `assets/{p23.imageAssetId}`
							}
							
							return cloned
						end
					end
					return cloned
				end)
				var34(function(p25) --[[ line: 452 ]]
					-- upvalues: current (copy), imageAssetId (ref)
					return if p25.kind == "thumbnail" and p25.id == current then { kind = "thumbnail", id = imageAssetId } else p25
				end)
			end
			getGameMediaStore().fetchGameMedia(tostring(p0.universeId))
		end):catch(function(p19) --[[ line: 461 ]]
			-- upvalues: fFlagMediaSelectorErrorLoggingModule (copy), formatErrorModule (copy), var46 (copy), var24 (copy), var41 (ref), var32 (copy), current (write), var34 (copy), var89 (write)
			if fFlagMediaSelectorErrorLoggingModule then
				warn(`[BuildExperience] MediaSelector upload failed: {formatErrorModule(p19)}`)
				var46(var24.mediaError)
			end
			if var41 == "icon" then return end
			if var41 == "empty" then
				var32(function(p20) --[[ line: 469 ]]
					-- upvalues: current (copy)
					local t = {}
					
					for i, v in p20 do
						if v.id ~= current then
							table.insert(t, v)
						end
					end
					return t
				end)
				var34(function(p21) --[[ line: 478 ]]
					-- upvalues: current (copy)
					return if p21.kind == "thumbnail" and p21.id == current then { kind = "icon" } else p21
				end)
				
				return
			end
			var32(function(p22) --[[ line: 485 ]]
				-- upvalues: current (copy), var89 (ref)
				local cloned = table.clone(p22)
				
				for i, v in cloned do
					if v.id == current then
						cloned[i] = var89
						
						return cloned
					end
				end
				return cloned
			end)
		end):finally(function() --[[ line: 497 ]]
			-- upvalues: var57 (copy), current (write), var59 (copy)
			var57(current, false)
			var59()
		end)
	end, {
		var41, var52, var27, var26, var43, var58, var59, var57, var24, p0.universeId
	})
	local var71 = reactModule.useCallback(function() --[[ line: 516 ]]
		-- upvalues: editor_1 (ref), var42 (ref)
		editor_1("editor")
		var42(nil)
	end, {})
	reactModule.useEffect(function() --[[ line: 521 ]]
		-- upvalues: p0 (ref), editor (ref), var71 (ref)
		local backHandlerRef = p0.backHandlerRef
		
		if backHandlerRef then
			backHandlerRef.current = if editor == "captureSelection" then var71 else nil
		end
		return function() --[[ line: 526 ]]
			-- upvalues: backHandlerRef (ref)
			if backHandlerRef then
				backHandlerRef.current = nil
			end
		end
	end, { editor, var71, p0.backHandlerRef })
	local var72 = reactModule.useMemo(function() --[[ line: 533 ]]
		-- upvalues: var37 (ref), var61 (ref)
		return if var37 then var61(var37) else { { items = {} } }
	end, { var37, var61 })
	
	if editor == "captureSelection" then
		return reactModule.createElement(captureSelectionViewModule, {
			captureSource = var50.current,
			onCaptureConfirmed = var70
		})
	end
	local mediaType = nil
	local assetSource = nil
	local var73 = false
	local id = false
	
	if var33.kind == "icon" then
		var73 = true
		assetSource = var29
		mediaType = "image"
		id = var43.icon or false
	elseif var33.kind == "thumbnail" then
		for i, v in var53 do
			if v.id == var33.id then
				mediaType = v.mediaType
				assetSource = v.assetSource
				id = var43[v.id] or false
				break
			end
		end
	end
	local t = {}
	local var76 = var35 and var37 == "icon"
	t.IconSlot = reactModule.createElement(filmstripSlotModule, {
		aspectRatio = "square",
		mediaType = "image",
		isFilled = true,
		LayoutOrder = 1,
		assetSource = var29,
		isSelected = var33.kind == "icon",
		isLoading = var43.icon or false,
		isMenuOpen = var76,
		menuItems = if var76 then var72 else nil,
		onMenuActivated = var63,
		onMenuClose = var64,
		onSelect = var65,
		onEditPressed = if var54 then var67 else nil
	})
	
	for i, v in var53 do
		local id_1 = v.id
		local var78 = var35 and var37 == id_1
		t[id_1] = reactModule.createElement(filmstripSlotModule, {
			aspectRatio = "wide",
			isFilled = true,
			mediaType = v.mediaType,
			assetSource = v.assetSource,
			isSelected = var33.kind == "thumbnail" and var33.id == id_1,
			isLoading = var43[id_1] or false,
			isMenuOpen = var78,
			menuItems = if var78 then var72 else nil,
			onMenuActivated = var63,
			onMenuClose = var64,
			onSelect = function() --[[ line: 603 ]]
				-- upvalues: var66 (ref), id_1 (ref)
				var66(id_1)
			end,
			onEditPressed = if var54 or id_1 ~= var56 then function() --[[ line: 607 ]]
				-- upvalues: var69 (ref), id_1 (ref)
				var69(id_1)
			end else nil,
			LayoutOrder = i + 1
		})
	end
	if var55 then
		local var77 = var35 and var37 == "empty"
		t.EmptySlot = reactModule.createElement(filmstripSlotModule, {
			aspectRatio = "wide",
			mediaType = nil,
			assetSource = nil,
			isFilled = false,
			isSelected = false,
			isMenuOpen = var77,
			menuItems = if var77 then var72 else nil,
			onMenuActivated = var63,
			onMenuClose = var64,
			onSelect = var68,
			onEmptySlotPressed = var68,
			LayoutOrder = #var53 + 2
		})
	end
	return reactModule.createElement(view, { tag = "col gap-xlarge size-full" }, {
		ErrorSnackbar = if fFlagMediaSelectorErrorLoggingModule and var45 ~= "" then reactModule.createElement(view, {
			tag = "row align-x-center size-full-0 auto-y padding-x-large",
			LayoutOrder = 0
		}, {
			Snackbar = reactModule.createElement(snackbar, {
				testId = "MediaSelector.error-snackbar",
				title = var45,
				onClose = var60
			})
		}) else nil,
		Preview = reactModule.createElement(view, {
			LayoutOrder = 1,
			testId = "MediaSelector.Preview",
			tag = {
				["align-x-center align-y-center fill size-full-0"] = true,
				["composition-content-body padding-y-xxlarge"] = fFlagBuildDesktopReadinessModule,
				["padding-xlarge"] = not fFlagBuildDesktopReadinessModule
			}
		}, {
			PreviewContent = reactModule.createElement(mediaPreviewModule, {
				mediaType = mediaType,
				assetSource = assetSource,
				isIcon = var73,
				isLoading = id
			})
		}),
		Filmstrip = if fFlagBuildDesktopReadinessModule then reactModule.createElement(scrollView, {
			tag = "size-full-0 auto-y",
			LayoutOrder = 2,
			testId = "MediaSelector.Filmstrip",
			padding = {
				top = UDim.new(0, var28.Padding.XXLarge),
				bottom = UDim.new(0, var28.Padding.XXLarge),
				left = UDim.new(0, var22.margin),
				right = UDim.new(0, var22.margin)
			},
			layout = {
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, var28.Gap.Medium)
			},
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.X,
				CanvasSize = UDim2.new(0, 0, 1, 0),
				ScrollingDirection = Enum.ScrollingDirection.X,
				scrollBarVisibility = foundationModule.Enums.Visibility.None
			}
		}, t) else reactModule.createElement(scrollView, {
			LayoutOrder = 2,
			testId = "MediaSelector.Filmstrip",
			Size = UDim2.new(1, 0, 0, var28.Size.Size_2400 + 2 * var28.Padding.Medium),
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.X,
				CanvasSize = UDim2.new(0, 0, 1, 0),
				ScrollingDirection = Enum.ScrollingDirection.X,
				scrollBarVisibility = foundationModule.Enums.Visibility.None
			}
		}, {
			FilmstripContent = reactModule.createElement(view, {
				tag = "row gap-medium auto-xy padding-xlarge",
				testId = "MediaSelector.FilmstripContent"
			}, t)
		})
	})
end