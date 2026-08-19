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

return function(p0) --[[ line: 55 | named "IconThumbnailsEditor" ]]
	-- upvalues: fFlagBuildDesktopReadinessModule (ref), var8 (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), getGameMediaForUniverseModule (ref), reactModule (ref), universeConfigurationModule (ref), signalsReactModule (ref), useTokens (ref), createGalleryCaptureSourceModule (ref), useMediaUpdaterModule (ref), getGameMediaStore (ref), uploadCaptureAsyncModule (ref), getThumbnailUrlAsyncModule (ref), promiseModule (ref), createImageAssetAsyncModule (ref), captureSelectionViewModule (ref), filmstripSlotModule (ref), view (ref), mediaPreviewModule (ref), scrollView (ref), foundationModule (ref)
	local MEDIA_SELECTION_CAPTURE_LIBRARY, MEDIA_SELECTION_DELETE
	local var20 = if fFlagBuildDesktopReadinessModule then var8() else nil
	local var21 = if fFlagBuildLocalization then useLocalization({
		captureLibrary = localizationStringsModule.MEDIA_SELECTION_CAPTURE_LIBRARY,
		delete = localizationStringsModule.MEDIA_SELECTION_DELETE
	}) else nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		MEDIA_SELECTION_CAPTURE_LIBRARY = var21.captureLibrary
		MEDIA_SELECTION_DELETE = var21.delete
	else
		MEDIA_SELECTION_CAPTURE_LIBRARY = localizationStringsModule.MEDIA_SELECTION_CAPTURE_LIBRARY
		MEDIA_SELECTION_DELETE = localizationStringsModule.MEDIA_SELECTION_DELETE
	end
	local var22 = getGameMediaForUniverseModule(p0.universeId)
	local var23 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 73 ]]
		-- upvalues: universeConfigurationModule (copy), p0 (ref)
		return universeConfigurationModule.getUniverseConfigurationStore().getAndFetchSummary(p0.universeId)
	end, { p0.universeId }).data)
	local var24 = if var23 then tostring(var23.rootPlaceId) else nil
	local var25 = useTokens()
	local var26, var27 = reactModule.useState(var22.icon)
	local var28, var29 = reactModule.useState(var22.thumbnails)
	local var30, var31 = reactModule.useState({ kind = "icon" })
	local var32, var33 = reactModule.useState(false)
	local var34, var35 = reactModule.useState(nil)
	local editor, editor_1 = reactModule.useState("editor")
	local var38, var39 = reactModule.useState(nil)
	local var40, var41 = reactModule.useState({})
	local var42 = reactModule.useRef(0)
	local var43 = reactModule.useRef(false)
	local var44 = reactModule.useRef(#var22.thumbnails + 1)
	local var45 = reactModule.useRef(nil)
	
	if var45.current == nil then
		var45.current = createGalleryCaptureSourceModule(nil, nil, { Enum.CaptureType.Screenshot })
	end
	local var46 = reactModule.useRef(var28)
	var46.current = var28
	reactModule.useRef(var26).current = var26
	local var47 = useMediaUpdaterModule()
	reactModule.useEffect(function() --[[ line: 104 ]]
		-- upvalues: var42 (ref), var29 (ref), var22 (ref)
		if var42.current == 0 then
			var29(var22.thumbnails)
			
			return
		end
	end, { var22.thumbnails })
	reactModule.useEffect(function() --[[ line: 115 ]]
		-- upvalues: var42 (ref), var27 (ref), var22 (ref)
		if var42.current == 0 then
			var27(var22.icon)
		end
	end, { var22.icon })
	local var48 = reactModule.useMemo(function() --[[ line: 121 ]]
		-- upvalues: var28 (ref)
		local t = {}
		
		for i, v in var28 do
			table.insert(t, v)
		end
		return t
	end, { var28 })
	local var49 = var24 ~= nil
	local var50 = #var48 < 10 and var49
	local var51 = if var48[1] then var48[1].id else nil
	local var52 = reactModule.useCallback(function(p1, p2) --[[ line: 136 ]]
		-- upvalues: var41 (ref)
		var41(function(p3) --[[ line: 137 ]]
			-- upvalues: p1 (ref), p2 (ref)
			local cloned = table.clone(p3)
			cloned[p1] = if p2 then true else nil
			
			return cloned
		end)
	end, {})
	local var53 = reactModule.useCallback(function() --[[ line: 144 ]]
		-- upvalues: var42 (ref)
		var42.current += 1
	end, {})
	local var54 = reactModule.useCallback(function() --[[ line: 148 ]]
		-- upvalues: var42 (ref)
		var42.current = math.max(0, var42.current - 1)
	end, {})
	local var55 = reactModule.useCallback(function(p4) --[[ line: 152 ]]
		-- upvalues: var49 (ref), MEDIA_SELECTION_CAPTURE_LIBRARY (write), var51 (ref), MEDIA_SELECTION_DELETE (write)
		local t = {}
		
		if var49 then
			table.insert(t, {
				id = "capture_library",
				icon = "icons/common/image",
				text = MEDIA_SELECTION_CAPTURE_LIBRARY
			})
		end
		if p4 ~= "icon" and p4 ~= var51 and p4 ~= "empty" then
			table.insert(t, {
				id = "delete",
				icon = "icons/common/trash",
				text = MEDIA_SELECTION_DELETE
			})
		end
		return { { items = t } }
	end, {
		var49,
		MEDIA_SELECTION_CAPTURE_LIBRARY,
		MEDIA_SELECTION_DELETE,
		var51
	})
	local var56 = reactModule.useCallback(function(p5) --[[ line: 173 ]]
		-- upvalues: var40 (ref), var43 (ref), var35 (ref), var33 (ref)
		if var40[p5] or var43.current and p5 ~= "icon" and p5 ~= "empty" then
			return
		end
		var35(p5)
		var33(true)
	end, { var40 })
	local var57 = reactModule.useCallback(function(p6) --[[ line: 182 ]]
		-- upvalues: var33 (ref), var43 (ref), var34 (ref), var49 (ref), var39 (ref), editor_1 (ref), var24 (ref), var40 (ref), var28 (ref), var53 (ref), var52 (ref), var29 (ref), var30 (ref), var31 (ref), var47 (ref), getGameMediaStore (copy), p0 (ref), var54 (ref)
		var33(false)
		
		if var43.current and var34 ~= "icon" and var34 ~= "empty" then return end
		if p6 == "capture_library" and var49 then
			var39(var34)
			editor_1("captureSelection")
			
			return
		elseif p6 == "delete" then
			local var76 = var34
			
			if var76 == nil or var24 == nil or var40[var76] then return end
			local var77 = nil
			local var78 = nil
			
			for i, v in var28 do
				if v.id == var76 then
					var77 = i
					var78 = v
					break
				end
			end
			if var77 == nil or var78 == nil then return end
			local var79 = var78
			
			if not var79.assetResourceName then return end
			local assetResourceName = var79.assetResourceName
			var43.current = true
			var53()
			var52(var76, true)
			var29(function(p7) --[[ line: 218 ]]
				-- upvalues: var76 (ref)
				local t = {}
				
				for i, v in p7 do
					if v.id ~= var76 then
						table.insert(t, v)
					end
				end
				return t
			end)
			
			if var30.kind == "thumbnail" and var30.id == var76 then
				var31({ kind = "icon" })
			end
			var47.removePreview(var24, assetResourceName):andThen(function() --[[ line: 233 ]]
				-- upvalues: getGameMediaStore (copy), p0 (copy)
				getGameMediaStore().fetchGameMedia(tostring(p0.universeId))
			end):catch(function() --[[ line: 236 ]]
				-- upvalues: var29 (copy), var76 (ref), var77 (write), var79 (ref)
				var29(function(p8) --[[ line: 237 ]]
					-- upvalues: var76 (copy), var77 (copy), var79 (copy)
					for i, v in p8 do
						if v.id == var76 then
							return p8
						end
					end
					local cloned = table.clone(p8)
					table.insert(cloned, math.min(var77, #cloned + 1), var79)
					
					return cloned
				end)
			end):finally(function() --[[ line: 248 ]]
				-- upvalues: var43 (copy), var52 (copy), var76 (ref), var54 (copy)
				var43.current = false
				var52(var76, false)
				var54()
			end)
		end
	end, {
		var34, var30, var28, var47, var24, var49, var40, var53, var54, var52
	})
	local var58 = reactModule.useCallback(function() --[[ line: 269 ]]
		-- upvalues: var33 (ref)
		var33(false)
	end, {})
	local var59 = reactModule.useCallback(function() --[[ line: 273 ]]
		-- upvalues: var31 (ref)
		var31({ kind = "icon" })
	end, {})
	local var60 = reactModule.useCallback(function(p9) --[[ line: 277 ]]
		-- upvalues: var31 (ref)
		var31({ kind = "thumbnail", id = p9 })
	end, {})
	local var61 = reactModule.useCallback(function() --[[ line: 281 ]]
		-- upvalues: var56 (ref)
		var56("icon")
	end, { var56 })
	local var62 = reactModule.useCallback(function() --[[ line: 285 ]]
		-- upvalues: var56 (ref)
		var56("empty")
	end, { var56 })
	local var63 = reactModule.useCallback(function(p10) --[[ line: 289 ]]
		-- upvalues: var56 (ref)
		var56(p10)
	end, { var56 })
	local var64 = reactModule.useCallback(function(p11) --[[ line: 294 ]]
		-- upvalues: var38 (ref), var24 (ref), var40 (ref), editor_1 (ref), var39 (ref), var46 (ref), var44 (ref), var53 (ref), var52 (ref), var31 (ref), var29 (ref), uploadCaptureAsyncModule (copy), getThumbnailUrlAsyncModule (copy), promiseModule (copy), var23 (ref), createImageAssetAsyncModule (copy), var47 (ref), var27 (ref), getGameMediaStore (copy), p0 (ref), var54 (ref)
		if var38 == nil or var24 == nil or var40[var38] then return end
		editor_1("editor")
		var39(nil)
		local var82 = nil
		local var83 = nil
		
		if var38 ~= "icon" and var38 ~= "empty" then
			for i, v in var46.current do
				if v.id == var38 then
					var82 = i
					var83 = v
					break
				end
			end
			if var82 == nil or var83 == nil then return end
			if not var83.assetResourceName then return end
		end
		local current
		local _ = nil
		
		if var38 == "empty" then
			current = `thumbnail_pending_{var44.current}`
			var44.current += 1
		else
			current = var38
		end
		var53()
		var52(current, true)
		
		if var38 == "icon" then
			var31({ kind = "icon" })
		elseif var38 == "empty" then
			var29(function(p12) --[[ line: 335 ]]
				-- upvalues: current (write)
				local cloned = table.clone(p12)
				table.insert(cloned, { mediaType = "image", assetSource = nil, id = current })
				
				return cloned
			end)
			var31({ kind = "thumbnail", id = current })
		else
			var29(function(p13) --[[ line: 346 ]]
				-- upvalues: var38 (ref)
				local cloned = table.clone(p13)
				
				for i, v in cloned do
					if v.id == var38 then
						cloned[i] = { mediaType = "image", assetSource = nil, id = v.id }
						
						return cloned
					end
				end
				return cloned
			end)
		end
		local var85 = uploadCaptureAsyncModule(p11):andThen(function(p16) --[[ line: 363 ]]
			-- upvalues: getThumbnailUrlAsyncModule (copy)
			return getThumbnailUrlAsyncModule(p16.assetId)
		end):andThen(function(p14) --[[ line: 366 ]]
			-- upvalues: promiseModule (copy), var23 (copy), createImageAssetAsyncModule (copy), var38 (ref)
			if typeof(p14) == "table" and p14.status == "in_review" then
				return promiseModule.reject({
					code = "IN_REVIEW",
					message = "Capture is under moderation review"
				})
			end
			local imageUrl = p14.imageUrl
			
			return createImageAssetAsyncModule(imageUrl, nil, var38 == "icon", if var23 then {
				creatorType = var23.creatorType,
				creatorTargetId = var23.creatorTargetId
			} else nil):andThen(function(p15) --[[ line: 380 ]]
				-- upvalues: imageUrl (ref)
				return {
					imageAssetId = tostring(p15.assetId),
					displayUrl = imageUrl
				}
			end)
		end)
		local var86 = var85:andThen(function(p17) --[[ line: 388 ]]
			return p17.imageAssetId
		end)
		;(if var38 == "icon" then var47.setIcon(var24, var86) elseif var38 == "empty" then var47.addPreview(var24, var86) else var47.replacePreview(var24, var86, var83.assetResourceName)):andThen(function() --[[ line: 406 ]]
			-- upvalues: var85 (ref)
			return var85
		end):andThen(function(p21) --[[ line: 409 ]]
			-- upvalues: var38 (ref), var27 (copy), var29 (copy), current (write), var31 (copy), getGameMediaStore (copy), p0 (copy)
			if var38 == "icon" then
				var27(p21.displayUrl)
			else
				local imageAssetId = p21.imageAssetId
				var29(function(p22) --[[ line: 417 ]]
					-- upvalues: current (copy), imageAssetId (ref), p21 (ref)
					local cloned = table.clone(p22)
					
					for i, v in cloned do
						if v.id == current then
							cloned[i] = {
								mediaType = "image",
								id = imageAssetId,
								assetSource = p21.displayUrl,
								assetResourceName = `assets/{p21.imageAssetId}`
							}
							
							return cloned
						end
					end
					return cloned
				end)
				var31(function(p23) --[[ line: 432 ]]
					-- upvalues: current (copy), imageAssetId (ref)
					return if p23.kind == "thumbnail" and p23.id == current then { kind = "thumbnail", id = imageAssetId } else p23
				end)
			end
			getGameMediaStore().fetchGameMedia(tostring(p0.universeId))
		end):catch(function() --[[ line: 441 ]]
			-- upvalues: var38 (ref), var29 (copy), current (write), var31 (copy), var83 (write)
			if var38 == "icon" then return end
			if var38 == "empty" then
				var29(function(p18) --[[ line: 445 ]]
					-- upvalues: current (copy)
					local t = {}
					
					for i, v in p18 do
						if v.id ~= current then
							table.insert(t, v)
						end
					end
					return t
				end)
				var31(function(p19) --[[ line: 454 ]]
					-- upvalues: current (copy)
					return if p19.kind == "thumbnail" and p19.id == current then { kind = "icon" } else p19
				end)
				
				return
			end
			var29(function(p20) --[[ line: 461 ]]
				-- upvalues: current (copy), var83 (ref)
				local cloned = table.clone(p20)
				
				for i, v in cloned do
					if v.id == current then
						cloned[i] = var83
						
						return cloned
					end
				end
				return cloned
			end)
		end):finally(function() --[[ line: 473 ]]
			-- upvalues: var52 (copy), current (write), var54 (copy)
			var52(current, false)
			var54()
		end)
	end, {
		var38, var47, var24, var23, var40, var53, var54, var52
	})
	local var65 = reactModule.useCallback(function() --[[ line: 490 ]]
		-- upvalues: editor_1 (ref), var39 (ref)
		editor_1("editor")
		var39(nil)
	end, {})
	reactModule.useEffect(function() --[[ line: 495 ]]
		-- upvalues: p0 (ref), editor (ref), var65 (ref)
		local backHandlerRef = p0.backHandlerRef
		
		if backHandlerRef then
			backHandlerRef.current = if editor == "captureSelection" then var65 else nil
		end
		return function() --[[ line: 500 ]]
			-- upvalues: backHandlerRef (ref)
			if backHandlerRef then
				backHandlerRef.current = nil
			end
		end
	end, { editor, var65 })
	local var66 = reactModule.useMemo(function() --[[ line: 507 ]]
		-- upvalues: var34 (ref), var55 (ref)
		return if var34 then var55(var34) else { { items = {} } }
	end, { var34, var55 })
	
	if editor == "captureSelection" then
		return reactModule.createElement(captureSelectionViewModule, {
			captureSource = var45.current,
			onCaptureConfirmed = var64
		})
	end
	local mediaType = nil
	local assetSource = nil
	local var67 = false
	local id = false
	
	if var30.kind == "icon" then
		var67 = true
		assetSource = var26
		mediaType = "image"
		id = var40.icon or false
	elseif var30.kind == "thumbnail" then
		for i, v in var48 do
			if v.id == var30.id then
				mediaType = v.mediaType
				assetSource = v.assetSource
				id = var40[v.id] or false
				break
			end
		end
	end
	local t = {}
	local var70 = var32 and var34 == "icon"
	t.IconSlot = reactModule.createElement(filmstripSlotModule, {
		aspectRatio = "square",
		mediaType = "image",
		isFilled = true,
		LayoutOrder = 1,
		assetSource = var26,
		isSelected = var30.kind == "icon",
		isLoading = var40.icon or false,
		isMenuOpen = var70,
		menuItems = if var70 then var66 else nil,
		onMenuActivated = var57,
		onMenuClose = var58,
		onSelect = var59,
		onEditPressed = if var49 then var61 else nil
	})
	
	for i, v in var48 do
		local id_1 = v.id
		local var72 = var32 and var34 == id_1
		t[id_1] = reactModule.createElement(filmstripSlotModule, {
			aspectRatio = "wide",
			isFilled = true,
			mediaType = v.mediaType,
			assetSource = v.assetSource,
			isSelected = var30.kind == "thumbnail" and var30.id == id_1,
			isLoading = var40[id_1] or false,
			isMenuOpen = var72,
			menuItems = if var72 then var66 else nil,
			onMenuActivated = var57,
			onMenuClose = var58,
			onSelect = function() --[[ line: 577 ]]
				-- upvalues: var60 (ref), id_1 (ref)
				var60(id_1)
			end,
			onEditPressed = if var49 or id_1 ~= var51 then function() --[[ line: 581 ]]
				-- upvalues: var63 (ref), id_1 (ref)
				var63(id_1)
			end else nil,
			LayoutOrder = i + 1
		})
	end
	if var50 then
		local var71 = var32 and var34 == "empty"
		t.EmptySlot = reactModule.createElement(filmstripSlotModule, {
			aspectRatio = "wide",
			mediaType = nil,
			assetSource = nil,
			isFilled = false,
			isSelected = false,
			isMenuOpen = var71,
			menuItems = if var71 then var66 else nil,
			onMenuActivated = var57,
			onMenuClose = var58,
			onSelect = var62,
			onEmptySlotPressed = var62,
			LayoutOrder = #var48 + 2
		})
	end
	return reactModule.createElement(view, { tag = "col gap-xlarge size-full" }, {
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
				isIcon = var67,
				isLoading = id
			})
		}),
		Filmstrip = if fFlagBuildDesktopReadinessModule then reactModule.createElement(scrollView, {
			tag = "size-full-0 auto-y",
			LayoutOrder = 2,
			testId = "MediaSelector.Filmstrip",
			padding = {
				top = UDim.new(0, var25.Padding.XXLarge),
				bottom = UDim.new(0, var25.Padding.XXLarge),
				left = UDim.new(0, var20.margin),
				right = UDim.new(0, var20.margin)
			},
			layout = {
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, var25.Gap.Medium)
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
			Size = UDim2.new(1, 0, 0, var25.Size.Size_2400 + 2 * var25.Padding.Medium),
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