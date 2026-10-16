local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local FoundationImagesModule = require(Parent.FoundationImages)
local ReactModule = require(Parent.React)
local ReactIsModule = require(Parent.ReactIs)
local UseOnLoadedModule = require(script.Parent.useOnLoaded)
local Assets = require(Parent.FoundationCloudAssets).Assets
local InteractableModule = require(Foundation.Components.Interactable)
local Images = FoundationImagesModule.Images
local IconImagesDEPRECATED = FoundationImagesModule.IconImages_DEPRECATED
local GetScaledSliceModule = require(script.Parent.ImageSet.getScaledSlice)
local IsCloudAssetModule = require(script.Parent.CloudAsset.isCloudAsset)
local IsFoundationImageModule = require(script.Parent.ImageSet.isFoundationImage)
local GuiObjectChildrenModule = require(Foundation.Utility.GuiObjectChildren)
local _ = require(Foundation.Components.Types)
local IndexBindableModule = require(Foundation.Utility.indexBindable)
local UseDefaultTagsModule = require(Foundation.Utility.useDefaultTags)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local WithGuiObjectPropsModule = require(Foundation.Utility.withGuiObjectProps)
local UseStyleTagsModule = require(Foundation.Providers.Style.useStyleTags)
local config = {
	AutoLocalize = false,
	AutoButtonColor = false,
	BorderSizePixel = 0,
	isDisabled = false
}

local function _(Vector) --[[ Line: 61 | Named "getAspectRatio" ]]
	return Vector.X / Vector.Y
end

local IsDEV = _G.__DEV__ == true

local _ = function(p1) --[[ Line: 67 | Named "getFoundationImageAsset" ]]
	-- upvalues: IconImagesDEPRECATED (copy), IsDEV (copy), Images (copy)
	local IconImagesDEPRECATEDEntry = IconImagesDEPRECATED[p1]
	
	return if IconImagesDEPRECATEDEntry then IconImagesDEPRECATEDEntry elseif IsDEV then Images[p1] else rawget(Images, p1)
end

local _ = function(p1) --[[ Line: 83 | Named "shouldUseFoundationSlice" ]]
	-- upvalues: IsFoundationImageModule (copy), IsCloudAssetModule (copy), IconImagesDEPRECATED (copy), IsDEV (copy), Images (copy)
	if not IsFoundationImageModule(p1) then
		return false
	end
	local IsCloudAssetModule1 = IsCloudAssetModule(p1)
	
	if not IsCloudAssetModule1 then
		local IconImagesDEPRECATEDEntry = IconImagesDEPRECATED[p1]
		IsCloudAssetModule1 = (if IconImagesDEPRECATEDEntry then IconImagesDEPRECATEDEntry elseif IsDEV then Images[p1] else rawget(Images, p1)) ~= nil
	end
	return IsCloudAssetModule1
end

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 94 | Named "Image" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), ReactModule (copy), ReactIsModule (copy), IsCloudAssetModule (copy), IsFoundationImageModule (copy), Assets (copy), IconImagesDEPRECATED (copy), IsDEV (copy), Images (copy), GetScaledSliceModule (copy), UseDefaultTagsModule (copy), UseStyleTagsModule (copy), UseOnLoadedModule (copy), WithGuiObjectPropsModule (copy), IndexBindableModule (copy), InteractableModule (copy), GuiObjectChildrenModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local HasOnStateChanged: boolean = WithDefaultsModuleResult.onStateChanged ~= nil or WithDefaultsModuleResult.onActivated ~= nil or WithDefaultsModuleResult.onSecondaryActivated ~= nil
	local AspectRatio = WithDefaultsModuleResult.aspectRatio
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function() --[[ Line: 102 ]]
		-- upvalues: ReactIsModule (upval), WithDefaultsModuleResult (copy), UseStateResult2 (copy), IsCloudAssetModule (upval), ReactModule (upval)
		if not ReactIsModule.isBinding(WithDefaultsModuleResult.Image) then return end
		local Image = WithDefaultsModuleResult.Image
		UseStateResult2(IsCloudAssetModule(Image:getValue()))
		local SubscribeToBindingResult = ReactModule.__subscribeToBinding(Image, function(p2) --[[ Line: 110 ]]
			-- upvalues: UseStateResult2 (upval), IsCloudAssetModule (upval)
			UseStateResult2(IsCloudAssetModule(p2))
		end)
		
		return function() --[[ Line: 114 ]]
			-- upvalues: SubscribeToBindingResult (copy)
			SubscribeToBindingResult()
		end
	end, { WithDefaultsModuleResult.Image, AspectRatio })
	local UseMemoResult, UseMemoResult2, UseMemoResult3, UseMemoResult4 = ReactModule.useMemo(function() --[[ Line: 120 ]]
		-- upvalues: WithDefaultsModuleResult (copy), AspectRatio (copy), ReactIsModule (upval), IsFoundationImageModule (upval), IsCloudAssetModule (upval), Assets (upval), IconImagesDEPRECATED (upval), IsDEV (upval), Images (upval), UseStateResult (copy)
		local Image = WithDefaultsModuleResult.Image
		local Offset = if WithDefaultsModuleResult.imageRect then WithDefaultsModuleResult.imageRect.offset else nil
		local Size = if WithDefaultsModuleResult.imageRect then WithDefaultsModuleResult.imageRect.size else nil
		local MapResult = AspectRatio
		
		if ReactIsModule.isBinding(WithDefaultsModuleResult.Image) then
			local function _(p2) --[[ Line: 131 | Named "getImageBindingValue" ]]
				-- upvalues: WithDefaultsModuleResult (upval), IsFoundationImageModule (upval), IsCloudAssetModule (upval), Assets (upval), IconImagesDEPRECATED (upval), IsDEV (upval), Images (upval), AspectRatio (upval)
				return WithDefaultsModuleResult.Image:map(function(p3) --[[ Line: 132 ]]
					-- upvalues: IsFoundationImageModule (upval), IsCloudAssetModule (upval), Assets (upval), p2 (copy), IconImagesDEPRECATED (upval), IsDEV (upval), Images (upval), AspectRatio (upval), WithDefaultsModuleResult (upval)
					if not IsFoundationImageModule(p3) then
						return if p2 == "Image" then p3 elseif p2 == "ImageRectOffset" and WithDefaultsModuleResult.imageRect then WithDefaultsModuleResult.imageRect.offset elseif p2 == "ImageRectSize" and WithDefaultsModuleResult.imageRect then WithDefaultsModuleResult.imageRect.size else nil
					elseif not IsCloudAssetModule(p3) then
						local IconImagesDEPRECATEDEntry = IconImagesDEPRECATED[p3]
						local IconImagesDEPRECATEDEntry1 = if IconImagesDEPRECATEDEntry then IconImagesDEPRECATEDEntry elseif IsDEV then Images[p3] else rawget(Images, p3)
						
						return if p2 == "AspectRatio" then AspectRatio elseif IconImagesDEPRECATEDEntry1 then IconImagesDEPRECATEDEntry1[p2] elseif p2 == "Image" then p3 else nil
					else
						local Asset = Assets[p3]
						
						if p2 == "Image" then
							return Asset.assetId
						elseif p2 == "AspectRatio" then
							local Size = Asset.size
							
							return Size.X / Size.Y
						else
							return nil
						end
					end
				end)
			end
			
			if UseStateResult then
				local v1 = "AspectRatio"
				MapResult = WithDefaultsModuleResult.Image:map(function(p2) --[[ Line: 132 ]]
					-- upvalues: IsFoundationImageModule (upval), IsCloudAssetModule (upval), Assets (upval), v1 (copy), IconImagesDEPRECATED (upval), IsDEV (upval), Images (upval), AspectRatio (upval), WithDefaultsModuleResult (upval)
					if not IsFoundationImageModule(p2) then
						return if v1 == "Image" then p2 elseif v1 == "ImageRectOffset" and WithDefaultsModuleResult.imageRect then WithDefaultsModuleResult.imageRect.offset elseif v1 == "ImageRectSize" and WithDefaultsModuleResult.imageRect then WithDefaultsModuleResult.imageRect.size else nil
					elseif not IsCloudAssetModule(p2) then
						local IconImagesDEPRECATEDEntry = IconImagesDEPRECATED[p2]
						local IconImagesDEPRECATEDEntry1 = if IconImagesDEPRECATEDEntry then IconImagesDEPRECATEDEntry elseif IsDEV then Images[p2] else rawget(Images, p2)
						
						return if v1 == "AspectRatio" then AspectRatio elseif IconImagesDEPRECATEDEntry1 then IconImagesDEPRECATEDEntry1[v1] elseif v1 == "Image" then p2 else nil
					else
						local Asset = Assets[p2]
						
						if v1 == "Image" then
							return Asset.assetId
						elseif v1 == "AspectRatio" then
							local Size = Asset.size
							
							return Size.X / Size.Y
						else
							return nil
						end
					end
				end)
			else
				MapResult = AspectRatio
			end
			local v2 = "Image"
			Image = WithDefaultsModuleResult.Image:map(function(p2) --[[ Line: 132 ]]
				-- upvalues: IsFoundationImageModule (upval), IsCloudAssetModule (upval), Assets (upval), v2 (copy), IconImagesDEPRECATED (upval), IsDEV (upval), Images (upval), AspectRatio (upval), WithDefaultsModuleResult (upval)
				if not IsFoundationImageModule(p2) then
					return if v2 == "Image" then p2 elseif v2 == "ImageRectOffset" and WithDefaultsModuleResult.imageRect then WithDefaultsModuleResult.imageRect.offset elseif v2 == "ImageRectSize" and WithDefaultsModuleResult.imageRect then WithDefaultsModuleResult.imageRect.size else nil
				elseif not IsCloudAssetModule(p2) then
					local IconImagesDEPRECATEDEntry = IconImagesDEPRECATED[p2]
					local IconImagesDEPRECATEDEntry1 = if IconImagesDEPRECATEDEntry then IconImagesDEPRECATEDEntry elseif IsDEV then Images[p2] else rawget(Images, p2)
					
					return if v2 == "AspectRatio" then AspectRatio elseif IconImagesDEPRECATEDEntry1 then IconImagesDEPRECATEDEntry1[v2] elseif v2 == "Image" then p2 else nil
				else
					local Asset = Assets[p2]
					
					if v2 == "Image" then
						return Asset.assetId
					elseif v2 == "AspectRatio" then
						local Size = Asset.size
						
						return Size.X / Size.Y
					else
						return nil
					end
				end
			end)
			local v3 = "ImageRectOffset"
			Offset = WithDefaultsModuleResult.Image:map(function(p2) --[[ Line: 132 ]]
				-- upvalues: IsFoundationImageModule (upval), IsCloudAssetModule (upval), Assets (upval), v3 (copy), IconImagesDEPRECATED (upval), IsDEV (upval), Images (upval), AspectRatio (upval), WithDefaultsModuleResult (upval)
				if not IsFoundationImageModule(p2) then
					return if v3 == "Image" then p2 elseif v3 == "ImageRectOffset" and WithDefaultsModuleResult.imageRect then WithDefaultsModuleResult.imageRect.offset elseif v3 == "ImageRectSize" and WithDefaultsModuleResult.imageRect then WithDefaultsModuleResult.imageRect.size else nil
				elseif not IsCloudAssetModule(p2) then
					local IconImagesDEPRECATEDEntry = IconImagesDEPRECATED[p2]
					local IconImagesDEPRECATEDEntry1 = if IconImagesDEPRECATEDEntry then IconImagesDEPRECATEDEntry elseif IsDEV then Images[p2] else rawget(Images, p2)
					
					return if v3 == "AspectRatio" then AspectRatio elseif IconImagesDEPRECATEDEntry1 then IconImagesDEPRECATEDEntry1[v3] elseif v3 == "Image" then p2 else nil
				else
					local Asset = Assets[p2]
					
					if v3 == "Image" then
						return Asset.assetId
					elseif v3 == "AspectRatio" then
						local Size = Asset.size
						
						return Size.X / Size.Y
					else
						return nil
					end
				end
			end)
			local v4 = "ImageRectSize"
			Size = WithDefaultsModuleResult.Image:map(function(p2) --[[ Line: 132 ]]
				-- upvalues: IsFoundationImageModule (upval), IsCloudAssetModule (upval), Assets (upval), v4 (copy), IconImagesDEPRECATED (upval), IsDEV (upval), Images (upval), AspectRatio (upval), WithDefaultsModuleResult (upval)
				if not IsFoundationImageModule(p2) then
					return if v4 == "Image" then p2 elseif v4 == "ImageRectOffset" and WithDefaultsModuleResult.imageRect then WithDefaultsModuleResult.imageRect.offset elseif v4 == "ImageRectSize" and WithDefaultsModuleResult.imageRect then WithDefaultsModuleResult.imageRect.size else nil
				elseif not IsCloudAssetModule(p2) then
					local IconImagesDEPRECATEDEntry = IconImagesDEPRECATED[p2]
					local IconImagesDEPRECATEDEntry1 = if IconImagesDEPRECATEDEntry then IconImagesDEPRECATEDEntry elseif IsDEV then Images[p2] else rawget(Images, p2)
					
					return if v4 == "AspectRatio" then AspectRatio elseif IconImagesDEPRECATEDEntry1 then IconImagesDEPRECATEDEntry1[v4] elseif v4 == "Image" then p2 else nil
				else
					local Asset = Assets[p2]
					
					if v4 == "Image" then
						return Asset.assetId
					elseif v4 == "AspectRatio" then
						local Size = Asset.size
						
						return Size.X / Size.Y
					else
						return nil
					end
				end
			end)
			
			return Image, Offset, Size, MapResult
		else
			if typeof(WithDefaultsModuleResult.Image) == "string" and IsFoundationImageModule(WithDefaultsModuleResult.Image) then
				if IsCloudAssetModule(WithDefaultsModuleResult.Image) then
					local Asset = Assets[WithDefaultsModuleResult.Image]
					Image = Asset.assetId
					local Size1 = Asset.size
					MapResult = Size1.X / Size1.Y
					
					return Image, Offset, Size, MapResult
				end
				local Image1 = WithDefaultsModuleResult.Image
				local IconImagesDEPRECATEDEntry = IconImagesDEPRECATED[Image1]
				local IconImagesDEPRECATEDEntry1 = if IconImagesDEPRECATEDEntry then IconImagesDEPRECATEDEntry elseif IsDEV then Images[Image1] else rawget(Images, Image1)
				
				if IconImagesDEPRECATEDEntry1 then
					Image = IconImagesDEPRECATEDEntry1.Image
					Offset = IconImagesDEPRECATEDEntry1.ImageRectOffset
					Size = IconImagesDEPRECATEDEntry1.ImageRectSize
				end
			end
			return Image, Offset, Size, MapResult
		end
	end, {
		WithDefaultsModuleResult.Image,
		WithDefaultsModuleResult.imageRect,
		UseStateResult,
		AspectRatio,
		Images
	})
	local Center = nil
	local Scale = nil
	local ScaleType = WithDefaultsModuleResult.ScaleType
	
	if WithDefaultsModuleResult.slice then
		if ReactIsModule.isBinding(WithDefaultsModuleResult.Image) then
			local MapResult = WithDefaultsModuleResult.Image:map(function(p2) --[[ Line: 197 ]]
				-- upvalues: IsFoundationImageModule (upval), IsCloudAssetModule (upval), IconImagesDEPRECATED (upval), IsDEV (upval), Images (upval), GetScaledSliceModule (upval), WithDefaultsModuleResult (copy)
				local v1 = nil
				if IsFoundationImageModule(p2) then
					v1 = IsCloudAssetModule(p2)
					
					if not v1 then
						local IconImagesDEPRECATEDEntry = IconImagesDEPRECATED[p2]
						v1 = (if IconImagesDEPRECATEDEntry then IconImagesDEPRECATEDEntry elseif IsDEV then Images[p2] else rawget(Images, p2)) ~= nil
					end
				else
					v1 = false
				end
				return if v1 then GetScaledSliceModule(WithDefaultsModuleResult.slice.center, WithDefaultsModuleResult.slice.scale) else WithDefaultsModuleResult.slice
			end)
			Center = MapResult:map(function(p2) --[[ Line: 204 ]]
				return p2.center
			end)
			Scale = MapResult:map(function(p2) --[[ Line: 207 ]]
				return p2.scale
			end)
		elseif typeof(WithDefaultsModuleResult.Image) == "string" then
			local Image = WithDefaultsModuleResult.Image
			local v1 = nil
			
			if IsFoundationImageModule(Image) then
				v1 = IsCloudAssetModule(Image)
				
				if not v1 then
					local IconImagesDEPRECATEDEntry = IconImagesDEPRECATED[Image]
					v1 = (if IconImagesDEPRECATEDEntry then IconImagesDEPRECATEDEntry elseif IsDEV then Images[Image] else rawget(Images, Image)) ~= nil
				end
			else
				v1 = false
			end
			if v1 then
				local ScaledSliceModule = GetScaledSliceModule(WithDefaultsModuleResult.slice.center, WithDefaultsModuleResult.slice.scale)
				Center = ScaledSliceModule.center
				Scale = ScaledSliceModule.scale
			else
				Center = WithDefaultsModuleResult.slice.center
				Scale = WithDefaultsModuleResult.slice.scale
			end
		end
		ScaleType = Enum.ScaleType.Slice
	end
	WithDefaultsModuleResult.aspectRatio = UseMemoResult4
	local UseStyleTagsModuleResult = UseStyleTagsModule((UseDefaultTagsModule(WithDefaultsModuleResult.tag, if WithDefaultsModuleResult.backgroundStyle == nil then "gui-object-defaults" else "gui-object-defaults x-default-transparency")))
	UseOnLoadedModule(UseMemoResult, WithDefaultsModuleResult.onLoaded)
	local ImageButton: string = if HasOnStateChanged then "ImageButton" else "ImageLabel"
	local WithGuiObjectPropsModuleResult = WithGuiObjectPropsModule(WithDefaultsModuleResult, {
		AutoButtonColor = if ImageButton == "ImageButton" then WithDefaultsModuleResult.AutoButtonColor else nil,
		Image = UseMemoResult,
		ImageContent = ReactModule.useMemo(function() --[[ Line: 230 ]]
			-- upvalues: ReactIsModule (upval), WithDefaultsModuleResult (copy)
			return if ReactIsModule.isBinding(WithDefaultsModuleResult.ImageContent) then WithDefaultsModuleResult.ImageContent:map(function(p2) --[[ Line: 233 ]]
				return if typeof(p2) == "string" then Content.fromUri(p2) else p2
			end) elseif typeof(WithDefaultsModuleResult.ImageContent) == "string" then Content.fromUri(WithDefaultsModuleResult.ImageContent) else WithDefaultsModuleResult.ImageContent
		end, { WithDefaultsModuleResult.ImageContent }),
		ImageColor3 = if WithDefaultsModuleResult.imageStyle then IndexBindableModule(WithDefaultsModuleResult.imageStyle, "Color3") else nil,
		ImageTransparency = if WithDefaultsModuleResult.imageStyle then IndexBindableModule(WithDefaultsModuleResult.imageStyle, "Transparency") else nil,
		ImageRectOffset = UseMemoResult2,
		ImageRectSize = UseMemoResult3,
		ResampleMode = WithDefaultsModuleResult.ResampleMode,
		ScaleType = ScaleType,
		SliceCenter = Center,
		SliceScale = Scale,
		TileSize = WithDefaultsModuleResult.TileSize,
		ref = Ref,
		[ReactModule.Tag] = UseStyleTagsModuleResult
	})
	local ImageButton1: string = ImageButton
	
	if HasOnStateChanged then
		ImageButton1 = InteractableModule
		WithGuiObjectPropsModuleResult.component = ImageButton
		WithGuiObjectPropsModuleResult.onActivated = WithDefaultsModuleResult.onActivated
		WithGuiObjectPropsModuleResult.onSecondaryActivated = WithDefaultsModuleResult.onSecondaryActivated
		WithGuiObjectPropsModuleResult.onStateChanged = WithDefaultsModuleResult.onStateChanged
		WithGuiObjectPropsModuleResult.stateLayer = WithDefaultsModuleResult.stateLayer
		WithGuiObjectPropsModuleResult.isDisabled = WithDefaultsModuleResult.isDisabled
		WithGuiObjectPropsModuleResult.cursor = WithDefaultsModuleResult.cursor
	end
	return ReactModule.createElement(ImageButton1, WithGuiObjectPropsModuleResult, GuiObjectChildrenModule(WithDefaultsModuleResult))
end))