local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local foundationCloudAssetsModule = require(parent.FoundationCloudAssets)
local foundationImagesModule = require(parent.FoundationImages)
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local useOnLoadedModule = require(script.Parent.useOnLoaded)
local assets = foundationCloudAssetsModule.Assets
local interactableModule = require(foundation.Components.Interactable)
local images = foundationImagesModule.Images
local iconImagesDEPRECATED = foundationImagesModule.IconImages_DEPRECATED
local getScaledSliceModule = require(script.Parent.ImageSet.getScaledSlice)
local isCloudAssetModule = require(script.Parent.CloudAsset.isCloudAsset)
local isFoundationImageModule = require(script.Parent.ImageSet.isFoundationImage)
local flagsModule = require(foundation.Utility.Flags)
local guiObjectChildrenModule = require(foundation.Utility.GuiObjectChildren)
local _ = require(foundation.Components.Types)
local indexBindableModule = require(foundation.Utility.indexBindable)
local useDefaultTagsModule = require(foundation.Utility.useDefaultTags)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local withGuiObjectPropsModule = require(foundation.Utility.withGuiObjectProps)
local useStyleTagsModule = require(foundation.Providers.Style.useStyleTags)
local t = {
	AutoLocalize = false,
	AutoButtonColor = false,
	BorderSizePixel = 0,
	isDisabled = false
}

local function _(p1)
	return p1.X / p1.Y
end

local var1 = _G.__DEV__ == true

local _ = function(value)
	-- upvalues: iconImagesDEPRECATED (ref), var1 (ref), images (ref)
	local var2 = iconImagesDEPRECATED[value]
	
	return var2 or (if var1 then images[value] else rawget(images, value))
end

local _ = function(p1)
	-- upvalues: isFoundationImageModule (ref), isCloudAssetModule (ref), iconImagesDEPRECATED (ref), var1 (ref), images (ref)
	if not isFoundationImageModule(p1) then
		return false
	end
	local var2 = isCloudAssetModule(p1)
	
	if not var2 then
		local var3 = iconImagesDEPRECATED[p1]
		var2 = (var3 or (if var1 then images[p1] else rawget(images, p1))) ~= nil
	end
	return var2
end

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), reactIsModule (ref), isCloudAssetModule (ref), isFoundationImageModule (ref), assets (ref), iconImagesDEPRECATED (ref), var1 (ref), images (ref), getScaledSliceModule (ref), useDefaultTagsModule (ref), useStyleTagsModule (ref), useOnLoadedModule (ref), flagsModule (ref), withGuiObjectPropsModule (ref), indexBindableModule (ref), interactableModule (ref), guiObjectChildrenModule (ref)
	local var2 = withDefaultsModule(p1, t)
	local var3 = if var2.onStateChanged == nil then if var2.onActivated == nil then var2.onSecondaryActivated ~= nil else true else true
	local aspectRatio = var2.aspectRatio
	local var4, var5 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: reactIsModule (copy), var2 (ref), var5 (ref), isCloudAssetModule (copy), reactModule (copy)
		if reactIsModule.isBinding(var2.Image) then
			local image = var2.Image
			var5(isCloudAssetModule(image:getValue()))
			local var6 = reactModule.__subscribeToBinding(image, function(p3)
				-- upvalues: var5 (copy), isCloudAssetModule (copy)
				var5(isCloudAssetModule(p3))
			end)
			
			return function()
				-- upvalues: var6 (ref)
				var6()
			end
		end
	end, { var2.Image, aspectRatio })
	local var6, var7, var8, var9 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), aspectRatio (ref), reactIsModule (copy), isFoundationImageModule (copy), isCloudAssetModule (copy), assets (copy), iconImagesDEPRECATED (copy), var1 (copy), images (copy), var4 (ref)
		local image = var2.Image
		local var10 = if var2.imageRect then var2.imageRect.offset else nil
		local var11 = if var2.imageRect then var2.imageRect.size else nil
		local var12 = aspectRatio
		
		if reactIsModule.isBinding(var2.Image) then
			local function _(p3)
				-- upvalues: var2 (copy), isFoundationImageModule (copy), isCloudAssetModule (copy), assets (copy), iconImagesDEPRECATED (copy), var1 (copy), images (copy), aspectRatio (copy)
				return var2.Image:map(function(p4)
					-- upvalues: isFoundationImageModule (copy), isCloudAssetModule (copy), assets (copy), p3 (ref), iconImagesDEPRECATED (copy), var1 (copy), images (copy), aspectRatio (copy), var2 (copy)
					if isFoundationImageModule(p4) then
						local _ = nil
						
						if isCloudAssetModule(p4) then
							local var13 = assets[p4]
							
							if p3 == "Image" then
								return var13.assetId
							elseif p3 == "AspectRatio" then
								local size = var13.size
								
								return size.X / size.Y
							end
							return nil
						else
							local var14 = iconImagesDEPRECATED[p4]
							local var15 = var14 or (if var1 then images[p4] else rawget(images, p4))
							
							return if p3 == "AspectRatio" then aspectRatio elseif var15 then var15[p3] elseif p3 == "Image" then p4 else nil
						end
					else
						return if p3 == "Image" then p4 elseif p3 == "ImageRectOffset" and var2.imageRect then var2.imageRect.offset elseif p3 == "ImageRectSize" and var2.imageRect then var2.imageRect.size else nil
					end
				end)
			end
			
			if var4 then
				local var13 = "AspectRatio"
				var12 = var2.Image:map(function(p3)
					-- upvalues: isFoundationImageModule (copy), isCloudAssetModule (copy), assets (copy), var13 (ref), iconImagesDEPRECATED (copy), var1 (copy), images (copy), aspectRatio (copy), var2 (copy)
					if not isFoundationImageModule(p3) then
						return if var13 == "Image" then p3 elseif var13 == "ImageRectOffset" and var2.imageRect then var2.imageRect.offset elseif var13 == "ImageRectSize" and var2.imageRect then var2.imageRect.size else nil
					end
					local _ = nil
					
					if not isCloudAssetModule(p3) then
						local var14 = iconImagesDEPRECATED[p3]
						local var15 = var14 or (if var1 then images[p3] else rawget(images, p3))
						
						return if var13 == "AspectRatio" then aspectRatio elseif var15 then var15[var13] elseif var13 == "Image" then p3 else nil
					end
					local var16 = assets[p3]
					
					if var13 == "Image" then
						return var16.assetId
					elseif var13 == "AspectRatio" then
						local size = var16.size
						
						return size.X / size.Y
					end
					return nil
				end)
			else
				var12 = aspectRatio
			end
			local var14 = "Image"
			image = var2.Image:map(function(p3)
				-- upvalues: isFoundationImageModule (copy), isCloudAssetModule (copy), assets (copy), var14 (ref), iconImagesDEPRECATED (copy), var1 (copy), images (copy), aspectRatio (copy), var2 (copy)
				if not isFoundationImageModule(p3) then
					return if var14 == "Image" then p3 elseif var14 == "ImageRectOffset" and var2.imageRect then var2.imageRect.offset elseif var14 == "ImageRectSize" and var2.imageRect then var2.imageRect.size else nil
				end
				local _ = nil
				
				if not isCloudAssetModule(p3) then
					local var15 = iconImagesDEPRECATED[p3]
					local var16 = var15 or (if var1 then images[p3] else rawget(images, p3))
					
					return if var14 == "AspectRatio" then aspectRatio elseif var16 then var16[var14] elseif var14 == "Image" then p3 else nil
				end
				local var17 = assets[p3]
				
				if var14 == "Image" then
					return var17.assetId
				elseif var14 == "AspectRatio" then
					local size = var17.size
					
					return size.X / size.Y
				end
				return nil
			end)
			local var15 = "ImageRectOffset"
			var10 = var2.Image:map(function(p3)
				-- upvalues: isFoundationImageModule (copy), isCloudAssetModule (copy), assets (copy), var15 (ref), iconImagesDEPRECATED (copy), var1 (copy), images (copy), aspectRatio (copy), var2 (copy)
				if not isFoundationImageModule(p3) then
					return if var15 == "Image" then p3 elseif var15 == "ImageRectOffset" and var2.imageRect then var2.imageRect.offset elseif var15 == "ImageRectSize" and var2.imageRect then var2.imageRect.size else nil
				end
				local _ = nil
				
				if not isCloudAssetModule(p3) then
					local var16 = iconImagesDEPRECATED[p3]
					local var17 = var16 or (if var1 then images[p3] else rawget(images, p3))
					
					return if var15 == "AspectRatio" then aspectRatio elseif var17 then var17[var15] elseif var15 == "Image" then p3 else nil
				end
				local var18 = assets[p3]
				
				if var15 == "Image" then
					return var18.assetId
				elseif var15 == "AspectRatio" then
					local size = var18.size
					
					return size.X / size.Y
				end
				return nil
			end)
			local var16 = "ImageRectSize"
			var11 = var2.Image:map(function(p3)
				-- upvalues: isFoundationImageModule (copy), isCloudAssetModule (copy), assets (copy), var16 (ref), iconImagesDEPRECATED (copy), var1 (copy), images (copy), aspectRatio (copy), var2 (copy)
				if not isFoundationImageModule(p3) then
					return if var16 == "Image" then p3 elseif var16 == "ImageRectOffset" and var2.imageRect then var2.imageRect.offset elseif var16 == "ImageRectSize" and var2.imageRect then var2.imageRect.size else nil
				end
				local _ = nil
				
				if not isCloudAssetModule(p3) then
					local var17 = iconImagesDEPRECATED[p3]
					local var18 = var17 or (if var1 then images[p3] else rawget(images, p3))
					
					return if var16 == "AspectRatio" then aspectRatio elseif var18 then var18[var16] elseif var16 == "Image" then p3 else nil
				end
				local var19 = assets[p3]
				
				if var16 == "Image" then
					return var19.assetId
				elseif var16 == "AspectRatio" then
					local size = var19.size
					
					return size.X / size.Y
				end
				return nil
			end)
			
			return image, var10, var11, var12
		elseif typeof(var2.Image) == "string" and isFoundationImageModule(var2.Image) then
			if isCloudAssetModule(var2.Image) then
				local image_1 = assets[var2.Image]
				image = image_1.assetId
				local size = image_1.size
				var12 = size.X / size.Y
				
				return image, var10, var11, var12
			end
			local image_1 = var2.Image
			local var17 = iconImagesDEPRECATED[image_1]
			local var18 = var17 or (if var1 then images[image_1] else rawget(images, image_1))
			
			if var18 then
				image = var18.Image
				var10 = var18.ImageRectOffset
				var11 = var18.ImageRectSize
			end
		end
		return image, var10, var11, var12
	end, {
		var2.Image,
		var2.imageRect,
		var4,
		aspectRatio,
		images
	})
	local center = nil
	local scale = nil
	local scaleType = var2.ScaleType
	
	if var2.slice then
		if reactIsModule.isBinding(var2.Image) then
			local var10 = var2.Image:map(function(p3)
				-- upvalues: isFoundationImageModule (copy), isCloudAssetModule (copy), iconImagesDEPRECATED (copy), var1 (copy), images (copy), getScaledSliceModule (copy), var2 (ref)
				local var11
				if isFoundationImageModule(p3) then
					var11 = isCloudAssetModule(p3)
					
					if not var11 then
						local var12 = iconImagesDEPRECATED[p3]
						var11 = (var12 or (if var1 then images[p3] else rawget(images, p3))) ~= nil
					end
				else
					var11 = false
				end
				return if var11 then getScaledSliceModule(var2.slice.center, var2.slice.scale) else var2.slice
			end)
			center = var10:map(function(p3)
				return p3.center
			end)
			scale = var10:map(function(p3)
				return p3.scale
			end)
		elseif typeof(var2.Image) == "string" then
			local var11
			local image = var2.Image
			
			if isFoundationImageModule(image) then
				var11 = isCloudAssetModule(image)
				
				if not var11 then
					local var12 = iconImagesDEPRECATED[image]
					var11 = (var12 or (if var1 then images[image] else rawget(images, image))) ~= nil
				end
			else
				var11 = false
			end
			if var11 then
				var11 = getScaledSliceModule(var2.slice.center, var2.slice.scale)
				center = var11.center
				scale = var11.scale
			else
				center = var2.slice.center
				scale = var2.slice.scale
			end
		end
		scaleType = Enum.ScaleType.Slice
	end
	var2.aspectRatio = var9
	local var13 = useStyleTagsModule(useDefaultTagsModule(var2.tag, if var2.backgroundStyle ~= nil then "gui-object-defaults" else "gui-object-defaults x-default-transparency"))
	useOnLoadedModule(var6, var2.onLoaded)
	local var14 = if var3 then "ImageButton" else "ImageLabel"
	local var15 = withGuiObjectPropsModule(var2, {
		AutoButtonColor = if var14 == "ImageButton" then var2.AutoButtonColor else nil,
		Image = var6,
		ImageContent = if flagsModule.FoundationImageContentSupport then reactModule.useMemo(function()
			-- upvalues: reactIsModule (copy), var2 (ref)
			return if reactIsModule.isBinding(var2.ImageContent) then var2.ImageContent:map(function(p3)
				return if typeof(p3) == "string" then Content.fromUri(p3) else p3
			end) elseif typeof(var2.ImageContent) == "string" then Content.fromUri(var2.ImageContent) else var2.ImageContent
		end, { var2.ImageContent }) else nil,
		ImageColor3 = if var2.imageStyle then indexBindableModule(var2.imageStyle, "Color3") else nil,
		ImageTransparency = if var2.imageStyle then indexBindableModule(var2.imageStyle, "Transparency") else nil,
		ImageRectOffset = var7,
		ImageRectSize = var8,
		ResampleMode = var2.ResampleMode,
		ScaleType = scaleType,
		SliceCenter = center,
		SliceScale = scale,
		TileSize = var2.TileSize,
		ref = p2,
		[reactModule.Tag] = var13
	})
	local var16 = var14
	
	if var3 then
		var16 = interactableModule
		var15.component = var14
		var15.onActivated = var2.onActivated
		var15.onSecondaryActivated = var2.onSecondaryActivated
		var15.onStateChanged = var2.onStateChanged
		var15.stateLayer = var2.stateLayer
		var15.isDisabled = var2.isDisabled
		var15.cursor = var2.cursor
	end
	return reactModule.createElement(var16, var15, guiObjectChildrenModule(var2))
end))