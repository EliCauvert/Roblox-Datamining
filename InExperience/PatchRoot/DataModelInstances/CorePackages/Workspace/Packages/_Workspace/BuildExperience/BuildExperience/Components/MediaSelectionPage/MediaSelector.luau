local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local scrollView = foundationModule.ScrollView
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local getGameMediaForUniverseModule = require(buildExperience.utils.getGameMediaForUniverse)
local filmstripSlotModule = require(script.Parent.FilmstripSlot)
local mediaPreviewModule = require(script.Parent.MediaPreview)
local _ = require(script.Parent.types)

return function(p0) --[[ line: 31 | named "IconThumbnailsEditor" ]]
	-- upvalues: getGameMediaForUniverseModule (ref), useTokens (ref), reactModule (ref), filmstripSlotModule (ref), view (ref), mediaPreviewModule (ref), scrollView (ref), foundationModule (ref)
	local var6 = getGameMediaForUniverseModule(p0.universeId)
	local var7 = useTokens()
	local icon = var6.icon
	local var8, var9 = reactModule.useState(var6.thumbnails)
	local var10, var11 = reactModule.useState({ kind = "icon" })
	local var12, var13 = reactModule.useState(false)
	local var14, var15 = reactModule.useState(nil)
	reactModule.useEffect(function() --[[ line: 41 ]]
		-- upvalues: var9 (ref), var6 (ref)
		var9(var6.thumbnails)
	end, { var6.thumbnails })
	local var16 = reactModule.useMemo(function() --[[ line: 45 ]]
		-- upvalues: var8 (ref)
		local t = {}
		
		for i, v in var8 do
			table.insert(t, v)
		end
		return t
	end, { var8 })
	local var17 = #var16 < 10
	local var18 = reactModule.useCallback(function(p1) --[[ line: 55 ]]
		local t = {}
		table.insert(t, {
			id = "capture_library",
			text = "Capture library",
			icon = "icons/common/image"
		})
		
		if p1 ~= "icon" and p1 ~= "thumbnail_1" and p1 ~= "empty" then
			table.insert(t, {
				id = "delete",
				text = "Delete",
				icon = "icons/common/trash"
			})
		end
		return { { items = t } }
	end, {})
	local var19 = reactModule.useCallback(function(p2) --[[ line: 66 ]]
		-- upvalues: var15 (ref), var13 (ref)
		var15(p2)
		var13(true)
	end, {})
	local var20 = reactModule.useCallback(function(p3) --[[ line: 71 ]]
		-- upvalues: var13 (ref), var14 (ref), var9 (ref), var10 (ref), var11 (ref)
		var13(false)
		
		if p3 == "capture_library" then
			if var14 == "icon" then return end
			if var14 == "empty" then
				var9(function(p4) --[[ line: 80 ]]
					return p4
				end)
				
				return
			end
			var9(function(p5) --[[ line: 95 ]]
				return p5
			end)
			
			return
		elseif p3 == "delete" then
			var9(function(p6) --[[ line: 114 ]]
				return p6
			end)
			local cloned = table.clone(var10)
			
			if cloned.kind == "thumbnail" then
				cloned.index -= 1
			end
			var11(cloned)
		end
	end, { var14, var10 })
	local var21 = reactModule.useCallback(function() --[[ line: 133 ]]
		-- upvalues: var13 (ref)
		var13(false)
	end, {})
	local var22 = reactModule.useCallback(function() --[[ line: 137 ]]
		-- upvalues: var11 (ref)
		var11({ kind = "icon" })
	end, {})
	local var23 = reactModule.useCallback(function(p7) --[[ line: 141 ]]
		-- upvalues: var11 (ref)
		var11({ kind = "thumbnail", index = p7 })
	end, {})
	local var24 = reactModule.useCallback(function() --[[ line: 145 ]]
		-- upvalues: var19 (ref)
		var19("icon")
	end, {})
	local var25 = reactModule.useCallback(function() --[[ line: 149 ]]
		-- upvalues: var19 (ref)
		var19("empty")
	end, {})
	local var26 = reactModule.useCallback(function(p8) --[[ line: 153 ]]
		-- upvalues: var19 (ref)
		var19(p8)
	end, {})
	local mediaType = nil
	local assetSource = nil
	local var27 = false
	
	if var10.kind == "icon" then
		var27 = true
		assetSource = icon
		mediaType = "image"
	elseif var10.kind == "thumbnail" then
		local index = var16[var10.index]
		
		if index then
			mediaType = index.mediaType
			assetSource = index.assetSource
		end
	end
	local var28 = reactModule.useMemo(function() --[[ line: 174 ]]
		-- upvalues: var14 (ref), var18 (ref)
		return if var14 then var18(var14) else { { items = {} } }
	end, { var14, var18 })
	local t = {}
	local var30 = var12 and var14 == "icon"
	t.IconSlot = reactModule.createElement(filmstripSlotModule, {
		aspectRatio = "square",
		mediaType = "image",
		isFilled = true,
		LayoutOrder = 1,
		assetSource = icon,
		isSelected = var10.kind == "icon",
		isMenuOpen = var30,
		menuItems = if var30 then var28 else nil,
		onMenuActivated = var20,
		onMenuClose = var21,
		onSelect = var22,
		onEditPressed = var24
	})
	
	for i, v in var16 do
		local id = v.id
		local var32 = var12 and var14 == id
		t[`Thumb_{i}`] = reactModule.createElement(filmstripSlotModule, {
			aspectRatio = "wide",
			isFilled = true,
			mediaType = v.mediaType,
			assetSource = v.assetSource,
			isSelected = var10.kind == "thumbnail" and var10.index == i,
			isMenuOpen = var32,
			menuItems = if var32 then var28 else nil,
			onMenuActivated = var20,
			onMenuClose = var21,
			onSelect = function() --[[ line: 214 ]]
				-- upvalues: var23 (ref), i (ref)
				var23(i)
			end,
			onEditPressed = function() --[[ line: 217 ]]
				-- upvalues: var26 (ref), id (ref)
				var26(id)
			end,
			LayoutOrder = i + 1
		})
	end
	if var17 then
		local var31 = var12 and var14 == "empty"
		t.EmptySlot = reactModule.createElement(filmstripSlotModule, {
			aspectRatio = "wide",
			mediaType = nil,
			assetSource = nil,
			isFilled = false,
			isSelected = false,
			isMenuOpen = var31,
			menuItems = if var31 then var28 else nil,
			onMenuActivated = var20,
			onMenuClose = var21,
			onSelect = var25,
			onEmptySlotPressed = var25,
			LayoutOrder = #var16 + 2
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
				isIcon = var27
			})
		}),
		Filmstrip = reactModule.createElement(scrollView, {
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, var7.Size.Size_2400 + 2 * var7.Padding.Medium),
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