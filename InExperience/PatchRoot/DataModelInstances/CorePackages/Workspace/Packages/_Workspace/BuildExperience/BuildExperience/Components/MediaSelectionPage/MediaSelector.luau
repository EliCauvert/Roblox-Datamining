local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local fFlagBuildDesktopReadinessModule = require(buildExperience.Flags.FFlagBuildDesktopReadiness)
local var1 = if fFlagBuildDesktopReadinessModule then require(parent.AppComposition) else nil
local promiseModule = require(parent.Promise)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local var2 = if fFlagBuildDesktopReadinessModule then var1.useCompositionLayout else nil
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
	-- upvalues: fFlagBuildDesktopReadinessModule (ref), var2 (ref), useLocalization (ref), localizationStringsModule (ref), fFlagMediaSelectorErrorLoggingModule (ref), getGameMediaForUniverseModule (ref), reactModule (ref), universeConfigurationModule (ref), signalsReactModule (ref), useTokens (ref), createGalleryCaptureSourceModule (ref), useMediaUpdaterModule (ref), getGameMediaStore (ref), formatErrorModule (ref), uploadCaptureAsyncModule (ref), getThumbnailUrlAsyncModule (ref), promiseModule (ref), createImageAssetAsyncModule (ref), captureSelectionViewModule (ref), filmstripSlotModule (ref), view (ref), snackbar (ref), mediaPreviewModule (ref), scrollView (ref), foundationModule (ref)
	local var3 = if fFlagBuildDesktopReadinessModule then var2() else nil
	local var4 = useLocalization({
		captureLibrary = localizationStringsModule.MEDIA_SELECTION_CAPTURE_LIBRARY,
		delete = localizationStringsModule.MEDIA_SELECTION_DELETE
	})
	local var5 = if fFlagMediaSelectorErrorLoggingModule then useLocalization({ mediaError = "Feature.Moments.Label.Error" }) else nil
	local captureLibrary = var4.captureLibrary
	local delete = var4.delete
	local var6 = getGameMediaForUniverseModule(p1.universeId)
	local var7 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: universeConfigurationModule (copy), p1 (ref)
		return universeConfigurationModule.getUniverseConfigurationStore().getAndFetchSummary(p1.universeId)
	end, { p1.universeId }).data)
	local var8 = if var7 then tostring(var7.rootPlaceId) else nil
	local var9 = useTokens()
	local var10, var11 = reactModule.useState(var6.icon)
	local var12, var13 = reactModule.useState(var6.thumbnails)
	local var14, var15 = reactModule.useState({ kind = "icon" })
	local var16, var17 = reactModule.useState(false)
	local var18, var19 = reactModule.useState(nil)
	local editor, editor_1 = reactModule.useState("editor")
	local var20, var21 = reactModule.useState(nil)
	local var22, var23 = reactModule.useState({})
	local var24, var25 = reactModule.useState("")
	local var26 = reactModule.useRef(0)
	local var27 = reactModule.useRef(false)
	local var28 = reactModule.useRef(#var6.thumbnails + 1)
	local var29 = reactModule.useRef(nil)
	
	if var29.current == nil then
		var29.current = createGalleryCaptureSourceModule(nil, nil, { Enum.CaptureType.Screenshot })
	end
	local var30 = reactModule.useRef(var12)
	var30.current = var12
	reactModule.useRef(var10).current = var10
	local var31 = useMediaUpdaterModule()
	reactModule.useEffect(function()
		-- upvalues: var26 (ref), var13 (ref), var6 (ref)
		if var26.current == 0 then
			var13(var6.thumbnails)
			
			return
		end
	end, { var6.thumbnails })
	reactModule.useEffect(function()
		-- upvalues: var26 (ref), var11 (ref), var6 (ref)
		if var26.current == 0 then
			var11(var6.icon)
		end
	end, { var6.icon })
	local var32 = reactModule.useMemo(function()
		-- upvalues: var12 (ref)
		local t = {}
		
		for i, v in var12 do
			table.insert(t, v)
		end
		return t
	end, { var12 })
	local var33 = var8 ~= nil
	local var34 = #var32 < 10 and var33
	local var35 = if var32[1] then var32[1].id else nil
	local var36 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var23 (ref)
		var23(function(p4)
			-- upvalues: p2 (ref), p3 (ref)
			local cloned = table.clone(p4)
			cloned[p2] = if p3 then true else nil
			
			return cloned
		end)
	end, {})
	local var37 = reactModule.useCallback(function()
		-- upvalues: var26 (ref)
		var26.current += 1
	end, {})
	local var38 = reactModule.useCallback(function()
		-- upvalues: var26 (ref)
		var26.current = math.max(0, var26.current - 1)
	end, {})
	local var39 = reactModule.useCallback(function()
		-- upvalues: var25 (ref)
		var25("")
	end, {})
	local var40 = reactModule.useCallback(function(p2)
		-- upvalues: var33 (ref), captureLibrary (ref), var35 (ref), delete (ref)
		local t = {}
		
		if var33 then
			table.insert(t, {
				id = "capture_library",
				icon = "icons/common/image",
				text = captureLibrary
			})
		end
		if p2 ~= "icon" and p2 ~= var35 and p2 ~= "empty" then
			table.insert(t, {
				id = "delete",
				icon = "icons/common/trash",
				text = delete
			})
		end
		return { { items = t } }
	end, { var33, captureLibrary, delete, var35 })
	local var41 = reactModule.useCallback(function(p2)
		-- upvalues: var22 (ref), var27 (ref), var19 (ref), var17 (ref)
		if var22[p2] or var27.current and p2 ~= "icon" and p2 ~= "empty" then
			return
		end
		var19(p2)
		var17(true)
	end, { var22 })
	local var42 = reactModule.useCallback(function(p2)
		-- upvalues: var17 (ref), var27 (ref), var18 (ref), var33 (ref), var21 (ref), editor_1 (ref), var8 (ref), var22 (ref), var12 (ref), var37 (ref), var36 (ref), var13 (ref), var14 (ref), var15 (ref), var31 (ref), getGameMediaStore (copy), p1 (ref), fFlagMediaSelectorErrorLoggingModule (copy), formatErrorModule (copy), var25 (ref), var5 (ref), var38 (ref)
		var17(false)
		
		if var27.current and var18 ~= "icon" and var18 ~= "empty" then return end
		if p2 == "capture_library" and var33 then
			var21(var18)
			editor_1("captureSelection")
			
			return
		elseif p2 == "delete" then
			local var43 = var18
			
			if var43 == nil or var8 == nil or var22[var43] then return end
			local var44 = nil
			local var45 = nil
			
			for i, v in var12 do
				if v.id == var43 then
					var44 = i
					var45 = v
					break
				end
			end
			if var44 == nil or var45 == nil then return end
			local var46 = var45
			
			if not var46.assetResourceName then return end
			local assetResourceName = var46.assetResourceName
			var27.current = true
			var37()
			var36(var43, true)
			var13(function(p3)
				-- upvalues: var43 (ref)
				local t = {}
				
				for i, v in p3 do
					if v.id ~= var43 then
						table.insert(t, v)
					end
				end
				return t
			end)
			
			if var14.kind == "thumbnail" and var14.id == var43 then
				var15({ kind = "icon" })
			end
			var31.removePreview(var8, assetResourceName):andThen(function()
				-- upvalues: getGameMediaStore (copy), p1 (copy)
				getGameMediaStore().fetchGameMedia(tostring(p1.universeId))
			end):catch(function(p4)
				-- upvalues: fFlagMediaSelectorErrorLoggingModule (copy), formatErrorModule (copy), var25 (copy), var5 (copy), var13 (copy), var43 (ref), var44 (write), var46 (ref)
				if fFlagMediaSelectorErrorLoggingModule then
					warn(`[BuildExperience] MediaSelector delete failed: {formatErrorModule(p4)}`)
					var25(var5.mediaError)
				end
				var13(function(p5)
					-- upvalues: var43 (copy), var44 (copy), var46 (copy)
					for i, v in p5 do
						if v.id == var43 then
							return p5
						end
					end
					local cloned = table.clone(p5)
					table.insert(cloned, math.min(var44, #cloned + 1), var46)
					
					return cloned
				end)
			end):finally(function()
				-- upvalues: var27 (copy), var36 (copy), var43 (ref), var38 (copy)
				var27.current = false
				var36(var43, false)
				var38()
			end)
		end
	end, {
		var18, var14, var12, var31, var8, var33, var22, var37, var38, var36, var5,
		p1.universeId
	})
	local var47 = reactModule.useCallback(function()
		-- upvalues: var17 (ref)
		var17(false)
	end, {})
	local var48 = reactModule.useCallback(function()
		-- upvalues: var15 (ref)
		var15({ kind = "icon" })
	end, {})
	local var49 = reactModule.useCallback(function(p3)
		-- upvalues: var15 (ref)
		var15({ kind = "thumbnail", id = p3 })
	end, {})
	local var50 = reactModule.useCallback(function()
		-- upvalues: var41 (ref)
		var41("icon")
	end, { var41 })
	local var51 = reactModule.useCallback(function()
		-- upvalues: var41 (ref)
		var41("empty")
	end, { var41 })
	local var52 = reactModule.useCallback(function(p3)
		-- upvalues: var41 (ref)
		var41(p3)
	end, { var41 })
	local var53 = reactModule.useCallback(function(p3)
		-- upvalues: var20 (ref), var8 (ref), var22 (ref), editor_1 (ref), var21 (ref), var30 (ref), var28 (ref), var37 (ref), var36 (ref), var15 (ref), var13 (ref), uploadCaptureAsyncModule (copy), getThumbnailUrlAsyncModule (copy), promiseModule (copy), var7 (ref), createImageAssetAsyncModule (copy), var31 (ref), var11 (ref), getGameMediaStore (copy), p1 (ref), fFlagMediaSelectorErrorLoggingModule (copy), formatErrorModule (copy), var25 (ref), var5 (ref), var38 (ref)
		if var20 == nil or var8 == nil or var22[var20] then return end
		editor_1("editor")
		var21(nil)
		local var54 = nil
		local var55 = nil
		
		if var20 ~= "icon" and var20 ~= "empty" then
			for i, v in var30.current do
				if v.id == var20 then
					var54 = i
					var55 = v
					break
				end
			end
			if var54 == nil or var55 == nil then return end
			if not var55.assetResourceName then return end
		end
		local current
		local _ = nil
		
		if var20 == "empty" then
			current = `thumbnail_pending_{var28.current}`
			var28.current += 1
		else
			current = var20
		end
		var37()
		var36(current, true)
		
		if var20 == "icon" then
			var15({ kind = "icon" })
		elseif var20 == "empty" then
			var13(function(p4)
				-- upvalues: current (write)
				local cloned = table.clone(p4)
				table.insert(cloned, { mediaType = "image", assetSource = nil, id = current })
				
				return cloned
			end)
			var15({ kind = "thumbnail", id = current })
		else
			var13(function(p4)
				-- upvalues: var20 (ref)
				local cloned = table.clone(p4)
				
				for i, v in cloned do
					if v.id == var20 then
						cloned[i] = { mediaType = "image", assetSource = nil, id = v.id }
						
						return cloned
					end
				end
				return cloned
			end)
		end
		local var56 = uploadCaptureAsyncModule(p3):andThen(function(p4)
			-- upvalues: getThumbnailUrlAsyncModule (copy)
			return getThumbnailUrlAsyncModule(p4.assetId)
		end):andThen(function(p4)
			-- upvalues: promiseModule (copy), var7 (copy), createImageAssetAsyncModule (copy), var20 (ref)
			if typeof(p4) == "table" and p4.status == "in_review" then
				return promiseModule.reject({
					code = "IN_REVIEW",
					message = "Capture is under moderation review"
				})
			end
			local imageUrl = p4.imageUrl
			
			return createImageAssetAsyncModule(imageUrl, nil, var20 == "icon", if var7 then {
				creatorType = var7.creatorType,
				creatorTargetId = var7.creatorTargetId
			} else nil):andThen(function(p5)
				-- upvalues: imageUrl (ref)
				return {
					imageAssetId = tostring(p5.assetId),
					displayUrl = imageUrl
				}
			end)
		end)
		local var57 = var56:andThen(function(p4)
			return p4.imageAssetId
		end)
		;(if var20 == "icon" then var31.setIcon(var8, var57) elseif var20 == "empty" then var31.addPreview(var8, var57) else var31.replacePreview(var8, var57, var55.assetResourceName)):andThen(function()
			-- upvalues: var56 (ref)
			return var56
		end):andThen(function(p4)
			-- upvalues: var20 (ref), var11 (copy), var13 (copy), current (write), var15 (copy), getGameMediaStore (copy), p1 (copy)
			if var20 == "icon" then
				var11(p4.displayUrl)
			else
				local imageAssetId = p4.imageAssetId
				var13(function(p5)
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
				var15(function(p6)
					-- upvalues: current (copy), imageAssetId (ref)
					return if p6.kind == "thumbnail" and p6.id == current then { kind = "thumbnail", id = imageAssetId } else p6
				end)
			end
			getGameMediaStore().fetchGameMedia(tostring(p1.universeId))
		end):catch(function(p5)
			-- upvalues: fFlagMediaSelectorErrorLoggingModule (copy), formatErrorModule (copy), var25 (copy), var5 (copy), var20 (ref), var13 (copy), current (write), var15 (copy), var55 (write)
			if fFlagMediaSelectorErrorLoggingModule then
				warn(`[BuildExperience] MediaSelector upload failed: {formatErrorModule(p5)}`)
				var25(var5.mediaError)
			end
			if var20 == "icon" then return end
			if var20 == "empty" then
				var13(function(p6)
					-- upvalues: current (copy)
					local t = {}
					
					for i, v in p6 do
						if v.id ~= current then
							table.insert(t, v)
						end
					end
					return t
				end)
				var15(function(p7)
					-- upvalues: current (copy)
					return if p7.kind == "thumbnail" and p7.id == current then { kind = "icon" } else p7
				end)
				
				return
			end
			var13(function(p6)
				-- upvalues: current (copy), var55 (ref)
				local cloned = table.clone(p6)
				
				for i, v in cloned do
					if v.id == current then
						cloned[i] = var55
						
						return cloned
					end
				end
				return cloned
			end)
		end):finally(function()
			-- upvalues: var36 (copy), current (write), var38 (copy)
			var36(current, false)
			var38()
		end)
	end, {
		var20, var31, var8, var7, var22, var37, var38, var36, var5, p1.universeId
	})
	local var58 = reactModule.useCallback(function()
		-- upvalues: editor_1 (ref), var21 (ref)
		editor_1("editor")
		var21(nil)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), editor (ref), var58 (ref)
		local backHandlerRef = p1.backHandlerRef
		
		if backHandlerRef then
			backHandlerRef.current = if editor == "captureSelection" then var58 else nil
		end
		return function()
			-- upvalues: backHandlerRef (ref)
			if backHandlerRef then
				backHandlerRef.current = nil
			end
		end
	end, { editor, var58, p1.backHandlerRef })
	local var59 = reactModule.useMemo(function()
		-- upvalues: var18 (ref), var40 (ref)
		return if var18 then var40(var18) else { { items = {} } }
	end, { var18, var40 })
	
	if editor == "captureSelection" then
		return reactModule.createElement(captureSelectionViewModule, {
			captureSource = var29.current,
			onCaptureConfirmed = var53
		})
	end
	local mediaType = nil
	local assetSource = nil
	local var60 = false
	local id = false
	
	if var14.kind == "icon" then
		var60 = true
		assetSource = var10
		mediaType = "image"
		id = var22.icon or false
	elseif var14.kind == "thumbnail" then
		for i, v in var32 do
			if v.id == var14.id then
				mediaType = v.mediaType
				assetSource = v.assetSource
				id = var22[v.id] or false
				break
			end
		end
	end
	local t = {}
	local var61 = var16 and var18 == "icon"
	t.IconSlot = reactModule.createElement(filmstripSlotModule, {
		aspectRatio = "square",
		mediaType = "image",
		isFilled = true,
		LayoutOrder = 1,
		assetSource = var10,
		isSelected = var14.kind == "icon",
		isLoading = var22.icon or false,
		isMenuOpen = var61,
		menuItems = if var61 then var59 else nil,
		onMenuActivated = var42,
		onMenuClose = var47,
		onSelect = var48,
		onEditPressed = if var33 then var50 else nil
	})
	
	for i, v in var32 do
		local id_1 = v.id
		local var62 = var16 and var18 == id_1
		t[id_1] = reactModule.createElement(filmstripSlotModule, {
			aspectRatio = "wide",
			isFilled = true,
			mediaType = v.mediaType,
			assetSource = v.assetSource,
			isSelected = var14.kind == "thumbnail" and var14.id == id_1,
			isLoading = var22[id_1] or false,
			isMenuOpen = var62,
			menuItems = if var62 then var59 else nil,
			onMenuActivated = var42,
			onMenuClose = var47,
			onSelect = function()
				-- upvalues: var49 (ref), id_1 (ref)
				var49(id_1)
			end,
			onEditPressed = if var33 or id_1 ~= var35 then function()
				-- upvalues: var52 (ref), id_1 (ref)
				var52(id_1)
			end else nil,
			LayoutOrder = i + 1
		})
	end
	if var34 then
		local var63 = var16 and var18 == "empty"
		t.EmptySlot = reactModule.createElement(filmstripSlotModule, {
			aspectRatio = "wide",
			mediaType = nil,
			assetSource = nil,
			isFilled = false,
			isSelected = false,
			isMenuOpen = var63,
			menuItems = if var63 then var59 else nil,
			onMenuActivated = var42,
			onMenuClose = var47,
			onSelect = var51,
			onEmptySlotPressed = var51,
			LayoutOrder = #var32 + 2
		})
	end
	return reactModule.createElement(view, { tag = "col gap-xlarge size-full" }, {
		ErrorSnackbar = if fFlagMediaSelectorErrorLoggingModule and var24 ~= "" then reactModule.createElement(view, {
			tag = "row align-x-center size-full-0 auto-y padding-x-large",
			LayoutOrder = 0
		}, {
			Snackbar = reactModule.createElement(snackbar, {
				testId = "MediaSelector.error-snackbar",
				title = var24,
				onClose = var39
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
				isIcon = var60,
				isLoading = id
			})
		}),
		Filmstrip = if fFlagBuildDesktopReadinessModule then reactModule.createElement(scrollView, {
			tag = "size-full-0 auto-y",
			LayoutOrder = 2,
			testId = "MediaSelector.Filmstrip",
			padding = {
				top = UDim.new(0, var9.Padding.XXLarge),
				bottom = UDim.new(0, var9.Padding.XXLarge),
				left = UDim.new(0, var3.margin),
				right = UDim.new(0, var3.margin)
			},
			layout = {
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, var9.Gap.Medium)
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
			Size = UDim2.new(1, 0, 0, var9.Size.Size_2400 + 2 * var9.Padding.Medium),
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