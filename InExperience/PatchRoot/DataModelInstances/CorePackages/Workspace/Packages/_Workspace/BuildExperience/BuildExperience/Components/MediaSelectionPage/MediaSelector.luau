local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local promiseModule = require(parent.Promise)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
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

return function(p0) --[[ line: 47 | named "IconThumbnailsEditor" ]]
	-- upvalues: getGameMediaForUniverseModule (ref), reactModule (ref), universeConfigurationModule (ref), signalsReactModule (ref), useTokens (ref), createGalleryCaptureSourceModule (ref), useMediaUpdaterModule (ref), localizationStringsModule (ref), getGameMediaStore (ref), uploadCaptureAsyncModule (ref), getThumbnailUrlAsyncModule (ref), promiseModule (ref), createImageAssetAsyncModule (ref), captureSelectionViewModule (ref), filmstripSlotModule (ref), view (ref), mediaPreviewModule (ref), scrollView (ref), foundationModule (ref)
	local var16 = getGameMediaForUniverseModule(p0.universeId)
	local var17 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 49 ]]
		-- upvalues: universeConfigurationModule (copy), p0 (ref)
		return universeConfigurationModule.getUniverseConfigurationStore().getAndFetchSummary(p0.universeId)
	end, { p0.universeId }).data)
	local var18 = if var17 then tostring(var17.rootPlaceId) else nil
	local var19 = useTokens()
	local var20, var21 = reactModule.useState(var16.icon)
	local var22, var23 = reactModule.useState(var16.thumbnails)
	local var24, var25 = reactModule.useState({ kind = "icon" })
	local var26, var27 = reactModule.useState(false)
	local var28, var29 = reactModule.useState(nil)
	local editor, editor_1 = reactModule.useState("editor")
	local var32, var33 = reactModule.useState(nil)
	local var34, var35 = reactModule.useState({})
	local var36 = reactModule.useRef(0)
	local var37 = reactModule.useRef(false)
	local var38 = reactModule.useRef(#var16.thumbnails + 1)
	local var39 = reactModule.useRef(nil)
	
	if var39.current == nil then
		var39.current = createGalleryCaptureSourceModule(nil, nil, { Enum.CaptureType.Screenshot })
	end
	local var40 = reactModule.useRef(var22)
	var40.current = var22
	reactModule.useRef(var20).current = var20
	local var41 = useMediaUpdaterModule()
	reactModule.useEffect(function() --[[ line: 80 ]]
		-- upvalues: var36 (ref), var23 (ref), var16 (ref)
		if var36.current == 0 then
			var23(var16.thumbnails)
			
			return
		end
	end, { var16.thumbnails })
	reactModule.useEffect(function() --[[ line: 91 ]]
		-- upvalues: var36 (ref), var21 (ref), var16 (ref)
		if var36.current == 0 then
			var21(var16.icon)
		end
	end, { var16.icon })
	local var42 = reactModule.useMemo(function() --[[ line: 97 ]]
		-- upvalues: var22 (ref)
		local t = {}
		
		for i, v in var22 do
			table.insert(t, v)
		end
		return t
	end, { var22 })
	local var43 = var18 ~= nil
	local var44 = #var42 < 10 and var43
	local var45 = if var42[1] then var42[1].id else nil
	local var46 = reactModule.useCallback(function(p1, p2) --[[ line: 112 ]]
		-- upvalues: var35 (ref)
		var35(function(p3) --[[ line: 113 ]]
			-- upvalues: p1 (ref), p2 (ref)
			local cloned = table.clone(p3)
			cloned[p1] = if p2 then true else nil
			
			return cloned
		end)
	end, {})
	local var47 = reactModule.useCallback(function() --[[ line: 120 ]]
		-- upvalues: var36 (ref)
		var36.current += 1
	end, {})
	local var48 = reactModule.useCallback(function() --[[ line: 124 ]]
		-- upvalues: var36 (ref)
		var36.current = math.max(0, var36.current - 1)
	end, {})
	local var49 = reactModule.useCallback(function(p4) --[[ line: 128 ]]
		-- upvalues: var43 (ref), localizationStringsModule (copy), var45 (ref)
		local t = {}
		
		if var43 then
			table.insert(t, {
				id = "capture_library",
				icon = "icons/common/image",
				text = localizationStringsModule.MEDIA_SELECTION_CAPTURE_LIBRARY
			})
		end
		if p4 ~= "icon" and p4 ~= var45 and p4 ~= "empty" then
			table.insert(t, {
				id = "delete",
				icon = "icons/common/trash",
				text = localizationStringsModule.MEDIA_SELECTION_DELETE
			})
		end
		return { { items = t } }
	end, { var43, var45 })
	local var50 = reactModule.useCallback(function(p5) --[[ line: 149 ]]
		-- upvalues: var34 (ref), var37 (ref), var29 (ref), var27 (ref)
		if var34[p5] or var37.current and p5 ~= "icon" and p5 ~= "empty" then
			return
		end
		var29(p5)
		var27(true)
	end, { var34 })
	local var51 = reactModule.useCallback(function(p6) --[[ line: 158 ]]
		-- upvalues: var27 (ref), var37 (ref), var28 (ref), var43 (ref), var33 (ref), editor_1 (ref), var18 (ref), var34 (ref), var22 (ref), var47 (ref), var46 (ref), var23 (ref), var24 (ref), var25 (ref), var41 (ref), getGameMediaStore (copy), p0 (ref), var48 (ref)
		var27(false)
		
		if var37.current and var28 ~= "icon" and var28 ~= "empty" then return end
		if p6 == "capture_library" and var43 then
			var33(var28)
			editor_1("captureSelection")
			
			return
		elseif p6 == "delete" then
			local var70 = var28
			
			if var70 == nil or var18 == nil or var34[var70] then return end
			local var71 = nil
			local var72 = nil
			
			for i, v in var22 do
				if v.id == var70 then
					var71 = i
					var72 = v
					break
				end
			end
			if var71 == nil or var72 == nil then return end
			local var73 = var72
			
			if not var73.assetResourceName then return end
			local assetResourceName = var73.assetResourceName
			var37.current = true
			var47()
			var46(var70, true)
			var23(function(p7) --[[ line: 194 ]]
				-- upvalues: var70 (ref)
				local t = {}
				
				for i, v in p7 do
					if v.id ~= var70 then
						table.insert(t, v)
					end
				end
				return t
			end)
			
			if var24.kind == "thumbnail" and var24.id == var70 then
				var25({ kind = "icon" })
			end
			var41.removePreview(var18, assetResourceName):andThen(function() --[[ line: 209 ]]
				-- upvalues: getGameMediaStore (copy), p0 (copy)
				getGameMediaStore().fetchGameMedia(tostring(p0.universeId))
			end):catch(function() --[[ line: 212 ]]
				-- upvalues: var23 (copy), var70 (ref), var71 (write), var73 (ref)
				var23(function(p8) --[[ line: 213 ]]
					-- upvalues: var70 (copy), var71 (copy), var73 (copy)
					for i, v in p8 do
						if v.id == var70 then
							return p8
						end
					end
					local cloned = table.clone(p8)
					table.insert(cloned, math.min(var71, #cloned + 1), var73)
					
					return cloned
				end)
			end):finally(function() --[[ line: 224 ]]
				-- upvalues: var37 (copy), var46 (copy), var70 (ref), var48 (copy)
				var37.current = false
				var46(var70, false)
				var48()
			end)
		end
	end, {
		var28, var24, var22, var41, var18, var43, var34, var47, var48, var46
	})
	local var52 = reactModule.useCallback(function() --[[ line: 245 ]]
		-- upvalues: var27 (ref)
		var27(false)
	end, {})
	local var53 = reactModule.useCallback(function() --[[ line: 249 ]]
		-- upvalues: var25 (ref)
		var25({ kind = "icon" })
	end, {})
	local var54 = reactModule.useCallback(function(p9) --[[ line: 253 ]]
		-- upvalues: var25 (ref)
		var25({ kind = "thumbnail", id = p9 })
	end, {})
	local var55 = reactModule.useCallback(function() --[[ line: 257 ]]
		-- upvalues: var50 (ref)
		var50("icon")
	end, { var50 })
	local var56 = reactModule.useCallback(function() --[[ line: 261 ]]
		-- upvalues: var50 (ref)
		var50("empty")
	end, { var50 })
	local var57 = reactModule.useCallback(function(p10) --[[ line: 265 ]]
		-- upvalues: var50 (ref)
		var50(p10)
	end, { var50 })
	local var58 = reactModule.useCallback(function(p11) --[[ line: 270 ]]
		-- upvalues: var32 (ref), var18 (ref), var34 (ref), editor_1 (ref), var33 (ref), var40 (ref), var38 (ref), var47 (ref), var46 (ref), var25 (ref), var23 (ref), uploadCaptureAsyncModule (copy), getThumbnailUrlAsyncModule (copy), promiseModule (copy), var17 (ref), createImageAssetAsyncModule (copy), var41 (ref), var21 (ref), getGameMediaStore (copy), p0 (ref), var48 (ref)
		if var32 == nil or var18 == nil or var34[var32] then return end
		editor_1("editor")
		var33(nil)
		local var76 = nil
		local var77 = nil
		
		if var32 ~= "icon" and var32 ~= "empty" then
			for i, v in var40.current do
				if v.id == var32 then
					var76 = i
					var77 = v
					break
				end
			end
			if var76 == nil or var77 == nil then return end
			if not var77.assetResourceName then return end
		end
		local current
		local _ = nil
		
		if var32 == "empty" then
			current = `thumbnail_pending_{var38.current}`
			var38.current += 1
		else
			current = var32
		end
		var47()
		var46(current, true)
		
		if var32 == "icon" then
			var25({ kind = "icon" })
		elseif var32 == "empty" then
			var23(function(p12) --[[ line: 311 ]]
				-- upvalues: current (write)
				local cloned = table.clone(p12)
				table.insert(cloned, { mediaType = "image", assetSource = nil, id = current })
				
				return cloned
			end)
			var25({ kind = "thumbnail", id = current })
		else
			var23(function(p13) --[[ line: 322 ]]
				-- upvalues: var32 (ref)
				local cloned = table.clone(p13)
				
				for i, v in cloned do
					if v.id == var32 then
						cloned[i] = { mediaType = "image", assetSource = nil, id = v.id }
						
						return cloned
					end
				end
				return cloned
			end)
		end
		local var79 = uploadCaptureAsyncModule(p11):andThen(function(p16) --[[ line: 339 ]]
			-- upvalues: getThumbnailUrlAsyncModule (copy)
			return getThumbnailUrlAsyncModule(p16.assetId)
		end):andThen(function(p14) --[[ line: 342 ]]
			-- upvalues: promiseModule (copy), var17 (copy), createImageAssetAsyncModule (copy), var32 (ref)
			if typeof(p14) == "table" and p14.status == "in_review" then
				return promiseModule.reject({
					code = "IN_REVIEW",
					message = "Capture is under moderation review"
				})
			end
			local imageUrl = p14.imageUrl
			
			return createImageAssetAsyncModule(imageUrl, nil, var32 == "icon", if var17 then {
				creatorType = var17.creatorType,
				creatorTargetId = var17.creatorTargetId
			} else nil):andThen(function(p15) --[[ line: 356 ]]
				-- upvalues: imageUrl (ref)
				return {
					imageAssetId = tostring(p15.assetId),
					displayUrl = imageUrl
				}
			end)
		end)
		local var80 = var79:andThen(function(p17) --[[ line: 364 ]]
			return p17.imageAssetId
		end)
		;(if var32 == "icon" then var41.setIcon(var18, var80) elseif var32 == "empty" then var41.addPreview(var18, var80) else var41.replacePreview(var18, var80, var77.assetResourceName)):andThen(function() --[[ line: 382 ]]
			-- upvalues: var79 (ref)
			return var79
		end):andThen(function(p21) --[[ line: 385 ]]
			-- upvalues: var32 (ref), var21 (copy), var23 (copy), current (write), var25 (copy), getGameMediaStore (copy), p0 (copy)
			if var32 == "icon" then
				var21(p21.displayUrl)
			else
				local imageAssetId = p21.imageAssetId
				var23(function(p22) --[[ line: 393 ]]
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
				var25(function(p23) --[[ line: 408 ]]
					-- upvalues: current (copy), imageAssetId (ref)
					return if p23.kind == "thumbnail" and p23.id == current then { kind = "thumbnail", id = imageAssetId } else p23
				end)
			end
			getGameMediaStore().fetchGameMedia(tostring(p0.universeId))
		end):catch(function() --[[ line: 417 ]]
			-- upvalues: var32 (ref), var23 (copy), current (write), var25 (copy), var77 (write)
			if var32 == "icon" then return end
			if var32 == "empty" then
				var23(function(p18) --[[ line: 421 ]]
					-- upvalues: current (copy)
					local t = {}
					
					for i, v in p18 do
						if v.id ~= current then
							table.insert(t, v)
						end
					end
					return t
				end)
				var25(function(p19) --[[ line: 430 ]]
					-- upvalues: current (copy)
					return if p19.kind == "thumbnail" and p19.id == current then { kind = "icon" } else p19
				end)
				
				return
			end
			var23(function(p20) --[[ line: 437 ]]
				-- upvalues: current (copy), var77 (ref)
				local cloned = table.clone(p20)
				
				for i, v in cloned do
					if v.id == current then
						cloned[i] = var77
						
						return cloned
					end
				end
				return cloned
			end)
		end):finally(function() --[[ line: 449 ]]
			-- upvalues: var46 (copy), current (write), var48 (copy)
			var46(current, false)
			var48()
		end)
	end, {
		var32, var41, var18, var17, var34, var47, var48, var46
	})
	local var59 = reactModule.useCallback(function() --[[ line: 466 ]]
		-- upvalues: editor_1 (ref), var33 (ref)
		editor_1("editor")
		var33(nil)
	end, {})
	reactModule.useEffect(function() --[[ line: 471 ]]
		-- upvalues: p0 (ref), editor (ref), var59 (ref)
		local backHandlerRef = p0.backHandlerRef
		
		if backHandlerRef then
			backHandlerRef.current = if editor == "captureSelection" then var59 else nil
		end
		return function() --[[ line: 476 ]]
			-- upvalues: backHandlerRef (ref)
			if backHandlerRef then
				backHandlerRef.current = nil
			end
		end
	end, { editor, var59 })
	local var60 = reactModule.useMemo(function() --[[ line: 483 ]]
		-- upvalues: var28 (ref), var49 (ref)
		return if var28 then var49(var28) else { { items = {} } }
	end, { var28, var49 })
	
	if editor == "captureSelection" then
		return reactModule.createElement(captureSelectionViewModule, {
			captureSource = var39.current,
			onCaptureConfirmed = var58
		})
	end
	local mediaType = nil
	local assetSource = nil
	local var61 = false
	local id = false
	
	if var24.kind == "icon" then
		var61 = true
		assetSource = var20
		mediaType = "image"
		id = var34.icon or false
	elseif var24.kind == "thumbnail" then
		for i, v in var42 do
			if v.id == var24.id then
				mediaType = v.mediaType
				assetSource = v.assetSource
				id = var34[v.id] or false
				break
			end
		end
	end
	local t = {}
	local var64 = var26 and var28 == "icon"
	t.IconSlot = reactModule.createElement(filmstripSlotModule, {
		aspectRatio = "square",
		mediaType = "image",
		isFilled = true,
		LayoutOrder = 1,
		assetSource = var20,
		isSelected = var24.kind == "icon",
		isLoading = var34.icon or false,
		isMenuOpen = var64,
		menuItems = if var64 then var60 else nil,
		onMenuActivated = var51,
		onMenuClose = var52,
		onSelect = var53,
		onEditPressed = if var43 then var55 else nil
	})
	
	for i, v in var42 do
		local id_1 = v.id
		local var66 = var26 and var28 == id_1
		t[id_1] = reactModule.createElement(filmstripSlotModule, {
			aspectRatio = "wide",
			isFilled = true,
			mediaType = v.mediaType,
			assetSource = v.assetSource,
			isSelected = var24.kind == "thumbnail" and var24.id == id_1,
			isLoading = var34[id_1] or false,
			isMenuOpen = var66,
			menuItems = if var66 then var60 else nil,
			onMenuActivated = var51,
			onMenuClose = var52,
			onSelect = function() --[[ line: 553 ]]
				-- upvalues: var54 (ref), id_1 (ref)
				var54(id_1)
			end,
			onEditPressed = if var43 or id_1 ~= var45 then function() --[[ line: 557 ]]
				-- upvalues: var57 (ref), id_1 (ref)
				var57(id_1)
			end else nil,
			LayoutOrder = i + 1
		})
	end
	if var44 then
		local var65 = var26 and var28 == "empty"
		t.EmptySlot = reactModule.createElement(filmstripSlotModule, {
			aspectRatio = "wide",
			mediaType = nil,
			assetSource = nil,
			isFilled = false,
			isSelected = false,
			isMenuOpen = var65,
			menuItems = if var65 then var60 else nil,
			onMenuActivated = var51,
			onMenuClose = var52,
			onSelect = var56,
			onEmptySlotPressed = var56,
			LayoutOrder = #var42 + 2
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
				isIcon = var61,
				isLoading = id
			})
		}),
		Filmstrip = reactModule.createElement(scrollView, {
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, var19.Size.Size_2400 + 2 * var19.Padding.Medium),
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