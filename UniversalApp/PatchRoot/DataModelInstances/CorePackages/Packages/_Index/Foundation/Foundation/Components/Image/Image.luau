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

local function _(p0) --[[ line: 60 | named "getAspectRatio" ]]
	return p0.X / p0.Y
end

local var17 = _G.__DEV__ == true

local _ = function(value) --[[ line: 66 | named "getFoundationImageAsset" ]]
	-- upvalues: iconImagesDEPRECATED (ref), var17 (ref), images (ref)
	local var18 = iconImagesDEPRECATED[value]
	
	return var18 or (if var17 then images[value] else rawget(images, value))
end

local _ = function(p1) --[[ line: 82 | named "shouldUseFoundationSlice" ]]
	-- upvalues: isFoundationImageModule (ref), isCloudAssetModule (ref), iconImagesDEPRECATED (ref), var17 (ref), images (ref)
	if not isFoundationImageModule(p1) then
		return false
	end
	local var19 = isCloudAssetModule(p1)
	
	if not var19 then
		local var20 = iconImagesDEPRECATED[p1]
		var19 = (var20 or (if var17 then images[p1] else rawget(images, p1))) ~= nil
	end
	return var19
end

return reactModule.memo(reactModule.forwardRef(function(p2, p3) --[[ line: 93 | named "Image" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), reactIsModule (ref), isCloudAssetModule (ref), isFoundationImageModule (ref), assets (ref), iconImagesDEPRECATED (ref), var17 (ref), images (ref), getScaledSliceModule (ref), useDefaultTagsModule (ref), useStyleTagsModule (ref), useOnLoadedModule (ref), withGuiObjectPropsModule (ref), indexBindableModule (ref), interactableModule (ref), guiObjectChildrenModule (ref)
	local var21 = withDefaultsModule(p2, t)
	local var22 = if var21.onStateChanged == nil then if var21.onActivated == nil then var21.onSecondaryActivated ~= nil else true else true
	local aspectRatio = var21.aspectRatio
	local var23, var24 = reactModule.useState(false)
	reactModule.useEffect(function() --[[ line: 101 ]]
		-- upvalues: reactIsModule (copy), var21 (ref), var24 (ref), isCloudAssetModule (copy), reactModule (copy)
		if reactIsModule.isBinding(var21.Image) then
			local image = var21.Image
			var24(isCloudAssetModule(image:getValue()))
			local var36 = reactModule.__subscribeToBinding(image, function(p4) --[[ line: 109 ]]
				-- upvalues: var24 (copy), isCloudAssetModule (copy)
				var24(isCloudAssetModule(p4))
			end)
			
			return function() --[[ line: 113 ]]
				-- upvalues: var36 (ref)
				var36()
			end
		end
	end, { var21.Image, aspectRatio })
	local var25, var26, var27, var28 = reactModule.useMemo(function() --[[ line: 119 ]]
		-- upvalues: var21 (ref), aspectRatio (ref), reactIsModule (copy), isFoundationImageModule (copy), isCloudAssetModule (copy), assets (copy), iconImagesDEPRECATED (copy), var17 (copy), images (copy), var23 (ref)
		local image = var21.Image
		local var37 = if var21.imageRect then var21.imageRect.offset else nil
		local var38 = if var21.imageRect then var21.imageRect.size else nil
		local var39 = aspectRatio
		
		if reactIsModule.isBinding(var21.Image) then
			local function _(p5) --[[ line: 130 | named "getImageBindingValue" ]]
				-- upvalues: var21 (copy), isFoundationImageModule (copy), isCloudAssetModule (copy), assets (copy), iconImagesDEPRECATED (copy), var17 (copy), images (copy), aspectRatio (copy)
				return var21.Image:map(function(p6) --[[ line: 131 ]]
					-- upvalues: isFoundationImageModule (copy), isCloudAssetModule (copy), assets (copy), p5 (ref), iconImagesDEPRECATED (copy), var17 (copy), images (copy), aspectRatio (copy), var21 (copy)
					if isFoundationImageModule(p6) then
						local _ = nil
						
						if isCloudAssetModule(p6) then
							local var46 = assets[p6]
							
							if p5 == "Image" then
								return var46.assetId
							elseif p5 == "AspectRatio" then
								local size = var46.size
								
								return size.X / size.Y
							end
							return nil
						else
							local var47 = iconImagesDEPRECATED[p6]
							local var48 = var47 or (if var17 then images[p6] else rawget(images, p6))
							
							return if p5 == "AspectRatio" then aspectRatio elseif var48 then var48[p5] elseif p5 == "Image" then p6 else nil
						end
					else
						return if p5 == "Image" then p6 elseif p5 == "ImageRectOffset" and var21.imageRect then var21.imageRect.offset elseif p5 == "ImageRectSize" and var21.imageRect then var21.imageRect.size else nil
					end
				end)
			end
			
			if var23 then
				local var40 = "AspectRatio"
				var39 = var21.Image:map(function(p7) --[[ line: 131 ]]
					-- upvalues: isFoundationImageModule (copy), isCloudAssetModule (copy), assets (copy), var40 (ref), iconImagesDEPRECATED (copy), var17 (copy), images (copy), aspectRatio (copy), var21 (copy)
					if not isFoundationImageModule(p7) then
						return if var40 == "Image" then p7 elseif var40 == "ImageRectOffset" and var21.imageRect then var21.imageRect.offset elseif var40 == "ImageRectSize" and var21.imageRect then var21.imageRect.size else nil
					end
					local _ = nil
					
					if not isCloudAssetModule(p7) then
						local var47 = iconImagesDEPRECATED[p7]
						local var48 = var47 or (if var17 then images[p7] else rawget(images, p7))
						
						return if var40 == "AspectRatio" then aspectRatio elseif var48 then var48[var40] elseif var40 == "Image" then p7 else nil
					end
					local var46 = assets[p7]
					
					if var40 == "Image" then
						return var46.assetId
					elseif var40 == "AspectRatio" then
						local size = var46.size
						
						return size.X / size.Y
					end
					return nil
				end)
			else
				var39 = aspectRatio
			end
			local var41 = "Image"
			image = var21.Image:map(function(p8) --[[ line: 131 ]]
				-- upvalues: isFoundationImageModule (copy), isCloudAssetModule (copy), assets (copy), var41 (ref), iconImagesDEPRECATED (copy), var17 (copy), images (copy), aspectRatio (copy), var21 (copy)
				if not isFoundationImageModule(p8) then
					return if var41 == "Image" then p8 elseif var41 == "ImageRectOffset" and var21.imageRect then var21.imageRect.offset elseif var41 == "ImageRectSize" and var21.imageRect then var21.imageRect.size else nil
				end
				local _ = nil
				
				if not isCloudAssetModule(p8) then
					local var47 = iconImagesDEPRECATED[p8]
					local var48 = var47 or (if var17 then images[p8] else rawget(images, p8))
					
					return if var41 == "AspectRatio" then aspectRatio elseif var48 then var48[var41] elseif var41 == "Image" then p8 else nil
				end
				local var46 = assets[p8]
				
				if var41 == "Image" then
					return var46.assetId
				elseif var41 == "AspectRatio" then
					local size = var46.size
					
					return size.X / size.Y
				end
				return nil
			end)
			local var42 = "ImageRectOffset"
			var37 = var21.Image:map(function(p9) --[[ line: 131 ]]
				-- upvalues: isFoundationImageModule (copy), isCloudAssetModule (copy), assets (copy), var42 (ref), iconImagesDEPRECATED (copy), var17 (copy), images (copy), aspectRatio (copy), var21 (copy)
				if not isFoundationImageModule(p9) then
					return if var42 == "Image" then p9 elseif var42 == "ImageRectOffset" and var21.imageRect then var21.imageRect.offset elseif var42 == "ImageRectSize" and var21.imageRect then var21.imageRect.size else nil
				end
				local _ = nil
				
				if not isCloudAssetModule(p9) then
					local var47 = iconImagesDEPRECATED[p9]
					local var48 = var47 or (if var17 then images[p9] else rawget(images, p9))
					
					return if var42 == "AspectRatio" then aspectRatio elseif var48 then var48[var42] elseif var42 == "Image" then p9 else nil
				end
				local var46 = assets[p9]
				
				if var42 == "Image" then
					return var46.assetId
				elseif var42 == "AspectRatio" then
					local size = var46.size
					
					return size.X / size.Y
				end
				return nil
			end)
			local var43 = "ImageRectSize"
			var38 = var21.Image:map(function(p10) --[[ line: 131 ]]
				-- upvalues: isFoundationImageModule (copy), isCloudAssetModule (copy), assets (copy), var43 (ref), iconImagesDEPRECATED (copy), var17 (copy), images (copy), aspectRatio (copy), var21 (copy)
				if not isFoundationImageModule(p10) then
					return if var43 == "Image" then p10 elseif var43 == "ImageRectOffset" and var21.imageRect then var21.imageRect.offset elseif var43 == "ImageRectSize" and var21.imageRect then var21.imageRect.size else nil
				end
				local _ = nil
				
				if not isCloudAssetModule(p10) then
					local var47 = iconImagesDEPRECATED[p10]
					local var48 = var47 or (if var17 then images[p10] else rawget(images, p10))
					
					return if var43 == "AspectRatio" then aspectRatio elseif var48 then var48[var43] elseif var43 == "Image" then p10 else nil
				end
				local var46 = assets[p10]
				
				if var43 == "Image" then
					return var46.assetId
				elseif var43 == "AspectRatio" then
					local size = var46.size
					
					return size.X / size.Y
				end
				return nil
			end)
			
			return image, var37, var38, var39
		elseif typeof(var21.Image) == "string" and isFoundationImageModule(var21.Image) then
			if isCloudAssetModule(var21.Image) then
				local image_1 = assets[var21.Image]
				image = image_1.assetId
				local size = image_1.size
				var39 = size.X / size.Y
				
				return image, var37, var38, var39
			end
			local image_1 = var21.Image
			local var44 = iconImagesDEPRECATED[image_1]
			local var45 = var44 or (if var17 then images[image_1] else rawget(images, image_1))
			
			if var45 then
				image = var45.Image
				var37 = var45.ImageRectOffset
				var38 = var45.ImageRectSize
			end
		end
		return image, var37, var38, var39
	end, {
		var21.Image,
		var21.imageRect,
		var23,
		aspectRatio,
		images
	})
	local center = nil
	local scale = nil
	local scaleType = var21.ScaleType
	
	if var21.slice then
		if reactIsModule.isBinding(var21.Image) then
			local var29 = var21.Image:map(function(p11) --[[ line: 196 ]]
				-- upvalues: isFoundationImageModule (copy), isCloudAssetModule (copy), iconImagesDEPRECATED (copy), var17 (copy), images (copy), getScaledSliceModule (copy), var21 (ref)
				local var49
				if isFoundationImageModule(p11) then
					var49 = isCloudAssetModule(p11)
					
					if not var49 then
						local var50 = iconImagesDEPRECATED[p11]
						var49 = (var50 or (if var17 then images[p11] else rawget(images, p11))) ~= nil
					end
				else
					var49 = false
				end
				return if var49 then getScaledSliceModule(var21.slice.center, var21.slice.scale) else var21.slice
			end)
			center = var29:map(function(p12) --[[ line: 203 ]]
				return p12.center
			end)
			scale = var29:map(function(p13) --[[ line: 206 ]]
				return p13.scale
			end)
		elseif typeof(var21.Image) == "string" then
			local var30
			local image = var21.Image
			
			if isFoundationImageModule(image) then
				var30 = isCloudAssetModule(image)
				
				if not var30 then
					local var31 = iconImagesDEPRECATED[image]
					var30 = (var31 or (if var17 then images[image] else rawget(images, image))) ~= nil
				end
			else
				var30 = false
			end
			if var30 then
				var30 = getScaledSliceModule(var21.slice.center, var21.slice.scale)
				center = var30.center
				scale = var30.scale
			else
				center = var21.slice.center
				scale = var21.slice.scale
			end
		end
		scaleType = Enum.ScaleType.Slice
	end
	var21.aspectRatio = var28
	local var32 = useStyleTagsModule(useDefaultTagsModule(var21.tag, if var21.backgroundStyle ~= nil then "gui-object-defaults" else "gui-object-defaults x-default-transparency"))
	useOnLoadedModule(var25, var21.onLoaded)
	local var33 = if var22 then "ImageButton" else "ImageLabel"
	local var34 = withGuiObjectPropsModule(var21, {
		AutoButtonColor = if var33 == "ImageButton" then var21.AutoButtonColor else nil,
		Image = var25,
		ImageColor3 = if var21.imageStyle then indexBindableModule(var21.imageStyle, "Color3") else nil,
		ImageTransparency = if var21.imageStyle then indexBindableModule(var21.imageStyle, "Transparency") else nil,
		ImageRectOffset = var26,
		ImageRectSize = var27,
		ResampleMode = var21.ResampleMode,
		ScaleType = scaleType,
		SliceCenter = center,
		SliceScale = scale,
		TileSize = var21.TileSize,
		ref = p3,
		[reactModule.Tag] = var32
	})
	local var35 = var33
	
	if var22 then
		var35 = interactableModule
		var34.component = var33
		var34.onActivated = var21.onActivated
		var34.onSecondaryActivated = var21.onSecondaryActivated
		var34.onStateChanged = var21.onStateChanged
		var34.stateLayer = var21.stateLayer
		var34.isDisabled = var21.isDisabled
		var34.cursor = var21.cursor
	end
	return reactModule.createElement(var35, var34, guiObjectChildrenModule(var21))
end))