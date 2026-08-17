local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local promiseModule = require(parent.Promise)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
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

return function(p0) --[[ line: 51 | named "IconThumbnailsEditor" ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), getGameMediaForUniverseModule (ref), reactModule (ref), universeConfigurationModule (ref), signalsReactModule (ref), useTokens (ref), createGalleryCaptureSourceModule (ref), useMediaUpdaterModule (ref), getGameMediaStore (ref), uploadCaptureAsyncModule (ref), getThumbnailUrlAsyncModule (ref), promiseModule (ref), createImageAssetAsyncModule (ref), captureSelectionViewModule (ref), filmstripSlotModule (ref), view (ref), mediaPreviewModule (ref), scrollView (ref), foundationModule (ref)
	local MEDIA_SELECTION_CAPTURE_LIBRARY, MEDIA_SELECTION_DELETE
	local var17 = if fFlagBuildLocalization then useLocalization({
		captureLibrary = localizationStringsModule.MEDIA_SELECTION_CAPTURE_LIBRARY,
		delete = localizationStringsModule.MEDIA_SELECTION_DELETE
	}) else nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		MEDIA_SELECTION_CAPTURE_LIBRARY = var17.captureLibrary
		MEDIA_SELECTION_DELETE = var17.delete
	else
		MEDIA_SELECTION_CAPTURE_LIBRARY = localizationStringsModule.MEDIA_SELECTION_CAPTURE_LIBRARY
		MEDIA_SELECTION_DELETE = localizationStringsModule.MEDIA_SELECTION_DELETE
	end
	local var18 = getGameMediaForUniverseModule(p0.universeId)
	local var19 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 68 ]]
		-- upvalues: universeConfigurationModule (copy), p0 (ref)
		return universeConfigurationModule.getUniverseConfigurationStore().getAndFetchSummary(p0.universeId)
	end, { p0.universeId }).data)
	local var20 = if var19 then tostring(var19.rootPlaceId) else nil
	local var21 = useTokens()
	local var22, var23 = reactModule.useState(var18.icon)
	local var24, var25 = reactModule.useState(var18.thumbnails)
	local var26, var27 = reactModule.useState({ kind = "icon" })
	local var28, var29 = reactModule.useState(false)
	local var30, var31 = reactModule.useState(nil)
	local editor, editor_1 = reactModule.useState("editor")
	local var34, var35 = reactModule.useState(nil)
	local var36, var37 = reactModule.useState({})
	local var38 = reactModule.useRef(0)
	local var39 = reactModule.useRef(false)
	local var40 = reactModule.useRef(#var18.thumbnails + 1)
	local var41 = reactModule.useRef(nil)
	
	if var41.current == nil then
		var41.current = createGalleryCaptureSourceModule(nil, nil, { Enum.CaptureType.Screenshot })
	end
	local var42 = reactModule.useRef(var24)
	var42.current = var24
	reactModule.useRef(var22).current = var22
	local var43 = useMediaUpdaterModule()
	reactModule.useEffect(function() --[[ line: 99 ]]
		-- upvalues: var38 (ref), var25 (ref), var18 (ref)
		if var38.current == 0 then
			var25(var18.thumbnails)
			
			return
		end
	end, { var18.thumbnails })
	reactModule.useEffect(function() --[[ line: 110 ]]
		-- upvalues: var38 (ref), var23 (ref), var18 (ref)
		if var38.current == 0 then
			var23(var18.icon)
		end
	end, { var18.icon })
	local var44 = reactModule.useMemo(function() --[[ line: 116 ]]
		-- upvalues: var24 (ref)
		local t = {}
		
		for i, v in var24 do
			table.insert(t, v)
		end
		return t
	end, { var24 })
	local var45 = var20 ~= nil
	local var46 = #var44 < 10 and var45
	local var47 = if var44[1] then var44[1].id else nil
	local var48 = reactModule.useCallback(function(p1, p2) --[[ line: 131 ]]
		-- upvalues: var37 (ref)
		var37(function(p3) --[[ line: 132 ]]
			-- upvalues: p1 (ref), p2 (ref)
			local cloned = table.clone(p3)
			cloned[p1] = if p2 then true else nil
			
			return cloned
		end)
	end, {})
	local var49 = reactModule.useCallback(function() --[[ line: 139 ]]
		-- upvalues: var38 (ref)
		var38.current += 1
	end, {})
	local var50 = reactModule.useCallback(function() --[[ line: 143 ]]
		-- upvalues: var38 (ref)
		var38.current = math.max(0, var38.current - 1)
	end, {})
	local var51 = reactModule.useCallback(function(p4) --[[ line: 147 ]]
		-- upvalues: var45 (ref), MEDIA_SELECTION_CAPTURE_LIBRARY (write), var47 (ref), MEDIA_SELECTION_DELETE (write)
		local t = {}
		
		if var45 then
			table.insert(t, {
				id = "capture_library",
				icon = "icons/common/image",
				text = MEDIA_SELECTION_CAPTURE_LIBRARY
			})
		end
		if p4 ~= "icon" and p4 ~= var47 and p4 ~= "empty" then
			table.insert(t, {
				id = "delete",
				icon = "icons/common/trash",
				text = MEDIA_SELECTION_DELETE
			})
		end
		return { { items = t } }
	end, {
		var45,
		MEDIA_SELECTION_CAPTURE_LIBRARY,
		MEDIA_SELECTION_DELETE,
		var47
	})
	local var52 = reactModule.useCallback(function(p5) --[[ line: 168 ]]
		-- upvalues: var36 (ref), var39 (ref), var31 (ref), var29 (ref)
		if var36[p5] or var39.current and p5 ~= "icon" and p5 ~= "empty" then
			return
		end
		var31(p5)
		var29(true)
	end, { var36 })
	local var53 = reactModule.useCallback(function(p6) --[[ line: 177 ]]
		-- upvalues: var29 (ref), var39 (ref), var30 (ref), var45 (ref), var35 (ref), editor_1 (ref), var20 (ref), var36 (ref), var24 (ref), var49 (ref), var48 (ref), var25 (ref), var26 (ref), var27 (ref), var43 (ref), getGameMediaStore (copy), p0 (ref), var50 (ref)
		var29(false)
		
		if var39.current and var30 ~= "icon" and var30 ~= "empty" then return end
		if p6 == "capture_library" and var45 then
			var35(var30)
			editor_1("captureSelection")
			
			return
		elseif p6 == "delete" then
			local var72 = var30
			
			if var72 == nil or var20 == nil or var36[var72] then return end
			local var73 = nil
			local var74 = nil
			
			for i, v in var24 do
				if v.id == var72 then
					var73 = i
					var74 = v
					break
				end
			end
			if var73 == nil or var74 == nil then return end
			local var75 = var74
			
			if not var75.assetResourceName then return end
			local assetResourceName = var75.assetResourceName
			var39.current = true
			var49()
			var48(var72, true)
			var25(function(p7) --[[ line: 213 ]]
				-- upvalues: var72 (ref)
				local t = {}
				
				for i, v in p7 do
					if v.id ~= var72 then
						table.insert(t, v)
					end
				end
				return t
			end)
			
			if var26.kind == "thumbnail" and var26.id == var72 then
				var27({ kind = "icon" })
			end
			var43.removePreview(var20, assetResourceName):andThen(function() --[[ line: 228 ]]
				-- upvalues: getGameMediaStore (copy), p0 (copy)
				getGameMediaStore().fetchGameMedia(tostring(p0.universeId))
			end):catch(function() --[[ line: 231 ]]
				-- upvalues: var25 (copy), var72 (ref), var73 (write), var75 (ref)
				var25(function(p8) --[[ line: 232 ]]
					-- upvalues: var72 (copy), var73 (copy), var75 (copy)
					for i, v in p8 do
						if v.id == var72 then
							return p8
						end
					end
					local cloned = table.clone(p8)
					table.insert(cloned, math.min(var73, #cloned + 1), var75)
					
					return cloned
				end)
			end):finally(function() --[[ line: 243 ]]
				-- upvalues: var39 (copy), var48 (copy), var72 (ref), var50 (copy)
				var39.current = false
				var48(var72, false)
				var50()
			end)
		end
	end, {
		var30, var26, var24, var43, var20, var45, var36, var49, var50, var48
	})
	local var54 = reactModule.useCallback(function() --[[ line: 264 ]]
		-- upvalues: var29 (ref)
		var29(false)
	end, {})
	local var55 = reactModule.useCallback(function() --[[ line: 268 ]]
		-- upvalues: var27 (ref)
		var27({ kind = "icon" })
	end, {})
	local var56 = reactModule.useCallback(function(p9) --[[ line: 272 ]]
		-- upvalues: var27 (ref)
		var27({ kind = "thumbnail", id = p9 })
	end, {})
	local var57 = reactModule.useCallback(function() --[[ line: 276 ]]
		-- upvalues: var52 (ref)
		var52("icon")
	end, { var52 })
	local var58 = reactModule.useCallback(function() --[[ line: 280 ]]
		-- upvalues: var52 (ref)
		var52("empty")
	end, { var52 })
	local var59 = reactModule.useCallback(function(p10) --[[ line: 284 ]]
		-- upvalues: var52 (ref)
		var52(p10)
	end, { var52 })
	local var60 = reactModule.useCallback(function(p11) --[[ line: 289 ]]
		-- upvalues: var34 (ref), var20 (ref), var36 (ref), editor_1 (ref), var35 (ref), var42 (ref), var40 (ref), var49 (ref), var48 (ref), var27 (ref), var25 (ref), uploadCaptureAsyncModule (copy), getThumbnailUrlAsyncModule (copy), promiseModule (copy), var19 (ref), createImageAssetAsyncModule (copy), var43 (ref), var23 (ref), getGameMediaStore (copy), p0 (ref), var50 (ref)
		if var34 == nil or var20 == nil or var36[var34] then return end
		editor_1("editor")
		var35(nil)
		local var78 = nil
		local var79 = nil
		
		if var34 ~= "icon" and var34 ~= "empty" then
			for i, v in var42.current do
				if v.id == var34 then
					var78 = i
					var79 = v
					break
				end
			end
			if var78 == nil or var79 == nil then return end
			if not var79.assetResourceName then return end
		end
		local current
		local _ = nil
		
		if var34 == "empty" then
			current = `thumbnail_pending_{var40.current}`
			var40.current += 1
		else
			current = var34
		end
		var49()
		var48(current, true)
		
		if var34 == "icon" then
			var27({ kind = "icon" })
		elseif var34 == "empty" then
			var25(function(p12) --[[ line: 330 ]]
				-- upvalues: current (write)
				local cloned = table.clone(p12)
				table.insert(cloned, { mediaType = "image", assetSource = nil, id = current })
				
				return cloned
			end)
			var27({ kind = "thumbnail", id = current })
		else
			var25(function(p13) --[[ line: 341 ]]
				-- upvalues: var34 (ref)
				local cloned = table.clone(p13)
				
				for i, v in cloned do
					if v.id == var34 then
						cloned[i] = { mediaType = "image", assetSource = nil, id = v.id }
						
						return cloned
					end
				end
				return cloned
			end)
		end
		local var81 = uploadCaptureAsyncModule(p11):andThen(function(p16) --[[ line: 358 ]]
			-- upvalues: getThumbnailUrlAsyncModule (copy)
			return getThumbnailUrlAsyncModule(p16.assetId)
		end):andThen(function(p14) --[[ line: 361 ]]
			-- upvalues: promiseModule (copy), var19 (copy), createImageAssetAsyncModule (copy), var34 (ref)
			if typeof(p14) == "table" and p14.status == "in_review" then
				return promiseModule.reject({
					code = "IN_REVIEW",
					message = "Capture is under moderation review"
				})
			end
			local imageUrl = p14.imageUrl
			
			return createImageAssetAsyncModule(imageUrl, nil, var34 == "icon", if var19 then {
				creatorType = var19.creatorType,
				creatorTargetId = var19.creatorTargetId
			} else nil):andThen(function(p15) --[[ line: 375 ]]
				-- upvalues: imageUrl (ref)
				return {
					imageAssetId = tostring(p15.assetId),
					displayUrl = imageUrl
				}
			end)
		end)
		local var82 = var81:andThen(function(p17) --[[ line: 383 ]]
			return p17.imageAssetId
		end)
		;(if var34 == "icon" then var43.setIcon(var20, var82) elseif var34 == "empty" then var43.addPreview(var20, var82) else var43.replacePreview(var20, var82, var79.assetResourceName)):andThen(function() --[[ line: 401 ]]
			-- upvalues: var81 (ref)
			return var81
		end):andThen(function(p21) --[[ line: 404 ]]
			-- upvalues: var34 (ref), var23 (copy), var25 (copy), current (write), var27 (copy), getGameMediaStore (copy), p0 (copy)
			if var34 == "icon" then
				var23(p21.displayUrl)
			else
				local imageAssetId = p21.imageAssetId
				var25(function(p22) --[[ line: 412 ]]
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
				var27(function(p23) --[[ line: 427 ]]
					-- upvalues: current (copy), imageAssetId (ref)
					return if p23.kind == "thumbnail" and p23.id == current then { kind = "thumbnail", id = imageAssetId } else p23
				end)
			end
			getGameMediaStore().fetchGameMedia(tostring(p0.universeId))
		end):catch(function() --[[ line: 436 ]]
			-- upvalues: var34 (ref), var25 (copy), current (write), var27 (copy), var79 (write)
			if var34 == "icon" then return end
			if var34 == "empty" then
				var25(function(p18) --[[ line: 440 ]]
					-- upvalues: current (copy)
					local t = {}
					
					for i, v in p18 do
						if v.id ~= current then
							table.insert(t, v)
						end
					end
					return t
				end)
				var27(function(p19) --[[ line: 449 ]]
					-- upvalues: current (copy)
					return if p19.kind == "thumbnail" and p19.id == current then { kind = "icon" } else p19
				end)
				
				return
			end
			var25(function(p20) --[[ line: 456 ]]
				-- upvalues: current (copy), var79 (ref)
				local cloned = table.clone(p20)
				
				for i, v in cloned do
					if v.id == current then
						cloned[i] = var79
						
						return cloned
					end
				end
				return cloned
			end)
		end):finally(function() --[[ line: 468 ]]
			-- upvalues: var48 (copy), current (write), var50 (copy)
			var48(current, false)
			var50()
		end)
	end, {
		var34, var43, var20, var19, var36, var49, var50, var48
	})
	local var61 = reactModule.useCallback(function() --[[ line: 485 ]]
		-- upvalues: editor_1 (ref), var35 (ref)
		editor_1("editor")
		var35(nil)
	end, {})
	reactModule.useEffect(function() --[[ line: 490 ]]
		-- upvalues: p0 (ref), editor (ref), var61 (ref)
		local backHandlerRef = p0.backHandlerRef
		
		if backHandlerRef then
			backHandlerRef.current = if editor == "captureSelection" then var61 else nil
		end
		return function() --[[ line: 495 ]]
			-- upvalues: backHandlerRef (ref)
			if backHandlerRef then
				backHandlerRef.current = nil
			end
		end
	end, { editor, var61 })
	local var62 = reactModule.useMemo(function() --[[ line: 502 ]]
		-- upvalues: var30 (ref), var51 (ref)
		return if var30 then var51(var30) else { { items = {} } }
	end, { var30, var51 })
	
	if editor == "captureSelection" then
		return reactModule.createElement(captureSelectionViewModule, {
			captureSource = var41.current,
			onCaptureConfirmed = var60
		})
	end
	local mediaType = nil
	local assetSource = nil
	local var63 = false
	local id = false
	
	if var26.kind == "icon" then
		var63 = true
		assetSource = var22
		mediaType = "image"
		id = var36.icon or false
	elseif var26.kind == "thumbnail" then
		for i, v in var44 do
			if v.id == var26.id then
				mediaType = v.mediaType
				assetSource = v.assetSource
				id = var36[v.id] or false
				break
			end
		end
	end
	local t = {}
	local var66 = var28 and var30 == "icon"
	t.IconSlot = reactModule.createElement(filmstripSlotModule, {
		aspectRatio = "square",
		mediaType = "image",
		isFilled = true,
		LayoutOrder = 1,
		assetSource = var22,
		isSelected = var26.kind == "icon",
		isLoading = var36.icon or false,
		isMenuOpen = var66,
		menuItems = if var66 then var62 else nil,
		onMenuActivated = var53,
		onMenuClose = var54,
		onSelect = var55,
		onEditPressed = if var45 then var57 else nil
	})
	
	for i, v in var44 do
		local id_1 = v.id
		local var68 = var28 and var30 == id_1
		t[id_1] = reactModule.createElement(filmstripSlotModule, {
			aspectRatio = "wide",
			isFilled = true,
			mediaType = v.mediaType,
			assetSource = v.assetSource,
			isSelected = var26.kind == "thumbnail" and var26.id == id_1,
			isLoading = var36[id_1] or false,
			isMenuOpen = var68,
			menuItems = if var68 then var62 else nil,
			onMenuActivated = var53,
			onMenuClose = var54,
			onSelect = function() --[[ line: 572 ]]
				-- upvalues: var56 (ref), id_1 (ref)
				var56(id_1)
			end,
			onEditPressed = if var45 or id_1 ~= var47 then function() --[[ line: 576 ]]
				-- upvalues: var59 (ref), id_1 (ref)
				var59(id_1)
			end else nil,
			LayoutOrder = i + 1
		})
	end
	if var46 then
		local var67 = var28 and var30 == "empty"
		t.EmptySlot = reactModule.createElement(filmstripSlotModule, {
			aspectRatio = "wide",
			mediaType = nil,
			assetSource = nil,
			isFilled = false,
			isSelected = false,
			isMenuOpen = var67,
			menuItems = if var67 then var62 else nil,
			onMenuActivated = var53,
			onMenuClose = var54,
			onSelect = var58,
			onEmptySlotPressed = var58,
			LayoutOrder = #var44 + 2
		})
	end
	return reactModule.createElement(view, { tag = "col gap-xlarge size-full" }, {
		Preview = reactModule.createElement(view, {
			tag = "align-x-center align-y-center fill size-full-0 padding-xlarge",
			LayoutOrder = 1
		}, {
			PreviewContent = reactModule.createElement(mediaPreviewModule, {
				mediaType = mediaType,
				assetSource = assetSource,
				isIcon = var63,
				isLoading = id
			})
		}),
		Filmstrip = reactModule.createElement(scrollView, {
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, var21.Size.Size_2400 + 2 * var21.Padding.Medium),
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.X,
				CanvasSize = UDim2.new(0, 0, 1, 0),
				ScrollingDirection = Enum.ScrollingDirection.X,
				scrollBarVisibility = foundationModule.Enums.Visibility.None
			}
		}, {
			FilmstripContent = reactModule.createElement(view, { tag = "row gap-medium auto-xy padding-xlarge" }, t)
		})
	})
end