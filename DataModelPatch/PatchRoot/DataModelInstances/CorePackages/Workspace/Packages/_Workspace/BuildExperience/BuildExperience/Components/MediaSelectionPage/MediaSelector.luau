local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ScrollView = FoundationModule.ScrollView
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local GetGameMediaForUniverseModule = require(BuildExperience.utils.getGameMediaForUniverse)
local FilmstripSlotModule = require(script.Parent.FilmstripSlot)
local MediaPreviewModule = require(script.Parent.MediaPreview)
local _ = require(script.Parent.types)

return function(p1)
	-- upvalues: GetGameMediaForUniverseModule (copy), UseTokensFunction (copy), ReactModule (copy), FilmstripSlotModule (copy), View (copy), MediaPreviewModule (copy), ScrollView (copy), FoundationModule (copy)
	local GameMediaForUniverseModule = GetGameMediaForUniverseModule(p1.universeId)
	local UseTokensResult = UseTokensFunction()
	local Icon = GameMediaForUniverseModule.icon
	local UseStateResult, UseStateResult2 = ReactModule.useState(GameMediaForUniverseModule.thumbnails)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState({ kind = "icon" })
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), GameMediaForUniverseModule (copy)
		UseStateResult2(GameMediaForUniverseModule.thumbnails)
	end, { GameMediaForUniverseModule.thumbnails })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseStateResult (copy)
		local List = {}
		
		for _, value in UseStateResult do
			table.insert(List, value)
		end
		return List
	end, { UseStateResult })
	local v1 = #UseMemoResult < 10
	local UseResult = ReactModule.useCallback(function(p2)
		local List = {}
		table.insert(List, {
			id = "capture_library",
			text = "Capture library",
			icon = "icons/common/image"
		})
		
		if p2 ~= "icon" and p2 ~= "thumbnail_1" and p2 ~= "empty" then
			table.insert(List, {
				id = "delete",
				text = "Delete",
				icon = "icons/common/trash"
			})
		end
		return { { items = List } }
	end, {})
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2_3 (copy), UseStateResult2_2 (copy)
		UseStateResult2_3(p2)
		UseStateResult2_2(true)
	end, {})
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2_2 (copy), UseStateResult4 (copy), UseStateResult2 (copy), UseStateResult1 (copy), UseStateResult2_1 (copy)
		UseStateResult2_2(false)
		
		if p2 ~= "capture_library" then
			if p2 == "delete" then
				UseStateResult2(function(p3)
					return p3
				end)
				local Copy = table.clone(UseStateResult1)
				
				if Copy.kind == "thumbnail" then
					Copy.index -= 1
				end
				UseStateResult2_1(Copy)
			end
			return
		elseif UseStateResult4 == "icon" then return end
		if UseStateResult4 == "empty" then
			UseStateResult2(function(p3)
				return p3
			end)
			
			return
		else
			UseStateResult2(function(p3)
				return p3
			end)
		end
	end, { UseStateResult4, UseStateResult1 })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2(false)
	end, {})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1({ kind = "icon" })
	end, {})
	local UseResult5 = ReactModule.useCallback(function(Index)
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1({ kind = "thumbnail", index = Index })
	end, {})
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: UseResult1 (copy)
		UseResult1("icon")
	end, {})
	local UseResult7 = ReactModule.useCallback(function()
		-- upvalues: UseResult1 (copy)
		UseResult1("empty")
	end, {})
	local UseResult8 = ReactModule.useCallback(function(p2)
		-- upvalues: UseResult1 (copy)
		UseResult1(p2)
	end, {})
	local MediaType = nil
	local AssetSource = nil
	local IsIcon = false
	
	if UseStateResult1.kind == "icon" then
		IsIcon = true
		AssetSource = Icon
		MediaType = "image"
	elseif UseStateResult1.kind == "thumbnail" then
		local UseMemoResultEntry = UseMemoResult[UseStateResult1.index]
		
		if UseMemoResultEntry then
			MediaType = UseMemoResultEntry.mediaType
			AssetSource = UseMemoResultEntry.assetSource
		end
	end
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseStateResult4 (copy), UseResult (copy)
		return if UseStateResult4 then UseResult(UseStateResult4) else { { items = {} } }
	end, { UseStateResult4, UseResult })
	local IsIcon1: boolean = UseStateResult3 and UseStateResult4 == "icon"
	local config = {
		IconSlot = ReactModule.createElement(FilmstripSlotModule, {
			aspectRatio = "square",
			mediaType = "image",
			isFilled = true,
			LayoutOrder = 1,
			assetSource = Icon,
			isSelected = UseStateResult1.kind == "icon",
			isMenuOpen = IsIcon1,
			menuItems = if IsIcon1 then UseMemoResult1 else nil,
			onMenuActivated = UseResult2,
			onMenuClose = UseResult3,
			onSelect = UseResult4,
			onEditPressed = UseResult6
		})
	}
	
	for i, value in UseMemoResult do
		local Id = value.id
		local IsUseStateResultMatch: boolean = UseStateResult3 and UseStateResult4 == Id
		config[`Thumb_{i}`] = ReactModule.createElement(FilmstripSlotModule, {
			aspectRatio = "wide",
			isFilled = true,
			mediaType = value.mediaType,
			assetSource = value.assetSource,
			isSelected = UseStateResult1.kind == "thumbnail" and UseStateResult1.index == i,
			isMenuOpen = IsUseStateResultMatch,
			menuItems = if IsUseStateResultMatch then UseMemoResult1 else nil,
			onMenuActivated = UseResult2,
			onMenuClose = UseResult3,
			onSelect = function()
				-- upvalues: UseResult5 (copy), i (copy)
				UseResult5(i)
			end,
			onEditPressed = function()
				-- upvalues: UseResult8 (copy), Id (copy)
				UseResult8(Id)
			end,
			LayoutOrder = i + 1
		})
	end
	if v1 then
		local IsEmpty: boolean = UseStateResult3 and UseStateResult4 == "empty"
		config.EmptySlot = ReactModule.createElement(FilmstripSlotModule, {
			aspectRatio = "wide",
			mediaType = nil,
			assetSource = nil,
			isFilled = false,
			isSelected = false,
			isMenuOpen = IsEmpty,
			menuItems = if IsEmpty then UseMemoResult1 else nil,
			onMenuActivated = UseResult2,
			onMenuClose = UseResult3,
			onSelect = UseResult7,
			onEmptySlotPressed = UseResult7,
			LayoutOrder = #UseMemoResult + 2
		})
	end
	return ReactModule.createElement(View, { tag = "col gap-xlarge size-full" }, {
		Preview = ReactModule.createElement(View, {
			tag = "align-x-center align-y-center fill size-full-0 padding-xlarge",
			LayoutOrder = 1
		}, {
			PreviewContent = ReactModule.createElement(MediaPreviewModule, {
				mediaType = MediaType,
				assetSource = AssetSource,
				isIcon = IsIcon
			})
		}),
		Filmstrip = ReactModule.createElement(ScrollView, {
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_2400 + 2 * UseTokensResult.Padding.Medium),
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.X,
				CanvasSize = UDim2.new(0, 0, 1, 0),
				ScrollingDirection = Enum.ScrollingDirection.X,
				scrollBarVisibility = FoundationModule.Enums.Visibility.None
			}
		}, {
			FilmstripContent = ReactModule.createElement(View, { tag = "row gap-medium auto-xy padding-xlarge" }, config)
		})
	})
end