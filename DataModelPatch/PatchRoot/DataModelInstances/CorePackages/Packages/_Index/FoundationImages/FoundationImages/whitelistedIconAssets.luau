local WhitelistedIconAssetsModule = {}

for _, value in string.split(require(script.Parent.Flags).FoundationImagesWhitelistedIconAssets, ",") do
	WhitelistedIconAssetsModule[value] = true
end
return WhitelistedIconAssetsModule