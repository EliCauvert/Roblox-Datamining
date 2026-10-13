local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local appCompositionModule = require(parent.AppComposition)
local promiseModule = require(parent.Promise)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local useCompositionLayout = appCompositionModule.useCompositionLayout
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
local fFlagMediaSelectorErrorLoggingModule = require(buildExperience.Flags.FFlagMediaSelectorErrorLogging)
local formatErrorModule = require(buildExperience.utils.formatError)
local snackbar = foundationModule.Snackbar

return function(p1)
	-- upvalues: useCompositionLayout (ref), useLocalization (ref), localizationStringsModule (ref), fFlagMediaSelectorErrorLoggingModule (ref), getGameMediaForUniverseModule (ref), reactModule (ref), universeConfigurationModule (ref), signalsReactModule (ref), useTokens (ref), createGalleryCaptureSourceModule (ref), useMediaUpdaterModule (ref), getGameMediaStore (ref), formatErrorModule (ref), uploadCaptureAsyncModule (ref), getThumbnailUrlAsyncModule (ref), promiseModule (ref), createImageAssetAsyncModule (ref), captureSelectionViewModule (ref), filmstripSlotModule (ref), view (ref), snackbar (ref), mediaPreviewModule (ref), scrollView (ref), foundationModule (ref)
	local var1 = useCompositionLayout()
	local var2 = useLocalization({
		captureLibrary = localizationStringsModule.MEDIA_SELECTION_CAPTURE_LIBRARY,
		delete = localizationStringsModule.MEDIA_SELECTION_DELETE
	})
	local var3 = if fFlagMediaSelectorErrorLoggingModule then useLocalization({ mediaError = "Feature.Moments.Label.Error" }) else nil
	local captureLibrary = var2.captureLibrary
	local delete = var2.delete
	local var4 = getGameMediaForUniverseModule(p1.universeId)
	local var5 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: universeConfigurationModule (copy), p1 (ref)
		return universeConfigurationModule.getUniverseConfigurationStore().getAndFetchSummary(p1.universeId)
	end, { p1.universeId }).data)
	local var6 = if var5 then tostring(var5.rootPlaceId) else nil
	local var7 = useTokens()
	local var8, var9 = reactModule.useState(var4.icon)
	local var10, var11 = reactModule.useState(var4.thumbnails)
	local var12, var13 = reactModule.useState({ kind = "icon" })
	local var14, var15 = reactModule.useState(false)
	local var16, var17 = reactModule.useState(nil)
	local editor, editor_1 = reactModule.useState("editor")
	local var18, var19 = reactModule.useState(nil)
	local var20, var21 = reactModule.useState({})
	local var22, var23 = reactModule.useState("")
	local var24 = reactModule.useRef(0)
	local var25 = reactModule.useRef(false)
	local var26 = reactModule.useRef(#var4.thumbnails + 1)
	local var27 = reactModule.useRef(nil)
	
	if var27.current == nil then
		var27.current = createGalleryCaptureSourceModule(nil, nil, { Enum.CaptureType.Screenshot })
	end
	local var28 = reactModule.useRef(var10)
	var28.current = var10
	reactModule.useRef(var8).current = var8
	local var29 = useMediaUpdaterModule()
	reactModule.useEffect(function()
		-- upvalues: var24 (ref), var11 (ref), var4 (ref)
		if var24.current == 0 then
			var11(var4.thumbnails)
			
			return
		end
	end, { var4.thumbnails })
	reactModule.useEffect(function()
		-- upvalues: var24 (ref), var9 (ref), var4 (ref)
		if var24.current == 0 then
			var9(var4.icon)
		end
	end, { var4.icon })
	local var30 = reactModule.useMemo(function()
		-- upvalues: var10 (ref)
		local t = {}
		
		for i, v in var10 do
			table.insert(t, v)
		end
		return t
	end, { var10 })
	local var31 = var6 ~= nil
	local var32 = #var30 < 10 and var31
	local var33 = if var30[1] then var30[1].id else nil
	local var34 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var21 (ref)
		var21(function(p4)
			-- upvalues: p2 (ref), p3 (ref)
			local cloned = table.clone(p4)
			cloned[p2] = if p3 then true else nil
			
			return cloned
		end)
	end, {})
	local var35 = reactModule.useCallback(function()
		-- upvalues: var24 (ref)
		var24.current += 1
	end, {})
	local var36 = reactModule.useCallback(function()
		-- upvalues: var24 (ref)
		var24.current = math.max(0, var24.current - 1)
	end, {})
	local var37 = reactModule.useCallback(function()
		-- upvalues: var23 (ref)
		var23("")
	end, {})
	local var38 = reactModule.useCallback(function(p2)
		-- upvalues: var31 (ref), captureLibrary (ref), var33 (ref), delete (ref)
		local t = {}
		
		if var31 then
			table.insert(t, {
				id = "capture_library",
				icon = "icons/common/image",
				text = captureLibrary
			})
		end
		if p2 ~= "icon" and p2 ~= var33 and p2 ~= "empty" then
			table.insert(t, {
				id = "delete",
				icon = "icons/common/trash",
				text = delete
			})
		end
		return { { items = t } }
	end, { var31, captureLibrary, delete, var33 })
	local var39 = reactModule.useCallback(function(p2)
		-- upvalues: var20 (ref), var25 (ref), var17 (ref), var15 (ref)
		if var20[p2] or var25.current and p2 ~= "icon" and p2 ~= "empty" then
			return
		end
		var17(p2)
		var15(true)
	end, { var20 })
	local var40 = reactModule.useCallback(function(p2)
		-- upvalues: var15 (ref), var25 (ref), var16 (ref), var31 (ref), var19 (ref), editor_1 (ref), var6 (ref), var20 (ref), var10 (ref), var35 (ref), var34 (ref), var11 (ref), var12 (ref), var13 (ref), var29 (ref), getGameMediaStore (copy), p1 (ref), fFlagMediaSelectorErrorLoggingModule (copy), formatErrorModule (copy), var23 (ref), var3 (ref), var36 (ref)
		var15(false)
		
		if var25.current and var16 ~= "icon" and var16 ~= "empty" then return end
		if p2 == "capture_library" and var31 then
			var19(var16)
			editor_1("captureSelection")
			
			return
		elseif p2 == "delete" then
			local var41 = var16
			
			if var41 == nil or var6 == nil or var20[var41] then return end
			local var42 = nil
			local var43 = nil
			
			for i, v in var10 do
				if v.id == var41 then
					var42 = i
					var43 = v
					break
				end
			end
			if var42 == nil or var43 == nil then return end
			local var44 = var43
			
			if not var44.assetResourceName then return end
			local assetResourceName = var44.assetResourceName
			var25.current = true
			var35()
			var34(var41, true)
			var11(function(p3)
				-- upvalues: var41 (ref)
				local t = {}
				
				for i, v in p3 do
					if v.id ~= var41 then
						table.insert(t, v)
					end
				end
				return t
			end)
			
			if var12.kind == "thumbnail" and var12.id == var41 then
				var13({ kind = "icon" })
			end
			var29.removePreview(var6, assetResourceName):andThen(function()
				-- upvalues: getGameMediaStore (copy), p1 (copy)
				getGameMediaStore().fetchGameMedia(tostring(p1.universeId))
			end):catch(function(p4)
				-- upvalues: fFlagMediaSelectorErrorLoggingModule (copy), formatErrorModule (copy), var23 (copy), var3 (copy), var11 (copy), var41 (ref), var42 (write), var44 (ref)
				if fFlagMediaSelectorErrorLoggingModule then
					warn(`[BuildExperience] MediaSelector delete failed: {formatErrorModule(p4)}`)
					var23(var3.mediaError)
				end
				var11(function(p5)
					-- upvalues: var41 (copy), var42 (copy), var44 (copy)
					for i, v in p5 do
						if v.id == var41 then
							return p5
						end
					end
					local cloned = table.clone(p5)
					table.insert(cloned, math.min(var42, #cloned + 1), var44)
					
					return cloned
				end)
			end):finally(function()
				-- upvalues: var25 (copy), var34 (copy), var41 (ref), var36 (copy)
				var25.current = false
				var34(var41, false)
				var36()
			end)
		end
	end, {
		var16, var12, var10, var29, var6, var31, var20, var35, var36, var34, var3,
		p1.universeId
	})
	local var45 = reactModule.useCallback(function()
		-- upvalues: var15 (ref)
		var15(false)
	end, {})
	local var46 = reactModule.useCallback(function()
		-- upvalues: var13 (ref)
		var13({ kind = "icon" })
	end, {})
	local var47 = reactModule.useCallback(function(p3)
		-- upvalues: var13 (ref)
		var13({ kind = "thumbnail", id = p3 })
	end, {})
	local var48 = reactModule.useCallback(function()
		-- upvalues: var39 (ref)
		var39("icon")
	end, { var39 })
	local var49 = reactModule.useCallback(function()
		-- upvalues: var39 (ref)
		var39("empty")
	end, { var39 })
	local var50 = reactModule.useCallback(function(p3)
		-- upvalues: var39 (ref)
		var39(p3)
	end, { var39 })
	local var51 = reactModule.useCallback(function(p3)
		-- upvalues: var18 (ref), var6 (ref), var20 (ref), editor_1 (ref), var19 (ref), var28 (ref), var26 (ref), var35 (ref), var34 (ref), var13 (ref), var11 (ref), uploadCaptureAsyncModule (copy), getThumbnailUrlAsyncModule (copy), promiseModule (copy), var5 (ref), createImageAssetAsyncModule (copy), var29 (ref), var9 (ref), getGameMediaStore (copy), p1 (ref), fFlagMediaSelectorErrorLoggingModule (copy), formatErrorModule (copy), var23 (ref), var3 (ref), var36 (ref)
		if var18 == nil or var6 == nil or var20[var18] then return end
		editor_1("editor")
		var19(nil)
		local var52 = nil
		local var53 = nil
		
		if var18 ~= "icon" and var18 ~= "empty" then
			for i, v in var28.current do
				if v.id == var18 then
					var52 = i
					var53 = v
					break
				end
			end
			if var52 == nil or var53 == nil then return end
			if not var53.assetResourceName then return end
		end
		local current
		local _ = nil
		
		if var18 == "empty" then
			current = `thumbnail_pending_{var26.current}`
			var26.current += 1
		else
			current = var18
		end
		var35()
		var34(current, true)
		
		if var18 == "icon" then
			var13({ kind = "icon" })
		elseif var18 == "empty" then
			var11(function(p4)
				-- upvalues: current (write)
				local cloned = table.clone(p4)
				table.insert(cloned, { mediaType = "image", assetSource = nil, id = current })
				
				return cloned
			end)
			var13({ kind = "thumbnail", id = current })
		else
			var11(function(p4)
				-- upvalues: var18 (ref)
				local cloned = table.clone(p4)
				
				for i, v in cloned do
					if v.id == var18 then
						cloned[i] = { mediaType = "image", assetSource = nil, id = v.id }
						
						return cloned
					end
				end
				return cloned
			end)
		end
		local var54 = uploadCaptureAsyncModule(p3):andThen(function(p4)
			-- upvalues: getThumbnailUrlAsyncModule (copy)
			return getThumbnailUrlAsyncModule(p4.assetId)
		end):andThen(function(p4)
			-- upvalues: promiseModule (copy), var5 (copy), createImageAssetAsyncModule (copy), var18 (ref)
			if typeof(p4) == "table" and p4.status == "in_review" then
				return promiseModule.reject({
					code = "IN_REVIEW",
					message = "Capture is under moderation review"
				})
			end
			local imageUrl = p4.imageUrl
			
			return createImageAssetAsyncModule(imageUrl, nil, var18 == "icon", if var5 then {
				creatorType = var5.creatorType,
				creatorTargetId = var5.creatorTargetId
			} else nil):andThen(function(p5)
				-- upvalues: imageUrl (ref)
				return {
					imageAssetId = tostring(p5.assetId),
					displayUrl = imageUrl
				}
			end)
		end)
		local var55 = var54:andThen(function(p4)
			return p4.imageAssetId
		end)
		;(if var18 == "icon" then var29.setIcon(var6, var55) elseif var18 == "empty" then var29.addPreview(var6, var55) else var29.replacePreview(var6, var55, var53.assetResourceName)):andThen(function()
			-- upvalues: var54 (ref)
			return var54
		end):andThen(function(p4)
			-- upvalues: var18 (ref), var9 (copy), var11 (copy), current (write), var13 (copy), getGameMediaStore (copy), p1 (copy)
			if var18 == "icon" then
				var9(p4.displayUrl)
			else
				local imageAssetId = p4.imageAssetId
				var11(function(p5)
					-- upvalues: current (copy), imageAssetId (ref), p4 (ref)
					local cloned = table.clone(p5)
					
					for i, v in cloned do
						if v.id == current then
							cloned[i] = {
								mediaType = "image",
								id = imageAssetId,
								assetSource = p4.displayUrl,
								assetResourceName = `assets/{p4.imageAssetId}`
							}
							
							return cloned
						end
					end
					return cloned
				end)
				var13(function(p6)
					-- upvalues: current (copy), imageAssetId (ref)
					return if p6.kind == "thumbnail" and p6.id == current then { kind = "thumbnail", id = imageAssetId } else p6
				end)
			end
			getGameMediaStore().fetchGameMedia(tostring(p1.universeId))
		end):catch(function(p5)
			-- upvalues: fFlagMediaSelectorErrorLoggingModule (copy), formatErrorModule (copy), var23 (copy), var3 (copy), var18 (ref), var11 (copy), current (write), var13 (copy), var53 (write)
			if fFlagMediaSelectorErrorLoggingModule then
				warn(`[BuildExperience] MediaSelector upload failed: {formatErrorModule(p5)}`)
				var23(var3.mediaError)
			end
			if var18 == "icon" then return end
			if var18 == "empty" then
				var11(function(p6)
					-- upvalues: current (copy)
					local t = {}
					
					for i, v in p6 do
						if v.id ~= current then
							table.insert(t, v)
						end
					end
					return t
				end)
				var13(function(p7)
					-- upvalues: current (copy)
					return if p7.kind == "thumbnail" and p7.id == current then { kind = "icon" } else p7
				end)
				
				return
			end
			var11(function(p6)
				-- upvalues: current (copy), var53 (ref)
				local cloned = table.clone(p6)
				
				for i, v in cloned do
					if v.id == current then
						cloned[i] = var53
						
						return cloned
					end
				end
				return cloned
			end)
		end):finally(function()
			-- upvalues: var34 (copy), current (write), var36 (copy)
			var34(current, false)
			var36()
		end)
	end, {
		var18, var29, var6, var5, var20, var35, var36, var34, var3, p1.universeId
	})
	local var56 = reactModule.useCallback(function()
		-- upvalues: editor_1 (ref), var19 (ref)
		editor_1("editor")
		var19(nil)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), editor (ref), var56 (ref)
		local backHandlerRef = p1.backHandlerRef
		
		if backHandlerRef then
			backHandlerRef.current = if editor == "captureSelection" then var56 else nil
		end
		return function()
			-- upvalues: backHandlerRef (ref)
			if backHandlerRef then
				backHandlerRef.current = nil
			end
		end
	end, { editor, var56, p1.backHandlerRef })
	local var57 = reactModule.useMemo(function()
		-- upvalues: var16 (ref), var38 (ref)
		return if var16 then var38(var16) else { { items = {} } }
	end, { var16, var38 })
	
	if editor == "captureSelection" then
		return reactModule.createElement(captureSelectionViewModule, {
			captureSource = var27.current,
			onCaptureConfirmed = var51
		})
	end
	local v
	local mediaType = nil
	local assetSource = nil
	local var58 = false
	local id = false
	
	if var12.kind == "icon" then
		var58 = true
		assetSource = var8
		mediaType = "image"
		id = var20.icon or false
	elseif var12.kind == "thumbnail" then
		for i, v in var30 do
			if v.id == var12.id then
				mediaType = v.mediaType
				assetSource = v.assetSource
				id = var20[v.id] or false
				break
			end
		end
	end
	local t = {}
	local var59 = var14 and var16 == "icon"
	t.IconSlot = reactModule.createElement(filmstripSlotModule, {
		aspectRatio = "square",
		mediaType = "image",
		isFilled = true,
		LayoutOrder = 1,
		assetSource = var8,
		isSelected = var12.kind == "icon",
		isLoading = var20.icon or false,
		isMenuOpen = var59,
		menuItems = if var59 then var57 else nil,
		onMenuActivated = var40,
		onMenuClose = var45,
		onSelect = var46,
		onEditPressed = if var31 then var48 else nil
	})
	
	for i, v in var30 do
		local id_1 = v.id
		local var60 = var14 and var16 == id_1
		t[id_1] = reactModule.createElement(filmstripSlotModule, {
			aspectRatio = "wide",
			isFilled = true,
			mediaType = v.mediaType,
			assetSource = v.assetSource,
			isSelected = var12.kind == "thumbnail" and var12.id == id_1,
			isLoading = var20[id_1] or false,
			isMenuOpen = var60,
			menuItems = if var60 then var57 else nil,
			onMenuActivated = var40,
			onMenuClose = var45,
			onSelect = function()
				-- upvalues: var47 (ref), id_1 (ref)
				var47(id_1)
			end,
			onEditPressed = if var31 or id_1 ~= var33 then function()
				-- upvalues: var50 (ref), id_1 (ref)
				var50(id_1)
			end else nil,
			LayoutOrder = i + 1
		})
	end
	if var32 then
		local var61 = var14 and var16 == "empty"
		t.EmptySlot = reactModule.createElement(filmstripSlotModule, {
			aspectRatio = "wide",
			mediaType = nil,
			assetSource = nil,
			isFilled = false,
			isSelected = false,
			isMenuOpen = var61,
			menuItems = if var61 then var57 else nil,
			onMenuActivated = var40,
			onMenuClose = var45,
			onSelect = var49,
			onEmptySlotPressed = var49,
			LayoutOrder = #var30 + 2
		})
	end
	v = { tag = "col gap-xlarge size-full" }
	
	return reactModule.createElement(view, v, {
		ErrorSnackbar = if fFlagMediaSelectorErrorLoggingModule and var22 ~= "" then reactModule.createElement(view, {
			tag = "row align-x-center size-full-0 auto-y padding-x-large",
			LayoutOrder = 0
		}, {
			Snackbar = reactModule.createElement(snackbar, {
				testId = "MediaSelector.error-snackbar",
				title = var22,
				onClose = var37
			})
		}) else nil,
		Preview = reactModule.createElement(view, {
			LayoutOrder = 1,
			testId = "MediaSelector.Preview",
			tag = {
				["align-x-center align-y-center fill size-full-0"] = true,
				["composition-content-body padding-y-xxlarge"] = true
			}
		}, {
			PreviewContent = reactModule.createElement(mediaPreviewModule, {
				mediaType = mediaType,
				assetSource = assetSource,
				isIcon = var58,
				isLoading = id
			})
		}),
		Filmstrip = reactModule.createElement(scrollView, {
			tag = "size-full-0 auto-y",
			LayoutOrder = 2,
			testId = "MediaSelector.Filmstrip",
			padding = {
				top = UDim.new(0, var7.Padding.XXLarge),
				bottom = UDim.new(0, var7.Padding.XXLarge),
				left = UDim.new(0, var1.margin),
				right = UDim.new(0, var1.margin)
			},
			layout = {
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, var7.Gap.Medium)
			},
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.X,
				CanvasSize = UDim2.new(0, 0, 1, 0),
				ScrollingDirection = Enum.ScrollingDirection.X,
				scrollBarVisibility = foundationModule.Enums.Visibility.None
			}
		}, t)
	})
end