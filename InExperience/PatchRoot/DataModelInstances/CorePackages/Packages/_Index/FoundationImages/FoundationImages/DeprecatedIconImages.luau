local Parent = script.Parent
local StaticFallbackImagesModule = require(Parent.Deprecated.StaticFallbackImages)
local Uiblox = require(Parent.Parent.BuilderIcons).Migration.uiblox
local WhitelistedIconAssetsModule = require(Parent.whitelistedIconAssets)
local DeprecatedIconImagesModule = {}

for i, value in require(Parent.Deprecated.GetDeprecatedIconImageSetData)((require(Parent.getResolutionScale)())) do
	if Uiblox[i] and WhitelistedIconAssetsModule[i] == nil then
		local t = {}
		
		for i1, value1 in value do
			if i1 == "ImageSet" then
				t.Image = StaticFallbackImagesModule[value1]
			else
				t[i1] = value1
			end
		end
		DeprecatedIconImagesModule[i] = t
	end
end
return DeprecatedIconImagesModule