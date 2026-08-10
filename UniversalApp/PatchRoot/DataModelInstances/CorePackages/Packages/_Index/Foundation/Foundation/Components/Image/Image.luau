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

local function _(p0) --[[ line: 62 | named "getAspectRatio" ]]
	return p0.X / p0.Y
end

local var18 = _G.__DEV__ == true

local _ = function(value) --[[ line: 68 | named "getFoundationImageAsset" ]]
	-- upvalues: iconImagesDEPRECATED (ref), var18 (ref), images (ref)
	local var19 = iconImagesDEPRECATED[value]
	
	return var19 or (if var18 then images[value] else rawget(images, value))
end

local _ = function(p1) --[[ line: 84 | named "shouldUseFoundationSlice" ]]
	-- upvalues: isFoundationImageModule (ref), isCloudAssetModule (ref), iconImagesDEPRECATED (ref), var18 (ref), images (ref)
	if not isFoundationImageModule(p1) then
		return false
	end
	local var20 = isCloudAssetModule(p1)
	
	if not var20 then
		local var21 = iconImagesDEPRECATED[p1]
		var20 = (var21 or (if var18 then images[p1] else rawget(images, p1))) ~= nil
	end
	return var20
end

return reactModule.memo(reactModule.forwardRef(function(p2, p3) --[[ line: 95 | named "Image" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), reactIsModule (ref), isCloudAssetModule (ref), isFoundationImageModule (ref), assets (ref), iconImagesDEPRECATED (ref), var18 (ref), images (ref), getScaledSliceModule (ref), useDefaultTagsModule (ref), useStyleTagsModule (ref), useOnLoadedModule (ref), flagsModule (ref), withGuiObjectPropsModule (ref), indexBindableModule (ref), interactableModule (ref), guiObjectChildrenModule (ref)
	local var22 = withDefaultsModule(p2, t)
	local var23 = if var22.onStateChanged == nil then if var22.onActivated == nil then var22.onSecondaryActivated ~= nil else true else true
	local aspectRatio = var22.aspectRatio
	local var24, var25 = reactModule.useState(false)
	reactModule.useEffect(function() --[[ line: 103 ]]
		-- upvalues: reactIsModule (copy), var22 (ref), var25 (ref), isCloudAssetModule (copy), reactModule (copy)
		if reactIsModule.isBinding(var22.Image) then
			local image = var22.Image
			var25(isCloudAssetModule(image:getValue()))
			local var37 = reactModule.__subscribeToBinding(image, function(p4) --[[ line: 111 ]]
				-- upvalues: var25 (copy), isCloudAssetModule (copy)
				var25(isCloudAssetModule(p4))
			end)
			
			return function() --[[ line: 115 ]]
				-- upvalues: var37 (ref)
				var37()
			end
		end
	end, { var22.Image, aspectRatio })
	local var26, var27, var28, var29 = reactModule.useMemo(function() --[[ line: 121 ]]
		-- upvalues: var22 (ref), aspectRatio (ref), reactIsModule (copy), isFoundationImageModule (copy), isCloudAssetModule (copy), assets (copy), iconImagesDEPRECATED (copy), var18 (copy), images (copy), var24 (ref)
		local image = var22.Image
		local var38 = if var22.imageRect then var22.imageRect.offset else nil
		local var39 = if var22.imageRect then var22.imageRect.size else nil
		local var40 = aspectRatio
		
		if reactIsModule.isBinding(var22.Image) then
			local function _(p5) --[[ line: 132 | named "getImageBindingValue" ]]
				-- upvalues: var22 (copy), isFoundationImageModule (copy), isCloudAssetModule (copy), assets (copy), iconImagesDEPRECATED (copy), var18 (copy), images (copy), aspectRatio (copy)
				return var22.Image:map(function(p6) --[[ line: 133 ]]
					-- upvalues: isFoundationImageModule (copy), isCloudAssetModule (copy), assets (copy), p5 (ref), iconImagesDEPRECATED (copy), var18 (copy), images (copy), aspectRatio (copy), var22 (copy)
					if isFoundationImageModule(p6) then
						local _ = nil
						
						if isCloudAssetModule(p6) then
							local var47 = assets[p6]
							
							if p5 == "Image" then
								return var47.assetId
							elseif p5 == "AspectRatio" then
								local size = var47.size
								
								return size.X / size.Y
							end
							return nil
						else
							local var48 = iconImagesDEPRECATED[p6]
							local var49 = var48 or (if var18 then images[p6] else rawget(images, p6))
							
							return if p5 == "AspectRatio" then aspectRatio elseif var49 then var49[p5] elseif p5 == "Image" then p6 else nil
						end
					else
						return if p5 == "Image" then p6 elseif p5 == "ImageRectOffset" and var22.imageRect then var22.imageRect.offset elseif p5 == "ImageRectSize" and var22.imageRect then var22.imageRect.size else nil
					end
				end)
			end
			
			if var24 then
				local var41 = "AspectRatio"
				var40 = var22.Image:map(function(p7) --[[ line: 133 ]]
					-- upvalues: isFoundationImageModule (copy), isCloudAssetModule (copy), assets (copy), var41 (ref), iconImagesDEPRECATED (copy), var18 (copy), images (copy), aspectRatio (copy), var22 (copy)
					if not isFoundationImageModule(p7) then
						return if var41 == "Image" then p7 elseif var41 == "ImageRectOffset" and var22.imageRect then var22.imageRect.offset elseif var41 == "ImageRectSize" and var22.imageRect then var22.imageRect.size else nil
					end
					local _ = nil
					
					if not isCloudAssetModule(p7) then
						local var48 = iconImagesDEPRECATED[p7]
						local var49 = var48 or (if var18 then images[p7] else rawget(images, p7))
						
						return if var41 == "AspectRatio" then aspectRatio elseif var49 then var49[var41] elseif var41 == "Image" then p7 else nil
					end
					local var47 = assets[p7]
					
					if var41 == "Image" then
						return var47.assetId
					elseif var41 == "AspectRatio" then
						local size = var47.size
						
						return size.X / size.Y
					end
					return nil
				end)
			else
				var40 = aspectRatio
			end
			local var42 = "Image"
			image = var22.Image:map(function(p8) --[[ line: 133 ]]
				-- upvalues: isFoundationImageModule (copy), isCloudAssetModule (copy), assets (copy), var42 (ref), iconImagesDEPRECATED (copy), var18 (copy), images (copy), aspectRatio (copy), var22 (copy)
				if not isFoundationImageModule(p8) then
					return if var42 == "Image" then p8 elseif var42 == "ImageRectOffset" and var22.imageRect then var22.imageRect.offset elseif var42 == "ImageRectSize" and var22.imageRect then var22.imageRect.size else nil
				end
				local _ = nil
				
				if not isCloudAssetModule(p8) then
					local var48 = iconImagesDEPRECATED[p8]
					local var49 = var48 or (if var18 then images[p8] else rawget(images, p8))
					
					return if var42 == "AspectRatio" then aspectRatio elseif var49 then var49[var42] elseif var42 == "Image" then p8 else nil
				end
				local var47 = assets[p8]
				
				if var42 == "Image" then
					return var47.assetId
				elseif var42 == "AspectRatio" then
					local size = var47.size
					
					return size.X / size.Y
				end
				return nil
			end)
			local var43 = "ImageRectOffset"
			var38 = var22.Image:map(function(p9) --[[ line: 133 ]]
				-- upvalues: isFoundationImageModule (copy), isCloudAssetModule (copy), assets (copy), var43 (ref), iconImagesDEPRECATED (copy), var18 (copy), images (copy), aspectRatio (copy), var22 (copy)
				if not isFoundationImageModule(p9) then
					return if var43 == "Image" then p9 elseif var43 == "ImageRectOffset" and var22.imageRect then var22.imageRect.offset elseif var43 == "ImageRectSize" and var22.imageRect then var22.imageRect.size else nil
				end
				local _ = nil
				
				if not isCloudAssetModule(p9) then
					local var48 = iconImagesDEPRECATED[p9]
					local var49 = var48 or (if var18 then images[p9] else rawget(images, p9))
					
					return if var43 == "AspectRatio" then aspectRatio elseif var49 then var49[var43] elseif var43 == "Image" then p9 else nil
				end
				local var47 = assets[p9]
				
				if var43 == "Image" then
					return var47.assetId
				elseif var43 == "AspectRatio" then
					local size = var47.size
					
					return size.X / size.Y
				end
				return nil
			end)
			local var44 = "ImageRectSize"
			var39 = var22.Image:map(function(p10) --[[ line: 133 ]]
				-- upvalues: isFoundationImageModule (copy), isCloudAssetModule (copy), assets (copy), var44 (ref), iconImagesDEPRECATED (copy), var18 (copy), images (copy), aspectRatio (copy), var22 (copy)
				if not isFoundationImageModule(p10) then
					return if var44 == "Image" then p10 elseif var44 == "ImageRectOffset" and var22.imageRect then var22.imageRect.offset elseif var44 == "ImageRectSize" and var22.imageRect then var22.imageRect.size else nil
				end
				local _ = nil
				
				if not isCloudAssetModule(p10) then
					local var48 = iconImagesDEPRECATED[p10]
					local var49 = var48 or (if var18 then images[p10] else rawget(images, p10))
					
					return if var44 == "AspectRatio" then aspectRatio elseif var49 then var49[var44] elseif var44 == "Image" then p10 else nil
				end
				local var47 = assets[p10]
				
				if var44 == "Image" then
					return var47.assetId
				elseif var44 == "AspectRatio" then
					local size = var47.size
					
					return size.X / size.Y
				end
				return nil
			end)
			
			return image, var38, var39, var40
		elseif typeof(var22.Image) == "string" and isFoundationImageModule(var22.Image) then
			if isCloudAssetModule(var22.Image) then
				local image_1 = assets[var22.Image]
				image = image_1.assetId
				local size = image_1.size
				var40 = size.X / size.Y
				
				return image, var38, var39, var40
			end
			local image_1 = var22.Image
			local var45 = iconImagesDEPRECATED[image_1]
			local var46 = var45 or (if var18 then images[image_1] else rawget(images, image_1))
			
			if var46 then
				image = var46.Image
				var38 = var46.ImageRectOffset
				var39 = var46.ImageRectSize
			end
		end
		return image, var38, var39, var40
	end, {
		var22.Image,
		var22.imageRect,
		var24,
		aspectRatio,
		images
	})
	local center = nil
	local scale = nil
	local scaleType = var22.ScaleType
	
	if var22.slice then
		if reactIsModule.isBinding(var22.Image) then
			local var30 = var22.Image:map(function(p11) --[[ line: 198 ]]
				-- upvalues: isFoundationImageModule (copy), isCloudAssetModule (copy), iconImagesDEPRECATED (copy), var18 (copy), images (copy), getScaledSliceModule (copy), var22 (ref)
				local var50
				if isFoundationImageModule(p11) then
					var50 = isCloudAssetModule(p11)
					
					if not var50 then
						local var51 = iconImagesDEPRECATED[p11]
						var50 = (var51 or (if var18 then images[p11] else rawget(images, p11))) ~= nil
					end
				else
					var50 = false
				end
				return if var50 then getScaledSliceModule(var22.slice.center, var22.slice.scale) else var22.slice
			end)
			center = var30:map(function(p12) --[[ line: 205 ]]
				return p12.center
			end)
			scale = var30:map(function(p13) --[[ line: 208 ]]
				return p13.scale
			end)
		elseif typeof(var22.Image) == "string" then
			local var31
			local image = var22.Image
			
			if isFoundationImageModule(image) then
				var31 = isCloudAssetModule(image)
				
				if not var31 then
					local var32 = iconImagesDEPRECATED[image]
					var31 = (var32 or (if var18 then images[image] else rawget(images, image))) ~= nil
				end
			else
				var31 = false
			end
			if var31 then
				var31 = getScaledSliceModule(var22.slice.center, var22.slice.scale)
				center = var31.center
				scale = var31.scale
			else
				center = var22.slice.center
				scale = var22.slice.scale
			end
		end
		scaleType = Enum.ScaleType.Slice
	end
	var22.aspectRatio = var29
	local var33 = useStyleTagsModule(useDefaultTagsModule(var22.tag, if var22.backgroundStyle ~= nil then "gui-object-defaults" else "gui-object-defaults x-default-transparency"))
	useOnLoadedModule(var26, var22.onLoaded)
	local var34 = if var23 then "ImageButton" else "ImageLabel"
	local var35 = withGuiObjectPropsModule(var22, {
		AutoButtonColor = if var34 == "ImageButton" then var22.AutoButtonColor else nil,
		Image = var26,
		ImageContent = if flagsModule.FoundationImageContentSupport then reactModule.useMemo(function() --[[ line: 232 ]]
			-- upvalues: reactIsModule (copy), var22 (ref)
			return if reactIsModule.isBinding(var22.ImageContent) then var22.ImageContent:map(function(p14) --[[ line: 235 ]]
				return if typeof(p14) == "string" then Content.fromUri(p14) else p14
			end) elseif typeof(var22.ImageContent) == "string" then Content.fromUri(var22.ImageContent) else var22.ImageContent
		end, { var22.ImageContent }) else nil,
		ImageColor3 = if var22.imageStyle then indexBindableModule(var22.imageStyle, "Color3") else nil,
		ImageTransparency = if var22.imageStyle then indexBindableModule(var22.imageStyle, "Transparency") else nil,
		ImageRectOffset = var27,
		ImageRectSize = var28,
		ResampleMode = var22.ResampleMode,
		ScaleType = scaleType,
		SliceCenter = center,
		SliceScale = scale,
		TileSize = var22.TileSize,
		ref = p3,
		[reactModule.Tag] = var33
	})
	local var36 = var34
	
	if var23 then
		var36 = interactableModule
		var35.component = var34
		var35.onActivated = var22.onActivated
		var35.onSecondaryActivated = var22.onSecondaryActivated
		var35.onStateChanged = var22.onStateChanged
		var35.stateLayer = var22.stateLayer
		var35.isDisabled = var22.isDisabled
		var35.cursor = var22.cursor
	end
	return reactModule.createElement(var36, var35, guiObjectChildrenModule(var22))
end))